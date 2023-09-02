/*
 * main.c
 *
 *  Created on: 2023��6��20��
 *      Author: Ming
 */
#include "init.h"
#include "spi.h"
#include "ad9958_hps.h"
#include "ads1118.h"
#include "meter.h"

extern void *periph_virtual_base;
extern uint32_t *led_pio_virtual_base;
extern uint32_t *button_pio_virtual_base;
extern uint32_t *sw_pio_virtual_base;
extern uint32_t *uart_0_virtual_base;
extern uint32_t *spi_0_virtual_base;
extern uint32_t *pio0_virtual_base;
extern uint16_t *ram_0_virtual_base;
extern uint32_t *ram_1_virtual_base;
uint32_t pio0 = 0;

extern uint16_t conf_default;
uint16_t rate, channel, fsr;
int16_t ads1118data;
uint32_t *freq;
int mode;
// unsigned int freq9958=50000000,amp9958=512;

int uart_getc(uint32_t timeout)
{
    uint32_t _time = 0;
    unsigned short uart_status; // 状态寄存器值
    do
    {
        _time++;
        uart_status = *(uart_0_virtual_base + 2); // 读取状态寄存器
        if (!(_time ^ timeout))
            return 256;
    } while (!(uart_status & 0x80));   // 等待状态寄存器bit7（rrdy）为1
    return *(uart_0_virtual_base + 0); // 读取一个字符并作为函数返回值返回
}
void uart_putc(char c)
{
    unsigned short uart_status; // 状态寄存器值
    do
    {
        uart_status = *(uart_0_virtual_base + 2); // 读取状态寄存器
    } while (!(uart_status & 0x40));              // 等待状态寄存器bit6（trdy）为1
    *(uart_0_virtual_base + 1) = c;               // 发送一个字符
    //delay_us(100);
}

// 串口字符串发送函数
void uart_printf(char *str)
{
    while (*str != '\0') // 检测当前指针指向的数是否为空字符
    {
        uart_putc(*str); // 发送一个字符
        str++;           // 字符串指针+1
    }
}
int main()
{
    //----Initialize, map virtual address----
    fpga_init();
    printf("hello");
    freq = ram_1_virtual_base + 2;
    //----code begin----
    ads1118_init(ram_1_virtual_base, (int *)ram_1_virtual_base + 1, conf_default);
    while(1){
    	float v=auto1118(CHANNEL2,4,0);
    	printf("%f",v);
    	delay_us(500000);
    }
//    while (1)
//    {
//        // scanf("%d",&mode);
//        float x;
//        char str[40];
//        mode = uart_getc(100000);
//        if (mode == 0x35)
//        {
//            x=autores();
//            printf("%f\n", x);
//            sprintf(str,"t5.txt=\"%.1f ohm\"\xff\xff\xff\0", x);
//            delay_us(2000);
//            uart_printf(str);
//        }
//        if (mode == 0x36)
//        {
//            x=cap();
//            printf("%fnF\n", x);
//            sprintf(str,"t6.txt=\"%.4f nF\"\xff\xff\xff\0", x);
//            delay_us(2000);
//            uart_printf(str);
//        }
//        if (mode == 0x37)
//        {
//            x=induc();
//            printf("%fmH\n", x);
//            sprintf(str,"t7.txt=\"%.4f mH\"\xff\xff\xff\0", x);
//            delay_us(2000);
//            uart_printf(str);
//        }
//        if (mode == 0x38)
//        {
//            x=DCRMS();
//            printf("%fV\n", x);
//            sprintf(str,"t8.txt=\"%.4f V\"\xff\xff\xff\0", x);
//            delay_us(2000);
//            uart_printf(str);
//        }
//        if (mode == 0x39)
//        {
//            x=ACRMS();
//            printf("%fmV\n", x);
//            sprintf(str,"t9.txt=\"%.1f mV\"\xff\xff\xff\0", x);
//            delay_us(2000);
//            uart_printf(str);
//        }
//    }

    // while (1)
    // {
    //     ads1118_channel(channel);
    //     ads1118_rate(rate);
    //     ads1118_fsr(fsr);
    //     ads1118data=*(ram_1_virtual_base+1);
    //     /* code */
    // }

    // scanf("%u %u",&freq,&amp);
    // spi_cs(0x01);
    //    AD9958_INIT();
    //    while(1)
    //    {AD9958_FREQ_CTRL(BOTH_ENABLE,freq);
    //    AD9958_AMP_CTRL(BOTH_ENABLE,amp);
    //    AD9958_PHASE_CTRL(CH0_ENABLE,0);
    //    AD9958_PHASE_CTRL(CH1_ENABLE,90);
    //    }
    //----code end----
    fpga_exit();
    return 0;
}

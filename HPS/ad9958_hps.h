/*
 * ad9958_hps.h
 *
 *  Created on: 2023年6月20日
 *  coding: UTF-8
 *      Author: Ming
 */

#ifndef AD9958_HPS_H_
#define AD9958_HPS_H_
#include "init.h"

//---------USER DEFINE START-----
#define OSC_CLK         25000000   //25M晶振    20~30M
#define PLL_RATIO       20         //倍频系数，4~20时有效；超此范围不倍频
#define IOUP   (1<<7)    //GPIO7
#define RESET  (1<<16)  //GPIO16
//---------USER DEFINE END-------

// Register addresses, writing to (MSB is 0 for a write)
#define CSR     0x00            //!< Channel select register            1 Byte
#define FR1     0x01            //!< Function register 1                3 Bytes
#define	CFR		0x03
#define CFTW0   0x04            //!< Channel Frequency Tuning Word      4 Bytes
#define CPOW    0x05            //!< Channel Phase Offset Word          2 Bytes
#define ACR     0x06            //!< Amplitude Control Register         3 Bytes

#define SPIMODE	0x02
#define CH0_ENABLE      0x40    //!< Only ch0 registers are written to
#define CH1_ENABLE      0x80    //!< Only ch1 registers are written to
#define BOTH_ENABLE     0xC0    //!< Both channel registers are written to
#define MAN_AMP         0x10    //!< Enable manual amplitude control
#define SYNC_DISABLE    0x20    //!< Disable the SYNC_CLK signal

void AD9958_CTRL(uint8_t ins, uint32_t data, uint8_t len);
void AD9958_IOUP();
void AD9958_FREQ_CTRL(uint8_t channel, uint64_t freq);
void AD9958_AMP_CTRL(uint8_t channel, uint16_t amp);
void AD9958_PHASE_CTRL(uint8_t channel, float phase);
void AD9958_WHOLE_CTRL(uint8_t channel, uint32_t freq, uint16_t phase, double amp);
void AD9958_INIT();
void AD9958_IO_UPDATE();

extern uint32_t pio0;

void AD9958_IO_UPDATE()
{
    for(int i=0;i<1000;i++);//delay
    *(pio0_virtual_base+1)|=IOUP;//GPIO4
    pio0|=IOUP;
    *pio0_virtual_base=pio0;
    for(int i=0;i<1000;i++);//delay
    pio0&=!IOUP;
    *pio0_virtual_base=pio0;
}
void AD9958_INIT()
{
    *(pio0_virtual_base+1)|=IOUP;
    pio0&=!IOUP;
    *(pio0_virtual_base+1)|=RESET;
    pio0|=RESET;
    *pio0_virtual_base=pio0;
    for(int i=0;i<1000;i++);
    pio0&=!RESET;
    *pio0_virtual_base=pio0;

    spi_write_byte(CSR);
    spi_write_byte(SPIMODE);

    spi_write_byte(FR1);
    spi_write_byte(0x80|(PLL_RATIO<<2));
    spi_write_byte(0x00);
    spi_write_byte(0x00);

    spi_write_byte(CFR);
    spi_write_byte(0x00);
    spi_write_byte(0x03);
    spi_write_byte(0x00);
    AD9958_IO_UPDATE();

    spi_write_byte(CFR);
    spi_write_byte(0x00);
    spi_write_byte(0x03);
    spi_write_byte(0x04);
    AD9958_IO_UPDATE();
}
void AD9958_FREQ_CTRL(uint8_t channel, uint64_t freq)
{
    uint32_t FPW=(freq<<32)/OSC_CLK/PLL_RATIO;
    printf("%d\n",FPW);
    static uint8_t freqdata[4];
    freqdata[0]=FPW>>24;
    freqdata[1]=FPW>>16;
    freqdata[2]=FPW>>8;
    freqdata[3]=FPW;

    spi_write_byte(CSR);
    spi_write_byte(channel|SPIMODE);
    
    spi_write_byte(CFTW0);
    spi_write(freqdata,4);
    AD9958_IO_UPDATE();
}
void AD9958_AMP_CTRL(uint8_t channel, uint16_t amp)
{
    static uint8_t ampdata[3];
    ampdata[0]=0;
    ampdata[1]=(amp>>8) | MAN_AMP;
    ampdata[2]=amp;

    spi_write_byte(CSR);
    spi_write_byte(channel|SPIMODE);
    spi_write_byte(ACR);
    spi_write(ampdata,3);

    AD9958_IO_UPDATE();
}
void AD9958_PHASE_CTRL(uint8_t channel, float phase)
{

    spi_write_byte(CSR);
    spi_write_byte(channel|SPIMODE);

    spi_write_byte(CPOW);
    uint16_t _phase=phase*16384/360;
    spi_write_byte(_phase>>8);
    spi_write_byte(_phase);

    AD9958_IO_UPDATE();
}


#endif /* AD9958_HPS_H_ */

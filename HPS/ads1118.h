/*
 * ads1118.h
 *
 *  Created on: 2023年7月4日
 *      Author: Ming
 */







#ifndef ADS1118_H_
#define ADS1118_H_
#include "init.h"

#define     CHANNEL_MASK (7<<12)
#define     CHANNEL0    (4<<12)              
#define     CHANNEL1    (5<<12)      
#define     CHANNEL2    (6<<12)      
#define     CHANNEL3    (7<<12)      
#define     CHANNEL0_1  (0<<12)       
#define     CHANNEL0_3  (1<<12)      
#define     CHANNEL1_3  (2<<12)      
#define     CHANNEL2_3  (3<<12)      

#define     FSR_MASK    (7<<9)
#define     FSR6144     (0<<9)    //6.098
#define     FSR4096     (1<<9)    //4.064
#define     FSR2048     (2<<9)    //2.035
#define     FSR1024     (3<<9)    //1.016
#define     FSR512      (4<<9)    //507
#define     FSR256      (5<<9)    //253
#define     RNG6144     6098
#define     RNG4096     4064
#define     RNG2048     2035
#define     RNG1024     1016
#define     RNG512      507
#define     RNG256      253

#define     MODE_MASK   (1<<8)
#define     CONTINUOUS  (0<<8)
#define     SINGLE      (1<<8)

#define     RATE_MASK   (7<<5)
#define     RATE8       (0<<5)
#define     RATE16      (1<<5)   
#define     RATE32      (2<<5)   
#define     RATE64      (3<<5)   
#define     RATE128     (4<<5)   
#define     RATE250     (5<<5)   
#define     RATE475     (6<<5)   
#define     RATE860     (7<<5)   

#define     TEMPR       (1<<4)

#define     PLUP_EN     (1<<3)
#define     PLUP_DIS    (1<<3)

#define     SET_EN      (1<<1)

uint16_t conf_default=CHANNEL0|FSR2048|CONTINUOUS|RATE64|PLUP_EN|SET_EN;
static uint16_t config;
uint32_t* conf_add;
int32_t* data_add;
void ads1118_init(uint32_t * confadd,int32_t * dataadd,uint16_t conf);
void ads1118_init(uint32_t * confadd,int32_t * dataadd,uint16_t conf)
{
    config=conf;
    conf_add=confadd;
    data_add=dataadd;
    *conf_add=config;
}
void ads1118_channel(uint16_t ch)
{
    config&=~CHANNEL_MASK;
    config|=ch;
    *conf_add=config;
}
void ads1118_fsr(uint16_t fsr)
{
    config&=~FSR_MASK;
    config|=fsr;
    *conf_add=config;
}
void ads1118_rate(uint16_t rate)
{
    config&=~RATE_MASK;
    config|=rate;
    *conf_add=config;
}
int read1118(uint16_t ch,uint16_t fsr)
{
    ads1118_channel(ch);
    ads1118_fsr(fsr);
    delay_us(100000);
    short d=*data_add;
    return d;
}
float auto1118(uint16_t ch,int _max,int _min)
{
    int x;
    if(_max>=5)
        {x=read1118(ch,FSR6144);
        if(x>16384||x<-16384)return RNG6144*x/32768;}

    if(_max>=4&&_min<=4)
        {x=read1118(ch,FSR4096);
        if(x>16384||x<-16384)return RNG4096*x/32768;}

    if(_max>=3&&_min<=3)
        {x=read1118(ch,FSR2048);
        if(x>16384||x<-16384)return RNG2048*x/32768;}

    if(_max>=2&&_min<=2)
        {x=read1118(ch,FSR1024);
        if(x>16384||x<-16384)return RNG1024*x/32768;}

    if(_max>=1&&_min<=1)
        {x=read1118(ch,FSR512);
        if(x>16384||x<-16384)return RNG512*x/32768;}

    if(_max>=0&&_min<=0)
        {x=read1118(ch,FSR256);
        return RNG256*x/32768;}
}
#endif /* ADS1118_H_ */

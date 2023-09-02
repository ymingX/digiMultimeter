#include "init.h"

#include "ads1118.h"
#include <math.h>
extern uint32_t pio0;

#define AC_DC (1 << 14)
#define DC_MASK (15 << 27)
#define DCx64 (8 << 27)
#define DCx1 (5 << 27)
#define DCx4_15 (2 << 27)

#define AC_MASK ((1 << 31) + (1 << 16))
#define AC_RAT (1 << 31)
#define RMS_CS (1 << 16) // 637
#define CS_FREQ (100000)

// 电阻档参考电阻
#define REFRES10 (56)
#define REFRES1k (2400)
#define REFRES100k (24000)
#define REFRES1M (200000)
#define RESRATIO (1 << 15)

// #define RES_MASK
#define RESRNGCTL10 (0 << 24)
#define RESRNGCTL1k (4 << 24)
#define RESRNGCTL100k (2 << 24)
#define RESRNGCTL1M (1 << 24)

#define INDUCFREQ (0 << 22)
#define CAPFREQ (2 << 22)
#define ACFREQ (1 << 22)

float res(int range);
float autores();
extern uint32_t *freq;

float res(int range)
{
    // pio0&=~RES_MASK;
    // pio0|=range;
    pio0 = range;
    *pio0_virtual_base = pio0;
    delay_us(4000);
    // float volt=auto1118(CHANNEL2_3,4,0);
    float volt3 = auto1118(CHANNEL3, 4, 0);
    float volt2 = auto1118(CHANNEL2, 4, 0);
    float res;
    if (range == RESRNGCTL10)
    {
        res = (volt3 / volt2 - 1) * REFRES10;
        res = 1.0049*res-0.009;
    }
    else if (range == RESRNGCTL1k)
    // return (2.5/volt-1)*REFRES1k+3.7831;
    {
        res = (volt3 / volt2 - 1) * REFRES1k;
        res +=1.86;
    }
    else if (range == RESRNGCTL100k)
    {
        res = (volt3 / volt2 - 1) * REFRES100k;
        res = 0.9972*res+31.5;
    }
    else if (range == RESRNGCTL1M)
    {
        res = (volt3 / volt2 - 1) * REFRES1M;
        if(res>800000)res-=3000;
    }
    return res;
}
float autores()
{
    float r;
    r = res(RESRNGCTL10);
    if (r < 450)
        return r;

    r = res(RESRNGCTL1k);
    if (r < 5000)
        return r;

    r = res(RESRNGCTL100k);
    if (r < 80000)
        return r;

    r = res(RESRNGCTL1M);
    return r;
}
float cap() // nF
{
    pio0 = CAPFREQ;
    *pio0_virtual_base = pio0;
    static double c = 35659.014;
    delay_us(1000000);
    int f = *freq;
    return c / f - 0.11;
}
float induc() // mH
{
    pio0 = INDUCFREQ;
    *pio0_virtual_base = pio0;

    delay_us(1000000);
    // float a=1.144874e-7;
    double a = 8734584797;
    long long f2 = *freq;
    f2 *= f2;
    return a / f2;
}
float DCRMS()
{
    pio0 = 0;
    pio0 &= ~AC_DC;
    pio0 |= DCx4_15;
    *pio0_virtual_base = pio0;
    delay_us(100000);
    float volt = auto1118(CHANNEL0, 4, 0);

    if (volt < 1)
    {
        pio0 &= ~DC_MASK;
        pio0 |= DCx1;
        *pio0_virtual_base = pio0;
        delay_us(100000);
        volt = auto1118(CHANNEL0, 4, 0);

        if (volt < 0.064)
        {
            pio0 &= ~DC_MASK;
            pio0 |= DCx64;
            *pio0_virtual_base = pio0;
            delay_us(100000);
            volt = auto1118(CHANNEL0, 4, 0) / 64 * 1.0012 - 0.0013;
        }
        return volt * 1.007 + 0.0005;
    }
    // volt=volt*15/4;
    volt = volt * 3.778 -0.025;
    return volt;
}
float ACRMS() // mV
{
    pio0 = ACFREQ | AC_RAT | AC_DC; // x3
    *pio0_virtual_base = pio0;
    delay_us(200000);
    int f=*freq;
    if(f>17108854)f=0;
    if (f > CS_FREQ)
    { // 637 or 8361
        pio0 &= ~RMS_CS;
        *pio0_virtual_base = pio0;
        delay_us(200000);
    }
    else
    {
        pio0 |= RMS_CS;
        *pio0_virtual_base = pio0;
        delay_us(200000);
    }
    float volt = auto1118(CHANNEL1, 4, 0);
    if ((pio0 & RMS_CS) == 0) // 8361
    {
        if (volt > 2.4)
        {
            pio0 &= ~AC_MASK; // x1/3
            pio0 &= ~RMS_CS;
            *pio0_virtual_base = pio0;
            delay_us(500000);
            volt = auto1118(CHANNEL1, 4, 0);

            if(volt<1.4)
                volt=560.9*volt-24;
            else if(volt<2.6)
                volt=546.55*volt+1.97;
            else volt=527*volt+51.15;
        }
        else
        {
            volt = 88.42 * volt - 3.497;
            return volt;
        }
        return volt;
    }
    else // 637
    {
        delay_us(1200000);
        volt = auto1118(CHANNEL1, 4, 0)*1000;
        if(volt>1200)
        {
            pio0 &= ~AC_MASK; // x1/3
            pio0 |= RMS_CS;
            *pio0_virtual_base = pio0;
            delay_us(1500000);
            volt = auto1118(CHANNEL1, 4, 0);
            return volt*4385-320;
        }
        else return volt/1.5;
    }
}

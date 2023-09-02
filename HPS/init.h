/*
 * init.h
 *
 *  Created on: 2023��6��20��
 *      Author: Ming
 */

#ifndef INIT_H_
#define INIT_H_

#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <stdint.h>
#define soc_cv_av
#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"
#include "hps_0.h"
#include "socal/alt_gpio.h"

#define HW_REGS_BASE (ALT_STM_OFST)		// HPS????????
#define HW_REGS_SPAN (0x04000000)		// HPS?????????
#define HW_REGS_MASK (HW_REGS_SPAN - 1) // HPS?????????

int fd;
static  void *periph_virtual_base;                  // ????????
static  uint32_t *led_pio_virtual_base = NULL;	    // led_pio ????
static  uint32_t *button_pio_virtual_base = NULL;   // button_pio ????
static  uint32_t *sw_pio_virtual_base = NULL;	    // button_pio ????
static  uint32_t *uart_0_virtual_base = NULL;		 // button_pio ????
static  uint32_t *spi_0_virtual_base = NULL;		 // button_pio ????
static  uint32_t *pio0_virtual_base = NULL;		 // button_pio ????
static  uint16_t  *ram_0_virtual_base = NULL;		 // button_pio ????
static  uint32_t  *ram_1_virtual_base = NULL;		 // button_pio ????

void fpga_init(){
	// ?? MMU
	if ((fd = open("/dev/mem", (O_RDWR | O_SYNC))) == -1)
	{
		printf("ERROR: could not open \"/dev/mem\"...\n");
		exit (1);
	}
	// ?????????????
	periph_virtual_base = mmap(NULL, HW_REGS_SPAN, (PROT_READ | PROT_WRITE),MAP_SHARED, fd, HW_REGS_BASE);
	if (periph_virtual_base == MAP_FAILED)
	{
		printf("ERROR: mmap() failed...\n");
		close(fd);
		exit (1);
	}
	// ??????????
	led_pio_virtual_base = periph_virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + LED_PIO_BASE) & (unsigned long)(HW_REGS_MASK));
	button_pio_virtual_base = periph_virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + BUTTON_PIO_BASE) & (unsigned long)(HW_REGS_MASK));
	sw_pio_virtual_base = periph_virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + DIPSW_PIO_BASE) & (unsigned long)(HW_REGS_MASK));
	uart_0_virtual_base = periph_virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + UART_0_BASE) & (unsigned long)(HW_REGS_MASK));
	spi_0_virtual_base = periph_virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + SPI_0_BASE) & (unsigned long)(HW_REGS_MASK));
	pio0_virtual_base = periph_virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + PIO_0_BASE) & (unsigned long)(HW_REGS_MASK));
	ram_0_virtual_base = periph_virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + ONCHIP_MEMORY2_0_BASE) & (unsigned long)(HW_REGS_MASK));
	ram_1_virtual_base = periph_virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + ONCHIP_MEMORY2_1_BASE) & (unsigned long)(HW_REGS_MASK));

}

void delay_us(int x)
{
	for(int i=0;i<x;i++)
		for(int j=0;j<110;j++);
}

void fpga_exit(){
    if (munmap(periph_virtual_base, HW_REGS_SPAN) != 0)
	{
		printf("ERROR: munmap() failed...\n");
		close(fd);
		exit (1);
	}
	close(fd); // ??MMU
	exit (0);
}

#endif /* INIT_H_ */

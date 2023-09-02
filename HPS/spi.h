/*
 * spi.h
 *
 *  Created on: 2023Äę6ÔÂ20ČŐ
 *      Author: Ming
 */

#ifndef SPI_H_
#define SPI_H_

void spi_cs(uint32_t cs);
void spi_write_byte(uint8_t ch);
char spi_read_byte();
void spi_write(uint8_t *str,int len);

void spi_write_byte(uint8_t ch)
{
	printf("%d\n",ch);
    uint32_t spi_status;
    do{
        spi_status=*(spi_0_virtual_base+2);
    }while(!(spi_status & 0x40));
	*(spi_0_virtual_base + 1) = ch;	 // 发送一个字符
}
void spi_write(uint8_t *str,int len)
{
    for(int i=0;i<len;i++)
        spi_write_byte(*(str+i));
}
void spi_cs(uint32_t cs)
{
	*(spi_0_virtual_base + 5) = cs;
}


#endif /* SPI_H_ */

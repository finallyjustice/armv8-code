#include "device.h"

unsigned int  *uart_base = (unsigned int *)UART_BASE;

void bootmain(void)
{
	uart_base[0] = 0x45;
	
	while(1)
	return;
}

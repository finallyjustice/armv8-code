#include "device.h"

unsigned int  *uart_base = (unsigned int *)UART_BASE;

void uart_send(unsigned char c)
{
	*uart_base = c;
	if(c == '\n')
		*uart_base = '\r';
}

void bootmain(void)
{
	uart_send('Y');
	uart_send('\n');

	while(1)
	return;
}

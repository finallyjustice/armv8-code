#include "device.h"

.text

.globl	_start
_start:
	
	/*
	 * UART initialisation (38400 8N1)
	 */
	ldr	x4, =UART_BASE		// UART base
	mov	w5, #0x10			// ibrd
	str	w5, [x4, #0x24]
	mov	w5, #0xc300
	orr	w5, w5, #0x0001		// cr
	str	w5, [x4, #0x30]

	/*
	 * CLCD output site MB
	 */
	ldr	x4, =SYSREGS_BASE
	ldr	w5, =(1 << 31) | (1 << 30) | (7 << 20) | (0 << 16)	// START|WRITE|MUXFPGA|SITE_MB
	str	wzr, [x4, #0xa0]	// V2M_SYS_CFGDATA
	str	w5, [x4, #0xa4]		// V2M_SYS_CFGCTRL

	/* 
	 * check CPU ID
	 */
	mrs x0, mpidr_el1
	tst x0, #15
	b.ne    second_cpu
	b.eq	first_cpu


first_cpu:

	/* 
	 * print 'A' on UART
	 */
	ldr x4, =UART_BASE
	mov w1, #TEST_TEST
	str w1, [x4]

	ldr x4, =UART_BASE
	mov w1, #66
	str w1, [x4]
	
	b bootmain

second_cpu:	
	b second_cpu


.data 
msg:
	.ascii "First CPU!\n"


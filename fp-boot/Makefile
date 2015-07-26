PHYS_OFFSET	:= 0x80000000
UART_BASE	:= 0x1c090000
SYSREGS_BASE	:= 0x1c010000
GIC_DIST_BASE	:= 0x2c001000
GIC_CPU_BASE	:= 0x2c002000
CNTFRQ		:= 0x01800000	# 24Mhz

CPPFLAGS	+= $(INITRD_FLAGS)

BOOTLOADER	:= boot.S
MBOX_OFFSET	:= 0xfff8
LD_SCRIPT	:= model.lds.S
IMAGE		:= kernel.axf

CROSS_COMPILE	?= aarch64-none-linux-gnu-
CC		:= $(CROSS_COMPILE)gcc
LD		:= $(CROSS_COMPILE)ld

all: $(IMAGE)

clean:
	rm -f $(IMAGE) boot.o 

$(IMAGE): boot.o kernel.ld 
	$(LD) -o $@ --script=kernel.ld

boot.o: $(BOOTLOADER) Makefile
	$(CC) $(CPPFLAGS) -DCNTFRQ=$(CNTFRQ) -DUART_BASE=$(UART_BASE) -DSYSREGS_BASE=$(SYSREGS_BASE) -DGIC_DIST_BASE=$(GIC_DIST_BASE) -DGIC_CPU_BASE=$(GIC_CPU_BASE) -c -o $@ $(BOOTLOADER)

# The filesystem archive might not exist if INITRD is not being used
.PHONY: all clean

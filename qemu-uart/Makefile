IMAGE		:= kernel.axf

CROSS_COMPILE = aarch64-linux-gnu-
CC		= $(CROSS_COMPILE)gcc
LD		= $(CROSS_COMPILE)ld
OBJDUMP = $(CROSS_COMPILE)objdump

CFLAGS = -Wall -O0 -nostdlib -nostartfiles -ffreestanding -march=armv8-a -g

OBJS = \
	   main.o

all: $(IMAGE)

boot.o: boot.S
	$(CC) boot.S -c -o boot.o

$(IMAGE): kernel.ld boot.o $(OBJS)
	$(LD) boot.o $(OBJS) libgcc.a -T kernel.ld -o $(IMAGE)
	$(OBJDUMP) -d kernel.axf > kernel.asm
	$(OBJDUMP) -t kernel.axf | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > kernel.sym

clean:
	rm -f $(IMAGE) *.o *.asm *.sym

.PHONY: all clean

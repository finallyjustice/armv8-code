IMAGE		:= kernel.axf

CROSS_COMPILE	?= aarch64-none-linux-gnu-
CC		:= $(CROSS_COMPILE)gcc
LD		:= $(CROSS_COMPILE)ld

CFLAGS = -Wall -O0 -nostdlib -nostartfiles -ffreestanding -march=armv8-a

OBJS = \
	   main.o

all: $(IMAGE)

boot.o: boot.S
	$(CC) boot.S -c -o boot.o

$(IMAGE): kernel.ld boot.o $(OBJS)
	$(LD) boot.o $(OBJS) -T kernel.ld -o $(IMAGE)

clean:
	rm -f $(IMAGE) *.o 

.PHONY: all clean

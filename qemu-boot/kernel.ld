OUTPUT_FORMAT("elf64-littleaarch64")
OUTPUT_ARCH(aarch64)
TARGET(binary)

SECTIONS
{
	. = 0x80000000;
	.text : { boot.o }
	. = 0x80000000 + 0xfff8;
	mbox = .;
	.mbox : { QUAD(0x0) }

	.data : { *(.data) }
	.bss : { *(.bss) }
}

OUTPUT_FORMAT("elf64-littleaarch64")
OUTPUT_ARCH(aarch64)
TARGET(binary)

SECTIONS
{
	. = 0x80000000;
	.text : { *(.text) }
	.data : { *(.data) }
	.bss : { *(.bss) }
}

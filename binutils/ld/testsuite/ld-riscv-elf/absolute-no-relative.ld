ENTRY(_start)
SECTIONS {
	__symbol_abs__ = 0x1234;
	.text 0x10000 : { *(.text*)}
	.got  0x20000 : { *(.got*) }
}

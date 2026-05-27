# Writeable gcc_except_table is required in order to put this section after
# the DATA_SEGMENT_ALIGN directive in the default linker script (and hence
# in the same PT_LOAD as the PT_TLS segment, and hence so that the
# gcc_except_table can affect the .tbss section location).
	.section	.gcc_except_table,"aw",%progbits
# Alignment is needed -- otherwise gcc_except_table start position seems to
# be adjusted so that the tbss section is fully aligned.
	.balign 4
	.ascii "Odd number of chars"

	.section	.tbss,"awT",%nobits
	.balign 4
	.type	xyz, %object
	.size	xyz, 4
xyz:
	.zero	4

	.data
dataval:
	.balign 4
	.ascii "x"

	.text
	.global _start
_start:

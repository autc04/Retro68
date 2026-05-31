#as: -32
#objdump: -dr --prefix-addresses --show-raw-insn
#name: MIPS 64-bit div
#source: div64.s

# Test the div macro.

.*: +file format .*mips.*

Disassembly of section \.text:
[0-9a-f]+ <[^>]*> 14c00002 	bnez	a2,[0-9a-f]+ <[^>]*>
[0-9a-f]+ <[^>]*> 00a6001e 	ddiv	zero,a1,a2
[0-9a-f]+ <[^>]*> 0007000d 	break	0x7
[0-9a-f]+ <[^>]*> 2401ffff 	li	at,-1
[0-9a-f]+ <[^>]*> 14c10004 	bne	a2,at,[0-9a-f]+ <[^>]*>
[0-9a-f]+ <[^>]*> 00010ffc 	dsll32	at,at,0x1f
[0-9a-f]+ <[^>]*> 14a10002 	bne	a1,at,[0-9a-f]+ <[^>]*>
[0-9a-f]+ <[^>]*> 00000000 	nop
[0-9a-f]+ <[^>]*> 0006000d 	break	0x6
[0-9a-f]+ <[^>]*> 00002012 	mflo	a0
[0-9a-f]+ <[^>]*> 24010002 	li	at,2
[0-9a-f]+ <[^>]*> 00000000 	nop
[0-9a-f]+ <[^>]*> 00a1001f 	ddivu	zero,a1,at
[0-9a-f]+ <[^>]*> 00002012 	mflo	a0
[0-9a-f]+ <[^>]*> 34018000 	li	at,0x8000
[0-9a-f]+ <[^>]*> 00000000 	nop
[0-9a-f]+ <[^>]*> 00a1001e 	ddiv	zero,a1,at
[0-9a-f]+ <[^>]*> 00002010 	mfhi	a0
[0-9a-f]+ <[^>]*> 24018000 	li	at,-32768
[0-9a-f]+ <[^>]*> 00000000 	nop
[0-9a-f]+ <[^>]*> 00a1001f 	ddivu	zero,a1,at
[0-9a-f]+ <[^>]*> 00002010 	mfhi	a0
	\.\.\.

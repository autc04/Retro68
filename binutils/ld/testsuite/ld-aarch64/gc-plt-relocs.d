#source: gc-plt1.s
#source: gc-plt-main.s
#source: gc-plt-hidden.s
#source: gc-plt2.s
#target: [check_shared_lib_support]
#ld: --gc-sections -T aarch64.ld --shared --hash-style=sysv
#objdump: -dT

# Shared object with plt related relocs against global symbol
# and local functions gced.  After gc-section removal we are
# checking that the function does not exist.

.*:     file format elf64-(little|big)aarch64

DYNAMIC SYMBOL TABLE:
0+10000 g    DF \.text	0+4 _start
0+00000      D  \*UND\*	0+ foo
0+10008 g    DF \.text	0+ bar

Disassembly of section \.plt:

0+9000 \<\.plt\>:
    9000:	a9bf7bf0 	stp	x16, x30, \[sp, #-16\]!
    9004:	f00919b0 	adrp	x16, 12340000 \<_GLOBAL_OFFSET_TABLE_\>
    9008:	f9400e11 	ldr	x17, \[x16, #24\]
    900c:	91006210 	add	x16, x16, #0x18
    9010:	d61f0220 	br	x17
    9014:	d503201f 	nop
    9018:	d503201f 	nop
    901c:	d503201f 	nop
    9020:	f00919b0 	adrp	x16, 12340000 \<_GLOBAL_OFFSET_TABLE_\>
    9024:	f9401211 	ldr	x17, \[x16, #32\]
    9028:	91008210 	add	x16, x16, #0x20
    902c:	d61f0220 	br	x17

Disassembly of section .text:

0+10000 \<_start\>:
   10000:	97ffe408 	bl	9020 \<\.plt\+0x20>

0+10004 \<hidfn\>:
   10004:	8a000000 	and	x0, x0, x0

0+10008 \<bar\>:
   10008:	14000001 	b	1000c \<foo\>

0+1000c \<foo\>:
   1000c:	97fffffe 	bl	10004 \<hidfn\>

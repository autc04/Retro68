#source: farcall-missing-type-main-undefweak.s
#as:
#ld:-T farcall-missing-type.ld
#objdump: -dr
#...
Disassembly of section .text:

.* <__start>:
 +[0-9a-f]+:	.... .... 	push	{r4, lr}
 +[0-9a-f]+:	.... .... 	nop.w
 +[0-9a-f]+:	.... .... 	pop	{r4, pc}

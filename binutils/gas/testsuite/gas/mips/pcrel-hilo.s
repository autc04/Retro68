	.module	mips64r6

	.text
	.align	16
	.globl	foo
	.ent	foo
foo:
0:	auipc	$4, %pcrel_hi(bar + 0x7fec)
1:	lui	$5, %hi(baz)
2:	auipc	$6, %pcrel_hi(bar + 0x7ff8)
3:	auipc	$7, %pcrel_hi(bar + 0xfff0)
4:	addiu	$4, %pcrel_lo(bar + 0x7fec + (4b - 0b))
5:	addiu	$5, %lo(baz)
6:	addiu	$6, %pcrel_lo(bar + 0x7ff8 + (6b - 2b))
7:	addiu	$7, %pcrel_lo(bar + 0xfff0 + (7b - 3b))
10:	auipc	$4, %pcrel_hi(bar + 0x800c)
11:	lui	$5, %hi(baz)
12:	auipc	$6, %pcrel_hi(bar + 0x8018)
13:	auipc	$7, %pcrel_hi(bar + 0x10010)
	.rept	49152
	nop
	.endr
14:	addiu	$4, %pcrel_lo(bar + 0x800c + (14b - 10b))
15:	addiu	$5, %lo(baz)
16:	addiu	$6, %pcrel_lo(bar + 0x8018 + (16b - 12b))
17:	addiu	$7, %pcrel_lo(bar + 0x10010 + (17b - 13b))
24:	addiu	$16, $0, %pcrel_lo(bar + 0x3803c + (24b - 20f))
25:	addiu	$17, $0, %lo(baz)
26:	addiu	$18, $0, %pcrel_lo(bar + 0x38048 + (26b - 22f))
27:	addiu	$19, $0, %pcrel_lo(bar + 0x40040 + (27b - 23f))
20:	auipc	$4, %pcrel_hi(bar + 0x3803c)
21:	lui	$5, %hi(baz)
22:	auipc	$6, %pcrel_hi(bar + 0x38048)
23:	auipc	$7, %pcrel_hi(bar + 0x40040)
	addu	$4, $4, $16
	addu	$5, $5, $17
	addu	$6, $6, $18
	addu	$7, $7, $19
	jrc	$31
	.end	foo

	.data
	.align	16
	.globl	bar
	.type	bar, @object
bar:
	.space	0x18000
	.size	bar, . - bar

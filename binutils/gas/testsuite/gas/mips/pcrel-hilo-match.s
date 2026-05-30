	.module	mips64r6

	.align	2
	.globl	_pinit
	.ent	_pinit
_pinit:
	lw	$3,8($23)
	li	$5,1
10:	auipc	$2,%pcrel_hi(__var1)
	ori	$3,$3,0x1
11:	auipc	$4,%pcrel_hi(var4)
	sw	$3,8($23)
12:	addiu	$4,$4,%pcrel_lo(var4 + (12b - 11b))
13:	auipc	$3,%pcrel_hi(var5)
14:	sw	$5,%pcrel_lo(__var1 + (14b - 10b))($2)
15:	auipc	$19,%pcrel_hi(hilo_match)
16:	auipc	$2,%pcrel_hi(__var3)
17:	sw	$5,%pcrel_lo(var5 + (17b - 13b))($3)
18:	auipc	$25,%pcrel_hi(func4)
19:	sw	$5,%pcrel_lo(__var3 + (19b - 16b))($2)
20:	jialc	$25,%pcrel_lo(func4 + (20b - 18b))
21:	lw	$17,%pcrel_lo(hilo_match + (21b - 15b))($19)
22:	auipc	$2,%pcrel_hi(var6)
23:	auipc	$3,%pcrel_hi(var6+704)
24:	addiu	$16,$2,%pcrel_lo(var6 + (24b - 22b))
25:	addiu	$18,$3,%pcrel_lo(var6+704 + (25b - 23b))
26:	auipc	$19,%pcrel_hi(hilo_match)
28:	auipc	$25,%pcrel_hi(func3)
27:	sw	$2,%pcrel_lo(hilo_match + (27b - 26b))($19)
29:	jialc	$25,%pcrel_lo(func3 + (29b - 28b))
	.end	_pinit
	.size	_pinit, .-_pinit

	.align	2
	.weak	__var3
	.section	.sbss,"aw",@nobits
	.align	2
	.type	__var3, @object
	.size	__var3, 4
__var3:
	.space	4
	.weak	__var1
	.align	2
	.type	__var1, @object
	.size	__var1, 4
__var1:
	.space	4
	.data
	.align	2
	.weak	__hilo_match
	.align	2
	.type	__hilo_match, @object
	.size	__hilo_match, 4
__hilo_match:
	.space	4
	.data
	.align	2
	.align	2
	.type	var2, @object
	.size	var2, 32
var2:
	.word	0
	.word	-1
	.word	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.word	0
	.word	0
	.half	0
	.space	6
	.align	2
	.rdata
	.align	2
	.space	8
	.local	var5
	.comm	var5,4,4
	.align	2
	.local	var6
	.comm	var6,704,4

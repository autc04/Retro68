	.text
cmov:
	cmova		%eax, %ecx
	cmov.a		%eax, %ecx
	cmovnbe		%eax, %ecx
	cmov.nbe	%eax, %ecx

	cmovpw		%ax, %cx
	cmovw.p		%ax, %cx
	cmovpew		%ax, %cx
	cmovw.pe	%ax, %cx

	cmovll		(%rax), %ecx
	cmovl.l		(%rax), %ecx
	cmovngel	(%rax), %ecx
	cmovl.nge	(%rax), %ecx

	cmovzq		(%rax), %rcx
	cmovq.z		(%rax), %rcx
	cmoveq		(%rax), %rcx
	cmovq.e		(%rax), %rcx

	cmov.s		%eax, %ecx
	cmovw.s		%ax, %cx
	cmovl.s		%eax, %ecx
	cmovq.s		%rax, %rcx

	fcmovu		%st(1), %st
	fcmov.u		%st(1), %st

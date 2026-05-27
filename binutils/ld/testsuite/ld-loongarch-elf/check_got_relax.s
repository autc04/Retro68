	.text
	.global _start
_start:

	# dot not relax when overflow
	la.got	  $a0,sym_default_2
	la.got	  $a0,sym_hidden_2
	la.got	  $a0,sym_protected_2

sym_default_1:
	.word	  0x123

	.global	  sym_hidden_1
	.hidden	  sym_hidden_1
sym_hidden_1:
	.word	  0x123

	.global	    sym_protected_1
	.protected  sym_protected_1
sym_protected_1:
	.word	  0x123


	.section  .other,"ax",@progbits
underflow:
	# dot not relax when underflow
	la.got	  $a0,sym_default_1
	la.got	  $a0,sym_hidden_1
	la.got	  $a0,sym_protected_1

	.global	  sym_default_2
sym_default_2:
	.word	  0x456

	.global	  sym_hidden_2
	.hidden	  sym_hidden_2
sym_hidden_2:
	.word	  0x456

	.global	    sym_protected_2
	.protected  sym_protected_2
sym_protected_2:
	.word	  0x456

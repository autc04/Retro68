.text
.option pic
.option norvc
.p2align 3
.global _start
_start:
	nop

sym_local:
	nop

.global sym_global
sym_global:
	nop

.global sym_hidden
.hidden sym_hidden
sym_hidden:
	nop

.global sym_global_abs
.set sym_global_abs, 42

.global sym_weak_undef
.weak sym_weak_undef

# Got

.section .discard.got_local, "ax"
	la	x1, sym_local

.section .discard.got_global, "ax"
	la	x1, sym_global

# Data

.section .discard.local,"a"
.p2align 1
discard_local:
.quad sym_local

.section .discard.global,"a"
.p2align 1
discard_global:
.quad sym_global

.section .discard.hidden,"a"
.p2align 1
discard_hidden:
.quad sym_hidden

.section .discard.global_abs,"a"
.p2align 1
discard_global_abs:
.quad sym_global_abs

.section .discard.weak_undef,"a"
.p2align 1
discard_weak_undef:
.quad sym_weak_undef

.section .discard._DYNAMIC,"a"
.p2align 1
discard_DYNAMIC:
.quad _DYNAMIC

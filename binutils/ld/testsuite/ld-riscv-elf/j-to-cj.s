# Test case: j -> c.j second-pass relaxation
#
# This test verifies that the linker performs a second relaxation pass
# to convert j (jal x0) instructions to c.j when the distance shrinks
# due to other relaxations.
#
# c.j range: +/-2046 bytes (12-bit signed offset, LSB=0)
# Available on both RV32C and RV64C
#
# Scenario:
# 1. Multiple tails that relax from auipc+jalr (8B) to j (4B)
# 2. After first pass: critical tail to target is ~2050 bytes (> c.j range)
# 3. If second pass runs (j -> c.j for other tails), shrinkage
#    brings critical tail distance under 2046 bytes
#
# Expected behavior with two-pass relaxation:
# - All tails to f1-f10 become c.j
# - Critical tail also becomes c.j

	.text
	.globl _start
_start:
	tail f1
	tail f2
	tail f3
	tail f4
	tail f5
	tail f6
	tail f7
	tail f8
	tail f9
	tail f10

critical:
	# This tail should become c.j with two-pass relaxation
	tail target

	# Padding: 505 * 4 = 2020 bytes
	# After 1st pass (tail->j): distance = 4 + 2020 + 20 + 2 = 2046 (borderline)
	# After 2nd pass (j->c.j): distance = 2 + 2020 + 20 + 2 = 2044 (can c.j)
	.option norvc
	.rept 505
	nop
	.endr
	.option rvc

f1:	ret
f2:	ret
f3:	ret
f4:	ret
f5:	ret
f6:	ret
f7:	ret
f8:	ret
f9:	ret
f10:	ret

target:
	ret

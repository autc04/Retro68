# Test case: jal -> c.jal second-pass relaxation
#
# This test verifies that the linker performs a second relaxation pass
# to convert jal instructions to c.jal when the distance shrinks
# due to other relaxations.
#
# c.jal range: +/-2046 bytes (12-bit signed offset, LSB=0)
# Only available in RV32C (not RV64C)
#
# Scenario:
# 1. Multiple calls that relax from auipc+jalr (8B) to jal (4B)
# 2. After first pass: critical call to target is ~2050 bytes (> c.jal range)
# 3. If second pass runs (jal -> c.jal for other calls), shrinkage
#    brings critical call distance under 2046 bytes
#
# Expected behavior with two-pass relaxation:
# - All calls to f1-f10 become c.jal
# - Critical call also becomes c.jal

	.text
	.globl _start
_start:
	call f1
	call f2
	call f3
	call f4
	call f5
	call f6
	call f7
	call f8
	call f9
	call f10

critical:
	# This call should become c.jal with two-pass relaxation
	call target

	# Padding: 505 * 4 = 2020 bytes
	# After 1st pass (call->jal): distance = 4 + 2020 + 20 + 2 = 2046 (borderline)
	# After 2nd pass (jal->c.jal): distance = 2 + 2020 + 20 + 2 = 2044 (can c.jal)
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

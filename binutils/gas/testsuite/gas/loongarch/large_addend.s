    .text
    .global _start
_start:
    pcalau12i	$a0, %pc_hi20(_start+0x7fffabcd12345678)
    addi.d	$a1, $zero, %pc_lo12(_start+0x7fffabcd12345678)
    lu32i.d	$a1, %pc64_lo20(_start+0x7fffabcd12345678)
    lu52i.d	$a1, $a1, %pc64_hi12(_start+0x7fffabcd12345678)
    add.d	$a0, $a1, $a0

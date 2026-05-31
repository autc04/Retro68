# Check 64bit AMX-AVX512 instructions

	.text
_start:
	tcvtrowd2ps	%edx, %tmm5, %zmm30
	tcvtrowd2ps	%edx, %tmm2, %zmm30
	tcvtrowd2ps	$123, %tmm5, %zmm30
	tcvtrowd2ps	$123, %tmm2, %zmm30
	tcvtrowps2bf16h	%edx, %tmm5, %zmm30
	tcvtrowps2bf16h	%edx, %tmm2, %zmm30
	tcvtrowps2bf16h	$123, %tmm5, %zmm30
	tcvtrowps2bf16h	$123, %tmm2, %zmm30
	tcvtrowps2bf16l	%edx, %tmm5, %zmm30
	tcvtrowps2bf16l	%edx, %tmm2, %zmm30
	tcvtrowps2bf16l	$123, %tmm5, %zmm30
	tcvtrowps2bf16l	$123, %tmm2, %zmm30
	tcvtrowps2phh	%edx, %tmm5, %zmm30
	tcvtrowps2phh	%edx, %tmm2, %zmm30
	tcvtrowps2phh	$123, %tmm5, %zmm30
	tcvtrowps2phh	$123, %tmm2, %zmm30
	tcvtrowps2phl	%edx, %tmm5, %zmm30
	tcvtrowps2phl	%edx, %tmm2, %zmm30
	tcvtrowps2phl	$123, %tmm5, %zmm30
	tcvtrowps2phl	$123, %tmm2, %zmm30
	tilemovrow	%edx, %tmm5, %zmm30
	tilemovrow	%edx, %tmm2, %zmm30
	tilemovrow	$123, %tmm5, %zmm30
	tilemovrow	$123, %tmm2, %zmm30

_intel:
	.intel_syntax noprefix
	tcvtrowd2ps	zmm30, tmm5, edx
	tcvtrowd2ps	zmm30, tmm2, edx
	tcvtrowd2ps	zmm30, tmm5, 123
	tcvtrowd2ps	zmm30, tmm2, 123
	tcvtrowps2bf16h	zmm30, tmm5, edx
	tcvtrowps2bf16h	zmm30, tmm2, edx
	tcvtrowps2bf16h	zmm30, tmm5, 123
	tcvtrowps2bf16h	zmm30, tmm2, 123
	tcvtrowps2bf16l	zmm30, tmm5, edx
	tcvtrowps2bf16l	zmm30, tmm2, edx
	tcvtrowps2bf16l	zmm30, tmm5, 123
	tcvtrowps2bf16l	zmm30, tmm2, 123
	tcvtrowps2phh	zmm30, tmm5, edx
	tcvtrowps2phh	zmm30, tmm2, edx
	tcvtrowps2phh	zmm30, tmm5, 123
	tcvtrowps2phh	zmm30, tmm2, 123
	tcvtrowps2phl	zmm30, tmm5, edx
	tcvtrowps2phl	zmm30, tmm2, edx
	tcvtrowps2phl	zmm30, tmm5, 123
	tcvtrowps2phl	zmm30, tmm2, 123
	tilemovrow	zmm30, tmm5, edx
	tilemovrow	zmm30, tmm2, edx
	tilemovrow	zmm30, tmm5, 123
	tilemovrow	zmm30, tmm2, 123

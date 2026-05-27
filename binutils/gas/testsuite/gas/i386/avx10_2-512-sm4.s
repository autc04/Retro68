# Check 32bit SM4 instructions

	.text
_start:
	vsm4key4	%zmm4, %zmm5, %zmm6
	vsm4key4	0x10000000(%esp, %esi, 8), %zmm5, %zmm6
	vsm4key4	(%ecx), %zmm5, %zmm6
	vsm4key4	8128(%ecx), %zmm5, %zmm6
	vsm4key4	-8192(%edx), %zmm5, %zmm6
	vsm4rnds4	%zmm4, %zmm5, %zmm6
	vsm4rnds4	0x10000000(%esp, %esi, 8), %zmm5, %zmm6
	vsm4rnds4	(%ecx), %zmm5, %zmm6
	vsm4rnds4	8128(%ecx), %zmm5, %zmm6
	vsm4rnds4	-8192(%edx), %zmm5, %zmm6

_intel:
	.intel_syntax noprefix
	vsm4key4	zmm6, zmm5, zmm4
	vsm4key4	zmm6, zmm5, ZMMWORD PTR [esp+esi*8+0x10000000]
	vsm4key4	zmm6, zmm5, [ecx]
	vsm4key4	zmm6, zmm5, ZMMWORD PTR [ecx+8128]
	vsm4key4	zmm6, zmm5, [edx-8192]
	vsm4rnds4	zmm6, zmm5, zmm4
	vsm4rnds4	zmm6, zmm5, [esp+esi*8+0x10000000]
	vsm4rnds4	zmm6, zmm5, ZMMWORD PTR [ecx]
	vsm4rnds4	zmm6, zmm5, ZMMWORD PTR [ecx+8128]
	vsm4rnds4	zmm6, zmm5, [edx-8192]

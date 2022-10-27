# Check illegal AVX512F instructions
	.text
	.allow_index_reg
_start:
	mov {sae}, %eax{%k1}
	mov {sae}, %eax
	mov %ebx, %eax{%k2}
	vaddps %zmm3, %zmm1, %zmm2{z}{%k1}{z}
	vaddps %zmm3, %zmm1{%k3}, %zmm2{z}
	vaddps %zmm3, %zmm1{%k1}, %zmm2{%k2}

	vcvtps2pd (%eax), %zmm1{1to8}
	vcvtps2pd (%eax){1to16}, %zmm1

	vcvtps2pd (%eax){%k1}, %zmm1
	vcvtps2pd (%eax){z}, %zmm1

	vgatherqpd (%rdi,%zmm2,8),%zmm6
	vgatherqpd (%edi),%zmm6{%k1}
	vgatherqpd (%zmm2),%zmm6{%k1}
	vpscatterdd %zmm6,(%edi){%k1}
	vpscatterdd %zmm6,(%zmm2){%k1}

	.intel_syntax noprefix
	mov eax{k1}, {sae}
	mov eax, {sae}
	mov eax{k2}, ebx
	vaddps zmm2{z}{k1}{z}, zmm1, zmm3
	vaddps zmm2{z}, zmm1{k3}, zmm3
	vaddps zmm2{k2}, zmm1{k1}, zmm3

	vcvtps2pd zmm1{1to8}, [eax]
	vcvtps2pd zmm1, [eax]{1to16}

	vcvtps2pd zmm1, [eax]{k1}
	vcvtps2pd zmm1, [eax]{z}

	vgatherqpd zmm6, ZMMWORD PTR [rdi+zmm2*8]
	vgatherqpd zmm6{k1}, ZMMWORD PTR [edi]
	vgatherqpd zmm6{k1}, ZMMWORD PTR [zmm2+eiz]
	vpscatterdd ZMMWORD PTR [edi]{k1}, zmm6
	vpscatterdd ZMMWORD PTR [zmm2+eiz]{k1}, zmm6

	vaddps zmm2, zmm1, QWORD PTR [eax]{1to8}
	vaddps zmm2, zmm1, QWORD PTR [eax]{1to16}
	vaddpd zmm2, zmm1, DWORD PTR [eax]{1to8}
	vaddpd zmm2, zmm1, DWORD PTR [eax]{1to16}
	vaddps zmm2, zmm1, ZMMWORD PTR [eax]{1to16}
	vaddps zmm2, zmm1, DWORD PTR [eax]
	vaddpd zmm2, zmm1, QWORD PTR [eax]

	.att_syntax prefix
	vaddps %zmm0, %zmm1, %zmm2{%ecx}
	vaddps %zmm0, %zmm1, %zmm2{z}

	.intel_syntax noprefix
	vaddps zmm2{ecx}, zmm1, zmm0
	vaddps zmm2{z}, zmm1, zmm0

	.att_syntax prefix
	vmovaps (%eax){1to2}, %zmm1
	vmovaps (%eax){1to4}, %zmm1
	vmovaps (%eax){1to8}, %zmm1
	vmovaps (%eax){1to16}, %zmm1

	vcvtps2pd (%eax){1to2}, %zmm1
	vcvtps2pd (%eax){1to4}, %zmm1
	vcvtps2pd (%eax){1to8}, %zmm1
	vcvtps2pd (%eax){1to16}, %zmm1

	vcvtps2pd (%eax){1to2}, %ymm1
	vcvtps2pd (%eax){1to4}, %ymm1
	vcvtps2pd (%eax){1to8}, %ymm1
	vcvtps2pd (%eax){1to16}, %ymm1

	vcvtps2pd (%eax){1to2}, %xmm1
	vcvtps2pd (%eax){1to4}, %xmm1
	vcvtps2pd (%eax){1to8}, %xmm1
	vcvtps2pd (%eax){1to16}, %xmm1

	vaddps (%eax){1to2}, %zmm1, %zmm2
	vaddps (%eax){1to4}, %zmm1, %zmm2
	vaddps (%eax){1to8}, %zmm1, %zmm2
	vaddps (%eax){1to16}, %zmm1, %zmm2

	vaddps (%eax){1to2}, %ymm1, %ymm2
	vaddps (%eax){1to4}, %ymm1, %ymm2
	vaddps (%eax){1to8}, %ymm1, %ymm2
	vaddps (%eax){1to16}, %ymm1, %ymm2

	vaddps (%eax){1to2}, %xmm1, %xmm2
	vaddps (%eax){1to4}, %xmm1, %xmm2
	vaddps (%eax){1to8}, %xmm1, %xmm2
	vaddps (%eax){1to16}, %xmm1, %xmm2

	vaddpd (%eax){1to2}, %zmm1, %zmm2
	vaddpd (%eax){1to4}, %zmm1, %zmm2
	vaddpd (%eax){1to8}, %zmm1, %zmm2
	vaddpd (%eax){1to16}, %zmm1, %zmm2

	vaddpd (%eax){1to2}, %ymm1, %ymm2
	vaddpd (%eax){1to4}, %ymm1, %ymm2
	vaddpd (%eax){1to8}, %ymm1, %ymm2
	vaddpd (%eax){1to16}, %ymm1, %ymm2

	vaddpd (%eax){1to2}, %xmm1, %xmm2
	vaddpd (%eax){1to4}, %xmm1, %xmm2
	vaddpd (%eax){1to8}, %xmm1, %xmm2
	vaddpd (%eax){1to16}, %xmm1, %xmm2

	.intel_syntax noprefix
	vcvtps2pd zmm1, QWORD PTR [eax]
	vcvtps2pd ymm1, QWORD PTR [eax]
	vcvtps2pd xmm1, QWORD PTR [eax]

	vcvtps2pd xmm1, DWORD PTR [eax]{1to2}
	vcvtps2pd xmm1, DWORD PTR [eax]{1to4}
	vcvtps2pd xmm1, DWORD PTR [eax]{1to8}
	vcvtps2pd xmm1, DWORD PTR [eax]{1to16}

	vaddps zmm2, zmm1, QWORD PTR [eax]
	vaddps ymm2, ymm1, QWORD PTR [eax]
	vaddps xmm2, xmm1, QWORD PTR [eax]

	vaddps zmm2, zmm1, DWORD PTR [eax]{1to2}
	vaddps zmm2, zmm1, DWORD PTR [eax]{1to4}
	vaddps zmm2, zmm1, DWORD PTR [eax]{1to8}
	vaddps zmm2, zmm1, DWORD PTR [eax]{1to16}

	vaddps ymm2, ymm1, DWORD PTR [eax]{1to2}
	vaddps ymm2, ymm1, DWORD PTR [eax]{1to4}
	vaddps ymm2, ymm1, DWORD PTR [eax]{1to8}
	vaddps ymm2, ymm1, DWORD PTR [eax]{1to16}

	vaddps xmm2, xmm1, DWORD PTR [eax]{1to2}
	vaddps xmm2, xmm1, DWORD PTR [eax]{1to4}
	vaddps xmm2, xmm1, DWORD PTR [eax]{1to8}
	vaddps xmm2, xmm1, DWORD PTR [eax]{1to16}

	vaddpd zmm2, zmm1, DWORD PTR [eax]
	vaddpd ymm2, ymm1, DWORD PTR [eax]
	vaddpd xmm2, xmm1, DWORD PTR [eax]

	vaddpd zmm2, zmm1, QWORD PTR [eax]{1to2}
	vaddpd zmm2, zmm1, QWORD PTR [eax]{1to4}
	vaddpd zmm2, zmm1, QWORD PTR [eax]{1to8}
	vaddpd zmm2, zmm1, QWORD PTR [eax]{1to16}

	vaddpd ymm2, ymm1, QWORD PTR [eax]{1to2}
	vaddpd ymm2, ymm1, QWORD PTR [eax]{1to4}
	vaddpd ymm2, ymm1, QWORD PTR [eax]{1to8}
	vaddpd ymm2, ymm1, QWORD PTR [eax]{1to16}

	vaddpd xmm2, xmm1, QWORD PTR [eax]{1to2}
	vaddpd xmm2, xmm1, QWORD PTR [eax]{1to4}
	vaddpd xmm2, xmm1, QWORD PTR [eax]{1to8}
	vaddpd xmm2, xmm1, QWORD PTR [eax]{1to16}

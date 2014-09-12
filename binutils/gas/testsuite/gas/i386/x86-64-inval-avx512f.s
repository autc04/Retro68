# Check illegal AVX512F instructions
	.text
_start:
	mov {sae}, %rax{%k1}
	mov {sae}, %rax
	mov %rbx, %rax{%k2}
	vaddps %zmm3, %zmm1, %zmm2{z}{%k1}{z}
	vaddps %zmm3, %zmm1{%k3}, %zmm2{z}
	vaddps %zmm3, %zmm1{%k1}, %zmm2{%k2}

	vcvtps2pd (%rax), %zmm1{1to8}
	vcvtps2pd (%rax){1to16}, %zmm1

	vcvtps2pd (%rax){%k1}, %zmm1
	vcvtps2pd (%rax){z}, %zmm1

	.intel_syntax noprefix
	mov rax{k1}, {sae}
	mov rax, {sae}
	mov rax{k2}, rbx
	vaddps zmm2{z}{k1}{z}, zmm1, zmm3
	vaddps zmm2{z}, zmm1{k3}, zmm3
	vaddps zmm2{k2}, zmm1{k1}, zmm3

	vcvtps2pd zmm1{1to8}, [rax]
	vcvtps2pd zmm1, [rax]{1to16}

	vcvtps2pd zmm1, [rax]{k1}
	vcvtps2pd zmm1, [rax]{z}

	vaddps zmm2, zmm1, QWORD PTR [rax]{1to8}
	vaddps zmm2, zmm1, QWORD PTR [rax]{1to16}
	vaddpd zmm2, zmm1, DWORD PTR [rax]{1to8}
	vaddpd zmm2, zmm1, DWORD PTR [rax]{1to16}
	vaddps zmm2, zmm1, ZMMWORD PTR [rax]{1to16}
	vaddps zmm2, zmm1, DWORD PTR [rax]
	vaddpd zmm2, zmm1, QWORD PTR [rax]

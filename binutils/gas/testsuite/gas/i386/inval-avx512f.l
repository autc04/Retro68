.*: Assembler messages:
.*:4: Error: .*
.*:5: Error: .*
.*:6: Error: .*
.*:7: Error: .*
.*:8: Error: .*
.*:9: Error: .*
.*:11: Error: .*
.*:12: Error: .*
.*:14: Error: .*
.*:15: Error: .*
.*:17: Error: .*
.*:20: Error: .*
.*:21: Error: .*
.*:22: Error: .*
.*:23: Error: .*
.*:23: Error: .*
.*:24: Error: .*
.*:24: Error: .*
.*:25: Error: .*
.*:25: Error: .*
.*:27: Error: .*
.*:28: Error: .*
.*:30: Error: .*
.*:31: Error: .*
.*:33: Error: .*
.*:35: Error: .*
.*:36: Error: .*
.*:37: Error: .*
.*:38: Error: .*
.*:39: Error: .*
.*:40: Error: .*
.*:41: Error: .*
GAS LISTING .*


[ 	]*1[ 	]+# Check illegal AVX512F instructions
[ 	]*2[ 	]+\.text
[ 	]*3[ 	]+_start:
[ 	]*4[ 	]+mov \{sae\}, %eax\{%k1\}
[ 	]*5[ 	]+mov \{sae\}, %eax
[ 	]*6[ 	]+mov %ebx, %eax\{%k2\}
[ 	]*7[ 	]+vaddps %zmm3, %zmm1, %zmm2\{z\}\{%k1\}\{z\}
[ 	]*8[ 	]+vaddps %zmm3, %zmm1\{%k3\}, %zmm2\{z\}
[ 	]*9[ 	]+vaddps %zmm3, %zmm1\{%k1\}, %zmm2\{%k2\}
[ 	]*10[ 	]+
[ 	]*11[ 	]+vcvtps2pd \(%eax\), %zmm1\{1to8\}
[ 	]*12[ 	]+vcvtps2pd \(%eax\)\{1to16\}, %zmm1
[ 	]*13[ 	]+
[ 	]*14[ 	]+vcvtps2pd \(%eax\)\{%k1\}, %zmm1
[ 	]*15[ 	]+vcvtps2pd \(%eax\)\{z\}, %zmm1
[ 	]*16[ 	]+
[ 	]*17[ 	]+vgatherqpd \(%rdi,%zmm2,8\),%zmm6
[ 	]*18[ 	]+
[ 	]*19[ 	]+\.intel_syntax noprefix
[ 	]*20[ 	]+mov eax\{k1\}, \{sae\}
[ 	]*21[ 	]+mov eax, \{sae\}
[ 	]*22[ 	]+mov eax\{k2\}, ebx
[ 	]*23[ 	]+vaddps zmm2\{z\}\{k1\}\{z\}, zmm1, zmm3
[ 	]*24[ 	]+vaddps zmm2\{z\}, zmm1\{k3\}, zmm3
[ 	]*25[ 	]+vaddps zmm2\{k2\}, zmm1\{k1\}, zmm3
[ 	]*26[ 	]+
[ 	]*27[ 	]+vcvtps2pd zmm1\{1to8\}, \[eax\]
[ 	]*28[ 	]+vcvtps2pd zmm1, \[eax\]\{1to16\}
[ 	]*29[ 	]+
[ 	]*30[ 	]+vcvtps2pd zmm1, \[eax\]\{k1\}
[ 	]*31[ 	]+vcvtps2pd zmm1, \[eax\]\{z\}
[ 	]*32[ 	]+
[ 	]*33[ 	]+vgatherqpd zmm6, ZMMWORD PTR \[rdi\+zmm2\*8\]
[ 	]*34[ 	]+
[ 	]*35[ 	]+vaddps zmm2, zmm1, QWORD PTR \[eax\]\{1to8\}
[ 	]*36[ 	]+vaddps zmm2, zmm1, QWORD PTR \[eax\]\{1to16\}
[ 	]*37[ 	]+vaddpd zmm2, zmm1, DWORD PTR \[eax\]\{1to8\}
[ 	]*38[ 	]+vaddpd zmm2, zmm1, DWORD PTR \[eax\]\{1to16\}
[ 	]*39[ 	]+vaddps zmm2, zmm1, ZMMWORD PTR \[eax\]\{1to16\}
[ 	]*40[ 	]+vaddps zmm2, zmm1, DWORD PTR \[eax\]
[ 	]*41[ 	]+vaddpd zmm2, zmm1, QWORD PTR \[eax\]

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
.*:18: Error: .*
.*:19: Error: .*
.*:20: Error: .*
.*:21: Error: .*
.*:21: Error: .*
.*:22: Error: .*
.*:22: Error: .*
.*:23: Error: .*
.*:23: Error: .*
.*:25: Error: .*
.*:26: Error: .*
.*:28: Error: .*
.*:29: Error: .*
.*:31: Error: .*
.*:32: Error: .*
.*:33: Error: .*
.*:34: Error: .*
.*:35: Error: .*
.*:36: Error: .*
.*:37: Error: .*
GAS LISTING .*


[ 	]*1[ 	]+# Check illegal AVX512F instructions
[ 	]*2[ 	]+\.text
[ 	]*3[ 	]+_start:
[ 	]*4[ 	]+mov \{sae\}, %rax\{%k1\}
[ 	]*5[ 	]+mov \{sae\}, %rax
[ 	]*6[ 	]+mov %rbx, %rax\{%k2\}
[ 	]*7[ 	]+vaddps %zmm3, %zmm1, %zmm2\{z\}\{%k1\}\{z\}
[ 	]*8[ 	]+vaddps %zmm3, %zmm1\{%k3\}, %zmm2\{z\}
[ 	]*9[ 	]+vaddps %zmm3, %zmm1\{%k1\}, %zmm2\{%k2\}
[ 	]*10[ 	]+
[ 	]*11[ 	]+vcvtps2pd \(%rax\), %zmm1\{1to8\}
[ 	]*12[ 	]+vcvtps2pd \(%rax\)\{1to16\}, %zmm1
[ 	]*13[ 	]+
[ 	]*14[ 	]+vcvtps2pd \(%rax\)\{%k1\}, %zmm1
[ 	]*15[ 	]+vcvtps2pd \(%rax\)\{z\}, %zmm1
[ 	]*16[ 	]+
[ 	]*17[ 	]+\.intel_syntax noprefix
[ 	]*18[ 	]+mov rax\{k1\}, \{sae\}
[ 	]*19[ 	]+mov rax, \{sae\}
[ 	]*20[ 	]+mov rax\{k2\}, rbx
[ 	]*21[ 	]+vaddps zmm2\{z\}\{k1\}\{z\}, zmm1, zmm3
[ 	]*22[ 	]+vaddps zmm2\{z\}, zmm1\{k3\}, zmm3
[ 	]*23[ 	]+vaddps zmm2\{k2\}, zmm1\{k1\}, zmm3
[ 	]*24[ 	]+
[ 	]*25[ 	]+vcvtps2pd zmm1\{1to8\}, \[rax\]
[ 	]*26[ 	]+vcvtps2pd zmm1, \[rax\]\{1to16\}
[ 	]*27[ 	]+
[ 	]*28[ 	]+vcvtps2pd zmm1, \[rax\]\{k1\}
[ 	]*29[ 	]+vcvtps2pd zmm1, \[rax\]\{z\}
[ 	]*30[ 	]+
[ 	]*31[ 	]+vaddps zmm2, zmm1, QWORD PTR \[rax\]\{1to8\}
[ 	]*32[ 	]+vaddps zmm2, zmm1, QWORD PTR \[rax\]\{1to16\}
[ 	]*33[ 	]+vaddpd zmm2, zmm1, DWORD PTR \[rax\]\{1to8\}
[ 	]*34[ 	]+vaddpd zmm2, zmm1, DWORD PTR \[rax\]\{1to16\}
[ 	]*35[ 	]+vaddps zmm2, zmm1, ZMMWORD PTR \[rax\]\{1to16\}
[ 	]*36[ 	]+vaddps zmm2, zmm1, DWORD PTR \[rax\]
[ 	]*37[ 	]+vaddpd zmm2, zmm1, QWORD PTR \[rax\]

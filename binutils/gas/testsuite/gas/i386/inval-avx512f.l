.*: Assembler messages:
.*:5: Error: .*
.*:6: Error: .*
.*:7: Error: .*
.*:8: Error: .*
.*:9: Error: .*
.*:10: Error: .*
.*:12: Error: .*
.*:13: Error: .*
.*:15: Error: .*
.*:16: Error: .*
.*:18: Error: .*
.*:19: Error: .*
.*:20: Error: .*
.*:21: Error: .*
.*:22: Error: .*
.*:25: Error: .*
.*:26: Error: .*
.*:27: Error: .*
.*:28: Error: .*
.*:29: Error: .*
.*:30: Error: .*
.*:32: Error: .*
.*:33: Error: .*
.*:35: Error: .*
.*:36: Error: .*
.*:38: Error: .*
.*:39: Error: .*
.*:40: Error: .*
.*:41: Error: .*
.*:42: Error: .*
.*:44: Error: .*
.*:45: Error: .*
.*:46: Error: .*
.*:47: Error: .*
.*:48: Error: .*
.*:49: Error: .*
.*:50: Error: .*
.*:53: Error: .*
.*:54: Error: .*
.*:57: Error: .*
.*:58: Error: .*
.*:61: Error: .*vmovaps.*
.*:62: Error: .*vmovaps.*
.*:63: Error: .*vmovaps.*
.*:64: Error: .*vmovaps.*
.*:66: Error: .*vcvtps2pd.*
.*:67: Error: .*vcvtps2pd.*
.*:69: Error: .*vcvtps2pd.*
.*:71: Error: .*vcvtps2pd.*
.*:73: Error: .*vcvtps2pd.*
.*:74: Error: .*vcvtps2pd.*
.*:77: Error: .*vcvtps2pd.*
.*:78: Error: .*vcvtps2pd.*
.*:79: Error: .*vcvtps2pd.*
.*:81: Error: .*vaddps.*
.*:82: Error: .*vaddps.*
.*:83: Error: .*vaddps.*
.*:86: Error: .*vaddps.*
.*:87: Error: .*vaddps.*
.*:89: Error: .*vaddps.*
.*:91: Error: .*vaddps.*
.*:93: Error: .*vaddps.*
.*:94: Error: .*vaddps.*
.*:96: Error: .*vaddpd.*
.*:97: Error: .*vaddpd.*
.*:99: Error: .*vaddpd.*
.*:101: Error: .*vaddpd.*
.*:103: Error: .*vaddpd.*
.*:104: Error: .*vaddpd.*
.*:107: Error: .*vaddpd.*
.*:108: Error: .*vaddpd.*
.*:109: Error: .*vaddpd.*
.*:112: Error: .*vcvtps2pd.*
.*:113: Error: .*vcvtps2pd.*
.*:117: Error: .*vcvtps2pd.*
.*:118: Error: .*vcvtps2pd.*
.*:119: Error: .*vcvtps2pd.*
.*:121: Error: .*vaddps.*
.*:122: Error: .*vaddps.*
.*:123: Error: .*vaddps.*
.*:125: Error: .*vaddps.*
.*:126: Error: .*vaddps.*
.*:127: Error: .*vaddps.*
.*:130: Error: .*vaddps.*
.*:131: Error: .*vaddps.*
.*:133: Error: .*vaddps.*
.*:135: Error: .*vaddps.*
.*:137: Error: .*vaddps.*
.*:138: Error: .*vaddps.*
.*:140: Error: .*vaddpd.*
.*:141: Error: .*vaddpd.*
.*:142: Error: .*vaddpd.*
.*:144: Error: .*vaddpd.*
.*:145: Error: .*vaddpd.*
.*:147: Error: .*vaddpd.*
.*:149: Error: .*vaddpd.*
.*:151: Error: .*vaddpd.*
.*:152: Error: .*vaddpd.*
.*:155: Error: .*vaddpd.*
.*:156: Error: .*vaddpd.*
.*:157: Error: .*vaddpd.*
GAS LISTING .*


[ 	]*1[ 	]+# Check illegal AVX512F instructions
[ 	]*2[ 	]+\.text
[ 	]*3[ 	]+\.allow_index_reg
[ 	]*4[ 	]+_start:
[ 	]*5[ 	]+mov \{sae\}, %eax\{%k1\}
[ 	]*6[ 	]+mov \{sae\}, %eax
[ 	]*7[ 	]+mov %ebx, %eax\{%k2\}
[ 	]*8[ 	]+vaddps %zmm3, %zmm1, %zmm2\{z\}\{%k1\}\{z\}
[ 	]*9[ 	]+vaddps %zmm3, %zmm1\{%k3\}, %zmm2\{z\}
[ 	]*10[ 	]+vaddps %zmm3, %zmm1\{%k1\}, %zmm2\{%k2\}
[ 	]*11[ 	]+
[ 	]*12[ 	]+vcvtps2pd \(%eax\), %zmm1\{1to8\}
[ 	]*13[ 	]+vcvtps2pd \(%eax\)\{1to16\}, %zmm1
[ 	]*14[ 	]+
[ 	]*15[ 	]+vcvtps2pd \(%eax\)\{%k1\}, %zmm1
[ 	]*16[ 	]+vcvtps2pd \(%eax\)\{z\}, %zmm1
[ 	]*17[ 	]+
[ 	]*18[ 	]+vgatherqpd \(%rdi,%zmm2,8\),%zmm6
[ 	]*19[ 	]+vgatherqpd \(%edi\),%zmm6\{%k1\}
[ 	]*20[ 	]+vgatherqpd \(%zmm2\),%zmm6\{%k1\}
[ 	]*21[ 	]+vpscatterdd %zmm6,\(%edi\)\{%k1\}
[ 	]*22[ 	]+vpscatterdd %zmm6,\(%zmm2\)\{%k1\}
[ 	]*23[ 	]+
[ 	]*24[ 	]+\.intel_syntax noprefix
[ 	]*25[ 	]+mov eax\{k1\}, \{sae\}
[ 	]*26[ 	]+mov eax, \{sae\}
[ 	]*27[ 	]+mov eax\{k2\}, ebx
[ 	]*28[ 	]+vaddps zmm2\{z\}\{k1\}\{z\}, zmm1, zmm3
[ 	]*29[ 	]+vaddps zmm2\{z\}, zmm1\{k3\}, zmm3
[ 	]*30[ 	]+vaddps zmm2\{k2\}, zmm1\{k1\}, zmm3
[ 	]*31[ 	]+
[ 	]*32[ 	]+vcvtps2pd zmm1\{1to8\}, \[eax\]
[ 	]*33[ 	]+vcvtps2pd zmm1, \[eax\]\{1to16\}
[ 	]*34[ 	]+
[ 	]*35[ 	]+vcvtps2pd zmm1, \[eax\]\{k1\}
[ 	]*36[ 	]+vcvtps2pd zmm1, \[eax\]\{z\}
[ 	]*37[ 	]+
[ 	]*38[ 	]+vgatherqpd zmm6, ZMMWORD PTR \[rdi\+zmm2\*8\]
[ 	]*39[ 	]+vgatherqpd zmm6\{k1\}, ZMMWORD PTR \[edi\]
[ 	]*40[ 	]+vgatherqpd zmm6\{k1\}, ZMMWORD PTR \[zmm2\+eiz\]
[ 	]*41[ 	]+vpscatterdd ZMMWORD PTR \[edi\]\{k1\}, zmm6
[ 	]*42[ 	]+vpscatterdd ZMMWORD PTR \[zmm2\+eiz\]\{k1\}, zmm6
[ 	]*43[ 	]+
[ 	]*44[ 	]+vaddps zmm2, zmm1, QWORD PTR \[eax\]\{1to8\}
[ 	]*45[ 	]+vaddps zmm2, zmm1, QWORD PTR \[eax\]\{1to16\}
[ 	]*46[ 	]+vaddpd zmm2, zmm1, DWORD PTR \[eax\]\{1to8\}
[ 	]*47[ 	]+vaddpd zmm2, zmm1, DWORD PTR \[eax\]\{1to16\}
[ 	]*48[ 	]+vaddps zmm2, zmm1, ZMMWORD PTR \[eax\]\{1to16\}
[ 	]*49[ 	]+vaddps zmm2, zmm1, DWORD PTR \[eax\]
[ 	]*50[ 	]+vaddpd zmm2, zmm1, QWORD PTR \[eax\]
[ 	]*51[ 	]*
[ 	]*52[ 	]+\.att_syntax prefix
[ 	]*53[ 	]+vaddps %zmm0, %zmm1, %zmm2\{%ecx\}
[ 	]*54[ 	]+vaddps %zmm0, %zmm1, %zmm2\{z\}
[ 	]*55[ 	]*
[ 	]*56[ 	]+\.intel_syntax noprefix
[ 	]*57[ 	]+vaddps zmm2\{ecx\}, zmm1, zmm0
GAS LISTING .*
#...
[ 	]*58[ 	]+vaddps zmm2\{z\}, zmm1, zmm0
[ 	]*59[ 	]*
[ 	]*60[ 	]+\.att_syntax prefix
[ 	]*61[ 	]+vmovaps \(%eax\)\{1to2\}, %zmm1
[ 	]*62[ 	]+vmovaps \(%eax\)\{1to4\}, %zmm1
[ 	]*63[ 	]+vmovaps \(%eax\)\{1to8\}, %zmm1
[ 	]*64[ 	]+vmovaps \(%eax\)\{1to16\}, %zmm1
[ 	]*65[ 	]*
[ 	]*66[ 	]+vcvtps2pd \(%eax\)\{1to2\}, %zmm1
[ 	]*67[ 	]+vcvtps2pd \(%eax\)\{1to4\}, %zmm1
[ 	]*68 \?\?\?\? 62F17C58[ 	]+vcvtps2pd \(%eax\)\{1to8\}, %zmm1
[ 	]*68[ 	]+5A08
[ 	]*69[ 	]+vcvtps2pd \(%eax\)\{1to16\}, %zmm1
[ 	]*70[ 	]*
[ 	]*71[ 	]+vcvtps2pd \(%eax\)\{1to2\}, %ymm1
[ 	]*72 \?\?\?\? 62F17C38[ 	]+vcvtps2pd \(%eax\)\{1to4\}, %ymm1
[ 	]*72[ 	]+5A08
[ 	]*73[ 	]+vcvtps2pd \(%eax\)\{1to8\}, %ymm1
[ 	]*74[ 	]+vcvtps2pd \(%eax\)\{1to16\}, %ymm1
[ 	]*75[ 	]*
[ 	]*76 \?\?\?\? 62F17C18[ 	]+vcvtps2pd \(%eax\)\{1to2\}, %xmm1
[ 	]*76[ 	]+5A08
[ 	]*77[ 	]+vcvtps2pd \(%eax\)\{1to4\}, %xmm1
[ 	]*78[ 	]+vcvtps2pd \(%eax\)\{1to8\}, %xmm1
[ 	]*79[ 	]+vcvtps2pd \(%eax\)\{1to16\}, %xmm1
[ 	]*80[ 	]+
[ 	]*81[ 	]+vaddps \(%eax\)\{1to2\}, %zmm1, %zmm2
[ 	]*82[ 	]+vaddps \(%eax\)\{1to4\}, %zmm1, %zmm2
[ 	]*83[ 	]+vaddps \(%eax\)\{1to8\}, %zmm1, %zmm2
[ 	]*84 \?\?\?\? 62F17458[ 	]+vaddps \(%eax\)\{1to16\}, %zmm1, %zmm2
[ 	]*84[ 	]+5810
[ 	]*85[ 	]*
[ 	]*86[ 	]+vaddps \(%eax\)\{1to2\}, %ymm1, %ymm2
[ 	]*87[ 	]+vaddps \(%eax\)\{1to4\}, %ymm1, %ymm2
[ 	]*88 \?\?\?\? 62F17438[ 	]+vaddps \(%eax\)\{1to8\}, %ymm1, %ymm2
[ 	]*88[ 	]+5810
[ 	]*89[ 	]+vaddps \(%eax\)\{1to16\}, %ymm1, %ymm2
[ 	]*90[ 	]*
[ 	]*91[ 	]+vaddps \(%eax\)\{1to2\}, %xmm1, %xmm2
[ 	]*92 \?\?\?\? 62F17418[ 	]+vaddps \(%eax\)\{1to4\}, %xmm1, %xmm2
[ 	]*92[ 	]+5810
[ 	]*93[ 	]+vaddps \(%eax\)\{1to8\}, %xmm1, %xmm2
[ 	]*94[ 	]+vaddps \(%eax\)\{1to16\}, %xmm1, %xmm2
[ 	]*95[ 	]*
[ 	]*96[ 	]+vaddpd \(%eax\)\{1to2\}, %zmm1, %zmm2
[ 	]*97[ 	]+vaddpd \(%eax\)\{1to4\}, %zmm1, %zmm2
[ 	]*98 \?\?\?\? 62F1F558[ 	]+vaddpd \(%eax\)\{1to8\}, %zmm1, %zmm2
[ 	]*98[ 	]+5810
[ 	]*99[ 	]+vaddpd \(%eax\)\{1to16\}, %zmm1, %zmm2
[ 	]*100[ 	]*
[ 	]*101[ 	]+vaddpd \(%eax\)\{1to2\}, %ymm1, %ymm2
[ 	]*102 \?\?\?\? 62F1F538[ 	]+vaddpd \(%eax\)\{1to4\}, %ymm1, %ymm2
[ 	]*102[ 	]+5810
[ 	]*103[ 	]+vaddpd \(%eax\)\{1to8\}, %ymm1, %ymm2
[ 	]*104[ 	]+vaddpd \(%eax\)\{1to16\}, %ymm1, %ymm2
[ 	]*105[ 	]*
[ 	]*106 \?\?\?\? 62F1F518[ 	]+vaddpd \(%eax\)\{1to2\}, %xmm1, %xmm2
GAS LISTING .*
#...
[ 	]*106[ 	]+5810
[ 	]*107[ 	]+vaddpd \(%eax\)\{1to4\}, %xmm1, %xmm2
[ 	]*108[ 	]+vaddpd \(%eax\)\{1to8\}, %xmm1, %xmm2
[ 	]*109[ 	]+vaddpd \(%eax\)\{1to16\}, %xmm1, %xmm2
[ 	]*110[ 	]*
[ 	]*111[ 	]+\.intel_syntax noprefix
[ 	]*112[ 	]+vcvtps2pd zmm1, QWORD PTR \[eax\]
[ 	]*113[ 	]+vcvtps2pd ymm1, QWORD PTR \[eax\]
[ 	]*114 \?\?\?\? C5F85A08[ 	]+vcvtps2pd xmm1, QWORD PTR \[eax\]
[ 	]*115[ 	]*
[ 	]*116 \?\?\?\? 62F17C18[ 	]+vcvtps2pd xmm1, DWORD PTR \[eax\]\{1to2\}
[ 	]*116[ 	]+5A08
[ 	]*117[ 	]+vcvtps2pd xmm1, DWORD PTR \[eax\]\{1to4\}
[ 	]*118[ 	]+vcvtps2pd xmm1, DWORD PTR \[eax\]\{1to8\}
[ 	]*119[ 	]+vcvtps2pd xmm1, DWORD PTR \[eax\]\{1to16\}
[ 	]*120[ 	]*
[ 	]*121[ 	]+vaddps zmm2, zmm1, QWORD PTR \[eax\]
[ 	]*122[ 	]+vaddps ymm2, ymm1, QWORD PTR \[eax\]
[ 	]*123[ 	]+vaddps xmm2, xmm1, QWORD PTR \[eax\]
[ 	]*124[ 	]*
[ 	]*125[ 	]+vaddps zmm2, zmm1, DWORD PTR \[eax\]\{1to2\}
[ 	]*126[ 	]+vaddps zmm2, zmm1, DWORD PTR \[eax\]\{1to4\}
[ 	]*127[ 	]+vaddps zmm2, zmm1, DWORD PTR \[eax\]\{1to8\}
[ 	]*128 \?\?\?\? 62F17458[ 	]+vaddps zmm2, zmm1, DWORD PTR \[eax\]\{1to16\}
[ 	]*128[ 	]+5810
[ 	]*129[ 	]*
[ 	]*130[ 	]+vaddps ymm2, ymm1, DWORD PTR \[eax\]\{1to2\}
[ 	]*131[ 	]+vaddps ymm2, ymm1, DWORD PTR \[eax\]\{1to4\}
[ 	]*132 \?\?\?\? 62F17438[ 	]+vaddps ymm2, ymm1, DWORD PTR \[eax\]\{1to8\}
[ 	]*132[ 	]+5810
[ 	]*133[ 	]+vaddps ymm2, ymm1, DWORD PTR \[eax\]\{1to16\}
[ 	]*134[ 	]*
[ 	]*135[ 	]+vaddps xmm2, xmm1, DWORD PTR \[eax\]\{1to2\}
[ 	]*136 \?\?\?\? 62F17418[ 	]+vaddps xmm2, xmm1, DWORD PTR \[eax\]\{1to4\}
[ 	]*136[ 	]+5810
[ 	]*137[ 	]+vaddps xmm2, xmm1, DWORD PTR \[eax\]\{1to8\}
[ 	]*138[ 	]+vaddps xmm2, xmm1, DWORD PTR \[eax\]\{1to16\}
[ 	]*139[ 	]*
[ 	]*140[ 	]+vaddpd zmm2, zmm1, DWORD PTR \[eax\]
[ 	]*141[ 	]+vaddpd ymm2, ymm1, DWORD PTR \[eax\]
[ 	]*142[ 	]+vaddpd xmm2, xmm1, DWORD PTR \[eax\]
[ 	]*143[ 	]*
[ 	]*144[ 	]+vaddpd zmm2, zmm1, QWORD PTR \[eax\]\{1to2\}
[ 	]*145[ 	]+vaddpd zmm2, zmm1, QWORD PTR \[eax\]\{1to4\}
[ 	]*146 \?\?\?\? 62F1F558[ 	]+vaddpd zmm2, zmm1, QWORD PTR \[eax\]\{1to8\}
[ 	]*146[ 	]+5810
[ 	]*147[ 	]+vaddpd zmm2, zmm1, QWORD PTR \[eax\]\{1to16\}
[ 	]*148[ 	]*
[ 	]*149[ 	]+vaddpd ymm2, ymm1, QWORD PTR \[eax\]\{1to2\}
[ 	]*150 \?\?\?\? 62F1F538[ 	]+vaddpd ymm2, ymm1, QWORD PTR \[eax\]\{1to4\}
[ 	]*150[ 	]+5810
[ 	]*151[ 	]+vaddpd ymm2, ymm1, QWORD PTR \[eax\]\{1to8\}
[ 	]*152[ 	]+vaddpd ymm2, ymm1, QWORD PTR \[eax\]\{1to16\}
[ 	]*153[ 	]*
[ 	]*154 \?\?\?\? 62F1F518[ 	]+vaddpd xmm2, xmm1, QWORD PTR \[eax\]\{1to2\}
[ 	]*154[ 	]+5810
[ 	]*155[ 	]+vaddpd xmm2, xmm1, QWORD PTR \[eax\]\{1to4\}
GAS LISTING .*
#...
[ 	]*156[ 	]+vaddpd xmm2, xmm1, QWORD PTR \[eax\]\{1to8\}
[ 	]*157[ 	]+vaddpd xmm2, xmm1, QWORD PTR \[eax\]\{1to16\}

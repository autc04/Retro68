#objdump: -dw -Mintel
#name: x86_64 MOVRS, AVX10.2/256 insns (Intel disassembly)
#source: x86-64-movrs-avx10_2-256.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 25 7f 0f 6f b4 f5 00 00 00 10\s+vmovrsb xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7f 08 6f 31\s+vmovrsb xmm30,XMMWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 65 7f 08 6f 71 7f\s+vmovrsb xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7f 8f 6f 72 80\s+vmovrsb xmm30\{k7\}\{z\},XMMWORD PTR \[rdx-0x800\]
\s*[a-f0-9]+:\s*62 25 7e 0f 6f b4 f5 00 00 00 10\s+vmovrsd xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7e 08 6f 31\s+vmovrsd xmm30,XMMWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 65 7e 08 6f 71 7f\s+vmovrsd xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7e 8f 6f 72 80\s+vmovrsd xmm30\{k7\}\{z\},XMMWORD PTR \[rdx-0x800\]
\s*[a-f0-9]+:\s*62 25 fe 0f 6f b4 f5 00 00 00 10\s+vmovrsq xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 fe 08 6f 31\s+vmovrsq xmm30,XMMWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 65 fe 08 6f 71 7f\s+vmovrsq xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 fe 8f 6f 72 80\s+vmovrsq xmm30\{k7\}\{z\},XMMWORD PTR \[rdx-0x800\]
\s*[a-f0-9]+:\s*62 25 ff 0f 6f b4 f5 00 00 00 10\s+vmovrsw xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 ff 08 6f 31\s+vmovrsw xmm30,XMMWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 65 ff 08 6f 71 7f\s+vmovrsw xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 ff 8f 6f 72 80\s+vmovrsw xmm30\{k7\}\{z\},XMMWORD PTR \[rdx-0x800\]
#pass

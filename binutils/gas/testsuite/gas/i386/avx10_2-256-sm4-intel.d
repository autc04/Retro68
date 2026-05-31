#objdump: -dw -Mintel
#name: i386 AVX10.2/256, SM4 insns (Intel disassembly)
#source: avx10_2-256-sm4.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 f2 56 28 da f4\s+{evex} vsm4key4 ymm6,ymm5,ymm4
\s*[a-f0-9]+:\s*62 f2 56 08 da f4\s+{evex} vsm4key4 xmm6,xmm5,xmm4
\s*[a-f0-9]+:\s*62 f2 56 28 da b4 f4 00 00 00 10\s+{evex} vsm4key4 ymm6,ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 56 28 da 31\s+{evex} vsm4key4 ymm6,ymm5,YMMWORD PTR \[ecx\]
\s*[a-f0-9]+:\s*62 f2 56 28 da 71 7f\s+{evex} vsm4key4 ymm6,ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f2 56 28 da 72 80\s+{evex} vsm4key4 ymm6,ymm5,YMMWORD PTR \[edx-0x1000\]
\s*[a-f0-9]+:\s*62 f2 56 08 da b4 f4 00 00 00 10\s+{evex} vsm4key4 xmm6,xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 56 08 da 31\s+{evex} vsm4key4 xmm6,xmm5,XMMWORD PTR \[ecx\]
\s*[a-f0-9]+:\s*62 f2 56 08 da 71 7f\s+{evex} vsm4key4 xmm6,xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f2 56 08 da 72 80\s+{evex} vsm4key4 xmm6,xmm5,XMMWORD PTR \[edx-0x800\]
\s*[a-f0-9]+:\s*62 f2 57 28 da f4\s+{evex} vsm4rnds4 ymm6,ymm5,ymm4
\s*[a-f0-9]+:\s*62 f2 57 08 da f4\s+{evex} vsm4rnds4 xmm6,xmm5,xmm4
\s*[a-f0-9]+:\s*62 f2 57 28 da b4 f4 00 00 00 10\s+{evex} vsm4rnds4 ymm6,ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 57 28 da 31\s+{evex} vsm4rnds4 ymm6,ymm5,YMMWORD PTR \[ecx\]
\s*[a-f0-9]+:\s*62 f2 57 28 da 71 7f\s+{evex} vsm4rnds4 ymm6,ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f2 57 28 da 72 80\s+{evex} vsm4rnds4 ymm6,ymm5,YMMWORD PTR \[edx-0x1000\]
\s*[a-f0-9]+:\s*62 f2 57 08 da b4 f4 00 00 00 10\s+{evex} vsm4rnds4 xmm6,xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 57 08 da 31\s+{evex} vsm4rnds4 xmm6,xmm5,XMMWORD PTR \[ecx\]
\s*[a-f0-9]+:\s*62 f2 57 08 da 71 7f\s+{evex} vsm4rnds4 xmm6,xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f2 57 08 da 72 80\s+{evex} vsm4rnds4 xmm6,xmm5,XMMWORD PTR \[edx-0x800\]
#pass

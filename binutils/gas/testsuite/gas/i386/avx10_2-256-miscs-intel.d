#objdump: -dw -Mintel
#name: i386 AVX10.2/256 minmax, vector copy and compare insns (Intel disassembly)
#source: avx10_2-256-miscs.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 f3 57 08 52 f4 7b\s+vminmaxbf16 xmm6,xmm5,xmm4,0x7b
\s*[a-f0-9]+:\s*62 f3 57 28 52 f4 7b\s+vminmaxbf16 ymm6,ymm5,ymm4,0x7b
\s*[a-f0-9]+:\s*62 f3 57 2f 52 b4 f4 00 00 00 10 7b\s+vminmaxbf16 ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 f3 57 28 52 71 7f 7b\s+vminmaxbf16 ymm6,ymm5,YMMWORD PTR \[ecx\+0xfe0\],0x7b
\s*[a-f0-9]+:\s*62 f3 57 0f 52 b4 f4 00 00 00 10 7b\s+vminmaxbf16 xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 f3 57 08 52 71 7f 7b\s+vminmaxbf16 xmm6,xmm5,XMMWORD PTR \[ecx\+0x7f0\],0x7b
\s*[a-f0-9]+:\s*62 f3 d5 08 52 f4 7b\s+vminmaxpd xmm6,xmm5,xmm4,0x7b
\s*[a-f0-9]+:\s*62 f3 d5 28 52 f4 7b\s+vminmaxpd ymm6,ymm5,ymm4,0x7b
\s*[a-f0-9]+:\s*62 f3 d5 2f 52 b4 f4 00 00 00 10 7b\s+vminmaxpd ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 f3 d5 28 52 71 7f 7b\s+vminmaxpd ymm6,ymm5,YMMWORD PTR \[ecx\+0xfe0\],0x7b
\s*[a-f0-9]+:\s*62 f3 d5 0f 52 b4 f4 00 00 00 10 7b\s+vminmaxpd xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 f3 d5 08 52 71 7f 7b\s+vminmaxpd xmm6,xmm5,XMMWORD PTR \[ecx\+0x7f0\],0x7b
\s*[a-f0-9]+:\s*62 f3 54 08 52 f4 7b\s+vminmaxph xmm6,xmm5,xmm4,0x7b
\s*[a-f0-9]+:\s*62 f3 54 28 52 f4 7b\s+vminmaxph ymm6,ymm5,ymm4,0x7b
\s*[a-f0-9]+:\s*62 f3 54 2f 52 b4 f4 00 00 00 10 7b\s+vminmaxph ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 f3 54 28 52 71 7f 7b\s+vminmaxph ymm6,ymm5,YMMWORD PTR \[ecx\+0xfe0\],0x7b
\s*[a-f0-9]+:\s*62 f3 54 0f 52 b4 f4 00 00 00 10 7b\s+vminmaxph xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 f3 54 08 52 71 7f 7b\s+vminmaxph xmm6,xmm5,XMMWORD PTR \[ecx\+0x7f0\],0x7b
\s*[a-f0-9]+:\s*62 f3 55 08 52 f4 7b\s+vminmaxps xmm6,xmm5,xmm4,0x7b
\s*[a-f0-9]+:\s*62 f3 55 28 52 f4 7b\s+vminmaxps ymm6,ymm5,ymm4,0x7b
\s*[a-f0-9]+:\s*62 f3 55 2f 52 b4 f4 00 00 00 10 7b\s+vminmaxps ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 f3 55 28 52 71 7f 7b\s+vminmaxps ymm6,ymm5,YMMWORD PTR \[ecx\+0xfe0\],0x7b
\s*[a-f0-9]+:\s*62 f3 55 0f 52 b4 f4 00 00 00 10 7b\s+vminmaxps xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 f3 55 08 52 71 7f 7b\s+vminmaxps xmm6,xmm5,XMMWORD PTR \[ecx\+0x7f0\],0x7b
\s*[a-f0-9]+:\s*62 f3 57 38 52 31 7b\s+vminmaxbf16 ymm6,ymm5,WORD BCST \[ecx\],0x7b
\s*[a-f0-9]+:\s*62 f3 57 bf 52 72 80 7b\s+vminmaxbf16 ymm6\{k7\}\{z\},ymm5,WORD BCST \[edx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 f3 57 18 52 31 7b\s+vminmaxbf16 xmm6,xmm5,WORD BCST \[ecx\],0x7b
\s*[a-f0-9]+:\s*62 f3 57 9f 52 72 80 7b\s+vminmaxbf16 xmm6\{k7\}\{z\},xmm5,WORD BCST \[edx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 f3 d5 38 52 31 7b\s+vminmaxpd ymm6,ymm5,QWORD BCST \[ecx\],0x7b
\s*[a-f0-9]+:\s*62 f3 d5 bf 52 72 80 7b\s+vminmaxpd ymm6\{k7\}\{z\},ymm5,QWORD BCST \[edx-0x400\],0x7b
\s*[a-f0-9]+:\s*62 f3 d5 18 52 31 7b\s+vminmaxpd xmm6,xmm5,QWORD BCST \[ecx\],0x7b
\s*[a-f0-9]+:\s*62 f3 d5 9f 52 72 80 7b\s+vminmaxpd xmm6\{k7\}\{z\},xmm5,QWORD BCST \[edx-0x400\],0x7b
\s*[a-f0-9]+:\s*62 f3 54 38 52 31 7b\s+vminmaxph ymm6,ymm5,WORD BCST \[ecx\],0x7b
\s*[a-f0-9]+:\s*62 f3 54 bf 52 72 80 7b\s+vminmaxph ymm6\{k7\}\{z\},ymm5,WORD BCST \[edx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 f3 54 18 52 31 7b\s+vminmaxph xmm6,xmm5,WORD BCST \[ecx\],0x7b
\s*[a-f0-9]+:\s*62 f3 54 9f 52 72 80 7b\s+vminmaxph xmm6\{k7\}\{z\},xmm5,WORD BCST \[edx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 f3 55 38 52 31 7b\s+vminmaxps ymm6,ymm5,DWORD BCST \[ecx\],0x7b
\s*[a-f0-9]+:\s*62 f3 55 bf 52 72 80 7b\s+vminmaxps ymm6\{k7\}\{z\},ymm5,DWORD BCST \[edx-0x200\],0x7b
\s*[a-f0-9]+:\s*62 f3 55 18 52 31 7b\s+vminmaxps xmm6,xmm5,DWORD BCST \[ecx\],0x7b
\s*[a-f0-9]+:\s*62 f3 55 9f 52 72 80 7b\s+vminmaxps xmm6\{k7\}\{z\},xmm5,DWORD BCST \[edx-0x200\],0x7b
\s*[a-f0-9]+:\s*62 f3 d5 08 53 f4 7b\s+vminmaxsd xmm6,xmm5,xmm4,0x7b
\s*[a-f0-9]+:\s*62 f3 d5 18 53 f4 7b\s+vminmaxsd xmm6,xmm5,xmm4\{sae\},0x7b
\s*[a-f0-9]+:\s*62 f3 d5 0f 53 b4 f4 00 00 00 10 7b\s+vminmaxsd xmm6\{k7\},xmm5,QWORD PTR \[esp\+esi\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 f3 d5 08 53 31 7b\s+vminmaxsd xmm6,xmm5,QWORD PTR \[ecx\],0x7b
\s*[a-f0-9]+:\s*62 f3 54 08 53 f4 7b\s+vminmaxsh xmm6,xmm5,xmm4,0x7b
\s*[a-f0-9]+:\s*62 f3 54 18 53 f4 7b\s+vminmaxsh xmm6,xmm5,xmm4\{sae\},0x7b
\s*[a-f0-9]+:\s*62 f3 54 0f 53 b4 f4 00 00 00 10 7b\s+vminmaxsh xmm6\{k7\},xmm5,WORD PTR \[esp\+esi\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 f3 54 08 53 31 7b\s+vminmaxsh xmm6,xmm5,WORD PTR \[ecx\],0x7b
\s*[a-f0-9]+:\s*62 f3 55 08 53 f4 7b\s+vminmaxss xmm6,xmm5,xmm4,0x7b
\s*[a-f0-9]+:\s*62 f3 55 18 53 f4 7b\s+vminmaxss xmm6,xmm5,xmm4\{sae\},0x7b
\s*[a-f0-9]+:\s*62 f3 55 0f 53 b4 f4 00 00 00 10 7b\s+vminmaxss xmm6\{k7\},xmm5,DWORD PTR \[esp\+esi\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 f3 55 08 53 31 7b\s+vminmaxss xmm6,xmm5,DWORD PTR \[ecx\],0x7b
\s*[a-f0-9]+:\s*62 f3 d5 08 53 71 7f 7b\s+vminmaxsd xmm6,xmm5,QWORD PTR \[ecx\+0x3f8\],0x7b
\s*[a-f0-9]+:\s*62 f3 d5 8f 53 72 80 7b\s+vminmaxsd xmm6\{k7\}\{z\},xmm5,QWORD PTR \[edx-0x400\],0x7b
\s*[a-f0-9]+:\s*62 f3 54 08 53 71 7f 7b\s+vminmaxsh xmm6,xmm5,WORD PTR \[ecx\+0xfe\],0x7b
\s*[a-f0-9]+:\s*62 f3 54 8f 53 72 80 7b\s+vminmaxsh xmm6\{k7\}\{z\},xmm5,WORD PTR \[edx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 f3 55 08 53 71 7f 7b\s+vminmaxss xmm6,xmm5,DWORD PTR \[ecx\+0x1fc\],0x7b
\s*[a-f0-9]+:\s*62 f3 55 8f 53 72 80 7b\s+vminmaxss xmm6\{k7\}\{z\},xmm5,DWORD PTR \[edx-0x200\],0x7b
\s*[a-f0-9]+:\s*62 f1 7e 08 7e f5\s+vmovd  xmm6,xmm5
\s*[a-f0-9]+:\s*62 f1 7d 08 d6 ee\s+vmovd  xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7e 08 6e f5\s+vmovw  xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7e 08 7e ee\s+vmovw  xmm6,xmm5
\s*[a-f0-9]+:\s*62 f1 ff 08 2f f5\s+vcomxsd xmm6,xmm5
\s*[a-f0-9]+:\s*62 f1 ff 18 2f f5\s+vcomxsd xmm6,xmm5\{sae\}
\s*[a-f0-9]+:\s*62 f1 ff 08 2f b4 f4 00 00 00 10\s+vcomxsd xmm6,QWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f1 ff 08 2f 31\s+vcomxsd xmm6,QWORD PTR \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7e 08 2f f5\s+vcomxsh xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7e 18 2f f5\s+vcomxsh xmm6,xmm5\{sae\}
\s*[a-f0-9]+:\s*62 f5 7e 08 2f b4 f4 00 00 00 10\s+vcomxsh xmm6,WORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7e 08 2f 31\s+vcomxsh xmm6,WORD PTR \[ecx\]
\s*[a-f0-9]+:\s*62 f1 7e 08 2f f5\s+vcomxss xmm6,xmm5
\s*[a-f0-9]+:\s*62 f1 7e 18 2f f5\s+vcomxss xmm6,xmm5\{sae\}
\s*[a-f0-9]+:\s*62 f1 7e 08 2f b4 f4 00 00 00 10\s+vcomxss xmm6,DWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f1 7e 08 2f 31\s+vcomxss xmm6,DWORD PTR \[ecx\]
\s*[a-f0-9]+:\s*62 f1 ff 08 2f 71 7f\s+vcomxsd xmm6,QWORD PTR \[ecx\+0x3f8\]
\s*[a-f0-9]+:\s*62 f1 ff 08 2f 72 80\s+vcomxsd xmm6,QWORD PTR \[edx-0x400\]
\s*[a-f0-9]+:\s*62 f5 7e 08 2f 71 7f\s+vcomxsh xmm6,WORD PTR \[ecx\+0xfe\]
\s*[a-f0-9]+:\s*62 f5 7e 08 2f 72 80\s+vcomxsh xmm6,WORD PTR \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f1 7e 08 2f 71 7f\s+vcomxss xmm6,DWORD PTR \[ecx\+0x1fc\]
\s*[a-f0-9]+:\s*62 f1 7e 08 2f 72 80\s+vcomxss xmm6,DWORD PTR \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f1 ff 08 2e f5\s+vucomxsd xmm6,xmm5
\s*[a-f0-9]+:\s*62 f1 ff 18 2e f5\s+vucomxsd xmm6,xmm5\{sae\}
\s*[a-f0-9]+:\s*62 f1 ff 08 2e b4 f4 00 00 00 10\s+vucomxsd xmm6,QWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f1 ff 08 2e 31\s+vucomxsd xmm6,QWORD PTR \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7e 08 2e f5\s+vucomxsh xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7e 18 2e f5\s+vucomxsh xmm6,xmm5\{sae\}
\s*[a-f0-9]+:\s*62 f5 7e 08 2e b4 f4 00 00 00 10\s+vucomxsh xmm6,WORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7e 08 2e 31\s+vucomxsh xmm6,WORD PTR \[ecx\]
\s*[a-f0-9]+:\s*62 f1 7e 08 2e f5\s+vucomxss xmm6,xmm5
\s*[a-f0-9]+:\s*62 f1 7e 18 2e f5\s+vucomxss xmm6,xmm5\{sae\}
\s*[a-f0-9]+:\s*62 f1 7e 08 2e b4 f4 00 00 00 10\s+vucomxss xmm6,DWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f1 7e 08 2e 31\s+vucomxss xmm6,DWORD PTR \[ecx\]
\s*[a-f0-9]+:\s*62 f1 ff 08 2e 71 7f\s+vucomxsd xmm6,QWORD PTR \[ecx\+0x3f8\]
\s*[a-f0-9]+:\s*62 f1 ff 08 2e 72 80\s+vucomxsd xmm6,QWORD PTR \[edx-0x400\]
\s*[a-f0-9]+:\s*62 f5 7e 08 2e 71 7f\s+vucomxsh xmm6,WORD PTR \[ecx\+0xfe\]
\s*[a-f0-9]+:\s*62 f5 7e 08 2e 72 80\s+vucomxsh xmm6,WORD PTR \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f1 7e 08 2e 71 7f\s+vucomxss xmm6,DWORD PTR \[ecx\+0x1fc\]
\s*[a-f0-9]+:\s*62 f1 7e 08 2e 72 80\s+vucomxss xmm6,DWORD PTR \[edx-0x200\]
#pass

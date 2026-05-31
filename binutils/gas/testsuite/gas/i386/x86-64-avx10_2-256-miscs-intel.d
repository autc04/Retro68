#objdump: -dw -Mintel
#name: x86_64 AVX10.2/256 minmax, vector copy and compare insns (Intel disassembly)
#source: x86-64-avx10_2-256-miscs.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 03 17 00 52 f4 7b\s+vminmaxbf16 xmm30,xmm29,xmm28,0x7b
\s*[a-f0-9]+:\s*62 03 17 20 52 f4 7b\s+vminmaxbf16 ymm30,ymm29,ymm28,0x7b
\s*[a-f0-9]+:\s*62 23 17 27 52 b4 f5 00 00 00 10 7b\s+vminmaxbf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 63 17 20 52 71 7f 7b\s+vminmaxbf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\],0x7b
\s*[a-f0-9]+:\s*62 23 17 07 52 b4 f5 00 00 00 10 7b\s+vminmaxbf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 63 17 00 52 71 7f 7b\s+vminmaxbf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\],0x7b
\s*[a-f0-9]+:\s*62 03 95 00 52 f4 7b\s+vminmaxpd xmm30,xmm29,xmm28,0x7b
\s*[a-f0-9]+:\s*62 03 95 20 52 f4 7b\s+vminmaxpd ymm30,ymm29,ymm28,0x7b
\s*[a-f0-9]+:\s*62 23 95 27 52 b4 f5 00 00 00 10 7b\s+vminmaxpd ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 63 95 20 52 71 7f 7b\s+vminmaxpd ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\],0x7b
\s*[a-f0-9]+:\s*62 23 95 07 52 b4 f5 00 00 00 10 7b\s+vminmaxpd xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 63 95 00 52 71 7f 7b\s+vminmaxpd xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\],0x7b
\s*[a-f0-9]+:\s*62 03 14 00 52 f4 7b\s+vminmaxph xmm30,xmm29,xmm28,0x7b
\s*[a-f0-9]+:\s*62 03 14 20 52 f4 7b\s+vminmaxph ymm30,ymm29,ymm28,0x7b
\s*[a-f0-9]+:\s*62 23 14 27 52 b4 f5 00 00 00 10 7b\s+vminmaxph ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 63 14 20 52 71 7f 7b\s+vminmaxph ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\],0x7b
\s*[a-f0-9]+:\s*62 23 14 07 52 b4 f5 00 00 00 10 7b\s+vminmaxph xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 63 14 00 52 71 7f 7b\s+vminmaxph xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\],0x7b
\s*[a-f0-9]+:\s*62 03 15 00 52 f4 7b\s+vminmaxps xmm30,xmm29,xmm28,0x7b
\s*[a-f0-9]+:\s*62 03 15 20 52 f4 7b\s+vminmaxps ymm30,ymm29,ymm28,0x7b
\s*[a-f0-9]+:\s*62 23 15 27 52 b4 f5 00 00 00 10 7b\s+vminmaxps ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 63 15 20 52 71 7f 7b\s+vminmaxps ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\],0x7b
\s*[a-f0-9]+:\s*62 23 15 07 52 b4 f5 00 00 00 10 7b\s+vminmaxps xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 63 15 00 52 71 7f 7b\s+vminmaxps xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\],0x7b
\s*[a-f0-9]+:\s*62 43 17 30 52 31 7b\s+vminmaxbf16 ymm30,ymm29,WORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 17 b7 52 72 80 7b\s+vminmaxbf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 43 17 10 52 31 7b\s+vminmaxbf16 xmm30,xmm29,WORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 17 97 52 72 80 7b\s+vminmaxbf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 43 95 30 52 31 7b\s+vminmaxpd ymm30,ymm29,QWORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 95 b7 52 72 80 7b\s+vminmaxpd ymm30\{k7\}\{z\},ymm29,QWORD BCST \[rdx-0x400\],0x7b
\s*[a-f0-9]+:\s*62 43 95 10 52 31 7b\s+vminmaxpd xmm30,xmm29,QWORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 95 97 52 72 80 7b\s+vminmaxpd xmm30\{k7\}\{z\},xmm29,QWORD BCST \[rdx-0x400\],0x7b
\s*[a-f0-9]+:\s*62 43 14 30 52 31 7b\s+vminmaxph ymm30,ymm29,WORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 14 b7 52 72 80 7b\s+vminmaxph ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 43 14 10 52 31 7b\s+vminmaxph xmm30,xmm29,WORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 14 97 52 72 80 7b\s+vminmaxph xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 43 15 30 52 31 7b\s+vminmaxps ymm30,ymm29,DWORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 15 b7 52 72 80 7b\s+vminmaxps ymm30\{k7\}\{z\},ymm29,DWORD BCST \[rdx-0x200\],0x7b
\s*[a-f0-9]+:\s*62 43 15 10 52 31 7b\s+vminmaxps xmm30,xmm29,DWORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 15 97 52 72 80 7b\s+vminmaxps xmm30\{k7\}\{z\},xmm29,DWORD BCST \[rdx-0x200\],0x7b
\s*[a-f0-9]+:\s*62 03 95 00 53 f4 7b\s+vminmaxsd xmm30,xmm29,xmm28,0x7b
\s*[a-f0-9]+:\s*62 03 95 10 53 f4 7b\s+vminmaxsd xmm30,xmm29,xmm28\{sae\},0x7b
\s*[a-f0-9]+:\s*62 23 95 07 53 b4 f5 00 00 00 10 7b\s+vminmaxsd xmm30\{k7\},xmm29,QWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 43 95 00 53 31 7b\s+vminmaxsd xmm30,xmm29,QWORD PTR \[r9\],0x7b
\s*[a-f0-9]+:\s*62 03 14 00 53 f4 7b\s+vminmaxsh xmm30,xmm29,xmm28,0x7b
\s*[a-f0-9]+:\s*62 03 14 10 53 f4 7b\s+vminmaxsh xmm30,xmm29,xmm28\{sae\},0x7b
\s*[a-f0-9]+:\s*62 23 14 07 53 b4 f5 00 00 00 10 7b\s+vminmaxsh xmm30\{k7\},xmm29,WORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 43 14 00 53 31 7b\s+vminmaxsh xmm30,xmm29,WORD PTR \[r9\],0x7b
\s*[a-f0-9]+:\s*62 03 15 00 53 f4 7b\s+vminmaxss xmm30,xmm29,xmm28,0x7b
\s*[a-f0-9]+:\s*62 03 15 10 53 f4 7b\s+vminmaxss xmm30,xmm29,xmm28\{sae\},0x7b
\s*[a-f0-9]+:\s*62 23 15 07 53 b4 f5 00 00 00 10 7b\s+vminmaxss xmm30\{k7\},xmm29,DWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 43 15 00 53 31 7b\s+vminmaxss xmm30,xmm29,DWORD PTR \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 95 00 53 71 7f 7b\s+vminmaxsd xmm30,xmm29,QWORD PTR \[rcx\+0x3f8\],0x7b
\s*[a-f0-9]+:\s*62 63 95 87 53 72 80 7b\s+vminmaxsd xmm30\{k7\}\{z\},xmm29,QWORD PTR \[rdx-0x400\],0x7b
\s*[a-f0-9]+:\s*62 63 14 00 53 71 7f 7b\s+vminmaxsh xmm30,xmm29,WORD PTR \[rcx\+0xfe\],0x7b
\s*[a-f0-9]+:\s*62 63 14 87 53 72 80 7b\s+vminmaxsh xmm30\{k7\}\{z\},xmm29,WORD PTR \[rdx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 63 15 00 53 71 7f 7b\s+vminmaxss xmm30,xmm29,DWORD PTR \[rcx\+0x1fc\],0x7b
\s*[a-f0-9]+:\s*62 63 15 87 53 72 80 7b\s+vminmaxss xmm30\{k7\}\{z\},xmm29,DWORD PTR \[rdx-0x200\],0x7b
\s*[a-f0-9]+:\s*62 01 7e 08 7e f5\s+vmovd  xmm30,xmm29
\s*[a-f0-9]+:\s*62 01 7d 08 d6 ee\s+vmovd  xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7e 08 6e f5\s+vmovw  xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7e 08 7e ee\s+vmovw  xmm30,xmm29
\s*[a-f0-9]+:\s*62 01 ff 08 2f f5\s+vcomxsd xmm30,xmm29
\s*[a-f0-9]+:\s*62 01 ff 18 2f f5\s+vcomxsd xmm30,xmm29\{sae\}
\s*[a-f0-9]+:\s*62 21 ff 08 2f b4 f5 00 00 00 10\s+vcomxsd xmm30,QWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 41 ff 08 2f 31\s+vcomxsd xmm30,QWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 05 7e 08 2f f5\s+vcomxsh xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7e 18 2f f5\s+vcomxsh xmm30,xmm29\{sae\}
\s*[a-f0-9]+:\s*62 25 7e 08 2f b4 f5 00 00 00 10\s+vcomxsh xmm30,WORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7e 08 2f 31\s+vcomxsh xmm30,WORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 01 7e 08 2f f5\s+vcomxss xmm30,xmm29
\s*[a-f0-9]+:\s*62 01 7e 18 2f f5\s+vcomxss xmm30,xmm29\{sae\}
\s*[a-f0-9]+:\s*62 21 7e 08 2f b4 f5 00 00 00 10\s+vcomxss xmm30,DWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 41 7e 08 2f 31\s+vcomxss xmm30,DWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 61 ff 08 2f 71 7f\s+vcomxsd xmm30,QWORD PTR \[rcx\+0x3f8\]
\s*[a-f0-9]+:\s*62 61 ff 08 2f 72 80\s+vcomxsd xmm30,QWORD PTR \[rdx-0x400\]
\s*[a-f0-9]+:\s*62 65 7e 08 2f 71 7f\s+vcomxsh xmm30,WORD PTR \[rcx\+0xfe\]
\s*[a-f0-9]+:\s*62 65 7e 08 2f 72 80\s+vcomxsh xmm30,WORD PTR \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 61 7e 08 2f 71 7f\s+vcomxss xmm30,DWORD PTR \[rcx\+0x1fc\]
\s*[a-f0-9]+:\s*62 61 7e 08 2f 72 80\s+vcomxss xmm30,DWORD PTR \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 01 ff 08 2e f5\s+vucomxsd xmm30,xmm29
\s*[a-f0-9]+:\s*62 01 ff 18 2e f5\s+vucomxsd xmm30,xmm29\{sae\}
\s*[a-f0-9]+:\s*62 21 ff 08 2e b4 f5 00 00 00 10\s+vucomxsd xmm30,QWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 41 ff 08 2e 31\s+vucomxsd xmm30,QWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 05 7e 08 2e f5\s+vucomxsh xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7e 18 2e f5\s+vucomxsh xmm30,xmm29\{sae\}
\s*[a-f0-9]+:\s*62 25 7e 08 2e b4 f5 00 00 00 10\s+vucomxsh xmm30,WORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7e 08 2e 31\s+vucomxsh xmm30,WORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 01 7e 08 2e f5\s+vucomxss xmm30,xmm29
\s*[a-f0-9]+:\s*62 01 7e 18 2e f5\s+vucomxss xmm30,xmm29\{sae\}
\s*[a-f0-9]+:\s*62 21 7e 08 2e b4 f5 00 00 00 10\s+vucomxss xmm30,DWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 41 7e 08 2e 31\s+vucomxss xmm30,DWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 61 ff 08 2e 71 7f\s+vucomxsd xmm30,QWORD PTR \[rcx\+0x3f8\]
\s*[a-f0-9]+:\s*62 61 ff 08 2e 72 80\s+vucomxsd xmm30,QWORD PTR \[rdx-0x400\]
\s*[a-f0-9]+:\s*62 65 7e 08 2e 71 7f\s+vucomxsh xmm30,WORD PTR \[rcx\+0xfe\]
\s*[a-f0-9]+:\s*62 65 7e 08 2e 72 80\s+vucomxsh xmm30,WORD PTR \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 61 7e 08 2e 71 7f\s+vucomxss xmm30,DWORD PTR \[rcx\+0x1fc\]
\s*[a-f0-9]+:\s*62 61 7e 08 2e 72 80\s+vucomxss xmm30,DWORD PTR \[rdx-0x200\]
#pass

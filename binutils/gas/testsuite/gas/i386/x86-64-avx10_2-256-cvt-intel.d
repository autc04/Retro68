#objdump: -dw -Mintel
#name: x86_64 AVX10.2/256 convert insns (Intel disassembly)
#source: x86-64-avx10_2-256-cvt.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 02 15 00 67 f4\s+vcvt2ps2phx xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 02 15 20 67 f4\s+vcvt2ps2phx ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 22 15 07 67 b4 f5 00 00 00 10\s+vcvt2ps2phx xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 15 10 67 31\s+vcvt2ps2phx xmm30,xmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 15 00 67 71 7f\s+vcvt2ps2phx xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 62 15 17 67 72 80\s+vcvt2ps2phx xmm30\{k7\},xmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 22 15 27 67 b4 f5 00 00 00 10\s+vcvt2ps2phx ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 15 30 67 31\s+vcvt2ps2phx ymm30,ymm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 15 20 67 71 7f\s+vcvt2ps2phx ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 62 15 37 67 72 80\s+vcvt2ps2phx ymm30\{k7\},ymm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 14 00 74 f4\s+vcvtbiasph2bf8 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 02 14 20 74 f4\s+vcvtbiasph2bf8 xmm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 22 14 07 74 b4 f5 00 00 00 10\s+vcvtbiasph2bf8 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 14 10 74 31\s+vcvtbiasph2bf8 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 14 00 74 71 7f\s+vcvtbiasph2bf8 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 62 14 97 74 72 80\s+vcvtbiasph2bf8 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 22 14 27 74 b4 f5 00 00 00 10\s+vcvtbiasph2bf8 xmm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 14 30 74 31\s+vcvtbiasph2bf8 xmm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 14 20 74 71 7f\s+vcvtbiasph2bf8 xmm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 62 14 b7 74 72 80\s+vcvtbiasph2bf8 xmm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 02 17 00 74 f4\s+vcvt2ph2bf8 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 02 17 20 74 f4\s+vcvt2ph2bf8 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 22 17 07 74 b4 f5 00 00 00 10\s+vcvt2ph2bf8 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 17 10 74 31\s+vcvt2ph2bf8 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 17 00 74 71 7f\s+vcvt2ph2bf8 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 62 17 17 74 72 80\s+vcvt2ph2bf8 xmm30\{k7\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 22 17 27 74 b4 f5 00 00 00 10\s+vcvt2ph2bf8 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 17 30 74 31\s+vcvt2ph2bf8 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 17 20 74 71 7f\s+vcvt2ph2bf8 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 62 17 37 74 72 80\s+vcvt2ph2bf8 ymm30\{k7\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 02 7e 08 74 f5\s+vcvtph2bf8 xmm30,xmm29
\s*[a-f0-9]+:\s*62 02 7e 28 74 f5\s+vcvtph2bf8 xmm30,ymm29
\s*[a-f0-9]+:\s*62 22 7e 0f 74 b4 f5 00 00 00 10\s+vcvtph2bf8 xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 7e 18 74 31\s+vcvtph2bf8 xmm30,WORD BCST \[r9\]\{1to8\}
\s*[a-f0-9]+:\s*62 62 7e 08 74 71 7f\s+vcvtph2bf8 xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 62 7e 9f 74 72 80\s+vcvtph2bf8 xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]\{1to8\}
\s*[a-f0-9]+:\s*62 42 7e 38 74 31\s+vcvtph2bf8 xmm30,WORD BCST \[r9\]\{1to16\}
\s*[a-f0-9]+:\s*62 62 7e 28 74 71 7f\s+vcvtph2bf8 xmm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 62 7e bf 74 72 80\s+vcvtph2bf8 xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]\{1to16\}
\s*[a-f0-9]+:\s*62 05 14 00 74 f4\s+vcvtbiasph2bf8s xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 05 14 20 74 f4\s+vcvtbiasph2bf8s xmm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 25 14 07 74 b4 f5 00 00 00 10\s+vcvtbiasph2bf8s xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 14 10 74 31\s+vcvtbiasph2bf8s xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 14 00 74 71 7f\s+vcvtbiasph2bf8s xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 14 97 74 72 80\s+vcvtbiasph2bf8s xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 14 27 74 b4 f5 00 00 00 10\s+vcvtbiasph2bf8s xmm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 14 30 74 31\s+vcvtbiasph2bf8s xmm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 14 20 74 71 7f\s+vcvtbiasph2bf8s xmm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 14 b7 74 72 80\s+vcvtbiasph2bf8s xmm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 17 00 74 f4\s+vcvt2ph2bf8s xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 05 17 20 74 f4\s+vcvt2ph2bf8s ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 25 17 07 74 b4 f5 00 00 00 10\s+vcvt2ph2bf8s xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 17 10 74 31\s+vcvt2ph2bf8s xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 17 00 74 71 7f\s+vcvt2ph2bf8s xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 17 17 74 72 80\s+vcvt2ph2bf8s xmm30\{k7\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 17 27 74 b4 f5 00 00 00 10\s+vcvt2ph2bf8s ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 17 30 74 31\s+vcvt2ph2bf8s ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 17 20 74 71 7f\s+vcvt2ph2bf8s ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 17 37 74 72 80\s+vcvt2ph2bf8s ymm30\{k7\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7e 08 74 f5\s+vcvtph2bf8s xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7e 28 74 f5\s+vcvtph2bf8s xmm30,ymm29
\s*[a-f0-9]+:\s*62 25 7e 0f 74 b4 f5 00 00 00 10\s+vcvtph2bf8s xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7e 18 74 31\s+vcvtph2bf8s xmm30,WORD BCST \[r9\]\{1to8\}
\s*[a-f0-9]+:\s*62 65 7e 08 74 71 7f\s+vcvtph2bf8s xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7e 9f 74 72 80\s+vcvtph2bf8s xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]\{1to8\}
\s*[a-f0-9]+:\s*62 45 7e 38 74 31\s+vcvtph2bf8s xmm30,WORD BCST \[r9\]\{1to16\}
\s*[a-f0-9]+:\s*62 65 7e 28 74 71 7f\s+vcvtph2bf8s xmm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7e bf 74 72 80\s+vcvtph2bf8s xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]\{1to16\}
\s*[a-f0-9]+:\s*62 05 14 00 18 f4\s+vcvtbiasph2hf8 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 05 14 20 18 f4\s+vcvtbiasph2hf8 xmm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 25 14 07 18 b4 f5 00 00 00 10\s+vcvtbiasph2hf8 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 14 10 18 31\s+vcvtbiasph2hf8 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 14 00 18 71 7f\s+vcvtbiasph2hf8 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 14 97 18 72 80\s+vcvtbiasph2hf8 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 14 27 18 b4 f5 00 00 00 10\s+vcvtbiasph2hf8 xmm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 14 30 18 31\s+vcvtbiasph2hf8 xmm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 14 20 18 71 7f\s+vcvtbiasph2hf8 xmm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 14 b7 18 72 80\s+vcvtbiasph2hf8 xmm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 17 00 18 f4\s+vcvt2ph2hf8 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 05 17 20 18 f4\s+vcvt2ph2hf8 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 25 17 07 18 b4 f5 00 00 00 10\s+vcvt2ph2hf8 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 17 10 18 31\s+vcvt2ph2hf8 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 17 00 18 71 7f\s+vcvt2ph2hf8 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 17 17 18 72 80\s+vcvt2ph2hf8 xmm30\{k7\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 17 27 18 b4 f5 00 00 00 10\s+vcvt2ph2hf8 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 17 30 18 31\s+vcvt2ph2hf8 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 17 20 18 71 7f\s+vcvt2ph2hf8 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 17 37 18 72 80\s+vcvt2ph2hf8 ymm30\{k7\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7e 08 18 f5\s+vcvtph2hf8 xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7e 28 18 f5\s+vcvtph2hf8 xmm30,ymm29
\s*[a-f0-9]+:\s*62 25 7e 0f 18 b4 f5 00 00 00 10\s+vcvtph2hf8 xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7e 18 18 31\s+vcvtph2hf8 xmm30,WORD BCST \[r9\]\{1to8\}
\s*[a-f0-9]+:\s*62 65 7e 08 18 71 7f\s+vcvtph2hf8 xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7e 9f 18 72 80\s+vcvtph2hf8 xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]\{1to8\}
\s*[a-f0-9]+:\s*62 45 7e 38 18 31\s+vcvtph2hf8 xmm30,WORD BCST \[r9\]\{1to16\}
\s*[a-f0-9]+:\s*62 65 7e 28 18 71 7f\s+vcvtph2hf8 xmm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7e bf 18 72 80\s+vcvtph2hf8 xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]\{1to16\}
\s*[a-f0-9]+:\s*62 05 14 00 1b f4\s+vcvtbiasph2hf8s xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 05 14 20 1b f4\s+vcvtbiasph2hf8s xmm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 25 14 07 1b b4 f5 00 00 00 10\s+vcvtbiasph2hf8s xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 14 10 1b 31\s+vcvtbiasph2hf8s xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 14 00 1b 71 7f\s+vcvtbiasph2hf8s xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 14 97 1b 72 80\s+vcvtbiasph2hf8s xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 14 27 1b b4 f5 00 00 00 10\s+vcvtbiasph2hf8s xmm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 14 30 1b 31\s+vcvtbiasph2hf8s xmm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 14 20 1b 71 7f\s+vcvtbiasph2hf8s xmm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 14 b7 1b 72 80\s+vcvtbiasph2hf8s xmm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 17 00 1b f4\s+vcvt2ph2hf8s xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 05 17 20 1b f4\s+vcvt2ph2hf8s ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 25 17 07 1b b4 f5 00 00 00 10\s+vcvt2ph2hf8s xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 17 10 1b 31\s+vcvt2ph2hf8s xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 17 00 1b 71 7f\s+vcvt2ph2hf8s xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 17 17 1b 72 80\s+vcvt2ph2hf8s xmm30\{k7\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 17 27 1b b4 f5 00 00 00 10\s+vcvt2ph2hf8s ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 17 30 1b 31\s+vcvt2ph2hf8s ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 17 20 1b 71 7f\s+vcvt2ph2hf8s ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 17 37 1b 72 80\s+vcvt2ph2hf8s ymm30\{k7\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7e 08 1b f5\s+vcvtph2hf8s xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7e 28 1b f5\s+vcvtph2hf8s xmm30,ymm29
\s*[a-f0-9]+:\s*62 25 7e 0f 1b b4 f5 00 00 00 10\s+vcvtph2hf8s xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7e 18 1b 31\s+vcvtph2hf8s xmm30,WORD BCST \[r9\]\{1to8\}
\s*[a-f0-9]+:\s*62 65 7e 08 1b 71 7f\s+vcvtph2hf8s xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7e 9f 1b 72 80\s+vcvtph2hf8s xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]\{1to8\}
\s*[a-f0-9]+:\s*62 45 7e 38 1b 31\s+vcvtph2hf8s xmm30,WORD BCST \[r9\]\{1to16\}
\s*[a-f0-9]+:\s*62 65 7e 28 1b 71 7f\s+vcvtph2hf8s xmm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7e bf 1b 72 80\s+vcvtph2hf8s xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]\{1to16\}
\s*[a-f0-9]+:\s*62 05 7f 08 1e f5\s+vcvthf82ph xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7f 28 1e f5\s+vcvthf82ph ymm30,xmm29
\s*[a-f0-9]+:\s*62 25 7f 0f 1e b4 f5 00 00 00 10\s+vcvthf82ph xmm30\{k7\},QWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7f 08 1e 31\s+vcvthf82ph xmm30,QWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 65 7f 08 1e 71 7f\s+vcvthf82ph xmm30,QWORD PTR \[rcx\+0x3f8\]
\s*[a-f0-9]+:\s*62 65 7f 8f 1e 72 80\s+vcvthf82ph xmm30\{k7\}\{z\},QWORD PTR \[rdx-0x400\]
\s*[a-f0-9]+:\s*62 25 7f 2f 1e b4 f5 00 00 00 10\s+vcvthf82ph ymm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7f 28 1e 31\s+vcvthf82ph ymm30,XMMWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 65 7f 28 1e 71 7f\s+vcvthf82ph ymm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7f af 1e 72 80\s+vcvthf82ph ymm30\{k7\}\{z\},XMMWORD PTR \[rdx-0x800\]
#pass

#objdump: -dw -Mintel
#name: i386 AVX10.2/256 convert insns (Intel disassembly)
#source: avx10_2-256-cvt.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 f2 55 08 67 f4\s+vcvt2ps2phx xmm6,xmm5,xmm4
\s*[a-f0-9]+:\s*62 f2 55 28 67 f4\s+vcvt2ps2phx ymm6,ymm5,ymm4
\s*[a-f0-9]+:\s*62 f2 55 0f 67 b4 f4 00 00 00 10\s+vcvt2ps2phx xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 55 18 67 31\s+vcvt2ps2phx xmm6,xmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 55 08 67 71 7f\s+vcvt2ps2phx xmm6,xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f2 55 1f 67 72 80\s+vcvt2ps2phx xmm6\{k7\},xmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 55 2f 67 b4 f4 00 00 00 10\s+vcvt2ps2phx ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 55 38 67 31\s+vcvt2ps2phx ymm6,ymm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 55 28 67 71 7f\s+vcvt2ps2phx ymm6,ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f2 55 3f 67 72 80\s+vcvt2ps2phx ymm6\{k7\},ymm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 54 08 74 f4\s+vcvtbiasph2bf8 xmm6,xmm5,xmm4
\s*[a-f0-9]+:\s*62 f2 54 28 74 f4\s+vcvtbiasph2bf8 xmm6,ymm5,ymm4
\s*[a-f0-9]+:\s*62 f2 54 0f 74 b4 f4 00 00 00 10\s+vcvtbiasph2bf8 xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 54 18 74 31\s+vcvtbiasph2bf8 xmm6,xmm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 54 08 74 71 7f\s+vcvtbiasph2bf8 xmm6,xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f2 54 9f 74 72 80\s+vcvtbiasph2bf8 xmm6\{k7\}\{z\},xmm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f2 54 2f 74 b4 f4 00 00 00 10\s+vcvtbiasph2bf8 xmm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 54 38 74 31\s+vcvtbiasph2bf8 xmm6,ymm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 54 28 74 71 7f\s+vcvtbiasph2bf8 xmm6,ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f2 54 bf 74 72 80\s+vcvtbiasph2bf8 xmm6\{k7\}\{z\},ymm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f2 57 08 74 f4\s+vcvt2ph2bf8 xmm6,xmm5,xmm4
\s*[a-f0-9]+:\s*62 f2 57 28 74 f4\s+vcvt2ph2bf8 ymm6,ymm5,ymm4
\s*[a-f0-9]+:\s*62 f2 57 0f 74 b4 f4 00 00 00 10\s+vcvt2ph2bf8 xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 57 18 74 31\s+vcvt2ph2bf8 xmm6,xmm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 57 08 74 71 7f\s+vcvt2ph2bf8 xmm6,xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f2 57 1f 74 72 80\s+vcvt2ph2bf8 xmm6\{k7\},xmm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f2 57 2f 74 b4 f4 00 00 00 10\s+vcvt2ph2bf8 ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 57 38 74 31\s+vcvt2ph2bf8 ymm6,ymm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 57 28 74 71 7f\s+vcvt2ph2bf8 ymm6,ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f2 57 3f 74 72 80\s+vcvt2ph2bf8 ymm6\{k7\},ymm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f2 7e 08 74 f5\s+vcvtph2bf8 xmm6,xmm5
\s*[a-f0-9]+:\s*62 f2 7e 28 74 f5\s+vcvtph2bf8 xmm6,ymm5
\s*[a-f0-9]+:\s*62 f2 7e 0f 74 b4 f4 00 00 00 10\s+vcvtph2bf8 xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 7e 18 74 31\s+vcvtph2bf8 xmm6,WORD BCST \[ecx\]\{1to8\}
\s*[a-f0-9]+:\s*62 f2 7e 08 74 71 7f\s+vcvtph2bf8 xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f2 7e 9f 74 72 80\s+vcvtph2bf8 xmm6\{k7\}\{z\},WORD BCST \[edx-0x100\]\{1to8\}
\s*[a-f0-9]+:\s*62 f2 7e 38 74 31\s+vcvtph2bf8 xmm6,WORD BCST \[ecx\]\{1to16\}
\s*[a-f0-9]+:\s*62 f2 7e 28 74 71 7f\s+vcvtph2bf8 xmm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f2 7e bf 74 72 80\s+vcvtph2bf8 xmm6\{k7\}\{z\},WORD BCST \[edx-0x100\]\{1to16\}
\s*[a-f0-9]+:\s*62 f5 54 08 74 f4\s+vcvtbiasph2bf8s xmm6,xmm5,xmm4
\s*[a-f0-9]+:\s*62 f5 54 28 74 f4\s+vcvtbiasph2bf8s xmm6,ymm5,ymm4
\s*[a-f0-9]+:\s*62 f5 54 0f 74 b4 f4 00 00 00 10\s+vcvtbiasph2bf8s xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 54 18 74 31\s+vcvtbiasph2bf8s xmm6,xmm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 54 08 74 71 7f\s+vcvtbiasph2bf8s xmm6,xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 54 9f 74 72 80\s+vcvtbiasph2bf8s xmm6\{k7\}\{z\},xmm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 54 2f 74 b4 f4 00 00 00 10\s+vcvtbiasph2bf8s xmm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 54 38 74 31\s+vcvtbiasph2bf8s xmm6,ymm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 54 28 74 71 7f\s+vcvtbiasph2bf8s xmm6,ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 54 bf 74 72 80\s+vcvtbiasph2bf8s xmm6\{k7\}\{z\},ymm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 57 08 74 f4\s+vcvt2ph2bf8s xmm6,xmm5,xmm4
\s*[a-f0-9]+:\s*62 f5 57 28 74 f4\s+vcvt2ph2bf8s ymm6,ymm5,ymm4
\s*[a-f0-9]+:\s*62 f5 57 0f 74 b4 f4 00 00 00 10\s+vcvt2ph2bf8s xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 57 18 74 31\s+vcvt2ph2bf8s xmm6,xmm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 57 08 74 71 7f\s+vcvt2ph2bf8s xmm6,xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 57 1f 74 72 80\s+vcvt2ph2bf8s xmm6\{k7\},xmm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 57 2f 74 b4 f4 00 00 00 10\s+vcvt2ph2bf8s ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 57 38 74 31\s+vcvt2ph2bf8s ymm6,ymm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 57 28 74 71 7f\s+vcvt2ph2bf8s ymm6,ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 57 3f 74 72 80\s+vcvt2ph2bf8s ymm6\{k7\},ymm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7e 08 74 f5\s+vcvtph2bf8s xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7e 28 74 f5\s+vcvtph2bf8s xmm6,ymm5
\s*[a-f0-9]+:\s*62 f5 7e 0f 74 b4 f4 00 00 00 10\s+vcvtph2bf8s xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7e 18 74 31\s+vcvtph2bf8s xmm6,WORD BCST \[ecx\]\{1to8\}
\s*[a-f0-9]+:\s*62 f5 7e 08 74 71 7f\s+vcvtph2bf8s xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7e 9f 74 72 80\s+vcvtph2bf8s xmm6\{k7\}\{z\},WORD BCST \[edx-0x100\]\{1to8\}
\s*[a-f0-9]+:\s*62 f5 7e 38 74 31\s+vcvtph2bf8s xmm6,WORD BCST \[ecx\]\{1to16\}
\s*[a-f0-9]+:\s*62 f5 7e 28 74 71 7f\s+vcvtph2bf8s xmm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 7e bf 74 72 80\s+vcvtph2bf8s xmm6\{k7\}\{z\},WORD BCST \[edx-0x100\]\{1to16\}
\s*[a-f0-9]+:\s*62 f5 54 08 18 f4\s+vcvtbiasph2hf8 xmm6,xmm5,xmm4
\s*[a-f0-9]+:\s*62 f5 54 28 18 f4\s+vcvtbiasph2hf8 xmm6,ymm5,ymm4
\s*[a-f0-9]+:\s*62 f5 54 0f 18 b4 f4 00 00 00 10\s+vcvtbiasph2hf8 xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 54 18 18 31\s+vcvtbiasph2hf8 xmm6,xmm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 54 08 18 71 7f\s+vcvtbiasph2hf8 xmm6,xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 54 9f 18 72 80\s+vcvtbiasph2hf8 xmm6\{k7\}\{z\},xmm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 54 2f 18 b4 f4 00 00 00 10\s+vcvtbiasph2hf8 xmm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 54 38 18 31\s+vcvtbiasph2hf8 xmm6,ymm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 54 28 18 71 7f\s+vcvtbiasph2hf8 xmm6,ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 54 bf 18 72 80\s+vcvtbiasph2hf8 xmm6\{k7\}\{z\},ymm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 57 08 18 f4\s+vcvt2ph2hf8 xmm6,xmm5,xmm4
\s*[a-f0-9]+:\s*62 f5 57 28 18 f4\s+vcvt2ph2hf8 ymm6,ymm5,ymm4
\s*[a-f0-9]+:\s*62 f5 57 0f 18 b4 f4 00 00 00 10\s+vcvt2ph2hf8 xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 57 18 18 31\s+vcvt2ph2hf8 xmm6,xmm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 57 08 18 71 7f\s+vcvt2ph2hf8 xmm6,xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 57 1f 18 72 80\s+vcvt2ph2hf8 xmm6\{k7\},xmm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 57 2f 18 b4 f4 00 00 00 10\s+vcvt2ph2hf8 ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 57 38 18 31\s+vcvt2ph2hf8 ymm6,ymm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 57 28 18 71 7f\s+vcvt2ph2hf8 ymm6,ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 57 3f 18 72 80\s+vcvt2ph2hf8 ymm6\{k7\},ymm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7e 08 18 f5\s+vcvtph2hf8 xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7e 28 18 f5\s+vcvtph2hf8 xmm6,ymm5
\s*[a-f0-9]+:\s*62 f5 7e 0f 18 b4 f4 00 00 00 10\s+vcvtph2hf8 xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7e 18 18 31\s+vcvtph2hf8 xmm6,WORD BCST \[ecx\]\{1to8\}
\s*[a-f0-9]+:\s*62 f5 7e 08 18 71 7f\s+vcvtph2hf8 xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7e 9f 18 72 80\s+vcvtph2hf8 xmm6\{k7\}\{z\},WORD BCST \[edx-0x100\]\{1to8\}
\s*[a-f0-9]+:\s*62 f5 7e 38 18 31\s+vcvtph2hf8 xmm6,WORD BCST \[ecx\]\{1to16\}
\s*[a-f0-9]+:\s*62 f5 7e 28 18 71 7f\s+vcvtph2hf8 xmm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 7e bf 18 72 80\s+vcvtph2hf8 xmm6\{k7\}\{z\},WORD BCST \[edx-0x100\]\{1to16\}
\s*[a-f0-9]+:\s*62 f5 54 08 1b f4\s+vcvtbiasph2hf8s xmm6,xmm5,xmm4
\s*[a-f0-9]+:\s*62 f5 54 28 1b f4\s+vcvtbiasph2hf8s xmm6,ymm5,ymm4
\s*[a-f0-9]+:\s*62 f5 54 0f 1b b4 f4 00 00 00 10\s+vcvtbiasph2hf8s xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 54 18 1b 31\s+vcvtbiasph2hf8s xmm6,xmm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 54 08 1b 71 7f\s+vcvtbiasph2hf8s xmm6,xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 54 9f 1b 72 80\s+vcvtbiasph2hf8s xmm6\{k7\}\{z\},xmm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 54 2f 1b b4 f4 00 00 00 10\s+vcvtbiasph2hf8s xmm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 54 38 1b 31\s+vcvtbiasph2hf8s xmm6,ymm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 54 28 1b 71 7f\s+vcvtbiasph2hf8s xmm6,ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 54 bf 1b 72 80\s+vcvtbiasph2hf8s xmm6\{k7\}\{z\},ymm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 57 08 1b f4\s+vcvt2ph2hf8s xmm6,xmm5,xmm4
\s*[a-f0-9]+:\s*62 f5 57 28 1b f4\s+vcvt2ph2hf8s ymm6,ymm5,ymm4
\s*[a-f0-9]+:\s*62 f5 57 0f 1b b4 f4 00 00 00 10\s+vcvt2ph2hf8s xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 57 18 1b 31\s+vcvt2ph2hf8s xmm6,xmm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 57 08 1b 71 7f\s+vcvt2ph2hf8s xmm6,xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 57 1f 1b 72 80\s+vcvt2ph2hf8s xmm6\{k7\},xmm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 57 2f 1b b4 f4 00 00 00 10\s+vcvt2ph2hf8s ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 57 38 1b 31\s+vcvt2ph2hf8s ymm6,ymm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 57 28 1b 71 7f\s+vcvt2ph2hf8s ymm6,ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 57 3f 1b 72 80\s+vcvt2ph2hf8s ymm6\{k7\},ymm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7e 08 1b f5\s+vcvtph2hf8s xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7e 28 1b f5\s+vcvtph2hf8s xmm6,ymm5
\s*[a-f0-9]+:\s*62 f5 7e 0f 1b b4 f4 00 00 00 10\s+vcvtph2hf8s xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7e 18 1b 31\s+vcvtph2hf8s xmm6,WORD BCST \[ecx\]\{1to8\}
\s*[a-f0-9]+:\s*62 f5 7e 08 1b 71 7f\s+vcvtph2hf8s xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7e 9f 1b 72 80\s+vcvtph2hf8s xmm6\{k7\}\{z\},WORD BCST \[edx-0x100\]\{1to8\}
\s*[a-f0-9]+:\s*62 f5 7e 38 1b 31\s+vcvtph2hf8s xmm6,WORD BCST \[ecx\]\{1to16\}
\s*[a-f0-9]+:\s*62 f5 7e 28 1b 71 7f\s+vcvtph2hf8s xmm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 7e bf 1b 72 80\s+vcvtph2hf8s xmm6\{k7\}\{z\},WORD BCST \[edx-0x100\]\{1to16\}
\s*[a-f0-9]+:\s*62 f5 7f 08 1e f5\s+vcvthf82ph xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7f 28 1e f5\s+vcvthf82ph ymm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7f 0f 1e b4 f4 00 00 00 10\s+vcvthf82ph xmm6\{k7\},QWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7f 08 1e 31\s+vcvthf82ph xmm6,QWORD PTR \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7f 08 1e 71 7f\s+vcvthf82ph xmm6,QWORD PTR \[ecx\+0x3f8\]
\s*[a-f0-9]+:\s*62 f5 7f 8f 1e 72 80\s+vcvthf82ph xmm6\{k7\}\{z\},QWORD PTR \[edx-0x400\]
\s*[a-f0-9]+:\s*62 f5 7f 2f 1e b4 f4 00 00 00 10\s+vcvthf82ph ymm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7f 28 1e 31\s+vcvthf82ph ymm6,XMMWORD PTR \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7f 28 1e 71 7f\s+vcvthf82ph ymm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7f af 1e 72 80\s+vcvthf82ph ymm6\{k7\}\{z\},XMMWORD PTR \[edx-0x800\]
#pass

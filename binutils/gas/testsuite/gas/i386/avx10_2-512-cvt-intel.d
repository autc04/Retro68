#objdump: -dw -Mintel
#name: i386 AVX10.2/512 convert insns (Intel disassembly)
#source: avx10_2-512-cvt.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 f2 55 48 67 f4\s+vcvt2ps2phx zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f2 55 18 67 f4\s+vcvt2ps2phx zmm6,zmm5,zmm4\{rn-sae\}
\s*[a-f0-9]+:\s*62 f2 55 4f 67 b4 f4 00 00 00 10\s+vcvt2ps2phx zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 55 58 67 31\s+vcvt2ps2phx zmm6,zmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 55 48 67 71 7f\s+vcvt2ps2phx zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f2 55 5f 67 72 80\s+vcvt2ps2phx zmm6\{k7\},zmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 54 48 74 f4\s+vcvtbiasph2bf8 ymm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f2 54 4f 74 b4 f4 00 00 00 10\s+vcvtbiasph2bf8 ymm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 54 58 74 31\s+vcvtbiasph2bf8 ymm6,zmm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 54 48 74 71 7f\s+vcvtbiasph2bf8 ymm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f2 54 df 74 72 80\s+vcvtbiasph2bf8 ymm6\{k7\}\{z\},zmm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f2 57 48 74 f4\s+vcvt2ph2bf8 zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f2 57 4f 74 b4 f4 00 00 00 10\s+vcvt2ph2bf8 zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 57 58 74 31\s+vcvt2ph2bf8 zmm6,zmm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 57 48 74 71 7f\s+vcvt2ph2bf8 zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f2 57 5f 74 72 80\s+vcvt2ph2bf8 zmm6\{k7\},zmm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f2 7e 48 74 f5\s+vcvtph2bf8 ymm6,zmm5
\s*[a-f0-9]+:\s*62 f2 7e 4f 74 b4 f4 00 00 00 10\s+vcvtph2bf8 ymm6\{k7\},ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 7e 58 74 31\s+vcvtph2bf8 ymm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 7e 48 74 71 7f\s+vcvtph2bf8 ymm6,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f2 7e df 74 72 80\s+vcvtph2bf8 ymm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 54 48 74 f4\s+vcvtbiasph2bf8s ymm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f5 54 4f 74 b4 f4 00 00 00 10\s+vcvtbiasph2bf8s ymm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 54 58 74 31\s+vcvtbiasph2bf8s ymm6,zmm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 54 48 74 71 7f\s+vcvtbiasph2bf8s ymm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f5 54 df 74 72 80\s+vcvtbiasph2bf8s ymm6\{k7\}\{z\},zmm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 57 48 74 f4\s+vcvt2ph2bf8s zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f5 57 4f 74 b4 f4 00 00 00 10\s+vcvt2ph2bf8s zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 57 58 74 31\s+vcvt2ph2bf8s zmm6,zmm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 57 48 74 71 7f\s+vcvt2ph2bf8s zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f5 57 5f 74 72 80\s+vcvt2ph2bf8s zmm6\{k7\},zmm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7e 48 74 f5\s+vcvtph2bf8s ymm6,zmm5
\s*[a-f0-9]+:\s*62 f5 7e 4f 74 b4 f4 00 00 00 10\s+vcvtph2bf8s ymm6\{k7\},ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7e 58 74 31\s+vcvtph2bf8s ymm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7e 48 74 71 7f\s+vcvtph2bf8s ymm6,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f5 7e df 74 72 80\s+vcvtph2bf8s ymm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 54 48 18 f4\s+vcvtbiasph2hf8 ymm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f5 54 4f 18 b4 f4 00 00 00 10\s+vcvtbiasph2hf8 ymm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 54 58 18 31\s+vcvtbiasph2hf8 ymm6,zmm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 54 48 18 71 7f\s+vcvtbiasph2hf8 ymm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f5 54 df 18 72 80\s+vcvtbiasph2hf8 ymm6\{k7\}\{z\},zmm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 57 48 18 f4\s+vcvt2ph2hf8 zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f5 57 4f 18 b4 f4 00 00 00 10\s+vcvt2ph2hf8 zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 57 58 18 31\s+vcvt2ph2hf8 zmm6,zmm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 57 48 18 71 7f\s+vcvt2ph2hf8 zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f5 57 5f 18 72 80\s+vcvt2ph2hf8 zmm6\{k7\},zmm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7e 48 18 f5\s+vcvtph2hf8 ymm6,zmm5
\s*[a-f0-9]+:\s*62 f5 7e 4f 18 b4 f4 00 00 00 10\s+vcvtph2hf8 ymm6\{k7\},ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7e 58 18 31\s+vcvtph2hf8 ymm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7e 48 18 71 7f\s+vcvtph2hf8 ymm6,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f5 7e df 18 72 80\s+vcvtph2hf8 ymm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 54 48 1b f4\s+vcvtbiasph2hf8s ymm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f5 54 4f 1b b4 f4 00 00 00 10\s+vcvtbiasph2hf8s ymm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 54 58 1b 31\s+vcvtbiasph2hf8s ymm6,zmm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 54 48 1b 71 7f\s+vcvtbiasph2hf8s ymm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f5 54 df 1b 72 80\s+vcvtbiasph2hf8s ymm6\{k7\}\{z\},zmm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 57 48 1b f4\s+vcvt2ph2hf8s zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f5 57 4f 1b b4 f4 00 00 00 10\s+vcvt2ph2hf8s zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 57 58 1b 31\s+vcvt2ph2hf8s zmm6,zmm5,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 57 48 1b 71 7f\s+vcvt2ph2hf8s zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f5 57 5f 1b 72 80\s+vcvt2ph2hf8s zmm6\{k7\},zmm5,WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7e 48 1b f5\s+vcvtph2hf8s ymm6,zmm5
\s*[a-f0-9]+:\s*62 f5 7e 4f 1b b4 f4 00 00 00 10\s+vcvtph2hf8s ymm6\{k7\},ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7e 58 1b 31\s+vcvtph2hf8s ymm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7e 48 1b 71 7f\s+vcvtph2hf8s ymm6,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f5 7e df 1b 72 80\s+vcvtph2hf8s ymm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7f 48 1e f5\s+vcvthf82ph zmm6,ymm5
\s*[a-f0-9]+:\s*62 f5 7f 4f 1e b4 f4 00 00 00 10\s+vcvthf82ph zmm6\{k7\},YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7f 48 1e 31\s+vcvthf82ph zmm6,YMMWORD PTR \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7f 48 1e 71 7f\s+vcvthf82ph zmm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 7f cf 1e 72 80\s+vcvthf82ph zmm6\{k7\}\{z\},YMMWORD PTR \[edx-0x1000\]
#pass

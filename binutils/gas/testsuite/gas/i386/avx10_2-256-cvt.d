#objdump: -dw
#name: i386 AVX10.2/256 convert insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 f2 55 08 67 f4\s+vcvt2ps2phx\s+%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 55 28 67 f4\s+vcvt2ps2phx\s+%ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 55 0f 67 b4 f4 00 00 00 10\s+vcvt2ps2phx\s+0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 55 18 67 31\s+vcvt2ps2phx\s+\(%ecx\)\{1to4\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 55 08 67 71 7f\s+vcvt2ps2phx\s+0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 55 1f 67 72 80\s+vcvt2ps2phx\s+-0x200\(%edx\)\{1to4\},%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 55 2f 67 b4 f4 00 00 00 10\s+vcvt2ps2phx\s+0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 55 38 67 31\s+vcvt2ps2phx\s+\(%ecx\)\{1to8\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 55 28 67 71 7f\s+vcvt2ps2phx\s+0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 55 3f 67 72 80\s+vcvt2ps2phx\s+-0x200\(%edx\)\{1to8\},%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 08 74 f4\s+vcvtbiasph2bf8\s+%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 28 74 f4\s+vcvtbiasph2bf8\s+%ymm4,%ymm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 0f 74 b4 f4 00 00 00 10\s+vcvtbiasph2bf8\s+0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 18 74 31\s+vcvtbiasph2bf8\s+\(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 08 74 71 7f\s+vcvtbiasph2bf8\s+0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 9f 74 72 80\s+vcvtbiasph2bf8\s+-0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 54 2f 74 b4 f4 00 00 00 10\s+vcvtbiasph2bf8\s+0x10000000\(%esp,%esi,8\),%ymm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 38 74 31\s+vcvtbiasph2bf8\s+\(%ecx\)\{1to16\},%ymm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 28 74 71 7f\s+vcvtbiasph2bf8\s+0xfe0\(%ecx\),%ymm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 bf 74 72 80\s+vcvtbiasph2bf8\s+-0x100\(%edx\)\{1to16\},%ymm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 57 08 74 f4\s+vcvt2ph2bf8\s+%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 57 28 74 f4\s+vcvt2ph2bf8\s+%ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 57 0f 74 b4 f4 00 00 00 10\s+vcvt2ph2bf8\s+0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 57 18 74 31\s+vcvt2ph2bf8\s+\(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 57 08 74 71 7f\s+vcvt2ph2bf8\s+0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 57 1f 74 72 80\s+vcvt2ph2bf8\s+-0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 57 2f 74 b4 f4 00 00 00 10\s+vcvt2ph2bf8\s+0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 57 38 74 31\s+vcvt2ph2bf8\s+\(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 57 28 74 71 7f\s+vcvt2ph2bf8\s+0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 57 3f 74 72 80\s+vcvt2ph2bf8\s+-0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 7e 08 74 f5\s+vcvtph2bf8\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 7e 28 74 f5\s+vcvtph2bf8\s+%ymm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 7e 0f 74 b4 f4 00 00 00 10\s+vcvtph2bf8x\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 7e 18 74 31\s+vcvtph2bf8\s+\(%ecx\)\{1to8\},%xmm6
\s*[a-f0-9]+:\s*62 f2 7e 08 74 71 7f\s+vcvtph2bf8x\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f2 7e 9f 74 72 80\s+vcvtph2bf8\s+-0x100\(%edx\)\{1to8\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 7e 38 74 31\s+vcvtph2bf8\s+\(%ecx\)\{1to16\},%xmm6
\s*[a-f0-9]+:\s*62 f2 7e 28 74 71 7f\s+vcvtph2bf8y\s+0xfe0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f2 7e bf 74 72 80\s+vcvtph2bf8\s+-0x100\(%edx\)\{1to16\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 54 08 74 f4\s+vcvtbiasph2bf8s\s+%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 54 28 74 f4\s+vcvtbiasph2bf8s\s+%ymm4,%ymm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 54 0f 74 b4 f4 00 00 00 10\s+vcvtbiasph2bf8s\s+0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 54 18 74 31\s+vcvtbiasph2bf8s\s+\(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 54 08 74 71 7f\s+vcvtbiasph2bf8s\s+0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 54 9f 74 72 80\s+vcvtbiasph2bf8s\s+-0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 54 2f 74 b4 f4 00 00 00 10\s+vcvtbiasph2bf8s\s+0x10000000\(%esp,%esi,8\),%ymm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 54 38 74 31\s+vcvtbiasph2bf8s\s+\(%ecx\)\{1to16\},%ymm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 54 28 74 71 7f\s+vcvtbiasph2bf8s\s+0xfe0\(%ecx\),%ymm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 54 bf 74 72 80\s+vcvtbiasph2bf8s\s+-0x100\(%edx\)\{1to16\},%ymm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 57 08 74 f4\s+vcvt2ph2bf8s\s+%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 57 28 74 f4\s+vcvt2ph2bf8s\s+%ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 57 0f 74 b4 f4 00 00 00 10\s+vcvt2ph2bf8s\s+0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 57 18 74 31\s+vcvt2ph2bf8s\s+\(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 57 08 74 71 7f\s+vcvt2ph2bf8s\s+0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 57 1f 74 72 80\s+vcvt2ph2bf8s\s+-0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 57 2f 74 b4 f4 00 00 00 10\s+vcvt2ph2bf8s\s+0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 57 38 74 31\s+vcvt2ph2bf8s\s+\(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 57 28 74 71 7f\s+vcvt2ph2bf8s\s+0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 57 3f 74 72 80\s+vcvt2ph2bf8s\s+-0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7e 08 74 f5\s+vcvtph2bf8s\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 28 74 f5\s+vcvtph2bf8s\s+%ymm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 0f 74 b4 f4 00 00 00 10\s+vcvtph2bf8sx\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7e 18 74 31\s+vcvtph2bf8s\s+\(%ecx\)\{1to8\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 08 74 71 7f\s+vcvtph2bf8sx\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 9f 74 72 80\s+vcvtph2bf8s\s+-0x100\(%edx\)\{1to8\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7e 38 74 31\s+vcvtph2bf8s\s+\(%ecx\)\{1to16\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 28 74 71 7f\s+vcvtph2bf8sy\s+0xfe0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7e bf 74 72 80\s+vcvtph2bf8s\s+-0x100\(%edx\)\{1to16\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 54 08 18 f4\s+vcvtbiasph2hf8\s+%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 54 28 18 f4\s+vcvtbiasph2hf8\s+%ymm4,%ymm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 54 0f 18 b4 f4 00 00 00 10\s+vcvtbiasph2hf8\s+0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 54 18 18 31\s+vcvtbiasph2hf8\s+\(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 54 08 18 71 7f\s+vcvtbiasph2hf8\s+0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 54 9f 18 72 80\s+vcvtbiasph2hf8\s+-0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 54 2f 18 b4 f4 00 00 00 10\s+vcvtbiasph2hf8\s+0x10000000\(%esp,%esi,8\),%ymm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 54 38 18 31\s+vcvtbiasph2hf8\s+\(%ecx\)\{1to16\},%ymm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 54 28 18 71 7f\s+vcvtbiasph2hf8\s+0xfe0\(%ecx\),%ymm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 54 bf 18 72 80\s+vcvtbiasph2hf8\s+-0x100\(%edx\)\{1to16\},%ymm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 57 08 18 f4\s+vcvt2ph2hf8\s+%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 57 28 18 f4\s+vcvt2ph2hf8\s+%ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 57 0f 18 b4 f4 00 00 00 10\s+vcvt2ph2hf8\s+0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 57 18 18 31\s+vcvt2ph2hf8\s+\(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 57 08 18 71 7f\s+vcvt2ph2hf8\s+0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 57 1f 18 72 80\s+vcvt2ph2hf8\s+-0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 57 2f 18 b4 f4 00 00 00 10\s+vcvt2ph2hf8\s+0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 57 38 18 31\s+vcvt2ph2hf8\s+\(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 57 28 18 71 7f\s+vcvt2ph2hf8\s+0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 57 3f 18 72 80\s+vcvt2ph2hf8\s+-0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7e 08 18 f5\s+vcvtph2hf8\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 28 18 f5\s+vcvtph2hf8\s+%ymm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 0f 18 b4 f4 00 00 00 10\s+vcvtph2hf8x\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7e 18 18 31\s+vcvtph2hf8\s+\(%ecx\)\{1to8\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 08 18 71 7f\s+vcvtph2hf8x\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 9f 18 72 80\s+vcvtph2hf8\s+-0x100\(%edx\)\{1to8\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7e 38 18 31\s+vcvtph2hf8\s+\(%ecx\)\{1to16\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 28 18 71 7f\s+vcvtph2hf8y\s+0xfe0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7e bf 18 72 80\s+vcvtph2hf8\s+-0x100\(%edx\)\{1to16\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 54 08 1b f4\s+vcvtbiasph2hf8s\s+%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 54 28 1b f4\s+vcvtbiasph2hf8s\s+%ymm4,%ymm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 54 0f 1b b4 f4 00 00 00 10\s+vcvtbiasph2hf8s\s+0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 54 18 1b 31\s+vcvtbiasph2hf8s\s+\(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 54 08 1b 71 7f\s+vcvtbiasph2hf8s\s+0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 54 9f 1b 72 80\s+vcvtbiasph2hf8s\s+-0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 54 2f 1b b4 f4 00 00 00 10\s+vcvtbiasph2hf8s\s+0x10000000\(%esp,%esi,8\),%ymm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 54 38 1b 31\s+vcvtbiasph2hf8s\s+\(%ecx\)\{1to16\},%ymm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 54 28 1b 71 7f\s+vcvtbiasph2hf8s\s+0xfe0\(%ecx\),%ymm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 54 bf 1b 72 80\s+vcvtbiasph2hf8s\s+-0x100\(%edx\)\{1to16\},%ymm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 57 08 1b f4\s+vcvt2ph2hf8s\s+%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 57 28 1b f4\s+vcvt2ph2hf8s\s+%ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 57 0f 1b b4 f4 00 00 00 10\s+vcvt2ph2hf8s\s+0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 57 18 1b 31\s+vcvt2ph2hf8s\s+\(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 57 08 1b 71 7f\s+vcvt2ph2hf8s\s+0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 57 1f 1b 72 80\s+vcvt2ph2hf8s\s+-0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 57 2f 1b b4 f4 00 00 00 10\s+vcvt2ph2hf8s\s+0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 57 38 1b 31\s+vcvt2ph2hf8s\s+\(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 57 28 1b 71 7f\s+vcvt2ph2hf8s\s+0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 57 3f 1b 72 80\s+vcvt2ph2hf8s\s+-0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7e 08 1b f5\s+vcvtph2hf8s\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 28 1b f5\s+vcvtph2hf8s\s+%ymm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 0f 1b b4 f4 00 00 00 10\s+vcvtph2hf8sx\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7e 18 1b 31\s+vcvtph2hf8s\s+\(%ecx\)\{1to8\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 08 1b 71 7f\s+vcvtph2hf8sx\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 9f 1b 72 80\s+vcvtph2hf8s\s+-0x100\(%edx\)\{1to8\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7e 38 1b 31\s+vcvtph2hf8s\s+\(%ecx\)\{1to16\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 28 1b 71 7f\s+vcvtph2hf8sy\s+0xfe0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7e bf 1b 72 80\s+vcvtph2hf8s\s+-0x100\(%edx\)\{1to16\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7f 08 1e f5\s+vcvthf82ph\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7f 28 1e f5\s+vcvthf82ph\s+%xmm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7f 0f 1e b4 f4 00 00 00 10\s+vcvthf82ph\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7f 08 1e 31\s+vcvthf82ph\s+\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7f 08 1e 71 7f\s+vcvthf82ph\s+0x3f8\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7f 8f 1e 72 80\s+vcvthf82ph\s+-0x400\(%edx\),%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7f 2f 1e b4 f4 00 00 00 10\s+vcvthf82ph\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7f 28 1e 31\s+vcvthf82ph\s+\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7f 28 1e 71 7f\s+vcvthf82ph\s+0x7f0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7f af 1e 72 80\s+vcvthf82ph\s+-0x800\(%edx\),%ymm6\{%k7\}\{z\}
#pass

#objdump: -dw
#name: i386 AVX10.2/512 convert insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 f2 55 48 67 f4\s+vcvt2ps2phx\s+%zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 55 18 67 f4\s+vcvt2ps2phx\s+\{rn-sae\},%zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 55 4f 67 b4 f4 00 00 00 10\s+vcvt2ps2phx\s+0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 55 58 67 31\s+vcvt2ps2phx\s+\(%ecx\)\{1to16\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 55 48 67 71 7f\s+vcvt2ps2phx\s+0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 55 5f 67 72 80\s+vcvt2ps2phx\s+-0x200\(%edx\)\{1to16\},%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 48 74 f4\s+vcvtbiasph2bf8\s+%zmm4,%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 4f 74 b4 f4 00 00 00 10\s+vcvtbiasph2bf8\s+0x10000000\(%esp,%esi,8\),%zmm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 58 74 31\s+vcvtbiasph2bf8\s+\(%ecx\)\{1to32\},%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 48 74 71 7f\s+vcvtbiasph2bf8\s+0x1fc0\(%ecx\),%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 df 74 72 80\s+vcvtbiasph2bf8\s+-0x100\(%edx\)\{1to32\},%zmm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 57 48 74 f4\s+vcvt2ph2bf8\s+%zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 57 4f 74 b4 f4 00 00 00 10\s+vcvt2ph2bf8\s+0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 57 58 74 31\s+vcvt2ph2bf8\s+\(%ecx\)\{1to32\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 57 48 74 71 7f\s+vcvt2ph2bf8\s+0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 57 5f 74 72 80\s+vcvt2ph2bf8\s+-0x100\(%edx\)\{1to32\},%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 7e 48 74 f5\s+vcvtph2bf8\s+%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 7e 4f 74 b4 f4 00 00 00 10\s+vcvtph2bf8\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 7e 58 74 31\s+vcvtph2bf8\s+\(%ecx\)\{1to32\},%ymm6
\s*[a-f0-9]+:\s*62 f2 7e 48 74 71 7f\s+vcvtph2bf8\s+0x1fc0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f2 7e df 74 72 80\s+vcvtph2bf8\s+-0x100\(%edx\)\{1to32\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 54 48 74 f4\s+vcvtbiasph2bf8s\s+%zmm4,%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 54 4f 74 b4 f4 00 00 00 10\s+vcvtbiasph2bf8s\s+0x10000000\(%esp,%esi,8\),%zmm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 54 58 74 31\s+vcvtbiasph2bf8s\s+\(%ecx\)\{1to32\},%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 54 48 74 71 7f\s+vcvtbiasph2bf8s\s+0x1fc0\(%ecx\),%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 54 df 74 72 80\s+vcvtbiasph2bf8s\s+-0x100\(%edx\)\{1to32\},%zmm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 57 48 74 f4\s+vcvt2ph2bf8s\s+%zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 57 4f 74 b4 f4 00 00 00 10\s+vcvt2ph2bf8s\s+0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 57 58 74 31\s+vcvt2ph2bf8s\s+\(%ecx\)\{1to32\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 57 48 74 71 7f\s+vcvt2ph2bf8s\s+0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 57 5f 74 72 80\s+vcvt2ph2bf8s\s+-0x100\(%edx\)\{1to32\},%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7e 48 74 f5\s+vcvtph2bf8s\s+%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7e 4f 74 b4 f4 00 00 00 10\s+vcvtph2bf8s\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7e 58 74 31\s+vcvtph2bf8s\s+\(%ecx\)\{1to32\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7e 48 74 71 7f\s+vcvtph2bf8s\s+0x1fc0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7e df 74 72 80\s+vcvtph2bf8s\s+-0x100\(%edx\)\{1to32\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 54 48 18 f4\s+vcvtbiasph2hf8\s+%zmm4,%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 54 4f 18 b4 f4 00 00 00 10\s+vcvtbiasph2hf8\s+0x10000000\(%esp,%esi,8\),%zmm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 54 58 18 31\s+vcvtbiasph2hf8\s+\(%ecx\)\{1to32\},%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 54 48 18 71 7f\s+vcvtbiasph2hf8\s+0x1fc0\(%ecx\),%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 54 df 18 72 80\s+vcvtbiasph2hf8\s+-0x100\(%edx\)\{1to32\},%zmm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 57 48 18 f4\s+vcvt2ph2hf8\s+%zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 57 4f 18 b4 f4 00 00 00 10\s+vcvt2ph2hf8\s+0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 57 58 18 31\s+vcvt2ph2hf8\s+\(%ecx\)\{1to32\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 57 48 18 71 7f\s+vcvt2ph2hf8\s+0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 57 5f 18 72 80\s+vcvt2ph2hf8\s+-0x100\(%edx\)\{1to32\},%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7e 48 18 f5\s+vcvtph2hf8\s+%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7e 4f 18 b4 f4 00 00 00 10\s+vcvtph2hf8\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7e 58 18 31\s+vcvtph2hf8\s+\(%ecx\)\{1to32\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7e 48 18 71 7f\s+vcvtph2hf8\s+0x1fc0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7e df 18 72 80\s+vcvtph2hf8\s+-0x100\(%edx\)\{1to32\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 54 48 1b f4\s+vcvtbiasph2hf8s\s+%zmm4,%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 54 4f 1b b4 f4 00 00 00 10\s+vcvtbiasph2hf8s\s+0x10000000\(%esp,%esi,8\),%zmm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 54 58 1b 31\s+vcvtbiasph2hf8s\s+\(%ecx\)\{1to32\},%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 54 48 1b 71 7f\s+vcvtbiasph2hf8s\s+0x1fc0\(%ecx\),%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 54 df 1b 72 80\s+vcvtbiasph2hf8s\s+-0x100\(%edx\)\{1to32\},%zmm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 57 48 1b f4\s+vcvt2ph2hf8s\s+%zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 57 4f 1b b4 f4 00 00 00 10\s+vcvt2ph2hf8s\s+0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 57 58 1b 31\s+vcvt2ph2hf8s\s+\(%ecx\)\{1to32\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 57 48 1b 71 7f\s+vcvt2ph2hf8s\s+0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 57 5f 1b 72 80\s+vcvt2ph2hf8s\s+-0x100\(%edx\)\{1to32\},%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7e 48 1b f5\s+vcvtph2hf8s\s+%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7e 4f 1b b4 f4 00 00 00 10\s+vcvtph2hf8s\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7e 58 1b 31\s+vcvtph2hf8s\s+\(%ecx\)\{1to32\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7e 48 1b 71 7f\s+vcvtph2hf8s\s+0x1fc0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7e df 1b 72 80\s+vcvtph2hf8s\s+-0x100\(%edx\)\{1to32\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7f 48 1e f5\s+vcvthf82ph\s+%ymm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7f 4f 1e b4 f4 00 00 00 10\s+vcvthf82ph\s+0x10000000\(%esp,%esi,8\),%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7f 48 1e 31\s+vcvthf82ph\s+\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 7f 48 1e 71 7f\s+vcvthf82ph\s+0xfe0\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 7f cf 1e 72 80\s+vcvthf82ph\s+-0x1000\(%edx\),%zmm6\{%k7\}\{z\}
#pass

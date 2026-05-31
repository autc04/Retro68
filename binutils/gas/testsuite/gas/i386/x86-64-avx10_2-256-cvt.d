#objdump: -dw
#name: x86_64 AVX10.2/256 convert insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 02 15 00 67 f4\s+vcvt2ps2phx\s+%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 02 15 20 67 f4\s+vcvt2ps2phx\s+%ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 22 15 07 67 b4 f5 00 00 00 10\s+vcvt2ps2phx\s+0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 15 10 67 31\s+vcvt2ps2phx\s+\(%r9\)\{1to4\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 15 00 67 71 7f\s+vcvt2ps2phx\s+0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 15 17 67 72 80\s+vcvt2ps2phx\s+-0x200\(%rdx\)\{1to4\},%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 22 15 27 67 b4 f5 00 00 00 10\s+vcvt2ps2phx\s+0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 15 30 67 31\s+vcvt2ps2phx\s+\(%r9\)\{1to8\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 15 20 67 71 7f\s+vcvt2ps2phx\s+0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 15 37 67 72 80\s+vcvt2ps2phx\s+-0x200\(%rdx\)\{1to8\},%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 02 14 00 74 f4\s+vcvtbiasph2bf8\s+%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 02 14 20 74 f4\s+vcvtbiasph2bf8\s+%ymm28,%ymm29,%xmm30
\s*[a-f0-9]+:\s*62 22 14 07 74 b4 f5 00 00 00 10\s+vcvtbiasph2bf8\s+0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 14 10 74 31\s+vcvtbiasph2bf8\s+\(%r9\)\{1to8\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 14 00 74 71 7f\s+vcvtbiasph2bf8\s+0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 14 97 74 72 80\s+vcvtbiasph2bf8\s+-0x100\(%rdx\)\{1to8\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 22 14 27 74 b4 f5 00 00 00 10\s+vcvtbiasph2bf8\s+0x10000000\(%rbp,%r14,8\),%ymm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 14 30 74 31\s+vcvtbiasph2bf8\s+\(%r9\)\{1to16\},%ymm29,%xmm30
\s*[a-f0-9]+:\s*62 62 14 20 74 71 7f\s+vcvtbiasph2bf8\s+0xfe0\(%rcx\),%ymm29,%xmm30
\s*[a-f0-9]+:\s*62 62 14 b7 74 72 80\s+vcvtbiasph2bf8\s+-0x100\(%rdx\)\{1to16\},%ymm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 17 00 74 f4\s+vcvt2ph2bf8\s+%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 02 17 20 74 f4\s+vcvt2ph2bf8\s+%ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 22 17 07 74 b4 f5 00 00 00 10\s+vcvt2ph2bf8\s+0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 17 10 74 31\s+vcvt2ph2bf8\s+\(%r9\)\{1to8\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 17 00 74 71 7f\s+vcvt2ph2bf8\s+0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 17 17 74 72 80\s+vcvt2ph2bf8\s+-0x100\(%rdx\)\{1to8\},%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 22 17 27 74 b4 f5 00 00 00 10\s+vcvt2ph2bf8\s+0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 17 30 74 31\s+vcvt2ph2bf8\s+\(%r9\)\{1to16\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 17 20 74 71 7f\s+vcvt2ph2bf8\s+0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 17 37 74 72 80\s+vcvt2ph2bf8\s+-0x100\(%rdx\)\{1to16\},%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 02 7e 08 74 f5\s+vcvtph2bf8\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 02 7e 28 74 f5\s+vcvtph2bf8\s+%ymm29,%xmm30
\s*[a-f0-9]+:\s*62 22 7e 0f 74 b4 f5 00 00 00 10\s+vcvtph2bf8x\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 7e 18 74 31\s+vcvtph2bf8\s+\(%r9\)\{1to8\},%xmm30
\s*[a-f0-9]+:\s*62 62 7e 08 74 71 7f\s+vcvtph2bf8x\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 62 7e 9f 74 72 80\s+vcvtph2bf8\s+-0x100\(%rdx\)\{1to8\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 42 7e 38 74 31\s+vcvtph2bf8\s+\(%r9\)\{1to16\},%xmm30
\s*[a-f0-9]+:\s*62 62 7e 28 74 71 7f\s+vcvtph2bf8y\s+0xfe0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 62 7e bf 74 72 80\s+vcvtph2bf8\s+-0x100\(%rdx\)\{1to16\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 14 00 74 f4\s+vcvtbiasph2bf8s\s+%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 14 20 74 f4\s+vcvtbiasph2bf8s\s+%ymm28,%ymm29,%xmm30
\s*[a-f0-9]+:\s*62 25 14 07 74 b4 f5 00 00 00 10\s+vcvtbiasph2bf8s\s+0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 14 10 74 31\s+vcvtbiasph2bf8s\s+\(%r9\)\{1to8\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 65 14 00 74 71 7f\s+vcvtbiasph2bf8s\s+0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 65 14 97 74 72 80\s+vcvtbiasph2bf8s\s+-0x100\(%rdx\)\{1to8\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 14 27 74 b4 f5 00 00 00 10\s+vcvtbiasph2bf8s\s+0x10000000\(%rbp,%r14,8\),%ymm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 14 30 74 31\s+vcvtbiasph2bf8s\s+\(%r9\)\{1to16\},%ymm29,%xmm30
\s*[a-f0-9]+:\s*62 65 14 20 74 71 7f\s+vcvtbiasph2bf8s\s+0xfe0\(%rcx\),%ymm29,%xmm30
\s*[a-f0-9]+:\s*62 65 14 b7 74 72 80\s+vcvtbiasph2bf8s\s+-0x100\(%rdx\)\{1to16\},%ymm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 17 00 74 f4\s+vcvt2ph2bf8s\s+%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 17 20 74 f4\s+vcvt2ph2bf8s\s+%ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 25 17 07 74 b4 f5 00 00 00 10\s+vcvt2ph2bf8s\s+0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 17 10 74 31\s+vcvt2ph2bf8s\s+\(%r9\)\{1to8\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 65 17 00 74 71 7f\s+vcvt2ph2bf8s\s+0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 65 17 17 74 72 80\s+vcvt2ph2bf8s\s+-0x100\(%rdx\)\{1to8\},%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 25 17 27 74 b4 f5 00 00 00 10\s+vcvt2ph2bf8s\s+0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 17 30 74 31\s+vcvt2ph2bf8s\s+\(%r9\)\{1to16\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 65 17 20 74 71 7f\s+vcvt2ph2bf8s\s+0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 65 17 37 74 72 80\s+vcvt2ph2bf8s\s+-0x100\(%rdx\)\{1to16\},%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 05 7e 08 74 f5\s+vcvtph2bf8s\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7e 28 74 f5\s+vcvtph2bf8s\s+%ymm29,%xmm30
\s*[a-f0-9]+:\s*62 25 7e 0f 74 b4 f5 00 00 00 10\s+vcvtph2bf8sx\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7e 18 74 31\s+vcvtph2bf8s\s+\(%r9\)\{1to8\},%xmm30
\s*[a-f0-9]+:\s*62 65 7e 08 74 71 7f\s+vcvtph2bf8sx\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7e 9f 74 72 80\s+vcvtph2bf8s\s+-0x100\(%rdx\)\{1to8\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 45 7e 38 74 31\s+vcvtph2bf8s\s+\(%r9\)\{1to16\},%xmm30
\s*[a-f0-9]+:\s*62 65 7e 28 74 71 7f\s+vcvtph2bf8sy\s+0xfe0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7e bf 74 72 80\s+vcvtph2bf8s\s+-0x100\(%rdx\)\{1to16\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 14 00 18 f4\s+vcvtbiasph2hf8\s+%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 14 20 18 f4\s+vcvtbiasph2hf8\s+%ymm28,%ymm29,%xmm30
\s*[a-f0-9]+:\s*62 25 14 07 18 b4 f5 00 00 00 10\s+vcvtbiasph2hf8\s+0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 14 10 18 31\s+vcvtbiasph2hf8\s+\(%r9\)\{1to8\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 65 14 00 18 71 7f\s+vcvtbiasph2hf8\s+0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 65 14 97 18 72 80\s+vcvtbiasph2hf8\s+-0x100\(%rdx\)\{1to8\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 14 27 18 b4 f5 00 00 00 10\s+vcvtbiasph2hf8\s+0x10000000\(%rbp,%r14,8\),%ymm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 14 30 18 31\s+vcvtbiasph2hf8\s+\(%r9\)\{1to16\},%ymm29,%xmm30
\s*[a-f0-9]+:\s*62 65 14 20 18 71 7f\s+vcvtbiasph2hf8\s+0xfe0\(%rcx\),%ymm29,%xmm30
\s*[a-f0-9]+:\s*62 65 14 b7 18 72 80\s+vcvtbiasph2hf8\s+-0x100\(%rdx\)\{1to16\},%ymm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 17 00 18 f4\s+vcvt2ph2hf8\s+%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 17 20 18 f4\s+vcvt2ph2hf8\s+%ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 25 17 07 18 b4 f5 00 00 00 10\s+vcvt2ph2hf8\s+0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 17 10 18 31\s+vcvt2ph2hf8\s+\(%r9\)\{1to8\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 65 17 00 18 71 7f\s+vcvt2ph2hf8\s+0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 65 17 17 18 72 80\s+vcvt2ph2hf8\s+-0x100\(%rdx\)\{1to8\},%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 25 17 27 18 b4 f5 00 00 00 10\s+vcvt2ph2hf8\s+0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 17 30 18 31\s+vcvt2ph2hf8\s+\(%r9\)\{1to16\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 65 17 20 18 71 7f\s+vcvt2ph2hf8\s+0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 65 17 37 18 72 80\s+vcvt2ph2hf8\s+-0x100\(%rdx\)\{1to16\},%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 05 7e 08 18 f5\s+vcvtph2hf8\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7e 28 18 f5\s+vcvtph2hf8\s+%ymm29,%xmm30
\s*[a-f0-9]+:\s*62 25 7e 0f 18 b4 f5 00 00 00 10\s+vcvtph2hf8x\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7e 18 18 31\s+vcvtph2hf8\s+\(%r9\)\{1to8\},%xmm30
\s*[a-f0-9]+:\s*62 65 7e 08 18 71 7f\s+vcvtph2hf8x\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7e 9f 18 72 80\s+vcvtph2hf8\s+-0x100\(%rdx\)\{1to8\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 45 7e 38 18 31\s+vcvtph2hf8\s+\(%r9\)\{1to16\},%xmm30
\s*[a-f0-9]+:\s*62 65 7e 28 18 71 7f\s+vcvtph2hf8y\s+0xfe0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7e bf 18 72 80\s+vcvtph2hf8\s+-0x100\(%rdx\)\{1to16\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 14 00 1b f4\s+vcvtbiasph2hf8s\s+%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 14 20 1b f4\s+vcvtbiasph2hf8s\s+%ymm28,%ymm29,%xmm30
\s*[a-f0-9]+:\s*62 25 14 07 1b b4 f5 00 00 00 10\s+vcvtbiasph2hf8s\s+0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 14 10 1b 31\s+vcvtbiasph2hf8s\s+\(%r9\)\{1to8\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 65 14 00 1b 71 7f\s+vcvtbiasph2hf8s\s+0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 65 14 97 1b 72 80\s+vcvtbiasph2hf8s\s+-0x100\(%rdx\)\{1to8\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 14 27 1b b4 f5 00 00 00 10\s+vcvtbiasph2hf8s\s+0x10000000\(%rbp,%r14,8\),%ymm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 14 30 1b 31\s+vcvtbiasph2hf8s\s+\(%r9\)\{1to16\},%ymm29,%xmm30
\s*[a-f0-9]+:\s*62 65 14 20 1b 71 7f\s+vcvtbiasph2hf8s\s+0xfe0\(%rcx\),%ymm29,%xmm30
\s*[a-f0-9]+:\s*62 65 14 b7 1b 72 80\s+vcvtbiasph2hf8s\s+-0x100\(%rdx\)\{1to16\},%ymm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 17 00 1b f4\s+vcvt2ph2hf8s\s+%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 17 20 1b f4\s+vcvt2ph2hf8s\s+%ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 25 17 07 1b b4 f5 00 00 00 10\s+vcvt2ph2hf8s\s+0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 17 10 1b 31\s+vcvt2ph2hf8s\s+\(%r9\)\{1to8\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 65 17 00 1b 71 7f\s+vcvt2ph2hf8s\s+0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 65 17 17 1b 72 80\s+vcvt2ph2hf8s\s+-0x100\(%rdx\)\{1to8\},%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 25 17 27 1b b4 f5 00 00 00 10\s+vcvt2ph2hf8s\s+0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 17 30 1b 31\s+vcvt2ph2hf8s\s+\(%r9\)\{1to16\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 65 17 20 1b 71 7f\s+vcvt2ph2hf8s\s+0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 65 17 37 1b 72 80\s+vcvt2ph2hf8s\s+-0x100\(%rdx\)\{1to16\},%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 05 7e 08 1b f5\s+vcvtph2hf8s\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7e 28 1b f5\s+vcvtph2hf8s\s+%ymm29,%xmm30
\s*[a-f0-9]+:\s*62 25 7e 0f 1b b4 f5 00 00 00 10\s+vcvtph2hf8sx\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7e 18 1b 31\s+vcvtph2hf8s\s+\(%r9\)\{1to8\},%xmm30
\s*[a-f0-9]+:\s*62 65 7e 08 1b 71 7f\s+vcvtph2hf8sx\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7e 9f 1b 72 80\s+vcvtph2hf8s\s+-0x100\(%rdx\)\{1to8\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 45 7e 38 1b 31\s+vcvtph2hf8s\s+\(%r9\)\{1to16\},%xmm30
\s*[a-f0-9]+:\s*62 65 7e 28 1b 71 7f\s+vcvtph2hf8sy\s+0xfe0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7e bf 1b 72 80\s+vcvtph2hf8s\s+-0x100\(%rdx\)\{1to16\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 7f 08 1e f5\s+vcvthf82ph\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7f 28 1e f5\s+vcvthf82ph\s+%xmm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7f 0f 1e b4 f5 00 00 00 10\s+vcvthf82ph\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7f 08 1e 31\s+vcvthf82ph\s+\(%r9\),%xmm30
\s*[a-f0-9]+:\s*62 65 7f 08 1e 71 7f\s+vcvthf82ph\s+0x3f8\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7f 8f 1e 72 80\s+vcvthf82ph\s+-0x400\(%rdx\),%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 7f 2f 1e b4 f5 00 00 00 10\s+vcvthf82ph\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7f 28 1e 31\s+vcvthf82ph\s+\(%r9\),%ymm30
\s*[a-f0-9]+:\s*62 65 7f 28 1e 71 7f\s+vcvthf82ph\s+0x7f0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7f af 1e 72 80\s+vcvthf82ph\s+-0x800\(%rdx\),%ymm30\{%k7\}\{z\}
#pass

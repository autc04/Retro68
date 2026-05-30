#objdump: -dw
#name: x86_64 AVX10.2/512 convert insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 02 15 40 67 f4\s+vcvt2ps2phx\s+%zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 02 15 10 67 f4\s+vcvt2ps2phx\s+\{rn-sae\},%zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 22 15 47 67 b4 f5 00 00 00 10\s+vcvt2ps2phx\s+0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 15 50 67 31\s+vcvt2ps2phx\s+\(%r9\)\{1to16\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 15 40 67 71 7f\s+vcvt2ps2phx\s+0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 15 57 67 72 80\s+vcvt2ps2phx\s+-0x200\(%rdx\)\{1to16\},%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 02 14 40 74 f4\s+vcvtbiasph2bf8\s+%zmm28,%zmm29,%ymm30
\s*[a-f0-9]+:\s*62 22 14 47 74 b4 f5 00 00 00 10\s+vcvtbiasph2bf8\s+0x10000000\(%rbp,%r14,8\),%zmm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 14 50 74 31\s+vcvtbiasph2bf8\s+\(%r9\)\{1to32\},%zmm29,%ymm30
\s*[a-f0-9]+:\s*62 62 14 40 74 71 7f\s+vcvtbiasph2bf8\s+0x1fc0\(%rcx\),%zmm29,%ymm30
\s*[a-f0-9]+:\s*62 62 14 d7 74 72 80\s+vcvtbiasph2bf8\s+-0x100\(%rdx\)\{1to32\},%zmm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 17 40 74 f4\s+vcvt2ph2bf8\s+%zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 22 17 47 74 b4 f5 00 00 00 10\s+vcvt2ph2bf8\s+0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 17 50 74 31\s+vcvt2ph2bf8\s+\(%r9\)\{1to32\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 17 40 74 71 7f\s+vcvt2ph2bf8\s+0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 17 57 74 72 80\s+vcvt2ph2bf8\s+-0x100\(%rdx\)\{1to32\},%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 02 7e 48 74 f5\s+vcvtph2bf8\s+%zmm29,%ymm30
\s*[a-f0-9]+:\s*62 22 7e 4f 74 b4 f5 00 00 00 10\s+vcvtph2bf8\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 7e 58 74 31\s+vcvtph2bf8\s+\(%r9\)\{1to32\},%ymm30
\s*[a-f0-9]+:\s*62 62 7e 48 74 71 7f\s+vcvtph2bf8\s+0x1fc0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 62 7e df 74 72 80\s+vcvtph2bf8\s+-0x100\(%rdx\)\{1to32\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 14 40 74 f4\s+vcvtbiasph2bf8s\s+%zmm28,%zmm29,%ymm30
\s*[a-f0-9]+:\s*62 25 14 47 74 b4 f5 00 00 00 10\s+vcvtbiasph2bf8s\s+0x10000000\(%rbp,%r14,8\),%zmm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 14 50 74 31\s+vcvtbiasph2bf8s\s+\(%r9\)\{1to32\},%zmm29,%ymm30
\s*[a-f0-9]+:\s*62 65 14 40 74 71 7f\s+vcvtbiasph2bf8s\s+0x1fc0\(%rcx\),%zmm29,%ymm30
\s*[a-f0-9]+:\s*62 65 14 d7 74 72 80\s+vcvtbiasph2bf8s\s+-0x100\(%rdx\)\{1to32\},%zmm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 17 40 74 f4\s+vcvt2ph2bf8s\s+%zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 25 17 47 74 b4 f5 00 00 00 10\s+vcvt2ph2bf8s\s+0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 17 50 74 31\s+vcvt2ph2bf8s\s+\(%r9\)\{1to32\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 65 17 40 74 71 7f\s+vcvt2ph2bf8s\s+0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 65 17 57 74 72 80\s+vcvt2ph2bf8s\s+-0x100\(%rdx\)\{1to32\},%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 05 7e 48 74 f5\s+vcvtph2bf8s\s+%zmm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7e 4f 74 b4 f5 00 00 00 10\s+vcvtph2bf8s\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7e 58 74 31\s+vcvtph2bf8s\s+\(%r9\)\{1to32\},%ymm30
\s*[a-f0-9]+:\s*62 65 7e 48 74 71 7f\s+vcvtph2bf8s\s+0x1fc0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7e df 74 72 80\s+vcvtph2bf8s\s+-0x100\(%rdx\)\{1to32\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 14 40 18 f4\s+vcvtbiasph2hf8\s+%zmm28,%zmm29,%ymm30
\s*[a-f0-9]+:\s*62 25 14 47 18 b4 f5 00 00 00 10\s+vcvtbiasph2hf8\s+0x10000000\(%rbp,%r14,8\),%zmm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 14 50 18 31\s+vcvtbiasph2hf8\s+\(%r9\)\{1to32\},%zmm29,%ymm30
\s*[a-f0-9]+:\s*62 65 14 40 18 71 7f\s+vcvtbiasph2hf8\s+0x1fc0\(%rcx\),%zmm29,%ymm30
\s*[a-f0-9]+:\s*62 65 14 d7 18 72 80\s+vcvtbiasph2hf8\s+-0x100\(%rdx\)\{1to32\},%zmm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 17 40 18 f4\s+vcvt2ph2hf8\s+%zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 25 17 47 18 b4 f5 00 00 00 10\s+vcvt2ph2hf8\s+0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 17 50 18 31\s+vcvt2ph2hf8\s+\(%r9\)\{1to32\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 65 17 40 18 71 7f\s+vcvt2ph2hf8\s+0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 65 17 57 18 72 80\s+vcvt2ph2hf8\s+-0x100\(%rdx\)\{1to32\},%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 05 7e 48 18 f5\s+vcvtph2hf8\s+%zmm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7e 4f 18 b4 f5 00 00 00 10\s+vcvtph2hf8\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7e 58 18 31\s+vcvtph2hf8\s+\(%r9\)\{1to32\},%ymm30
\s*[a-f0-9]+:\s*62 65 7e 48 18 71 7f\s+vcvtph2hf8\s+0x1fc0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7e df 18 72 80\s+vcvtph2hf8\s+-0x100\(%rdx\)\{1to32\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 14 40 1b f4\s+vcvtbiasph2hf8s\s+%zmm28,%zmm29,%ymm30
\s*[a-f0-9]+:\s*62 25 14 47 1b b4 f5 00 00 00 10\s+vcvtbiasph2hf8s\s+0x10000000\(%rbp,%r14,8\),%zmm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 14 50 1b 31\s+vcvtbiasph2hf8s\s+\(%r9\)\{1to32\},%zmm29,%ymm30
\s*[a-f0-9]+:\s*62 65 14 40 1b 71 7f\s+vcvtbiasph2hf8s\s+0x1fc0\(%rcx\),%zmm29,%ymm30
\s*[a-f0-9]+:\s*62 65 14 d7 1b 72 80\s+vcvtbiasph2hf8s\s+-0x100\(%rdx\)\{1to32\},%zmm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 17 40 1b f4\s+vcvt2ph2hf8s\s+%zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 25 17 47 1b b4 f5 00 00 00 10\s+vcvt2ph2hf8s\s+0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 17 50 1b 31\s+vcvt2ph2hf8s\s+\(%r9\)\{1to32\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 65 17 40 1b 71 7f\s+vcvt2ph2hf8s\s+0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 65 17 57 1b 72 80\s+vcvt2ph2hf8s\s+-0x100\(%rdx\)\{1to32\},%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 05 7e 48 1b f5\s+vcvtph2hf8s\s+%zmm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7e 4f 1b b4 f5 00 00 00 10\s+vcvtph2hf8s\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7e 58 1b 31\s+vcvtph2hf8s\s+\(%r9\)\{1to32\},%ymm30
\s*[a-f0-9]+:\s*62 65 7e 48 1b 71 7f\s+vcvtph2hf8s\s+0x1fc0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7e df 1b 72 80\s+vcvtph2hf8s\s+-0x100\(%rdx\)\{1to32\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 7f 48 1e f5\s+vcvthf82ph\s+%ymm29,%zmm30
\s*[a-f0-9]+:\s*62 25 7f 4f 1e b4 f5 00 00 00 10\s+vcvthf82ph\s+0x10000000\(%rbp,%r14,8\),%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7f 48 1e 31\s+vcvthf82ph\s+\(%r9\),%zmm30
\s*[a-f0-9]+:\s*62 65 7f 48 1e 71 7f\s+vcvthf82ph\s+0xfe0\(%rcx\),%zmm30
\s*[a-f0-9]+:\s*62 65 7f cf 1e 72 80\s+vcvthf82ph\s+-0x1000\(%rdx\),%zmm30\{%k7\}\{z\}
#pass

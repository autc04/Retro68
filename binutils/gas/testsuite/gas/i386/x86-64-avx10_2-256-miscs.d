#objdump: -dw
#name: x86_64 AVX10.2/256 minmax, vector copy and compare insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 03 17 00 52 f4 7b\s+vminmaxbf16\s\$0x7b,%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 03 17 20 52 f4 7b\s+vminmaxbf16\s\$0x7b,%ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 23 17 27 52 b4 f5 00 00 00 10 7b\s+vminmaxbf16\s\$0x7b,0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 63 17 20 52 71 7f 7b\s+vminmaxbf16\s\$0x7b,0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 23 17 07 52 b4 f5 00 00 00 10 7b\s+vminmaxbf16\s\$0x7b,0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 63 17 00 52 71 7f 7b\s+vminmaxbf16\s\$0x7b,0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 03 95 00 52 f4 7b\s+vminmaxpd\s\$0x7b,%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 03 95 20 52 f4 7b\s+vminmaxpd\s\$0x7b,%ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 23 95 27 52 b4 f5 00 00 00 10 7b\s+vminmaxpd\s\$0x7b,0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 63 95 20 52 71 7f 7b\s+vminmaxpd\s\$0x7b,0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 23 95 07 52 b4 f5 00 00 00 10 7b\s+vminmaxpd\s\$0x7b,0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 63 95 00 52 71 7f 7b\s+vminmaxpd\s\$0x7b,0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 03 14 00 52 f4 7b\s+vminmaxph\s\$0x7b,%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 03 14 20 52 f4 7b\s+vminmaxph\s\$0x7b,%ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 23 14 27 52 b4 f5 00 00 00 10 7b\s+vminmaxph\s\$0x7b,0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 63 14 20 52 71 7f 7b\s+vminmaxph\s\$0x7b,0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 23 14 07 52 b4 f5 00 00 00 10 7b\s+vminmaxph\s\$0x7b,0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 63 14 00 52 71 7f 7b\s+vminmaxph\s\$0x7b,0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 03 15 00 52 f4 7b\s+vminmaxps\s\$0x7b,%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 03 15 20 52 f4 7b\s+vminmaxps\s\$0x7b,%ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 23 15 27 52 b4 f5 00 00 00 10 7b\s+vminmaxps\s\$0x7b,0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 63 15 20 52 71 7f 7b\s+vminmaxps\s\$0x7b,0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 23 15 07 52 b4 f5 00 00 00 10 7b\s+vminmaxps\s\$0x7b,0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 63 15 00 52 71 7f 7b\s+vminmaxps\s\$0x7b,0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 43 17 30 52 31 7b\s+vminmaxbf16\s\$0x7b,\(%r9\)\{1to16\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 63 17 b7 52 72 80 7b\s+vminmaxbf16\s\$0x7b,-0x100\(%rdx\)\{1to16\},%ymm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 43 17 10 52 31 7b\s+vminmaxbf16\s\$0x7b,\(%r9\)\{1to8\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 63 17 97 52 72 80 7b\s+vminmaxbf16\s\$0x7b,-0x100\(%rdx\)\{1to8\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 43 95 30 52 31 7b\s+vminmaxpd\s\$0x7b,\(%r9\)\{1to4\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 63 95 b7 52 72 80 7b\s+vminmaxpd\s\$0x7b,-0x400\(%rdx\)\{1to4\},%ymm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 43 95 10 52 31 7b\s+vminmaxpd\s\$0x7b,\(%r9\)\{1to2\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 63 95 97 52 72 80 7b\s+vminmaxpd\s\$0x7b,-0x400\(%rdx\)\{1to2\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 43 14 30 52 31 7b\s+vminmaxph\s\$0x7b,\(%r9\)\{1to16\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 63 14 b7 52 72 80 7b\s+vminmaxph\s\$0x7b,-0x100\(%rdx\)\{1to16\},%ymm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 43 14 10 52 31 7b\s+vminmaxph\s\$0x7b,\(%r9\)\{1to8\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 63 14 97 52 72 80 7b\s+vminmaxph\s\$0x7b,-0x100\(%rdx\)\{1to8\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 43 15 30 52 31 7b\s+vminmaxps\s\$0x7b,\(%r9\)\{1to8\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 63 15 b7 52 72 80 7b\s+vminmaxps\s\$0x7b,-0x200\(%rdx\)\{1to8\},%ymm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 43 15 10 52 31 7b\s+vminmaxps\s\$0x7b,\(%r9\)\{1to4\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 63 15 97 52 72 80 7b\s+vminmaxps\s\$0x7b,-0x200\(%rdx\)\{1to4\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 03 95 00 53 f4 7b\s+vminmaxsd\s\$0x7b,%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 03 95 10 53 f4 7b\s+vminmaxsd\s\$0x7b,\{sae\},%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 23 95 07 53 b4 f5 00 00 00 10 7b\s+vminmaxsd\s\$0x7b,0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 43 95 00 53 31 7b\s+vminmaxsd\s\$0x7b,\(%r9\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 03 14 00 53 f4 7b\s+vminmaxsh\s\$0x7b,%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 03 14 10 53 f4 7b\s+vminmaxsh\s\$0x7b,\{sae\},%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 23 14 07 53 b4 f5 00 00 00 10 7b\s+vminmaxsh\s\$0x7b,0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 43 14 00 53 31 7b\s+vminmaxsh\s\$0x7b,\(%r9\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 03 15 00 53 f4 7b\s+vminmaxss\s\$0x7b,%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 03 15 10 53 f4 7b\s+vminmaxss\s\$0x7b,\{sae\},%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 23 15 07 53 b4 f5 00 00 00 10 7b\s+vminmaxss\s\$0x7b,0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 43 15 00 53 31 7b\s+vminmaxss\s\$0x7b,\(%r9\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 63 95 00 53 71 7f 7b\s+vminmaxsd\s\$0x7b,0x3f8\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 63 95 87 53 72 80 7b\s+vminmaxsd\s\$0x7b,-0x400\(%rdx\),%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 63 14 00 53 71 7f 7b\s+vminmaxsh\s\$0x7b,0xfe\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 63 14 87 53 72 80 7b\s+vminmaxsh\s\$0x7b,-0x100\(%rdx\),%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 63 15 00 53 71 7f 7b\s+vminmaxss\s\$0x7b,0x1fc\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 63 15 87 53 72 80 7b\s+vminmaxss\s\$0x7b,-0x200\(%rdx\),%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 01 7e 08 7e f5\s+vmovd  %xmm29,%xmm30
\s*[a-f0-9]+:\s*62 01 7d 08 d6 ee\s+vmovd  %xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7e 08 6e f5\s+vmovw  %xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7e 08 7e ee\s+vmovw  %xmm29,%xmm30
\s*[a-f0-9]+:\s*62 01 ff 08 2f f5\s+vcomxsd %xmm29,%xmm30
\s*[a-f0-9]+:\s*62 01 ff 18 2f f5\s+vcomxsd \{sae\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 21 ff 08 2f b4 f5 00 00 00 10\s+vcomxsd 0x10000000\(%rbp,%r14,8\),%xmm30
\s*[a-f0-9]+:\s*62 41 ff 08 2f 31\s+vcomxsd \(%r9\),%xmm30
\s*[a-f0-9]+:\s*62 05 7e 08 2f f5\s+vcomxsh %xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7e 18 2f f5\s+vcomxsh \{sae\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 25 7e 08 2f b4 f5 00 00 00 10\s+vcomxsh 0x10000000\(%rbp,%r14,8\),%xmm30
\s*[a-f0-9]+:\s*62 45 7e 08 2f 31\s+vcomxsh \(%r9\),%xmm30
\s*[a-f0-9]+:\s*62 01 7e 08 2f f5\s+vcomxss %xmm29,%xmm30
\s*[a-f0-9]+:\s*62 01 7e 18 2f f5\s+vcomxss \{sae\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 21 7e 08 2f b4 f5 00 00 00 10\s+vcomxss 0x10000000\(%rbp,%r14,8\),%xmm30
\s*[a-f0-9]+:\s*62 41 7e 08 2f 31\s+vcomxss \(%r9\),%xmm30
\s*[a-f0-9]+:\s*62 61 ff 08 2f 71 7f\s+vcomxsd 0x3f8\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 61 ff 08 2f 72 80\s+vcomxsd -0x400\(%rdx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7e 08 2f 71 7f\s+vcomxsh 0xfe\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7e 08 2f 72 80\s+vcomxsh -0x100\(%rdx\),%xmm30
\s*[a-f0-9]+:\s*62 61 7e 08 2f 71 7f\s+vcomxss 0x1fc\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 61 7e 08 2f 72 80\s+vcomxss -0x200\(%rdx\),%xmm30
\s*[a-f0-9]+:\s*62 01 ff 08 2e f5\s+vucomxsd %xmm29,%xmm30
\s*[a-f0-9]+:\s*62 01 ff 18 2e f5\s+vucomxsd \{sae\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 21 ff 08 2e b4 f5 00 00 00 10\s+vucomxsd 0x10000000\(%rbp,%r14,8\),%xmm30
\s*[a-f0-9]+:\s*62 41 ff 08 2e 31\s+vucomxsd \(%r9\),%xmm30
\s*[a-f0-9]+:\s*62 05 7e 08 2e f5\s+vucomxsh %xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7e 18 2e f5\s+vucomxsh \{sae\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 25 7e 08 2e b4 f5 00 00 00 10\s+vucomxsh 0x10000000\(%rbp,%r14,8\),%xmm30
\s*[a-f0-9]+:\s*62 45 7e 08 2e 31\s+vucomxsh \(%r9\),%xmm30
\s*[a-f0-9]+:\s*62 01 7e 08 2e f5\s+vucomxss %xmm29,%xmm30
\s*[a-f0-9]+:\s*62 01 7e 18 2e f5\s+vucomxss \{sae\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 21 7e 08 2e b4 f5 00 00 00 10\s+vucomxss 0x10000000\(%rbp,%r14,8\),%xmm30
\s*[a-f0-9]+:\s*62 41 7e 08 2e 31\s+vucomxss \(%r9\),%xmm30
\s*[a-f0-9]+:\s*62 61 ff 08 2e 71 7f\s+vucomxsd 0x3f8\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 61 ff 08 2e 72 80\s+vucomxsd -0x400\(%rdx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7e 08 2e 71 7f\s+vucomxsh 0xfe\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7e 08 2e 72 80\s+vucomxsh -0x100\(%rdx\),%xmm30
\s*[a-f0-9]+:\s*62 61 7e 08 2e 71 7f\s+vucomxss 0x1fc\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 61 7e 08 2e 72 80\s+vucomxss -0x200\(%rdx\),%xmm30
#pass

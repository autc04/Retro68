#objdump: -dw
#name: x86_64 AVX10.2/512 minmax insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 03 17 40 52 f4 7b\s+vminmaxbf16\s\$0x7b,%zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 23 17 47 52 b4 f5 00 00 00 10 7b\s+vminmaxbf16\s\$0x7b,0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 63 17 40 52 71 7f 7b\s+vminmaxbf16\s\$0x7b,0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 03 95 40 52 f4 7b\s+vminmaxpd\s\$0x7b,%zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 23 95 47 52 b4 f5 00 00 00 10 7b\s+vminmaxpd\s\$0x7b,0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 63 95 40 52 71 7f 7b\s+vminmaxpd\s\$0x7b,0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 03 14 40 52 f4 7b\s+vminmaxph\s\$0x7b,%zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 23 14 47 52 b4 f5 00 00 00 10 7b\s+vminmaxph\s\$0x7b,0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 63 14 40 52 71 7f 7b\s+vminmaxph\s\$0x7b,0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 03 15 40 52 f4 7b\s+vminmaxps\s\$0x7b,%zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 23 15 47 52 b4 f5 00 00 00 10 7b\s+vminmaxps\s\$0x7b,0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 63 15 40 52 71 7f 7b\s+vminmaxps\s\$0x7b,0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 43 17 50 52 31 7b\s+vminmaxbf16\s\$0x7b,\(%r9\)\{1to32\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 63 17 d7 52 72 80 7b\s+vminmaxbf16\s\$0x7b,-0x100\(%rdx\)\{1to32\},%zmm29,%zmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 03 95 10 52 f4 7b\s+vminmaxpd\s\$0x7b,\{sae\},%zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 43 95 50 52 31 7b\s+vminmaxpd\s\$0x7b,\(%r9\)\{1to8\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 63 95 d7 52 72 80 7b\s+vminmaxpd\s\$0x7b,-0x400\(%rdx\)\{1to8\},%zmm29,%zmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 03 14 10 52 f4 7b\s+vminmaxph\s\$0x7b,\{sae\},%zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 43 14 50 52 31 7b\s+vminmaxph\s\$0x7b,\(%r9\)\{1to32\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 63 14 d7 52 72 80 7b\s+vminmaxph\s\$0x7b,-0x100\(%rdx\)\{1to32\},%zmm29,%zmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 03 15 10 52 f4 7b\s+vminmaxps\s\$0x7b,\{sae\},%zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 43 15 50 52 31 7b\s+vminmaxps\s\$0x7b,\(%r9\)\{1to16\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 63 15 d7 52 72 80 7b\s+vminmaxps\s\$0x7b,-0x200\(%rdx\)\{1to16\},%zmm29,%zmm30\{%k7\}\{z\}
#pass

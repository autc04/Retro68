#objdump: -dw
#name: i386 AVX10.2/512 minmax insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 f3 57 48 52 f4 7b\s+vminmaxbf16\s\$0x7b,%zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f3 57 4f 52 b4 f4 00 00 00 10 7b\s+vminmaxbf16\s\$0x7b,0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 57 48 52 71 7f 7b\s+vminmaxbf16\s\$0x7b,0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f3 d5 48 52 f4 7b\s+vminmaxpd\s\$0x7b,%zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f3 d5 4f 52 b4 f4 00 00 00 10 7b\s+vminmaxpd\s\$0x7b,0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 d5 48 52 71 7f 7b\s+vminmaxpd\s\$0x7b,0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f3 54 48 52 f4 7b\s+vminmaxph\s\$0x7b,%zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f3 54 4f 52 b4 f4 00 00 00 10 7b\s+vminmaxph\s\$0x7b,0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 54 48 52 71 7f 7b\s+vminmaxph\s\$0x7b,0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f3 55 48 52 f4 7b\s+vminmaxps\s\$0x7b,%zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f3 55 4f 52 b4 f4 00 00 00 10 7b\s+vminmaxps\s\$0x7b,0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 55 48 52 71 7f 7b\s+vminmaxps\s\$0x7b,0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f3 57 58 52 31 7b\s+vminmaxbf16\s\$0x7b,\(%ecx\)\{1to32\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f3 57 df 52 72 80 7b\s+vminmaxbf16\s\$0x7b,-0x100\(%edx\)\{1to32\},%zmm5,%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 d5 18 52 f4 7b\s+vminmaxpd\s\$0x7b,\{sae\},%zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f3 d5 58 52 31 7b\s+vminmaxpd\s\$0x7b,\(%ecx\)\{1to8\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f3 d5 df 52 72 80 7b\s+vminmaxpd\s\$0x7b,-0x400\(%edx\)\{1to8\},%zmm5,%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 54 18 52 f4 7b\s+vminmaxph\s\$0x7b,\{sae\},%zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f3 54 58 52 31 7b\s+vminmaxph\s\$0x7b,\(%ecx\)\{1to32\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f3 54 df 52 72 80 7b\s+vminmaxph\s\$0x7b,-0x100\(%edx\)\{1to32\},%zmm5,%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 55 18 52 f4 7b\s+vminmaxps\s\$0x7b,\{sae\},%zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f3 55 58 52 31 7b\s+vminmaxps\s\$0x7b,\(%ecx\)\{1to16\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f3 55 df 52 72 80 7b\s+vminmaxps\s\$0x7b,-0x200\(%edx\)\{1to16\},%zmm5,%zmm6\{%k7\}\{z\}
#pass

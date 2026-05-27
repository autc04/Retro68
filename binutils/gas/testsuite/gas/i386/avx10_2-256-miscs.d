#objdump: -dw
#name: i386 AVX10.2/256 minmax, vector copy and compare insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 f3 57 08 52 f4 7b\s+vminmaxbf16\s\$0x7b,%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 57 28 52 f4 7b\s+vminmaxbf16\s\$0x7b,%ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f3 57 2f 52 b4 f4 00 00 00 10 7b\s+vminmaxbf16\s\$0x7b,0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 57 28 52 71 7f 7b\s+vminmaxbf16\s\$0x7b,0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f3 57 0f 52 b4 f4 00 00 00 10 7b\s+vminmaxbf16\s\$0x7b,0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 57 08 52 71 7f 7b\s+vminmaxbf16\s\$0x7b,0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 d5 08 52 f4 7b\s+vminmaxpd\s\$0x7b,%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 d5 28 52 f4 7b\s+vminmaxpd\s\$0x7b,%ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f3 d5 2f 52 b4 f4 00 00 00 10 7b\s+vminmaxpd\s\$0x7b,0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 d5 28 52 71 7f 7b\s+vminmaxpd\s\$0x7b,0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f3 d5 0f 52 b4 f4 00 00 00 10 7b\s+vminmaxpd\s\$0x7b,0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 d5 08 52 71 7f 7b\s+vminmaxpd\s\$0x7b,0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 54 08 52 f4 7b\s+vminmaxph\s\$0x7b,%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 54 28 52 f4 7b\s+vminmaxph\s\$0x7b,%ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f3 54 2f 52 b4 f4 00 00 00 10 7b\s+vminmaxph\s\$0x7b,0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 54 28 52 71 7f 7b\s+vminmaxph\s\$0x7b,0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f3 54 0f 52 b4 f4 00 00 00 10 7b\s+vminmaxph\s\$0x7b,0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 54 08 52 71 7f 7b\s+vminmaxph\s\$0x7b,0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 55 08 52 f4 7b\s+vminmaxps\s\$0x7b,%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 55 28 52 f4 7b\s+vminmaxps\s\$0x7b,%ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f3 55 2f 52 b4 f4 00 00 00 10 7b\s+vminmaxps\s\$0x7b,0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 55 28 52 71 7f 7b\s+vminmaxps\s\$0x7b,0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f3 55 0f 52 b4 f4 00 00 00 10 7b\s+vminmaxps\s\$0x7b,0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 55 08 52 71 7f 7b\s+vminmaxps\s\$0x7b,0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 57 38 52 31 7b\s+vminmaxbf16\s\$0x7b,\(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f3 57 bf 52 72 80 7b\s+vminmaxbf16\s\$0x7b,-0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 57 18 52 31 7b\s+vminmaxbf16\s\$0x7b,\(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 57 9f 52 72 80 7b\s+vminmaxbf16\s\$0x7b,-0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 d5 38 52 31 7b\s+vminmaxpd\s\$0x7b,\(%ecx\)\{1to4\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f3 d5 bf 52 72 80 7b\s+vminmaxpd\s\$0x7b,-0x400\(%edx\)\{1to4\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 d5 18 52 31 7b\s+vminmaxpd\s\$0x7b,\(%ecx\)\{1to2\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 d5 9f 52 72 80 7b\s+vminmaxpd\s\$0x7b,-0x400\(%edx\)\{1to2\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 54 38 52 31 7b\s+vminmaxph\s\$0x7b,\(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f3 54 bf 52 72 80 7b\s+vminmaxph\s\$0x7b,-0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 54 18 52 31 7b\s+vminmaxph\s\$0x7b,\(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 54 9f 52 72 80 7b\s+vminmaxph\s\$0x7b,-0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 55 38 52 31 7b\s+vminmaxps\s\$0x7b,\(%ecx\)\{1to8\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f3 55 bf 52 72 80 7b\s+vminmaxps\s\$0x7b,-0x200\(%edx\)\{1to8\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 55 18 52 31 7b\s+vminmaxps\s\$0x7b,\(%ecx\)\{1to4\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 55 9f 52 72 80 7b\s+vminmaxps\s\$0x7b,-0x200\(%edx\)\{1to4\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 d5 08 53 f4 7b\s+vminmaxsd\s\$0x7b,%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 d5 18 53 f4 7b\s+vminmaxsd\s\$0x7b,\{sae\},%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 d5 0f 53 b4 f4 00 00 00 10 7b\s+vminmaxsd\s\$0x7b,0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 d5 08 53 31 7b\s+vminmaxsd\s\$0x7b,\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 54 08 53 f4 7b\s+vminmaxsh\s\$0x7b,%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 54 18 53 f4 7b\s+vminmaxsh\s\$0x7b,\{sae\},%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 54 0f 53 b4 f4 00 00 00 10 7b\s+vminmaxsh\s\$0x7b,0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 54 08 53 31 7b\s+vminmaxsh\s\$0x7b,\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 55 08 53 f4 7b\s+vminmaxss\s\$0x7b,%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 55 18 53 f4 7b\s+vminmaxss\s\$0x7b,\{sae\},%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 55 0f 53 b4 f4 00 00 00 10 7b\s+vminmaxss\s\$0x7b,0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 55 08 53 31 7b\s+vminmaxss\s\$0x7b,\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 d5 08 53 71 7f 7b\s+vminmaxsd\s\$0x7b,0x3f8\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 d5 8f 53 72 80 7b\s+vminmaxsd\s\$0x7b,-0x400\(%edx\),%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 54 08 53 71 7f 7b\s+vminmaxsh\s\$0x7b,0xfe\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 54 8f 53 72 80 7b\s+vminmaxsh\s\$0x7b,-0x100\(%edx\),%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 55 08 53 71 7f 7b\s+vminmaxss\s\$0x7b,0x1fc\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 55 8f 53 72 80 7b\s+vminmaxss\s\$0x7b,-0x200\(%edx\),%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f1 7e 08 7e f5\s+vmovd  %xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f1 7d 08 d6 ee\s+vmovd  %xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 08 6e f5\s+vmovw  %xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 08 7e ee\s+vmovw  %xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f1 ff 08 2f f5\s+vcomxsd %xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f1 ff 18 2f f5\s+vcomxsd \{sae\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f1 ff 08 2f b4 f4 00 00 00 10\s+vcomxsd 0x10000000\(%esp,%esi,8\),%xmm6
\s*[a-f0-9]+:\s*62 f1 ff 08 2f 31\s+vcomxsd \(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 08 2f f5\s+vcomxsh %xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 18 2f f5\s+vcomxsh \{sae\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 08 2f b4 f4 00 00 00 10\s+vcomxsh 0x10000000\(%esp,%esi,8\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 08 2f 31\s+vcomxsh \(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f1 7e 08 2f f5\s+vcomxss %xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f1 7e 18 2f f5\s+vcomxss \{sae\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f1 7e 08 2f b4 f4 00 00 00 10\s+vcomxss 0x10000000\(%esp,%esi,8\),%xmm6
\s*[a-f0-9]+:\s*62 f1 7e 08 2f 31\s+vcomxss \(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f1 ff 08 2f 71 7f\s+vcomxsd 0x3f8\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f1 ff 08 2f 72 80\s+vcomxsd -0x400\(%edx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 08 2f 71 7f\s+vcomxsh 0xfe\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 08 2f 72 80\s+vcomxsh -0x100\(%edx\),%xmm6
\s*[a-f0-9]+:\s*62 f1 7e 08 2f 71 7f\s+vcomxss 0x1fc\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f1 7e 08 2f 72 80\s+vcomxss -0x200\(%edx\),%xmm6
\s*[a-f0-9]+:\s*62 f1 ff 08 2e f5\s+vucomxsd %xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f1 ff 18 2e f5\s+vucomxsd \{sae\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f1 ff 08 2e b4 f4 00 00 00 10\s+vucomxsd 0x10000000\(%esp,%esi,8\),%xmm6
\s*[a-f0-9]+:\s*62 f1 ff 08 2e 31\s+vucomxsd \(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 08 2e f5\s+vucomxsh %xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 18 2e f5\s+vucomxsh \{sae\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 08 2e b4 f4 00 00 00 10\s+vucomxsh 0x10000000\(%esp,%esi,8\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 08 2e 31\s+vucomxsh \(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f1 7e 08 2e f5\s+vucomxss %xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f1 7e 18 2e f5\s+vucomxss \{sae\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f1 7e 08 2e b4 f4 00 00 00 10\s+vucomxss 0x10000000\(%esp,%esi,8\),%xmm6
\s*[a-f0-9]+:\s*62 f1 7e 08 2e 31\s+vucomxss \(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f1 ff 08 2e 71 7f\s+vucomxsd 0x3f8\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f1 ff 08 2e 72 80\s+vucomxsd -0x400\(%edx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 08 2e 71 7f\s+vucomxsh 0xfe\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7e 08 2e 72 80\s+vucomxsh -0x100\(%edx\),%xmm6
\s*[a-f0-9]+:\s*62 f1 7e 08 2e 71 7f\s+vucomxss 0x1fc\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f1 7e 08 2e 72 80\s+vucomxss -0x200\(%edx\),%xmm6
#pass

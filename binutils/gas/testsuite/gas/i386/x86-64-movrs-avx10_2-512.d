#objdump: -dw
#name: x86_64 MOVRS, AVX10.2/512 insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 25 7f 4f 6f b4 f5 00 00 00 10\s+vmovrsb 0x10000000\(%rbp,%r14,8\),%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7f 48 6f 31\s+vmovrsb \(%r9\),%zmm30
\s*[a-f0-9]+:\s*62 65 7f 48 6f 71 7f\s+vmovrsb 0x1fc0\(%rcx\),%zmm30
\s*[a-f0-9]+:\s*62 65 7f cf 6f 72 80\s+vmovrsb -0x2000\(%rdx\),%zmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 7e 4f 6f b4 f5 00 00 00 10\s+vmovrsd 0x10000000\(%rbp,%r14,8\),%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7e 48 6f 31\s+vmovrsd \(%r9\),%zmm30
\s*[a-f0-9]+:\s*62 65 7e 48 6f 71 7f\s+vmovrsd 0x1fc0\(%rcx\),%zmm30
\s*[a-f0-9]+:\s*62 65 7e cf 6f 72 80\s+vmovrsd -0x2000\(%rdx\),%zmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 fe 4f 6f b4 f5 00 00 00 10\s+vmovrsq 0x10000000\(%rbp,%r14,8\),%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 fe 48 6f 31\s+vmovrsq \(%r9\),%zmm30
\s*[a-f0-9]+:\s*62 65 fe 48 6f 71 7f\s+vmovrsq 0x1fc0\(%rcx\),%zmm30
\s*[a-f0-9]+:\s*62 65 fe cf 6f 72 80\s+vmovrsq -0x2000\(%rdx\),%zmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 ff 4f 6f b4 f5 00 00 00 10\s+vmovrsw 0x10000000\(%rbp,%r14,8\),%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 ff 48 6f 31\s+vmovrsw \(%r9\),%zmm30
\s*[a-f0-9]+:\s*62 65 ff 48 6f 71 7f\s+vmovrsw 0x1fc0\(%rcx\),%zmm30
\s*[a-f0-9]+:\s*62 65 ff cf 6f 72 80\s+vmovrsw -0x2000\(%rdx\),%zmm30\{%k7\}\{z\}
#pass

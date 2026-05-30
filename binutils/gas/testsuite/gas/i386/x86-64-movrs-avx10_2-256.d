#objdump: -dw
#name: x86_64 MOVRS, AVX10.2/256 insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 25 7f 0f 6f b4 f5 00 00 00 10\s+vmovrsb 0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7f 08 6f 31\s+vmovrsb \(%r9\),%xmm30
\s*[a-f0-9]+:\s*62 65 7f 08 6f 71 7f\s+vmovrsb 0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7f 8f 6f 72 80\s+vmovrsb -0x800\(%rdx\),%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 7e 0f 6f b4 f5 00 00 00 10\s+vmovrsd 0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7e 08 6f 31\s+vmovrsd \(%r9\),%xmm30
\s*[a-f0-9]+:\s*62 65 7e 08 6f 71 7f\s+vmovrsd 0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7e 8f 6f 72 80\s+vmovrsd -0x800\(%rdx\),%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 fe 0f 6f b4 f5 00 00 00 10\s+vmovrsq 0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 fe 08 6f 31\s+vmovrsq \(%r9\),%xmm30
\s*[a-f0-9]+:\s*62 65 fe 08 6f 71 7f\s+vmovrsq 0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 fe 8f 6f 72 80\s+vmovrsq -0x800\(%rdx\),%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 ff 0f 6f b4 f5 00 00 00 10\s+vmovrsw 0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 ff 08 6f 31\s+vmovrsw \(%r9\),%xmm30
\s*[a-f0-9]+:\s*62 65 ff 08 6f 71 7f\s+vmovrsw 0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 ff 8f 6f 72 80\s+vmovrsw -0x800\(%rdx\),%xmm30\{%k7\}\{z\}
#pass

#objdump: -dw
#name: x86_64 AVX10.2/512 media insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 02 17 40 50 f4\s+vpdpbssd %zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 22 17 47 50 b4 f5 00 00 00 10\s+vpdpbssd 0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 17 50 50 31\s+vpdpbssd \(%r9\)\{1to16\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 17 40 50 71 7f\s+vpdpbssd 0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 17 d7 50 72 80\s+vpdpbssd -0x200\(%rdx\)\{1to16\},%zmm29,%zmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 17 40 51 f4\s+vpdpbssds %zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 22 17 47 51 b4 f5 00 00 00 10\s+vpdpbssds 0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 17 50 51 31\s+vpdpbssds \(%r9\)\{1to16\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 17 40 51 71 7f\s+vpdpbssds 0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 17 d7 51 72 80\s+vpdpbssds -0x200\(%rdx\)\{1to16\},%zmm29,%zmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 16 40 50 f4\s+vpdpbsud %zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 22 16 47 50 b4 f5 00 00 00 10\s+vpdpbsud 0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 16 50 50 31\s+vpdpbsud \(%r9\)\{1to16\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 16 40 50 71 7f\s+vpdpbsud 0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 16 d7 50 72 80\s+vpdpbsud -0x200\(%rdx\)\{1to16\},%zmm29,%zmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 16 40 51 f4\s+vpdpbsuds %zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 22 16 47 51 b4 f5 00 00 00 10\s+vpdpbsuds 0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 16 50 51 31\s+vpdpbsuds \(%r9\)\{1to16\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 16 40 51 71 7f\s+vpdpbsuds 0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 16 d7 51 72 80\s+vpdpbsuds -0x200\(%rdx\)\{1to16\},%zmm29,%zmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 14 40 50 f4\s+vpdpbuud %zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 22 14 47 50 b4 f5 00 00 00 10\s+vpdpbuud 0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 14 50 50 31\s+vpdpbuud \(%r9\)\{1to16\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 14 40 50 71 7f\s+vpdpbuud 0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 14 d7 50 72 80\s+vpdpbuud -0x200\(%rdx\)\{1to16\},%zmm29,%zmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 14 40 51 f4\s+vpdpbuuds %zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 22 14 47 51 b4 f5 00 00 00 10\s+vpdpbuuds 0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 14 50 51 31\s+vpdpbuuds \(%r9\)\{1to16\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 14 40 51 71 7f\s+vpdpbuuds 0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 14 d7 51 72 80\s+vpdpbuuds -0x200\(%rdx\)\{1to16\},%zmm29,%zmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 16 40 d2 f4\s+vpdpwsud %zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 22 16 47 d2 b4 f5 00 00 00 10\s+vpdpwsud 0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 16 50 d2 31\s+vpdpwsud \(%r9\)\{1to16\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 16 40 d2 71 7f\s+vpdpwsud 0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 16 d7 d2 72 80\s+vpdpwsud -0x200\(%rdx\)\{1to16\},%zmm29,%zmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 16 40 d3 f4\s+vpdpwsuds %zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 22 16 47 d3 b4 f5 00 00 00 10\s+vpdpwsuds 0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 16 50 d3 31\s+vpdpwsuds \(%r9\)\{1to16\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 16 40 d3 71 7f\s+vpdpwsuds 0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 16 d7 d3 72 80\s+vpdpwsuds -0x200\(%rdx\)\{1to16\},%zmm29,%zmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 15 40 d2 f4\s+vpdpwusd %zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 22 15 47 d2 b4 f5 00 00 00 10\s+vpdpwusd 0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 15 50 d2 31\s+vpdpwusd \(%r9\)\{1to16\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 15 40 d2 71 7f\s+vpdpwusd 0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 15 d7 d2 72 80\s+vpdpwusd -0x200\(%rdx\)\{1to16\},%zmm29,%zmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 15 40 d3 f4\s+vpdpwusds %zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 22 15 47 d3 b4 f5 00 00 00 10\s+vpdpwusds 0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 15 50 d3 31\s+vpdpwusds \(%r9\)\{1to16\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 15 40 d3 71 7f\s+vpdpwusds 0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 15 d7 d3 72 80\s+vpdpwusds -0x200\(%rdx\)\{1to16\},%zmm29,%zmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 14 40 d2 f4\s+vpdpwuud %zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 22 14 47 d2 b4 f5 00 00 00 10\s+vpdpwuud 0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 14 50 d2 31\s+vpdpwuud \(%r9\)\{1to16\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 14 40 d2 71 7f\s+vpdpwuud 0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 14 d7 d2 72 80\s+vpdpwuud -0x200\(%rdx\)\{1to16\},%zmm29,%zmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 14 40 d3 f4\s+vpdpwuuds %zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 22 14 47 d3 b4 f5 00 00 00 10\s+vpdpwuuds 0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 14 50 d3 31\s+vpdpwuuds \(%r9\)\{1to16\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 14 40 d3 71 7f\s+vpdpwuuds 0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 14 d7 d3 72 80\s+vpdpwuuds -0x200\(%rdx\)\{1to16\},%zmm29,%zmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 14 40 52 f4\s+vdpphps %zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 22 14 47 52 b4 f5 00 00 00 10\s+vdpphps 0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 14 50 52 31\s+vdpphps \(%r9\)\{1to16\},%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 14 40 52 71 7f\s+vdpphps 0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 14 d7 52 72 80\s+vdpphps -0x200\(%rdx\)\{1to16\},%zmm29,%zmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 03 16 40 42 f4 7b\s+vmpsadbw \$0x7b,%zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 23 16 47 42 b4 f5 00 00 00 10 7b\s+vmpsadbw \$0x7b,0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30\{%k7\}
\s*[a-f0-9]+:\s*62 43 16 40 42 31 7b\s+vmpsadbw \$0x7b,\(%r9\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 63 16 40 42 71 7f 7b\s+vmpsadbw \$0x7b,0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 63 16 c7 42 72 80 7b\s+vmpsadbw \$0x7b,-0x2000\(%rdx\),%zmm29,%zmm30\{%k7\}\{z\}
#pass

#objdump: -dw
#name: x86_64 AVX10.2/256 media insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 02 17 20 50 f4\s+vpdpbssd %ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 02 17 00 50 f4\s+vpdpbssd %xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 22 17 27 50 b4 f5 00 00 00 10\s+vpdpbssd 0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 17 30 50 31\s+vpdpbssd \(%r9\)\{1to8\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 17 20 50 71 7f\s+vpdpbssd 0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 17 b7 50 72 80\s+vpdpbssd -0x200\(%rdx\)\{1to8\},%ymm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 22 17 07 50 b4 f5 00 00 00 10\s+vpdpbssd 0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 17 10 50 31\s+vpdpbssd \(%r9\)\{1to4\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 17 00 50 71 7f\s+vpdpbssd 0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 17 97 50 72 80\s+vpdpbssd -0x200\(%rdx\)\{1to4\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 17 20 51 f4\s+vpdpbssds %ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 02 17 00 51 f4\s+vpdpbssds %xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 22 17 27 51 b4 f5 00 00 00 10\s+vpdpbssds 0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 17 30 51 31\s+vpdpbssds \(%r9\)\{1to8\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 17 20 51 71 7f\s+vpdpbssds 0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 17 b7 51 72 80\s+vpdpbssds -0x200\(%rdx\)\{1to8\},%ymm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 22 17 07 51 b4 f5 00 00 00 10\s+vpdpbssds 0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 17 10 51 31\s+vpdpbssds \(%r9\)\{1to4\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 17 00 51 71 7f\s+vpdpbssds 0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 17 97 51 72 80\s+vpdpbssds -0x200\(%rdx\)\{1to4\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 16 20 50 f4\s+vpdpbsud %ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 02 16 00 50 f4\s+vpdpbsud %xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 22 16 27 50 b4 f5 00 00 00 10\s+vpdpbsud 0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 16 30 50 31\s+vpdpbsud \(%r9\)\{1to8\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 16 20 50 71 7f\s+vpdpbsud 0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 16 b7 50 72 80\s+vpdpbsud -0x200\(%rdx\)\{1to8\},%ymm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 22 16 07 50 b4 f5 00 00 00 10\s+vpdpbsud 0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 16 10 50 31\s+vpdpbsud \(%r9\)\{1to4\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 16 00 50 71 7f\s+vpdpbsud 0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 16 97 50 72 80\s+vpdpbsud -0x200\(%rdx\)\{1to4\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 16 20 51 f4\s+vpdpbsuds %ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 02 16 00 51 f4\s+vpdpbsuds %xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 22 16 27 51 b4 f5 00 00 00 10\s+vpdpbsuds 0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 16 30 51 31\s+vpdpbsuds \(%r9\)\{1to8\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 16 20 51 71 7f\s+vpdpbsuds 0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 16 b7 51 72 80\s+vpdpbsuds -0x200\(%rdx\)\{1to8\},%ymm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 22 16 07 51 b4 f5 00 00 00 10\s+vpdpbsuds 0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 16 10 51 31\s+vpdpbsuds \(%r9\)\{1to4\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 16 00 51 71 7f\s+vpdpbsuds 0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 16 97 51 72 80\s+vpdpbsuds -0x200\(%rdx\)\{1to4\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 14 20 50 f4\s+vpdpbuud %ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 02 14 00 50 f4\s+vpdpbuud %xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 22 14 27 50 b4 f5 00 00 00 10\s+vpdpbuud 0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 14 30 50 31\s+vpdpbuud \(%r9\)\{1to8\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 14 20 50 71 7f\s+vpdpbuud 0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 14 b7 50 72 80\s+vpdpbuud -0x200\(%rdx\)\{1to8\},%ymm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 22 14 07 50 b4 f5 00 00 00 10\s+vpdpbuud 0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 14 10 50 31\s+vpdpbuud \(%r9\)\{1to4\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 14 00 50 71 7f\s+vpdpbuud 0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 14 97 50 72 80\s+vpdpbuud -0x200\(%rdx\)\{1to4\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 14 20 51 f4\s+vpdpbuuds %ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 02 14 00 51 f4\s+vpdpbuuds %xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 22 14 27 51 b4 f5 00 00 00 10\s+vpdpbuuds 0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 14 30 51 31\s+vpdpbuuds \(%r9\)\{1to8\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 14 20 51 71 7f\s+vpdpbuuds 0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 14 b7 51 72 80\s+vpdpbuuds -0x200\(%rdx\)\{1to8\},%ymm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 22 14 07 51 b4 f5 00 00 00 10\s+vpdpbuuds 0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 14 10 51 31\s+vpdpbuuds \(%r9\)\{1to4\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 14 00 51 71 7f\s+vpdpbuuds 0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 14 97 51 72 80\s+vpdpbuuds -0x200\(%rdx\)\{1to4\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 16 20 d2 f4\s+vpdpwsud %ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 02 16 00 d2 f4\s+vpdpwsud %xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 22 16 27 d2 b4 f5 00 00 00 10\s+vpdpwsud 0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 16 30 d2 31\s+vpdpwsud \(%r9\)\{1to8\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 16 20 d2 71 7f\s+vpdpwsud 0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 16 b7 d2 72 80\s+vpdpwsud -0x200\(%rdx\)\{1to8\},%ymm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 22 16 07 d2 b4 f5 00 00 00 10\s+vpdpwsud 0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 16 10 d2 31\s+vpdpwsud \(%r9\)\{1to4\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 16 00 d2 71 7f\s+vpdpwsud 0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 16 97 d2 72 80\s+vpdpwsud -0x200\(%rdx\)\{1to4\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 16 20 d3 f4\s+vpdpwsuds %ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 02 16 00 d3 f4\s+vpdpwsuds %xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 22 16 27 d3 b4 f5 00 00 00 10\s+vpdpwsuds 0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 16 30 d3 31\s+vpdpwsuds \(%r9\)\{1to8\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 16 20 d3 71 7f\s+vpdpwsuds 0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 16 b7 d3 72 80\s+vpdpwsuds -0x200\(%rdx\)\{1to8\},%ymm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 22 16 07 d3 b4 f5 00 00 00 10\s+vpdpwsuds 0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 16 10 d3 31\s+vpdpwsuds \(%r9\)\{1to4\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 16 00 d3 71 7f\s+vpdpwsuds 0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 16 97 d3 72 80\s+vpdpwsuds -0x200\(%rdx\)\{1to4\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 15 20 d2 f4\s+vpdpwusd %ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 02 15 00 d2 f4\s+vpdpwusd %xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 22 15 27 d2 b4 f5 00 00 00 10\s+vpdpwusd 0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 15 30 d2 31\s+vpdpwusd \(%r9\)\{1to8\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 15 20 d2 71 7f\s+vpdpwusd 0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 15 b7 d2 72 80\s+vpdpwusd -0x200\(%rdx\)\{1to8\},%ymm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 22 15 07 d2 b4 f5 00 00 00 10\s+vpdpwusd 0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 15 10 d2 31\s+vpdpwusd \(%r9\)\{1to4\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 15 00 d2 71 7f\s+vpdpwusd 0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 15 97 d2 72 80\s+vpdpwusd -0x200\(%rdx\)\{1to4\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 15 20 d3 f4\s+vpdpwusds %ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 02 15 00 d3 f4\s+vpdpwusds %xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 22 15 27 d3 b4 f5 00 00 00 10\s+vpdpwusds 0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 15 30 d3 31\s+vpdpwusds \(%r9\)\{1to8\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 15 20 d3 71 7f\s+vpdpwusds 0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 15 b7 d3 72 80\s+vpdpwusds -0x200\(%rdx\)\{1to8\},%ymm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 22 15 07 d3 b4 f5 00 00 00 10\s+vpdpwusds 0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 15 10 d3 31\s+vpdpwusds \(%r9\)\{1to4\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 15 00 d3 71 7f\s+vpdpwusds 0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 15 97 d3 72 80\s+vpdpwusds -0x200\(%rdx\)\{1to4\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 14 20 d2 f4\s+vpdpwuud %ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 02 14 00 d2 f4\s+vpdpwuud %xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 22 14 27 d2 b4 f5 00 00 00 10\s+vpdpwuud 0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 14 30 d2 31\s+vpdpwuud \(%r9\)\{1to8\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 14 20 d2 71 7f\s+vpdpwuud 0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 14 b7 d2 72 80\s+vpdpwuud -0x200\(%rdx\)\{1to8\},%ymm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 22 14 07 d2 b4 f5 00 00 00 10\s+vpdpwuud 0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 14 10 d2 31\s+vpdpwuud \(%r9\)\{1to4\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 14 00 d2 71 7f\s+vpdpwuud 0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 14 97 d2 72 80\s+vpdpwuud -0x200\(%rdx\)\{1to4\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 14 20 d3 f4\s+vpdpwuuds %ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 02 14 00 d3 f4\s+vpdpwuuds %xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 22 14 27 d3 b4 f5 00 00 00 10\s+vpdpwuuds 0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 14 30 d3 31\s+vpdpwuuds \(%r9\)\{1to8\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 14 20 d3 71 7f\s+vpdpwuuds 0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 14 b7 d3 72 80\s+vpdpwuuds -0x200\(%rdx\)\{1to8\},%ymm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 22 14 07 d3 b4 f5 00 00 00 10\s+vpdpwuuds 0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 14 10 d3 31\s+vpdpwuuds \(%r9\)\{1to4\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 14 00 d3 71 7f\s+vpdpwuuds 0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 14 97 d3 72 80\s+vpdpwuuds -0x200\(%rdx\)\{1to4\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 02 14 20 52 f4\s+vdpphps %ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 02 14 00 52 f4\s+vdpphps %xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 22 14 27 52 b4 f5 00 00 00 10\s+vdpphps 0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 14 30 52 31\s+vdpphps \(%r9\)\{1to8\},%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 14 20 52 71 7f\s+vdpphps 0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 14 b7 52 72 80\s+vdpphps -0x200\(%rdx\)\{1to8\},%ymm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 22 14 07 52 b4 f5 00 00 00 10\s+vdpphps 0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 42 14 10 52 31\s+vdpphps \(%r9\)\{1to4\},%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 14 00 52 71 7f\s+vdpphps 0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 14 97 52 72 80\s+vdpphps -0x200\(%rdx\)\{1to4\},%xmm29,%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 03 16 00 42 f4 7b\s+vmpsadbw \$0x7b,%xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 03 16 20 42 f4 7b\s+vmpsadbw \$0x7b,%ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 23 16 27 42 b4 f5 00 00 00 10 7b\s+vmpsadbw \$0x7b,0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 43 16 20 42 31 7b\s+vmpsadbw \$0x7b,\(%r9\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 63 16 20 42 71 7f 7b\s+vmpsadbw \$0x7b,0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 63 16 a7 42 72 80 7b\s+vmpsadbw \$0x7b,-0x1000\(%rdx\),%ymm29,%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 23 16 07 42 b4 f5 00 00 00 10 7b\s+vmpsadbw \$0x7b,0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 43 16 00 42 31 7b\s+vmpsadbw \$0x7b,\(%r9\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 63 16 00 42 71 7f 7b\s+vmpsadbw \$0x7b,0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 63 16 87 42 72 80 7b\s+vmpsadbw \$0x7b,-0x800\(%rdx\),%xmm29,%xmm30\{%k7\}\{z\}
#pass

#objdump: -dw
#name: i386 AVX10.2/256 media insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 f2 57 2f 50 f4\s+vpdpbssd %ymm4,%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 57 0f 50 f4\s+vpdpbssd %xmm4,%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 57 2f 50 b4 f4 00 00 00 10\s+vpdpbssd 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 57 38 50 31\s+vpdpbssd \(%ecx\)\{1to8\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 57 2f 50 71 7f\s+vpdpbssd 0xfe0\(%ecx\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 57 bf 50 72 80\s+vpdpbssd -0x200\(%edx\)\{1to8\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 57 0f 50 b4 f4 00 00 00 10\s+vpdpbssd 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 57 18 50 31\s+vpdpbssd \(%ecx\)\{1to4\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 57 0f 50 71 7f\s+vpdpbssd 0x7f0\(%ecx\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 57 9f 50 72 80\s+vpdpbssd -0x200\(%edx\)\{1to4\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 57 2f 51 f4\s+vpdpbssds %ymm4,%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 57 0f 51 f4\s+vpdpbssds %xmm4,%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 57 2f 51 b4 f4 00 00 00 10\s+vpdpbssds 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 57 38 51 31\s+vpdpbssds \(%ecx\)\{1to8\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 57 2f 51 71 7f\s+vpdpbssds 0xfe0\(%ecx\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 57 bf 51 72 80\s+vpdpbssds -0x200\(%edx\)\{1to8\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 57 0f 51 b4 f4 00 00 00 10\s+vpdpbssds 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 57 18 51 31\s+vpdpbssds \(%ecx\)\{1to4\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 57 0f 51 71 7f\s+vpdpbssds 0x7f0\(%ecx\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 57 9f 51 72 80\s+vpdpbssds -0x200\(%edx\)\{1to4\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 56 2f 50 f4\s+vpdpbsud %ymm4,%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 0f 50 f4\s+vpdpbsud %xmm4,%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 2f 50 b4 f4 00 00 00 10\s+vpdpbsud 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 38 50 31\s+vpdpbsud \(%ecx\)\{1to8\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 2f 50 71 7f\s+vpdpbsud 0xfe0\(%ecx\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 bf 50 72 80\s+vpdpbsud -0x200\(%edx\)\{1to8\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 56 0f 50 b4 f4 00 00 00 10\s+vpdpbsud 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 18 50 31\s+vpdpbsud \(%ecx\)\{1to4\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 0f 50 71 7f\s+vpdpbsud 0x7f0\(%ecx\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 9f 50 72 80\s+vpdpbsud -0x200\(%edx\)\{1to4\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 56 2f 51 f4\s+vpdpbsuds %ymm4,%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 0f 51 f4\s+vpdpbsuds %xmm4,%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 2f 51 b4 f4 00 00 00 10\s+vpdpbsuds 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 38 51 31\s+vpdpbsuds \(%ecx\)\{1to8\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 2f 51 71 7f\s+vpdpbsuds 0xfe0\(%ecx\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 bf 51 72 80\s+vpdpbsuds -0x200\(%edx\)\{1to8\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 56 0f 51 b4 f4 00 00 00 10\s+vpdpbsuds 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 18 51 31\s+vpdpbsuds \(%ecx\)\{1to4\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 0f 51 71 7f\s+vpdpbsuds 0x7f0\(%ecx\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 9f 51 72 80\s+vpdpbsuds -0x200\(%edx\)\{1to4\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 54 2f 50 f4\s+vpdpbuud %ymm4,%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 0f 50 f4\s+vpdpbuud %xmm4,%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 2f 50 b4 f4 00 00 00 10\s+vpdpbuud 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 38 50 31\s+vpdpbuud \(%ecx\)\{1to8\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 2f 50 71 7f\s+vpdpbuud 0xfe0\(%ecx\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 bf 50 72 80\s+vpdpbuud -0x200\(%edx\)\{1to8\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 54 0f 50 b4 f4 00 00 00 10\s+vpdpbuud 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 18 50 31\s+vpdpbuud \(%ecx\)\{1to4\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 0f 50 71 7f\s+vpdpbuud 0x7f0\(%ecx\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 9f 50 72 80\s+vpdpbuud -0x200\(%edx\)\{1to4\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 54 2f 51 f4\s+vpdpbuuds %ymm4,%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 0f 51 f4\s+vpdpbuuds %xmm4,%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 2f 51 b4 f4 00 00 00 10\s+vpdpbuuds 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 38 51 31\s+vpdpbuuds \(%ecx\)\{1to8\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 2f 51 71 7f\s+vpdpbuuds 0xfe0\(%ecx\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 bf 51 72 80\s+vpdpbuuds -0x200\(%edx\)\{1to8\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 54 0f 51 b4 f4 00 00 00 10\s+vpdpbuuds 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 18 51 31\s+vpdpbuuds \(%ecx\)\{1to4\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 0f 51 71 7f\s+vpdpbuuds 0x7f0\(%ecx\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 9f 51 72 80\s+vpdpbuuds -0x200\(%edx\)\{1to4\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 56 2f d2 f4\s+vpdpwsud %ymm4,%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 0f d2 f4\s+vpdpwsud %xmm4,%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 2f d2 b4 f4 00 00 00 10\s+vpdpwsud 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 38 d2 31\s+vpdpwsud \(%ecx\)\{1to8\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 2f d2 71 7f\s+vpdpwsud 0xfe0\(%ecx\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 bf d2 72 80\s+vpdpwsud -0x200\(%edx\)\{1to8\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 56 0f d2 b4 f4 00 00 00 10\s+vpdpwsud 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 18 d2 31\s+vpdpwsud \(%ecx\)\{1to4\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 0f d2 71 7f\s+vpdpwsud 0x7f0\(%ecx\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 9f d2 72 80\s+vpdpwsud -0x200\(%edx\)\{1to4\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 56 2f d3 f4\s+vpdpwsuds %ymm4,%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 0f d3 f4\s+vpdpwsuds %xmm4,%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 2f d3 b4 f4 00 00 00 10\s+vpdpwsuds 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 38 d3 31\s+vpdpwsuds \(%ecx\)\{1to8\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 2f d3 71 7f\s+vpdpwsuds 0xfe0\(%ecx\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 bf d3 72 80\s+vpdpwsuds -0x200\(%edx\)\{1to8\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 56 0f d3 b4 f4 00 00 00 10\s+vpdpwsuds 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 18 d3 31\s+vpdpwsuds \(%ecx\)\{1to4\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 0f d3 71 7f\s+vpdpwsuds 0x7f0\(%ecx\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 9f d3 72 80\s+vpdpwsuds -0x200\(%edx\)\{1to4\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 55 2f d2 f4\s+vpdpwusd %ymm4,%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 55 0f d2 f4\s+vpdpwusd %xmm4,%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 55 2f d2 b4 f4 00 00 00 10\s+vpdpwusd 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 55 38 d2 31\s+vpdpwusd \(%ecx\)\{1to8\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 55 2f d2 71 7f\s+vpdpwusd 0xfe0\(%ecx\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 55 bf d2 72 80\s+vpdpwusd -0x200\(%edx\)\{1to8\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 55 0f d2 b4 f4 00 00 00 10\s+vpdpwusd 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 55 18 d2 31\s+vpdpwusd \(%ecx\)\{1to4\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 55 0f d2 71 7f\s+vpdpwusd 0x7f0\(%ecx\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 55 9f d2 72 80\s+vpdpwusd -0x200\(%edx\)\{1to4\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 55 2f d3 f4\s+vpdpwusds %ymm4,%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 55 0f d3 f4\s+vpdpwusds %xmm4,%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 55 2f d3 b4 f4 00 00 00 10\s+vpdpwusds 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 55 38 d3 31\s+vpdpwusds \(%ecx\)\{1to8\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 55 2f d3 71 7f\s+vpdpwusds 0xfe0\(%ecx\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 55 bf d3 72 80\s+vpdpwusds -0x200\(%edx\)\{1to8\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 55 0f d3 b4 f4 00 00 00 10\s+vpdpwusds 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 55 18 d3 31\s+vpdpwusds \(%ecx\)\{1to4\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 55 0f d3 71 7f\s+vpdpwusds 0x7f0\(%ecx\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 55 9f d3 72 80\s+vpdpwusds -0x200\(%edx\)\{1to4\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 54 2f d2 f4\s+vpdpwuud %ymm4,%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 0f d2 f4\s+vpdpwuud %xmm4,%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 2f d2 b4 f4 00 00 00 10\s+vpdpwuud 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 38 d2 31\s+vpdpwuud \(%ecx\)\{1to8\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 2f d2 71 7f\s+vpdpwuud 0xfe0\(%ecx\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 bf d2 72 80\s+vpdpwuud -0x200\(%edx\)\{1to8\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 54 0f d2 b4 f4 00 00 00 10\s+vpdpwuud 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 18 d2 31\s+vpdpwuud \(%ecx\)\{1to4\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 0f d2 71 7f\s+vpdpwuud 0x7f0\(%ecx\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 9f d2 72 80\s+vpdpwuud -0x200\(%edx\)\{1to4\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 54 2f d3 f4\s+vpdpwuuds %ymm4,%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 0f d3 f4\s+vpdpwuuds %xmm4,%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 2f d3 b4 f4 00 00 00 10\s+vpdpwuuds 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 38 d3 31\s+vpdpwuuds \(%ecx\)\{1to8\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 2f d3 71 7f\s+vpdpwuuds 0xfe0\(%ecx\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 bf d3 72 80\s+vpdpwuuds -0x200\(%edx\)\{1to8\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 54 0f d3 b4 f4 00 00 00 10\s+vpdpwuuds 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 18 d3 31\s+vpdpwuuds \(%ecx\)\{1to4\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 0f d3 71 7f\s+vpdpwuuds 0x7f0\(%ecx\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 9f d3 72 80\s+vpdpwuuds -0x200\(%edx\)\{1to4\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 54 2f 52 f4\s+vdpphps %ymm4,%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 0f 52 f4\s+vdpphps %xmm4,%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 2f 52 b4 f4 00 00 00 10\s+vdpphps 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 38 52 31\s+vdpphps \(%ecx\)\{1to8\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 2f 52 71 7f\s+vdpphps 0xfe0\(%ecx\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 bf 52 72 80\s+vdpphps -0x200\(%edx\)\{1to8\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 54 0f 52 b4 f4 00 00 00 10\s+vdpphps 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 18 52 31\s+vdpphps \(%ecx\)\{1to4\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 0f 52 71 7f\s+vdpphps 0x7f0\(%ecx\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 9f 52 72 80\s+vdpphps -0x200\(%edx\)\{1to4\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 56 0f 42 f4 7b\s+vmpsadbw \$0x7b,%xmm4,%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 56 2f 42 f4 7b\s+vmpsadbw \$0x7b,%ymm4,%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 56 2f 42 b4 f4 00 00 00 10 7b\s+vmpsadbw \$0x7b,0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 56 2f 42 31 7b\s+vmpsadbw \$0x7b,\(%ecx\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 56 2f 42 71 7f 7b\s+vmpsadbw \$0x7b,0xfe0\(%ecx\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 56 af 42 72 80 7b\s+vmpsadbw \$0x7b,-0x1000\(%edx\),%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 56 0f 42 b4 f4 00 00 00 10 7b\s+vmpsadbw \$0x7b,0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 56 0f 42 31 7b\s+vmpsadbw \$0x7b,\(%ecx\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 56 0f 42 71 7f 7b\s+vmpsadbw \$0x7b,0x7f0\(%ecx\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 56 8f 42 72 80 7b\s+vmpsadbw \$0x7b,-0x800\(%edx\),%xmm5,%xmm6\{%k7\}\{z\}
#pass

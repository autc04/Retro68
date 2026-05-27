#objdump: -dw
#name: i386 AVX10.2/512 media insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 f2 57 48 50 f4\s+vpdpbssd %zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 57 4f 50 b4 f4 00 00 00 10\s+vpdpbssd 0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 57 58 50 31\s+vpdpbssd \(%ecx\)\{1to16\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 57 48 50 71 7f\s+vpdpbssd 0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 57 df 50 72 80\s+vpdpbssd -0x200\(%edx\)\{1to16\},%zmm5,%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 57 48 51 f4\s+vpdpbssds %zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 57 4f 51 b4 f4 00 00 00 10\s+vpdpbssds 0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 57 58 51 31\s+vpdpbssds \(%ecx\)\{1to16\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 57 48 51 71 7f\s+vpdpbssds 0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 57 df 51 72 80\s+vpdpbssds -0x200\(%edx\)\{1to16\},%zmm5,%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 56 48 50 f4\s+vpdpbsud %zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 56 4f 50 b4 f4 00 00 00 10\s+vpdpbsud 0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 58 50 31\s+vpdpbsud \(%ecx\)\{1to16\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 56 48 50 71 7f\s+vpdpbsud 0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 56 df 50 72 80\s+vpdpbsud -0x200\(%edx\)\{1to16\},%zmm5,%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 56 48 51 f4\s+vpdpbsuds %zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 56 4f 51 b4 f4 00 00 00 10\s+vpdpbsuds 0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 58 51 31\s+vpdpbsuds \(%ecx\)\{1to16\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 56 48 51 71 7f\s+vpdpbsuds 0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 56 df 51 72 80\s+vpdpbsuds -0x200\(%edx\)\{1to16\},%zmm5,%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 54 48 50 f4\s+vpdpbuud %zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 54 4f 50 b4 f4 00 00 00 10\s+vpdpbuud 0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 58 50 31\s+vpdpbuud \(%ecx\)\{1to16\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 54 48 50 71 7f\s+vpdpbuud 0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 54 df 50 72 80\s+vpdpbuud -0x200\(%edx\)\{1to16\},%zmm5,%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 54 48 51 f4\s+vpdpbuuds %zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 54 4f 51 b4 f4 00 00 00 10\s+vpdpbuuds 0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 58 51 31\s+vpdpbuuds \(%ecx\)\{1to16\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 54 48 51 71 7f\s+vpdpbuuds 0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 54 df 51 72 80\s+vpdpbuuds -0x200\(%edx\)\{1to16\},%zmm5,%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 56 48 d2 f4\s+vpdpwsud %zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 56 4f d2 b4 f4 00 00 00 10\s+vpdpwsud 0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 58 d2 31\s+vpdpwsud \(%ecx\)\{1to16\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 56 48 d2 71 7f\s+vpdpwsud 0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 56 df d2 72 80\s+vpdpwsud -0x200\(%edx\)\{1to16\},%zmm5,%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 56 48 d3 f4\s+vpdpwsuds %zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 56 4f d3 b4 f4 00 00 00 10\s+vpdpwsuds 0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 56 58 d3 31\s+vpdpwsuds \(%ecx\)\{1to16\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 56 48 d3 71 7f\s+vpdpwsuds 0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 56 df d3 72 80\s+vpdpwsuds -0x200\(%edx\)\{1to16\},%zmm5,%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 55 48 d2 f4\s+vpdpwusd %zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 55 4f d2 b4 f4 00 00 00 10\s+vpdpwusd 0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 55 58 d2 31\s+vpdpwusd \(%ecx\)\{1to16\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 55 48 d2 71 7f\s+vpdpwusd 0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 55 df d2 72 80\s+vpdpwusd -0x200\(%edx\)\{1to16\},%zmm5,%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 55 48 d3 f4\s+vpdpwusds %zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 55 4f d3 b4 f4 00 00 00 10\s+vpdpwusds 0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 55 58 d3 31\s+vpdpwusds \(%ecx\)\{1to16\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 55 48 d3 71 7f\s+vpdpwusds 0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 55 df d3 72 80\s+vpdpwusds -0x200\(%edx\)\{1to16\},%zmm5,%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 54 48 d2 f4\s+vpdpwuud %zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 54 4f d2 b4 f4 00 00 00 10\s+vpdpwuud 0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 58 d2 31\s+vpdpwuud \(%ecx\)\{1to16\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 54 48 d2 71 7f\s+vpdpwuud 0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 54 df d2 72 80\s+vpdpwuud -0x200\(%edx\)\{1to16\},%zmm5,%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 54 48 d3 f4\s+vpdpwuuds %zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 54 4f d3 b4 f4 00 00 00 10\s+vpdpwuuds 0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 58 d3 31\s+vpdpwuuds \(%ecx\)\{1to16\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 54 48 d3 71 7f\s+vpdpwuuds 0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 54 df d3 72 80\s+vpdpwuuds -0x200\(%edx\)\{1to16\},%zmm5,%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f2 54 48 52 f4\s+vdpphps %zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 54 4f 52 b4 f4 00 00 00 10\s+vdpphps 0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f2 54 58 52 31\s+vdpphps \(%ecx\)\{1to16\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 54 48 52 71 7f\s+vdpphps 0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 54 df 52 72 80\s+vdpphps -0x200\(%edx\)\{1to16\},%zmm5,%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 56 48 42 f4 7b\s+vmpsadbw \$0x7b,%zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f3 56 4f 42 b4 f4 00 00 00 10 7b\s+vmpsadbw \$0x7b,0x10000000\(%esp,%esi,8\),%zmm5,%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 56 48 42 31 7b\s+vmpsadbw \$0x7b,\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f3 56 48 42 71 7f 7b\s+vmpsadbw \$0x7b,0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f3 56 cf 42 72 80 7b\s+vmpsadbw \$0x7b,-0x2000\(%edx\),%zmm5,%zmm6\{%k7\}\{z\}
#pass

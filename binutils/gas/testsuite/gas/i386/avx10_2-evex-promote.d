#objdump: -dw
#name: i386 AVX10.2/256 evex promote insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*c4 e2 57 50 f4\s+vpdpbssd %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 53 50 f4\s+vpdpbssd %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 57 50 31\s+vpdpbssd \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 53 50 31\s+vpdpbssd \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 57 28 50 f4\s+\{evex\} vpdpbssd %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 57 08 50 f4\s+\{evex\} vpdpbssd %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 57 28 50 31\s+\{evex\} vpdpbssd \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 57 08 50 31\s+\{evex\} vpdpbssd \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 57 51 f4\s+vpdpbssds %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 53 51 f4\s+vpdpbssds %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 57 51 31\s+vpdpbssds \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 53 51 31\s+vpdpbssds \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 57 28 51 f4\s+\{evex\} vpdpbssds %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 57 08 51 f4\s+\{evex\} vpdpbssds %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 57 28 51 31\s+\{evex\} vpdpbssds \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 57 08 51 31\s+\{evex\} vpdpbssds \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 56 50 f4\s+vpdpbsud %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 52 50 f4\s+vpdpbsud %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 56 50 31\s+vpdpbsud \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 52 50 31\s+vpdpbsud \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 28 50 f4\s+\{evex\} vpdpbsud %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 08 50 f4\s+\{evex\} vpdpbsud %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 28 50 31\s+\{evex\} vpdpbsud \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 08 50 31\s+\{evex\} vpdpbsud \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 56 51 f4\s+vpdpbsuds %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 52 51 f4\s+vpdpbsuds %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 56 51 31\s+vpdpbsuds \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 52 51 31\s+vpdpbsuds \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 28 51 f4\s+\{evex\} vpdpbsuds %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 08 51 f4\s+\{evex\} vpdpbsuds %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 28 51 31\s+\{evex\} vpdpbsuds \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 08 51 31\s+\{evex\} vpdpbsuds \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 54 50 f4\s+vpdpbuud %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 50 50 f4\s+vpdpbuud %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 54 50 31\s+vpdpbuud \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 50 50 31\s+vpdpbuud \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 28 50 f4\s+\{evex\} vpdpbuud %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 08 50 f4\s+\{evex\} vpdpbuud %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 28 50 31\s+\{evex\} vpdpbuud \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 08 50 31\s+\{evex\} vpdpbuud \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 54 51 f4\s+vpdpbuuds %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 50 51 f4\s+vpdpbuuds %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 54 51 31\s+vpdpbuuds \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 50 51 31\s+vpdpbuuds \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 28 51 f4\s+\{evex\} vpdpbuuds %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 08 51 f4\s+\{evex\} vpdpbuuds %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 28 51 31\s+\{evex\} vpdpbuuds \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 08 51 31\s+\{evex\} vpdpbuuds \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 56 d2 f4\s+vpdpwsud %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 52 d2 f4\s+vpdpwsud %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 56 d2 31\s+vpdpwsud \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 52 d2 31\s+vpdpwsud \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 28 d2 f4\s+\{evex\} vpdpwsud %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 08 d2 f4\s+\{evex\} vpdpwsud %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 28 d2 31\s+\{evex\} vpdpwsud \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 08 d2 31\s+\{evex\} vpdpwsud \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 56 d3 f4\s+vpdpwsuds %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 52 d3 f4\s+vpdpwsuds %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 56 d3 31\s+vpdpwsuds \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 52 d3 31\s+vpdpwsuds \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 28 d3 f4\s+\{evex\} vpdpwsuds %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 08 d3 f4\s+\{evex\} vpdpwsuds %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 28 d3 31\s+\{evex\} vpdpwsuds \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 08 d3 31\s+\{evex\} vpdpwsuds \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 55 d2 f4\s+vpdpwusd %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 51 d2 f4\s+vpdpwusd %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 55 d2 31\s+vpdpwusd \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 51 d2 31\s+vpdpwusd \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 55 28 d2 f4\s+\{evex\} vpdpwusd %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 55 08 d2 f4\s+\{evex\} vpdpwusd %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 55 28 d2 31\s+\{evex\} vpdpwusd \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 55 08 d2 31\s+\{evex\} vpdpwusd \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 55 d3 f4\s+vpdpwusds %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 51 d3 f4\s+vpdpwusds %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 55 d3 31\s+vpdpwusds \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 51 d3 31\s+vpdpwusds \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 55 28 d3 f4\s+\{evex\} vpdpwusds %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 55 08 d3 f4\s+\{evex\} vpdpwusds %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 55 28 d3 31\s+\{evex\} vpdpwusds \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 55 08 d3 31\s+\{evex\} vpdpwusds \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 54 d2 f4\s+vpdpwuud %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 50 d2 f4\s+vpdpwuud %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 54 d2 31\s+vpdpwuud \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 50 d2 31\s+vpdpwuud \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 28 d2 f4\s+\{evex\} vpdpwuud %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 08 d2 f4\s+\{evex\} vpdpwuud %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 28 d2 31\s+\{evex\} vpdpwuud \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 08 d2 31\s+\{evex\} vpdpwuud \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 54 d3 f4\s+vpdpwuuds %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 50 d3 f4\s+vpdpwuuds %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 54 d3 31\s+vpdpwuuds \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 50 d3 31\s+vpdpwuuds \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 28 d3 f4\s+\{evex\} vpdpwuuds %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 08 d3 f4\s+\{evex\} vpdpwuuds %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 28 d3 31\s+\{evex\} vpdpwuuds \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 08 d3 31\s+\{evex\} vpdpwuuds \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e3 51 42 f4 7b\s+vmpsadbw \$0x7b,%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e3 55 42 f4 7b\s+vmpsadbw \$0x7b,%ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e3 51 42 31 7b\s+vmpsadbw \$0x7b,\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e3 55 42 31 7b\s+vmpsadbw \$0x7b,\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f3 56 08 42 f4 7b\s+\{evex\} vmpsadbw \$0x7b,%xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 56 28 42 f4 7b\s+\{evex\} vmpsadbw \$0x7b,%ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f3 56 08 42 31 7b\s+\{evex\} vmpsadbw \$0x7b,\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 56 28 42 31 7b\s+\{evex\} vmpsadbw \$0x7b,\(%ecx\),%ymm5,%ymm6
#pass

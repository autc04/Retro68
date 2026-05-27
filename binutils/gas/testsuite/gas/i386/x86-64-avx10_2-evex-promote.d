#objdump: -dw
#name: x86_64 AVX10.2/256 evex promote insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*c4 c2 57 50 f6\s+vpdpbssd %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 c2 53 50 f6\s+vpdpbssd %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 57 50 31\s+vpdpbssd \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 53 50 31\s+vpdpbssd \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 d2 57 28 50 f6\s+\{evex\} vpdpbssd %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 d2 57 08 50 f6\s+\{evex\} vpdpbssd %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 57 28 50 31\s+\{evex\} vpdpbssd \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 57 08 50 31\s+\{evex\} vpdpbssd \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 c2 57 51 f6\s+vpdpbssds %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 c2 53 51 f6\s+vpdpbssds %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 57 51 31\s+vpdpbssds \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 53 51 31\s+vpdpbssds \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 d2 57 28 51 f6\s+\{evex\} vpdpbssds %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 d2 57 08 51 f6\s+\{evex\} vpdpbssds %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 57 28 51 31\s+\{evex\} vpdpbssds \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 57 08 51 31\s+\{evex\} vpdpbssds \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 c2 56 50 f6\s+vpdpbsud %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 c2 52 50 f6\s+vpdpbsud %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 56 50 31\s+vpdpbsud \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 52 50 31\s+vpdpbsud \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 d2 56 28 50 f6\s+\{evex\} vpdpbsud %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 d2 56 08 50 f6\s+\{evex\} vpdpbsud %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 28 50 31\s+\{evex\} vpdpbsud \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 08 50 31\s+\{evex\} vpdpbsud \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 c2 56 51 f6\s+vpdpbsuds %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 c2 52 51 f6\s+vpdpbsuds %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 56 51 31\s+vpdpbsuds \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 52 51 31\s+vpdpbsuds \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 d2 56 28 51 f6\s+\{evex\} vpdpbsuds %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 d2 56 08 51 f6\s+\{evex\} vpdpbsuds %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 28 51 31\s+\{evex\} vpdpbsuds \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 08 51 31\s+\{evex\} vpdpbsuds \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 c2 54 50 f6\s+vpdpbuud %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 c2 50 50 f6\s+vpdpbuud %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 54 50 31\s+vpdpbuud \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 50 50 31\s+vpdpbuud \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 d2 54 28 50 f6\s+\{evex\} vpdpbuud %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 d2 54 08 50 f6\s+\{evex\} vpdpbuud %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 28 50 31\s+\{evex\} vpdpbuud \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 08 50 31\s+\{evex\} vpdpbuud \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 c2 54 51 f6\s+vpdpbuuds %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 c2 50 51 f6\s+vpdpbuuds %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 54 51 31\s+vpdpbuuds \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 50 51 31\s+vpdpbuuds \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 d2 54 28 51 f6\s+\{evex\} vpdpbuuds %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 d2 54 08 51 f6\s+\{evex\} vpdpbuuds %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 28 51 31\s+\{evex\} vpdpbuuds \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 08 51 31\s+\{evex\} vpdpbuuds \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 c2 56 d2 f6\s+vpdpwsud %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 c2 52 d2 f6\s+vpdpwsud %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 56 d2 31\s+vpdpwsud \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 52 d2 31\s+vpdpwsud \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 d2 56 28 d2 f6\s+\{evex\} vpdpwsud %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 d2 56 08 d2 f6\s+\{evex\} vpdpwsud %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 28 d2 31\s+\{evex\} vpdpwsud \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 08 d2 31\s+\{evex\} vpdpwsud \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 c2 56 d3 f6\s+vpdpwsuds %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 c2 52 d3 f6\s+vpdpwsuds %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 56 d3 31\s+vpdpwsuds \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 52 d3 31\s+vpdpwsuds \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 d2 56 28 d3 f6\s+\{evex\} vpdpwsuds %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 d2 56 08 d3 f6\s+\{evex\} vpdpwsuds %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 28 d3 31\s+\{evex\} vpdpwsuds \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 08 d3 31\s+\{evex\} vpdpwsuds \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 c2 55 d2 f6\s+vpdpwusd %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 c2 51 d2 f6\s+vpdpwusd %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 55 d2 31\s+vpdpwusd \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 51 d2 31\s+vpdpwusd \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 d2 55 28 d2 f6\s+\{evex\} vpdpwusd %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 d2 55 08 d2 f6\s+\{evex\} vpdpwusd %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 55 28 d2 31\s+\{evex\} vpdpwusd \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 55 08 d2 31\s+\{evex\} vpdpwusd \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 c2 55 d3 f6\s+vpdpwusds %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 c2 51 d3 f6\s+vpdpwusds %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 55 d3 31\s+vpdpwusds \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 51 d3 31\s+vpdpwusds \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 d2 55 28 d3 f6\s+\{evex\} vpdpwusds %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 d2 55 08 d3 f6\s+\{evex\} vpdpwusds %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 55 28 d3 31\s+\{evex\} vpdpwusds \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 55 08 d3 31\s+\{evex\} vpdpwusds \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 c2 54 d2 f6\s+vpdpwuud %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 c2 50 d2 f6\s+vpdpwuud %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 54 d2 31\s+vpdpwuud \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 50 d2 31\s+vpdpwuud \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 d2 54 28 d2 f6\s+\{evex\} vpdpwuud %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 d2 54 08 d2 f6\s+\{evex\} vpdpwuud %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 28 d2 31\s+\{evex\} vpdpwuud \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 08 d2 31\s+\{evex\} vpdpwuud \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 c2 54 d3 f6\s+vpdpwuuds %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 c2 50 d3 f6\s+vpdpwuuds %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e2 54 d3 31\s+vpdpwuuds \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e2 50 d3 31\s+vpdpwuuds \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 d2 54 28 d3 f6\s+\{evex\} vpdpwuuds %ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 d2 54 08 d3 f6\s+\{evex\} vpdpwuuds %xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 54 28 d3 31\s+\{evex\} vpdpwuuds \(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 54 08 d3 31\s+\{evex\} vpdpwuuds \(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 c3 51 42 f6 7b\s+vmpsadbw \$0x7b,%xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 c3 55 42 f6 7b\s+vmpsadbw \$0x7b,%ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*c4 e3 51 42 31 7b\s+vmpsadbw \$0x7b,\(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*c4 e3 55 42 31 7b\s+vmpsadbw \$0x7b,\(%rcx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 d3 56 08 42 f6 7b\s+\{evex\} vmpsadbw \$0x7b,%xmm14,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 d3 56 28 42 f6 7b\s+\{evex\} vmpsadbw \$0x7b,%ymm14,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f3 56 08 42 31 7b\s+\{evex\} vmpsadbw \$0x7b,\(%rcx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 56 28 42 31 7b\s+\{evex\} vmpsadbw \$0x7b,\(%rcx\),%ymm5,%ymm6
#pass

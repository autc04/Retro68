#objdump: -dw
#name: i386 AVX10.2/256, SM4 insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 f2 56 28 da f4\s+{evex} vsm4key4 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 08 da f4\s+{evex} vsm4key4 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 28 da b4 f4 00 00 00 10\s+{evex} vsm4key4 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 28 da 31\s+{evex} vsm4key4 \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 28 da 71 7f\s+{evex} vsm4key4 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 28 da 72 80\s+{evex} vsm4key4 -0x1000\(%edx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 56 08 da b4 f4 00 00 00 10\s+{evex} vsm4key4 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 08 da 31\s+{evex} vsm4key4 \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 08 da 71 7f\s+{evex} vsm4key4 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 56 08 da 72 80\s+{evex} vsm4key4 -0x800\(%edx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 57 28 da f4\s+{evex} vsm4rnds4 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 57 08 da f4\s+{evex} vsm4rnds4 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 57 28 da b4 f4 00 00 00 10\s+{evex} vsm4rnds4 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 57 28 da 31\s+{evex} vsm4rnds4 \(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 57 28 da 71 7f\s+{evex} vsm4rnds4 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 57 28 da 72 80\s+{evex} vsm4rnds4 -0x1000\(%edx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f2 57 08 da b4 f4 00 00 00 10\s+{evex} vsm4rnds4 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 57 08 da 31\s+{evex} vsm4rnds4 \(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 57 08 da 71 7f\s+{evex} vsm4rnds4 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f2 57 08 da 72 80\s+{evex} vsm4rnds4 -0x800\(%edx\),%xmm5,%xmm6
#pass

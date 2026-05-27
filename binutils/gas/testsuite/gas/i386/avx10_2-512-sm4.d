#objdump: -dw
#name: i386 AVX10_2, SM4 insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 f2 56 48 da f4\s+vsm4key4 %zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 56 48 da b4 f4 00 00 00 10\s+vsm4key4 0x10000000\(%esp,%esi,8\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 56 48 da 31\s+vsm4key4 \(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 56 48 da 71 7f\s+vsm4key4 0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 56 48 da 72 80\s+vsm4key4 -0x2000\(%edx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 57 48 da f4\s+vsm4rnds4 %zmm4,%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 57 48 da b4 f4 00 00 00 10\s+vsm4rnds4 0x10000000\(%esp,%esi,8\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 57 48 da 31\s+vsm4rnds4 \(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 57 48 da 71 7f\s+vsm4rnds4 0x1fc0\(%ecx\),%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f2 57 48 da 72 80\s+vsm4rnds4 -0x2000\(%edx\),%zmm5,%zmm6
#pass

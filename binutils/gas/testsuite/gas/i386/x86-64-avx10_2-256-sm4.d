#objdump: -dw
#name: x86_64 AVX10.2/256, SM4 insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 02 16 20 da f4\s+vsm4key4 %ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 02 16 00 da f4\s+vsm4key4 %xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 22 16 20 da b4 f5 00 00 00 10\s+vsm4key4 0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 42 16 20 da 31\s+vsm4key4 \(%r9\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 16 20 da 71 7f\s+vsm4key4 0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 16 20 da 72 80\s+vsm4key4 -0x1000\(%rdx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 22 16 00 da b4 f5 00 00 00 10\s+vsm4key4 0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 42 16 00 da 31\s+vsm4key4 \(%r9\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 16 00 da 71 7f\s+vsm4key4 0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 16 00 da 72 80\s+vsm4key4 -0x800\(%rdx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 02 17 20 da f4\s+vsm4rnds4 %ymm28,%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 02 17 00 da f4\s+vsm4rnds4 %xmm28,%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 22 17 20 da b4 f5 00 00 00 10\s+vsm4rnds4 0x10000000\(%rbp,%r14,8\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 42 17 20 da 31\s+vsm4rnds4 \(%r9\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 17 20 da 71 7f\s+vsm4rnds4 0xfe0\(%rcx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 62 17 20 da 72 80\s+vsm4rnds4 -0x1000\(%rdx\),%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 22 17 00 da b4 f5 00 00 00 10\s+vsm4rnds4 0x10000000\(%rbp,%r14,8\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 42 17 00 da 31\s+vsm4rnds4 \(%r9\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 17 00 da 71 7f\s+vsm4rnds4 0x7f0\(%rcx\),%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 62 17 00 da 72 80\s+vsm4rnds4 -0x800\(%rdx\),%xmm29,%xmm30
#pass

#objdump: -dw
#name: x86_64 AVX10.2/512, SM4 insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 02 16 40 da f4\s+vsm4key4 %zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 22 16 40 da b4 f5 00 00 00 10\s+vsm4key4 0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 42 16 40 da 31\s+vsm4key4 \(%r9\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 16 40 da 71 7f\s+vsm4key4 0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 16 40 da 72 80\s+vsm4key4 -0x2000\(%rdx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 02 17 40 da f4\s+vsm4rnds4 %zmm28,%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 22 17 40 da b4 f5 00 00 00 10\s+vsm4rnds4 0x10000000\(%rbp,%r14,8\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 42 17 40 da 31\s+vsm4rnds4 \(%r9\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 17 40 da 71 7f\s+vsm4rnds4 0x1fc0\(%rcx\),%zmm29,%zmm30
\s*[a-f0-9]+:\s*62 62 17 40 da 72 80\s+vsm4rnds4 -0x2000\(%rdx\),%zmm29,%zmm30
#pass

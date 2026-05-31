#objdump: -dw -Mintel
#name: x86_64 AVX10.2/256, SM4 insns (Intel disassembly)
#source: x86-64-avx10_2-256-sm4.s

.*: +file format .*

Disassembly of section \.text:

#pass
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 02 16 20 da f4\s+vsm4key4 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 02 16 00 da f4\s+vsm4key4 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 22 16 20 da b4 f5 00 00 00 10\s+vsm4key4 ymm30,ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 16 20 da 31\s+vsm4key4 ymm30,ymm29,YMMWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 62 16 20 da 71 7f\s+vsm4key4 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 62 16 20 da 72 80\s+vsm4key4 ymm30,ymm29,YMMWORD PTR \[rdx-0x1000\]
\s*[a-f0-9]+:\s*62 22 16 00 da b4 f5 00 00 00 10\s+vsm4key4 xmm30,xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 16 00 da 31\s+vsm4key4 xmm30,xmm29,XMMWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 62 16 00 da 71 7f\s+vsm4key4 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 62 16 00 da 72 80\s+vsm4key4 xmm30,xmm29,XMMWORD PTR \[rdx-0x800\]
\s*[a-f0-9]+:\s*62 02 17 20 da f4\s+vsm4rnds4 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 02 17 00 da f4\s+vsm4rnds4 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 22 17 20 da b4 f5 00 00 00 10\s+vsm4rnds4 ymm30,ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 17 20 da 31\s+vsm4rnds4 ymm30,ymm29,YMMWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 62 17 20 da 71 7f\s+vsm4rnds4 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 62 17 20 da 72 80\s+vsm4rnds4 ymm30,ymm29,YMMWORD PTR \[rdx-0x1000\]
\s*[a-f0-9]+:\s*62 22 17 00 da b4 f5 00 00 00 10\s+vsm4rnds4 xmm30,xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 17 00 da 31\s+vsm4rnds4 xmm30,xmm29,XMMWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 62 17 00 da 71 7f\s+vsm4rnds4 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 62 17 00 da 72 80\s+vsm4rnds4 xmm30,xmm29,XMMWORD PTR \[rdx-0x800\]
#pass

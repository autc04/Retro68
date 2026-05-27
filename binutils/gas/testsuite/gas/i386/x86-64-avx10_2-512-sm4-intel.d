#objdump: -dw -Mintel
#name: x86_64 AVX10.2/512, SM4 insns (Intel disassembly)
#source: x86-64-avx10_2-512-sm4.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 02 16 40 da f4\s+vsm4key4 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 22 16 40 da b4 f5 00 00 00 10\s+vsm4key4 zmm30,zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 16 40 da 31\s+vsm4key4 zmm30,zmm29,ZMMWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 62 16 40 da 71 7f\s+vsm4key4 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 62 16 40 da 72 80\s+vsm4key4 zmm30,zmm29,ZMMWORD PTR \[rdx-0x2000\]
\s*[a-f0-9]+:\s*62 02 17 40 da f4\s+vsm4rnds4 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 22 17 40 da b4 f5 00 00 00 10\s+vsm4rnds4 zmm30,zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 17 40 da 31\s+vsm4rnds4 zmm30,zmm29,ZMMWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 62 17 40 da 71 7f\s+vsm4rnds4 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 62 17 40 da 72 80\s+vsm4rnds4 zmm30,zmm29,ZMMWORD PTR \[rdx-0x2000\]
#pass

#objdump: -dw -Mintel
#name: x86_64 AVX10.2/512 minmax insns (Intel disassembly)
#source: x86-64-avx10_2-512-miscs.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 03 17 40 52 f4 7b\s+vminmaxbf16 zmm30,zmm29,zmm28,0x7b
\s*[a-f0-9]+:\s*62 23 17 47 52 b4 f5 00 00 00 10 7b\s+vminmaxbf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 63 17 40 52 71 7f 7b\s+vminmaxbf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\],0x7b
\s*[a-f0-9]+:\s*62 03 95 40 52 f4 7b\s+vminmaxpd zmm30,zmm29,zmm28,0x7b
\s*[a-f0-9]+:\s*62 23 95 47 52 b4 f5 00 00 00 10 7b\s+vminmaxpd zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 63 95 40 52 71 7f 7b\s+vminmaxpd zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\],0x7b
\s*[a-f0-9]+:\s*62 03 14 40 52 f4 7b\s+vminmaxph zmm30,zmm29,zmm28,0x7b
\s*[a-f0-9]+:\s*62 23 14 47 52 b4 f5 00 00 00 10 7b\s+vminmaxph zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 63 14 40 52 71 7f 7b\s+vminmaxph zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\],0x7b
\s*[a-f0-9]+:\s*62 03 15 40 52 f4 7b\s+vminmaxps zmm30,zmm29,zmm28,0x7b
\s*[a-f0-9]+:\s*62 23 15 47 52 b4 f5 00 00 00 10 7b\s+vminmaxps zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 63 15 40 52 71 7f 7b\s+vminmaxps zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\],0x7b
\s*[a-f0-9]+:\s*62 43 17 50 52 31 7b\s+vminmaxbf16 zmm30,zmm29,WORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 17 d7 52 72 80 7b\s+vminmaxbf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 03 95 10 52 f4 7b\s+vminmaxpd zmm30,zmm29,zmm28\{sae\},0x7b
\s*[a-f0-9]+:\s*62 43 95 50 52 31 7b\s+vminmaxpd zmm30,zmm29,QWORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 95 d7 52 72 80 7b\s+vminmaxpd zmm30\{k7\}\{z\},zmm29,QWORD BCST \[rdx-0x400\],0x7b
\s*[a-f0-9]+:\s*62 03 14 10 52 f4 7b\s+vminmaxph zmm30,zmm29,zmm28\{sae\},0x7b
\s*[a-f0-9]+:\s*62 43 14 50 52 31 7b\s+vminmaxph zmm30,zmm29,WORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 14 d7 52 72 80 7b\s+vminmaxph zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 03 15 10 52 f4 7b\s+vminmaxps zmm30,zmm29,zmm28\{sae\},0x7b
\s*[a-f0-9]+:\s*62 43 15 50 52 31 7b\s+vminmaxps zmm30,zmm29,DWORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 15 d7 52 72 80 7b\s+vminmaxps zmm30\{k7\}\{z\},zmm29,DWORD BCST \[rdx-0x200\],0x7b
#pass

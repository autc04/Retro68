#objdump: -dw -Mintel
#name: i386 AVX10.2/512 minmax insns (Intel disassembly)
#source: avx10_2-512-miscs.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 f3 57 48 52 f4 7b\s+vminmaxbf16 zmm6,zmm5,zmm4,0x7b
\s*[a-f0-9]+:\s*62 f3 57 4f 52 b4 f4 00 00 00 10 7b\s+vminmaxbf16 zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 f3 57 48 52 71 7f 7b\s+vminmaxbf16 zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\],0x7b
\s*[a-f0-9]+:\s*62 f3 d5 48 52 f4 7b\s+vminmaxpd zmm6,zmm5,zmm4,0x7b
\s*[a-f0-9]+:\s*62 f3 d5 4f 52 b4 f4 00 00 00 10 7b\s+vminmaxpd zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 f3 d5 48 52 71 7f 7b\s+vminmaxpd zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\],0x7b
\s*[a-f0-9]+:\s*62 f3 54 48 52 f4 7b\s+vminmaxph zmm6,zmm5,zmm4,0x7b
\s*[a-f0-9]+:\s*62 f3 54 4f 52 b4 f4 00 00 00 10 7b\s+vminmaxph zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 f3 54 48 52 71 7f 7b\s+vminmaxph zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\],0x7b
\s*[a-f0-9]+:\s*62 f3 55 48 52 f4 7b\s+vminmaxps zmm6,zmm5,zmm4,0x7b
\s*[a-f0-9]+:\s*62 f3 55 4f 52 b4 f4 00 00 00 10 7b\s+vminmaxps zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 f3 55 48 52 71 7f 7b\s+vminmaxps zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\],0x7b
\s*[a-f0-9]+:\s*62 f3 57 58 52 31 7b\s+vminmaxbf16 zmm6,zmm5,WORD BCST \[ecx\],0x7b
\s*[a-f0-9]+:\s*62 f3 57 df 52 72 80 7b\s+vminmaxbf16 zmm6\{k7\}\{z\},zmm5,WORD BCST \[edx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 f3 d5 18 52 f4 7b\s+vminmaxpd zmm6,zmm5,zmm4\{sae\},0x7b
\s*[a-f0-9]+:\s*62 f3 d5 58 52 31 7b\s+vminmaxpd zmm6,zmm5,QWORD BCST \[ecx\],0x7b
\s*[a-f0-9]+:\s*62 f3 d5 df 52 72 80 7b\s+vminmaxpd zmm6\{k7\}\{z\},zmm5,QWORD BCST \[edx-0x400\],0x7b
\s*[a-f0-9]+:\s*62 f3 54 18 52 f4 7b\s+vminmaxph zmm6,zmm5,zmm4\{sae\},0x7b
\s*[a-f0-9]+:\s*62 f3 54 58 52 31 7b\s+vminmaxph zmm6,zmm5,WORD BCST \[ecx\],0x7b
\s*[a-f0-9]+:\s*62 f3 54 df 52 72 80 7b\s+vminmaxph zmm6\{k7\}\{z\},zmm5,WORD BCST \[edx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 f3 55 18 52 f4 7b\s+vminmaxps zmm6,zmm5,zmm4\{sae\},0x7b
\s*[a-f0-9]+:\s*62 f3 55 58 52 31 7b\s+vminmaxps zmm6,zmm5,DWORD BCST \[ecx\],0x7b
\s*[a-f0-9]+:\s*62 f3 55 df 52 72 80 7b\s+vminmaxps zmm6\{k7\}\{z\},zmm5,DWORD BCST \[edx-0x200\],0x7b
#pass

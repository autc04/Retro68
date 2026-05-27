#objdump: -dw -Mintel
#name: i386 AVX10.2/512, SM4 insns (Intel disassembly)
#source: avx10_2-512-sm4.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 f2 56 48 da f4\s+vsm4key4 zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f2 56 48 da b4 f4 00 00 00 10\s+vsm4key4 zmm6,zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 56 48 da 31\s+vsm4key4 zmm6,zmm5,ZMMWORD PTR \[ecx\]
\s*[a-f0-9]+:\s*62 f2 56 48 da 71 7f\s+vsm4key4 zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f2 56 48 da 72 80\s+vsm4key4 zmm6,zmm5,ZMMWORD PTR \[edx-0x2000\]
\s*[a-f0-9]+:\s*62 f2 57 48 da f4\s+vsm4rnds4 zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f2 57 48 da b4 f4 00 00 00 10\s+vsm4rnds4 zmm6,zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 57 48 da 31\s+vsm4rnds4 zmm6,zmm5,ZMMWORD PTR \[ecx\]
\s*[a-f0-9]+:\s*62 f2 57 48 da 71 7f\s+vsm4rnds4 zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f2 57 48 da 72 80\s+vsm4rnds4 zmm6,zmm5,ZMMWORD PTR \[edx-0x2000\]
#pass

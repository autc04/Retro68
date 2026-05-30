#objdump: -dw -Mintel
#name: x86_64 AVX10.2/512 media insns (Intel disassembly)
#source: x86-64-avx10_2-512-media.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 02 17 40 50 f4\s+vpdpbssd zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 22 17 47 50 b4 f5 00 00 00 10\s+vpdpbssd zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 17 50 50 31\s+vpdpbssd zmm30,zmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 17 40 50 71 7f\s+vpdpbssd zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 62 17 d7 50 72 80\s+vpdpbssd zmm30\{k7\}\{z\},zmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 17 40 51 f4\s+vpdpbssds zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 22 17 47 51 b4 f5 00 00 00 10\s+vpdpbssds zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 17 50 51 31\s+vpdpbssds zmm30,zmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 17 40 51 71 7f\s+vpdpbssds zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 62 17 d7 51 72 80\s+vpdpbssds zmm30\{k7\}\{z\},zmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 16 40 50 f4\s+vpdpbsud zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 22 16 47 50 b4 f5 00 00 00 10\s+vpdpbsud zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 16 50 50 31\s+vpdpbsud zmm30,zmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 16 40 50 71 7f\s+vpdpbsud zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 62 16 d7 50 72 80\s+vpdpbsud zmm30\{k7\}\{z\},zmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 16 40 51 f4\s+vpdpbsuds zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 22 16 47 51 b4 f5 00 00 00 10\s+vpdpbsuds zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 16 50 51 31\s+vpdpbsuds zmm30,zmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 16 40 51 71 7f\s+vpdpbsuds zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 62 16 d7 51 72 80\s+vpdpbsuds zmm30\{k7\}\{z\},zmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 14 40 50 f4\s+vpdpbuud zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 22 14 47 50 b4 f5 00 00 00 10\s+vpdpbuud zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 14 50 50 31\s+vpdpbuud zmm30,zmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 14 40 50 71 7f\s+vpdpbuud zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 62 14 d7 50 72 80\s+vpdpbuud zmm30\{k7\}\{z\},zmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 14 40 51 f4\s+vpdpbuuds zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 22 14 47 51 b4 f5 00 00 00 10\s+vpdpbuuds zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 14 50 51 31\s+vpdpbuuds zmm30,zmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 14 40 51 71 7f\s+vpdpbuuds zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 62 14 d7 51 72 80\s+vpdpbuuds zmm30\{k7\}\{z\},zmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 16 40 d2 f4\s+vpdpwsud zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 22 16 47 d2 b4 f5 00 00 00 10\s+vpdpwsud zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 16 50 d2 31\s+vpdpwsud zmm30,zmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 16 40 d2 71 7f\s+vpdpwsud zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 62 16 d7 d2 72 80\s+vpdpwsud zmm30\{k7\}\{z\},zmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 16 40 d3 f4\s+vpdpwsuds zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 22 16 47 d3 b4 f5 00 00 00 10\s+vpdpwsuds zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 16 50 d3 31\s+vpdpwsuds zmm30,zmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 16 40 d3 71 7f\s+vpdpwsuds zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 62 16 d7 d3 72 80\s+vpdpwsuds zmm30\{k7\}\{z\},zmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 15 40 d2 f4\s+vpdpwusd zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 22 15 47 d2 b4 f5 00 00 00 10\s+vpdpwusd zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 15 50 d2 31\s+vpdpwusd zmm30,zmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 15 40 d2 71 7f\s+vpdpwusd zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 62 15 d7 d2 72 80\s+vpdpwusd zmm30\{k7\}\{z\},zmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 15 40 d3 f4\s+vpdpwusds zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 22 15 47 d3 b4 f5 00 00 00 10\s+vpdpwusds zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 15 50 d3 31\s+vpdpwusds zmm30,zmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 15 40 d3 71 7f\s+vpdpwusds zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 62 15 d7 d3 72 80\s+vpdpwusds zmm30\{k7\}\{z\},zmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 14 40 d2 f4\s+vpdpwuud zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 22 14 47 d2 b4 f5 00 00 00 10\s+vpdpwuud zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 14 50 d2 31\s+vpdpwuud zmm30,zmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 14 40 d2 71 7f\s+vpdpwuud zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 62 14 d7 d2 72 80\s+vpdpwuud zmm30\{k7\}\{z\},zmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 14 40 d3 f4\s+vpdpwuuds zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 22 14 47 d3 b4 f5 00 00 00 10\s+vpdpwuuds zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 14 50 d3 31\s+vpdpwuuds zmm30,zmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 14 40 d3 71 7f\s+vpdpwuuds zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 62 14 d7 d3 72 80\s+vpdpwuuds zmm30\{k7\}\{z\},zmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 14 40 52 f4\s+vdpphps zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 22 14 47 52 b4 f5 00 00 00 10\s+vdpphps zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 14 50 52 31\s+vdpphps zmm30,zmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 14 40 52 71 7f\s+vdpphps zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 62 14 d7 52 72 80\s+vdpphps zmm30\{k7\}\{z\},zmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 03 16 40 42 f4 7b\s+vmpsadbw zmm30,zmm29,zmm28,0x7b
\s*[a-f0-9]+:\s*62 23 16 47 42 b4 f5 00 00 00 10 7b\s+vmpsadbw zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 43 16 40 42 31 7b\s+vmpsadbw zmm30,zmm29,ZMMWORD PTR \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 16 40 42 71 7f 7b\s+vmpsadbw zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\],0x7b
\s*[a-f0-9]+:\s*62 63 16 c7 42 72 80 7b\s+vmpsadbw zmm30\{k7\}\{z\},zmm29,ZMMWORD PTR \[rdx-0x2000\],0x7b
#pass

#objdump: -dw -Mintel
#name: x86_64 AVX10.2/256 media insns (Intel disassembly)
#source: x86-64-avx10_2-256-media.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 02 17 20 50 f4\s+vpdpbssd ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 02 17 00 50 f4\s+vpdpbssd xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 22 17 27 50 b4 f5 00 00 00 10\s+vpdpbssd ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 17 30 50 31\s+vpdpbssd ymm30,ymm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 17 20 50 71 7f\s+vpdpbssd ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 62 17 b7 50 72 80\s+vpdpbssd ymm30\{k7\}\{z\},ymm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 22 17 07 50 b4 f5 00 00 00 10\s+vpdpbssd xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 17 10 50 31\s+vpdpbssd xmm30,xmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 17 00 50 71 7f\s+vpdpbssd xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 62 17 97 50 72 80\s+vpdpbssd xmm30\{k7\}\{z\},xmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 17 20 51 f4\s+vpdpbssds ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 02 17 00 51 f4\s+vpdpbssds xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 22 17 27 51 b4 f5 00 00 00 10\s+vpdpbssds ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 17 30 51 31\s+vpdpbssds ymm30,ymm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 17 20 51 71 7f\s+vpdpbssds ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 62 17 b7 51 72 80\s+vpdpbssds ymm30\{k7\}\{z\},ymm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 22 17 07 51 b4 f5 00 00 00 10\s+vpdpbssds xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 17 10 51 31\s+vpdpbssds xmm30,xmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 17 00 51 71 7f\s+vpdpbssds xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 62 17 97 51 72 80\s+vpdpbssds xmm30\{k7\}\{z\},xmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 16 20 50 f4\s+vpdpbsud ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 02 16 00 50 f4\s+vpdpbsud xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 22 16 27 50 b4 f5 00 00 00 10\s+vpdpbsud ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 16 30 50 31\s+vpdpbsud ymm30,ymm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 16 20 50 71 7f\s+vpdpbsud ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 62 16 b7 50 72 80\s+vpdpbsud ymm30\{k7\}\{z\},ymm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 22 16 07 50 b4 f5 00 00 00 10\s+vpdpbsud xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 16 10 50 31\s+vpdpbsud xmm30,xmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 16 00 50 71 7f\s+vpdpbsud xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 62 16 97 50 72 80\s+vpdpbsud xmm30\{k7\}\{z\},xmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 16 20 51 f4\s+vpdpbsuds ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 02 16 00 51 f4\s+vpdpbsuds xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 22 16 27 51 b4 f5 00 00 00 10\s+vpdpbsuds ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 16 30 51 31\s+vpdpbsuds ymm30,ymm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 16 20 51 71 7f\s+vpdpbsuds ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 62 16 b7 51 72 80\s+vpdpbsuds ymm30\{k7\}\{z\},ymm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 22 16 07 51 b4 f5 00 00 00 10\s+vpdpbsuds xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 16 10 51 31\s+vpdpbsuds xmm30,xmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 16 00 51 71 7f\s+vpdpbsuds xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 62 16 97 51 72 80\s+vpdpbsuds xmm30\{k7\}\{z\},xmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 14 20 50 f4\s+vpdpbuud ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 02 14 00 50 f4\s+vpdpbuud xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 22 14 27 50 b4 f5 00 00 00 10\s+vpdpbuud ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 14 30 50 31\s+vpdpbuud ymm30,ymm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 14 20 50 71 7f\s+vpdpbuud ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 62 14 b7 50 72 80\s+vpdpbuud ymm30\{k7\}\{z\},ymm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 22 14 07 50 b4 f5 00 00 00 10\s+vpdpbuud xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 14 10 50 31\s+vpdpbuud xmm30,xmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 14 00 50 71 7f\s+vpdpbuud xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 62 14 97 50 72 80\s+vpdpbuud xmm30\{k7\}\{z\},xmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 14 20 51 f4\s+vpdpbuuds ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 02 14 00 51 f4\s+vpdpbuuds xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 22 14 27 51 b4 f5 00 00 00 10\s+vpdpbuuds ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 14 30 51 31\s+vpdpbuuds ymm30,ymm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 14 20 51 71 7f\s+vpdpbuuds ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 62 14 b7 51 72 80\s+vpdpbuuds ymm30\{k7\}\{z\},ymm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 22 14 07 51 b4 f5 00 00 00 10\s+vpdpbuuds xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 14 10 51 31\s+vpdpbuuds xmm30,xmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 14 00 51 71 7f\s+vpdpbuuds xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 62 14 97 51 72 80\s+vpdpbuuds xmm30\{k7\}\{z\},xmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 16 20 d2 f4\s+vpdpwsud ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 02 16 00 d2 f4\s+vpdpwsud xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 22 16 27 d2 b4 f5 00 00 00 10\s+vpdpwsud ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 16 30 d2 31\s+vpdpwsud ymm30,ymm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 16 20 d2 71 7f\s+vpdpwsud ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 62 16 b7 d2 72 80\s+vpdpwsud ymm30\{k7\}\{z\},ymm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 22 16 07 d2 b4 f5 00 00 00 10\s+vpdpwsud xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 16 10 d2 31\s+vpdpwsud xmm30,xmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 16 00 d2 71 7f\s+vpdpwsud xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 62 16 97 d2 72 80\s+vpdpwsud xmm30\{k7\}\{z\},xmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 16 20 d3 f4\s+vpdpwsuds ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 02 16 00 d3 f4\s+vpdpwsuds xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 22 16 27 d3 b4 f5 00 00 00 10\s+vpdpwsuds ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 16 30 d3 31\s+vpdpwsuds ymm30,ymm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 16 20 d3 71 7f\s+vpdpwsuds ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 62 16 b7 d3 72 80\s+vpdpwsuds ymm30\{k7\}\{z\},ymm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 22 16 07 d3 b4 f5 00 00 00 10\s+vpdpwsuds xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 16 10 d3 31\s+vpdpwsuds xmm30,xmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 16 00 d3 71 7f\s+vpdpwsuds xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 62 16 97 d3 72 80\s+vpdpwsuds xmm30\{k7\}\{z\},xmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 15 20 d2 f4\s+vpdpwusd ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 02 15 00 d2 f4\s+vpdpwusd xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 22 15 27 d2 b4 f5 00 00 00 10\s+vpdpwusd ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 15 30 d2 31\s+vpdpwusd ymm30,ymm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 15 20 d2 71 7f\s+vpdpwusd ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 62 15 b7 d2 72 80\s+vpdpwusd ymm30\{k7\}\{z\},ymm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 22 15 07 d2 b4 f5 00 00 00 10\s+vpdpwusd xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 15 10 d2 31\s+vpdpwusd xmm30,xmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 15 00 d2 71 7f\s+vpdpwusd xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 62 15 97 d2 72 80\s+vpdpwusd xmm30\{k7\}\{z\},xmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 15 20 d3 f4\s+vpdpwusds ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 02 15 00 d3 f4\s+vpdpwusds xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 22 15 27 d3 b4 f5 00 00 00 10\s+vpdpwusds ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 15 30 d3 31\s+vpdpwusds ymm30,ymm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 15 20 d3 71 7f\s+vpdpwusds ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 62 15 b7 d3 72 80\s+vpdpwusds ymm30\{k7\}\{z\},ymm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 22 15 07 d3 b4 f5 00 00 00 10\s+vpdpwusds xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 15 10 d3 31\s+vpdpwusds xmm30,xmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 15 00 d3 71 7f\s+vpdpwusds xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 62 15 97 d3 72 80\s+vpdpwusds xmm30\{k7\}\{z\},xmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 14 20 d2 f4\s+vpdpwuud ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 02 14 00 d2 f4\s+vpdpwuud xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 22 14 27 d2 b4 f5 00 00 00 10\s+vpdpwuud ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 14 30 d2 31\s+vpdpwuud ymm30,ymm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 14 20 d2 71 7f\s+vpdpwuud ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 62 14 b7 d2 72 80\s+vpdpwuud ymm30\{k7\}\{z\},ymm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 22 14 07 d2 b4 f5 00 00 00 10\s+vpdpwuud xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 14 10 d2 31\s+vpdpwuud xmm30,xmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 14 00 d2 71 7f\s+vpdpwuud xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 62 14 97 d2 72 80\s+vpdpwuud xmm30\{k7\}\{z\},xmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 14 20 d3 f4\s+vpdpwuuds ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 02 14 00 d3 f4\s+vpdpwuuds xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 22 14 27 d3 b4 f5 00 00 00 10\s+vpdpwuuds ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 14 30 d3 31\s+vpdpwuuds ymm30,ymm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 14 20 d3 71 7f\s+vpdpwuuds ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 62 14 b7 d3 72 80\s+vpdpwuuds ymm30\{k7\}\{z\},ymm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 22 14 07 d3 b4 f5 00 00 00 10\s+vpdpwuuds xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 14 10 d3 31\s+vpdpwuuds xmm30,xmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 14 00 d3 71 7f\s+vpdpwuuds xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 62 14 97 d3 72 80\s+vpdpwuuds xmm30\{k7\}\{z\},xmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 02 14 20 52 f4\s+vdpphps ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 02 14 00 52 f4\s+vdpphps xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 22 14 27 52 b4 f5 00 00 00 10\s+vdpphps ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 14 30 52 31\s+vdpphps ymm30,ymm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 14 20 52 71 7f\s+vdpphps ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 62 14 b7 52 72 80\s+vdpphps ymm30\{k7\}\{z\},ymm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 22 14 07 52 b4 f5 00 00 00 10\s+vdpphps xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 42 14 10 52 31\s+vdpphps xmm30,xmm29,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 62 14 00 52 71 7f\s+vdpphps xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 62 14 97 52 72 80\s+vdpphps xmm30\{k7\}\{z\},xmm29,DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 03 16 00 42 f4 7b\s+vmpsadbw xmm30,xmm29,xmm28,0x7b
\s*[a-f0-9]+:\s*62 03 16 20 42 f4 7b\s+vmpsadbw ymm30,ymm29,ymm28,0x7b
\s*[a-f0-9]+:\s*62 23 16 27 42 b4 f5 00 00 00 10 7b\s+vmpsadbw ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 43 16 20 42 31 7b\s+vmpsadbw ymm30,ymm29,YMMWORD PTR \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 16 20 42 71 7f 7b\s+vmpsadbw ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\],0x7b
\s*[a-f0-9]+:\s*62 63 16 a7 42 72 80 7b\s+vmpsadbw ymm30\{k7\}\{z\},ymm29,YMMWORD PTR \[rdx-0x1000\],0x7b
\s*[a-f0-9]+:\s*62 23 16 07 42 b4 f5 00 00 00 10 7b\s+vmpsadbw xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 43 16 00 42 31 7b\s+vmpsadbw xmm30,xmm29,XMMWORD PTR \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 16 00 42 71 7f 7b\s+vmpsadbw xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\],0x7b
\s*[a-f0-9]+:\s*62 63 16 87 42 72 80 7b\s+vmpsadbw xmm30\{k7\}\{z\},xmm29,XMMWORD PTR \[rdx-0x800\],0x7b
#pass

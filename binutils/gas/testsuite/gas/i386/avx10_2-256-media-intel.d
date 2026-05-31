#objdump: -dw -Mintel
#name: i386 AVX10.2/256 media insns (Intel disassembly)
#source: avx10_2-256-media.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 f2 57 2f 50 f4\s+vpdpbssd ymm6\{k7\},ymm5,ymm4
\s*[a-f0-9]+:\s*62 f2 57 0f 50 f4\s+vpdpbssd xmm6\{k7\},xmm5,xmm4
\s*[a-f0-9]+:\s*62 f2 57 2f 50 b4 f4 00 00 00 10\s+vpdpbssd ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 57 38 50 31\s+vpdpbssd ymm6,ymm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 57 2f 50 71 7f\s+vpdpbssd ymm6\{k7\},ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f2 57 bf 50 72 80\s+vpdpbssd ymm6\{k7\}\{z\},ymm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 57 0f 50 b4 f4 00 00 00 10\s+vpdpbssd xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 57 18 50 31\s+vpdpbssd xmm6,xmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 57 0f 50 71 7f\s+vpdpbssd xmm6\{k7\},xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f2 57 9f 50 72 80\s+vpdpbssd xmm6\{k7\}\{z\},xmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 57 2f 51 f4\s+vpdpbssds ymm6\{k7\},ymm5,ymm4
\s*[a-f0-9]+:\s*62 f2 57 0f 51 f4\s+vpdpbssds xmm6\{k7\},xmm5,xmm4
\s*[a-f0-9]+:\s*62 f2 57 2f 51 b4 f4 00 00 00 10\s+vpdpbssds ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 57 38 51 31\s+vpdpbssds ymm6,ymm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 57 2f 51 71 7f\s+vpdpbssds ymm6\{k7\},ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f2 57 bf 51 72 80\s+vpdpbssds ymm6\{k7\}\{z\},ymm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 57 0f 51 b4 f4 00 00 00 10\s+vpdpbssds xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 57 18 51 31\s+vpdpbssds xmm6,xmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 57 0f 51 71 7f\s+vpdpbssds xmm6\{k7\},xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f2 57 9f 51 72 80\s+vpdpbssds xmm6\{k7\}\{z\},xmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 56 2f 50 f4\s+vpdpbsud ymm6\{k7\},ymm5,ymm4
\s*[a-f0-9]+:\s*62 f2 56 0f 50 f4\s+vpdpbsud xmm6\{k7\},xmm5,xmm4
\s*[a-f0-9]+:\s*62 f2 56 2f 50 b4 f4 00 00 00 10\s+vpdpbsud ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 56 38 50 31\s+vpdpbsud ymm6,ymm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 56 2f 50 71 7f\s+vpdpbsud ymm6\{k7\},ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f2 56 bf 50 72 80\s+vpdpbsud ymm6\{k7\}\{z\},ymm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 56 0f 50 b4 f4 00 00 00 10\s+vpdpbsud xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 56 18 50 31\s+vpdpbsud xmm6,xmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 56 0f 50 71 7f\s+vpdpbsud xmm6\{k7\},xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f2 56 9f 50 72 80\s+vpdpbsud xmm6\{k7\}\{z\},xmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 56 2f 51 f4\s+vpdpbsuds ymm6\{k7\},ymm5,ymm4
\s*[a-f0-9]+:\s*62 f2 56 0f 51 f4\s+vpdpbsuds xmm6\{k7\},xmm5,xmm4
\s*[a-f0-9]+:\s*62 f2 56 2f 51 b4 f4 00 00 00 10\s+vpdpbsuds ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 56 38 51 31\s+vpdpbsuds ymm6,ymm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 56 2f 51 71 7f\s+vpdpbsuds ymm6\{k7\},ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f2 56 bf 51 72 80\s+vpdpbsuds ymm6\{k7\}\{z\},ymm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 56 0f 51 b4 f4 00 00 00 10\s+vpdpbsuds xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 56 18 51 31\s+vpdpbsuds xmm6,xmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 56 0f 51 71 7f\s+vpdpbsuds xmm6\{k7\},xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f2 56 9f 51 72 80\s+vpdpbsuds xmm6\{k7\}\{z\},xmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 54 2f 50 f4\s+vpdpbuud ymm6\{k7\},ymm5,ymm4
\s*[a-f0-9]+:\s*62 f2 54 0f 50 f4\s+vpdpbuud xmm6\{k7\},xmm5,xmm4
\s*[a-f0-9]+:\s*62 f2 54 2f 50 b4 f4 00 00 00 10\s+vpdpbuud ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 54 38 50 31\s+vpdpbuud ymm6,ymm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 54 2f 50 71 7f\s+vpdpbuud ymm6\{k7\},ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f2 54 bf 50 72 80\s+vpdpbuud ymm6\{k7\}\{z\},ymm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 54 0f 50 b4 f4 00 00 00 10\s+vpdpbuud xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 54 18 50 31\s+vpdpbuud xmm6,xmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 54 0f 50 71 7f\s+vpdpbuud xmm6\{k7\},xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f2 54 9f 50 72 80\s+vpdpbuud xmm6\{k7\}\{z\},xmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 54 2f 51 f4\s+vpdpbuuds ymm6\{k7\},ymm5,ymm4
\s*[a-f0-9]+:\s*62 f2 54 0f 51 f4\s+vpdpbuuds xmm6\{k7\},xmm5,xmm4
\s*[a-f0-9]+:\s*62 f2 54 2f 51 b4 f4 00 00 00 10\s+vpdpbuuds ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 54 38 51 31\s+vpdpbuuds ymm6,ymm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 54 2f 51 71 7f\s+vpdpbuuds ymm6\{k7\},ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f2 54 bf 51 72 80\s+vpdpbuuds ymm6\{k7\}\{z\},ymm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 54 0f 51 b4 f4 00 00 00 10\s+vpdpbuuds xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 54 18 51 31\s+vpdpbuuds xmm6,xmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 54 0f 51 71 7f\s+vpdpbuuds xmm6\{k7\},xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f2 54 9f 51 72 80\s+vpdpbuuds xmm6\{k7\}\{z\},xmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 56 2f d2 f4\s+vpdpwsud ymm6\{k7\},ymm5,ymm4
\s*[a-f0-9]+:\s*62 f2 56 0f d2 f4\s+vpdpwsud xmm6\{k7\},xmm5,xmm4
\s*[a-f0-9]+:\s*62 f2 56 2f d2 b4 f4 00 00 00 10\s+vpdpwsud ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 56 38 d2 31\s+vpdpwsud ymm6,ymm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 56 2f d2 71 7f\s+vpdpwsud ymm6\{k7\},ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f2 56 bf d2 72 80\s+vpdpwsud ymm6\{k7\}\{z\},ymm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 56 0f d2 b4 f4 00 00 00 10\s+vpdpwsud xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 56 18 d2 31\s+vpdpwsud xmm6,xmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 56 0f d2 71 7f\s+vpdpwsud xmm6\{k7\},xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f2 56 9f d2 72 80\s+vpdpwsud xmm6\{k7\}\{z\},xmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 56 2f d3 f4\s+vpdpwsuds ymm6\{k7\},ymm5,ymm4
\s*[a-f0-9]+:\s*62 f2 56 0f d3 f4\s+vpdpwsuds xmm6\{k7\},xmm5,xmm4
\s*[a-f0-9]+:\s*62 f2 56 2f d3 b4 f4 00 00 00 10\s+vpdpwsuds ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 56 38 d3 31\s+vpdpwsuds ymm6,ymm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 56 2f d3 71 7f\s+vpdpwsuds ymm6\{k7\},ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f2 56 bf d3 72 80\s+vpdpwsuds ymm6\{k7\}\{z\},ymm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 56 0f d3 b4 f4 00 00 00 10\s+vpdpwsuds xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 56 18 d3 31\s+vpdpwsuds xmm6,xmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 56 0f d3 71 7f\s+vpdpwsuds xmm6\{k7\},xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f2 56 9f d3 72 80\s+vpdpwsuds xmm6\{k7\}\{z\},xmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 55 2f d2 f4\s+vpdpwusd ymm6\{k7\},ymm5,ymm4
\s*[a-f0-9]+:\s*62 f2 55 0f d2 f4\s+vpdpwusd xmm6\{k7\},xmm5,xmm4
\s*[a-f0-9]+:\s*62 f2 55 2f d2 b4 f4 00 00 00 10\s+vpdpwusd ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 55 38 d2 31\s+vpdpwusd ymm6,ymm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 55 2f d2 71 7f\s+vpdpwusd ymm6\{k7\},ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f2 55 bf d2 72 80\s+vpdpwusd ymm6\{k7\}\{z\},ymm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 55 0f d2 b4 f4 00 00 00 10\s+vpdpwusd xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 55 18 d2 31\s+vpdpwusd xmm6,xmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 55 0f d2 71 7f\s+vpdpwusd xmm6\{k7\},xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f2 55 9f d2 72 80\s+vpdpwusd xmm6\{k7\}\{z\},xmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 55 2f d3 f4\s+vpdpwusds ymm6\{k7\},ymm5,ymm4
\s*[a-f0-9]+:\s*62 f2 55 0f d3 f4\s+vpdpwusds xmm6\{k7\},xmm5,xmm4
\s*[a-f0-9]+:\s*62 f2 55 2f d3 b4 f4 00 00 00 10\s+vpdpwusds ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 55 38 d3 31\s+vpdpwusds ymm6,ymm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 55 2f d3 71 7f\s+vpdpwusds ymm6\{k7\},ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f2 55 bf d3 72 80\s+vpdpwusds ymm6\{k7\}\{z\},ymm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 55 0f d3 b4 f4 00 00 00 10\s+vpdpwusds xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 55 18 d3 31\s+vpdpwusds xmm6,xmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 55 0f d3 71 7f\s+vpdpwusds xmm6\{k7\},xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f2 55 9f d3 72 80\s+vpdpwusds xmm6\{k7\}\{z\},xmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 54 2f d2 f4\s+vpdpwuud ymm6\{k7\},ymm5,ymm4
\s*[a-f0-9]+:\s*62 f2 54 0f d2 f4\s+vpdpwuud xmm6\{k7\},xmm5,xmm4
\s*[a-f0-9]+:\s*62 f2 54 2f d2 b4 f4 00 00 00 10\s+vpdpwuud ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 54 38 d2 31\s+vpdpwuud ymm6,ymm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 54 2f d2 71 7f\s+vpdpwuud ymm6\{k7\},ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f2 54 bf d2 72 80\s+vpdpwuud ymm6\{k7\}\{z\},ymm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 54 0f d2 b4 f4 00 00 00 10\s+vpdpwuud xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 54 18 d2 31\s+vpdpwuud xmm6,xmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 54 0f d2 71 7f\s+vpdpwuud xmm6\{k7\},xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f2 54 9f d2 72 80\s+vpdpwuud xmm6\{k7\}\{z\},xmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 54 2f d3 f4\s+vpdpwuuds ymm6\{k7\},ymm5,ymm4
\s*[a-f0-9]+:\s*62 f2 54 0f d3 f4\s+vpdpwuuds xmm6\{k7\},xmm5,xmm4
\s*[a-f0-9]+:\s*62 f2 54 2f d3 b4 f4 00 00 00 10\s+vpdpwuuds ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 54 38 d3 31\s+vpdpwuuds ymm6,ymm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 54 2f d3 71 7f\s+vpdpwuuds ymm6\{k7\},ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f2 54 bf d3 72 80\s+vpdpwuuds ymm6\{k7\}\{z\},ymm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 54 0f d3 b4 f4 00 00 00 10\s+vpdpwuuds xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 54 18 d3 31\s+vpdpwuuds xmm6,xmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 54 0f d3 71 7f\s+vpdpwuuds xmm6\{k7\},xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f2 54 9f d3 72 80\s+vpdpwuuds xmm6\{k7\}\{z\},xmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 54 2f 52 f4\s+vdpphps ymm6\{k7\},ymm5,ymm4
\s*[a-f0-9]+:\s*62 f2 54 0f 52 f4\s+vdpphps xmm6\{k7\},xmm5,xmm4
\s*[a-f0-9]+:\s*62 f2 54 2f 52 b4 f4 00 00 00 10\s+vdpphps ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 54 38 52 31\s+vdpphps ymm6,ymm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 54 2f 52 71 7f\s+vdpphps ymm6\{k7\},ymm5,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f2 54 bf 52 72 80\s+vdpphps ymm6\{k7\}\{z\},ymm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 54 0f 52 b4 f4 00 00 00 10\s+vdpphps xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 54 18 52 31\s+vdpphps xmm6,xmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 54 0f 52 71 7f\s+vdpphps xmm6\{k7\},xmm5,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f2 54 9f 52 72 80\s+vdpphps xmm6\{k7\}\{z\},xmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f3 56 0f 42 f4 7b\s+vmpsadbw xmm6\{k7\},xmm5,xmm4,0x7b
\s*[a-f0-9]+:\s*62 f3 56 2f 42 f4 7b\s+vmpsadbw ymm6\{k7\},ymm5,ymm4,0x7b
\s*[a-f0-9]+:\s*62 f3 56 2f 42 b4 f4 00 00 00 10 7b\s+vmpsadbw ymm6\{k7\},ymm5,YMMWORD PTR \[esp\+esi\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 f3 56 2f 42 31 7b\s+vmpsadbw ymm6\{k7\},ymm5,YMMWORD PTR \[ecx\],0x7b
\s*[a-f0-9]+:\s*62 f3 56 2f 42 71 7f 7b\s+vmpsadbw ymm6\{k7\},ymm5,YMMWORD PTR \[ecx\+0xfe0\],0x7b
\s*[a-f0-9]+:\s*62 f3 56 af 42 72 80 7b\s+vmpsadbw ymm6\{k7\}\{z\},ymm5,YMMWORD PTR \[edx-0x1000\],0x7b
\s*[a-f0-9]+:\s*62 f3 56 0f 42 b4 f4 00 00 00 10 7b\s+vmpsadbw xmm6\{k7\},xmm5,XMMWORD PTR \[esp\+esi\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 f3 56 0f 42 31 7b\s+vmpsadbw xmm6\{k7\},xmm5,XMMWORD PTR \[ecx\],0x7b
\s*[a-f0-9]+:\s*62 f3 56 0f 42 71 7f 7b\s+vmpsadbw xmm6\{k7\},xmm5,XMMWORD PTR \[ecx\+0x7f0\],0x7b
\s*[a-f0-9]+:\s*62 f3 56 8f 42 72 80 7b\s+vmpsadbw xmm6\{k7\}\{z\},xmm5,XMMWORD PTR \[edx-0x800\],0x7b
#pass

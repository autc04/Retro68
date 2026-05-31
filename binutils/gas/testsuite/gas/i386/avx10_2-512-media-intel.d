#objdump: -dw -Mintel
#name: i386 AVX10.2/512 media insns (Intel disassembly)
#source: avx10_2-512-media.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 f2 57 48 50 f4\s+vpdpbssd zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f2 57 4f 50 b4 f4 00 00 00 10\s+vpdpbssd zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 57 58 50 31\s+vpdpbssd zmm6,zmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 57 48 50 71 7f\s+vpdpbssd zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f2 57 df 50 72 80\s+vpdpbssd zmm6\{k7\}\{z\},zmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 57 48 51 f4\s+vpdpbssds zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f2 57 4f 51 b4 f4 00 00 00 10\s+vpdpbssds zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 57 58 51 31\s+vpdpbssds zmm6,zmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 57 48 51 71 7f\s+vpdpbssds zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f2 57 df 51 72 80\s+vpdpbssds zmm6\{k7\}\{z\},zmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 56 48 50 f4\s+vpdpbsud zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f2 56 4f 50 b4 f4 00 00 00 10\s+vpdpbsud zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 56 58 50 31\s+vpdpbsud zmm6,zmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 56 48 50 71 7f\s+vpdpbsud zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f2 56 df 50 72 80\s+vpdpbsud zmm6\{k7\}\{z\},zmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 56 48 51 f4\s+vpdpbsuds zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f2 56 4f 51 b4 f4 00 00 00 10\s+vpdpbsuds zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 56 58 51 31\s+vpdpbsuds zmm6,zmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 56 48 51 71 7f\s+vpdpbsuds zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f2 56 df 51 72 80\s+vpdpbsuds zmm6\{k7\}\{z\},zmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 54 48 50 f4\s+vpdpbuud zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f2 54 4f 50 b4 f4 00 00 00 10\s+vpdpbuud zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 54 58 50 31\s+vpdpbuud zmm6,zmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 54 48 50 71 7f\s+vpdpbuud zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f2 54 df 50 72 80\s+vpdpbuud zmm6\{k7\}\{z\},zmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 54 48 51 f4\s+vpdpbuuds zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f2 54 4f 51 b4 f4 00 00 00 10\s+vpdpbuuds zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 54 58 51 31\s+vpdpbuuds zmm6,zmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 54 48 51 71 7f\s+vpdpbuuds zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f2 54 df 51 72 80\s+vpdpbuuds zmm6\{k7\}\{z\},zmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 56 48 d2 f4\s+vpdpwsud zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f2 56 4f d2 b4 f4 00 00 00 10\s+vpdpwsud zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 56 58 d2 31\s+vpdpwsud zmm6,zmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 56 48 d2 71 7f\s+vpdpwsud zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f2 56 df d2 72 80\s+vpdpwsud zmm6\{k7\}\{z\},zmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 56 48 d3 f4\s+vpdpwsuds zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f2 56 4f d3 b4 f4 00 00 00 10\s+vpdpwsuds zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 56 58 d3 31\s+vpdpwsuds zmm6,zmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 56 48 d3 71 7f\s+vpdpwsuds zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f2 56 df d3 72 80\s+vpdpwsuds zmm6\{k7\}\{z\},zmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 55 48 d2 f4\s+vpdpwusd zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f2 55 4f d2 b4 f4 00 00 00 10\s+vpdpwusd zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 55 58 d2 31\s+vpdpwusd zmm6,zmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 55 48 d2 71 7f\s+vpdpwusd zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f2 55 df d2 72 80\s+vpdpwusd zmm6\{k7\}\{z\},zmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 55 48 d3 f4\s+vpdpwusds zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f2 55 4f d3 b4 f4 00 00 00 10\s+vpdpwusds zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 55 58 d3 31\s+vpdpwusds zmm6,zmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 55 48 d3 71 7f\s+vpdpwusds zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f2 55 df d3 72 80\s+vpdpwusds zmm6\{k7\}\{z\},zmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 54 48 d2 f4\s+vpdpwuud zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f2 54 4f d2 b4 f4 00 00 00 10\s+vpdpwuud zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 54 58 d2 31\s+vpdpwuud zmm6,zmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 54 48 d2 71 7f\s+vpdpwuud zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f2 54 df d2 72 80\s+vpdpwuud zmm6\{k7\}\{z\},zmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 54 48 d3 f4\s+vpdpwuuds zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f2 54 4f d3 b4 f4 00 00 00 10\s+vpdpwuuds zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 54 58 d3 31\s+vpdpwuuds zmm6,zmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 54 48 d3 71 7f\s+vpdpwuuds zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f2 54 df d3 72 80\s+vpdpwuuds zmm6\{k7\}\{z\},zmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f2 54 48 52 f4\s+vdpphps zmm6,zmm5,zmm4
\s*[a-f0-9]+:\s*62 f2 54 4f 52 b4 f4 00 00 00 10\s+vdpphps zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f2 54 58 52 31\s+vdpphps zmm6,zmm5,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f2 54 48 52 71 7f\s+vdpphps zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 f2 54 df 52 72 80\s+vdpphps zmm6\{k7\}\{z\},zmm5,DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f3 56 48 42 f4 7b\s+vmpsadbw zmm6,zmm5,zmm4,0x7b
\s*[a-f0-9]+:\s*62 f3 56 4f 42 b4 f4 00 00 00 10 7b\s+vmpsadbw zmm6\{k7\},zmm5,ZMMWORD PTR \[esp\+esi\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 f3 56 48 42 31 7b\s+vmpsadbw zmm6,zmm5,ZMMWORD PTR \[ecx\],0x7b
\s*[a-f0-9]+:\s*62 f3 56 48 42 71 7f 7b\s+vmpsadbw zmm6,zmm5,ZMMWORD PTR \[ecx\+0x1fc0\],0x7b
\s*[a-f0-9]+:\s*62 f3 56 cf 42 72 80 7b\s+vmpsadbw zmm6\{k7\}\{z\},zmm5,ZMMWORD PTR \[edx-0x2000\],0x7b
#pass

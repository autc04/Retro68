#objdump: -dw -Mintel
#name: x86_64 AVX10.2/256 BF16 insns (Intel disassembly)
#source: x86-64-avx10_2-256-bf16.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 05 15 20 58 f4\s+vaddbf16 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 05 15 00 58 f4\s+vaddbf16 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 25 15 27 58 b4 f5 00 00 00 10\s+vaddbf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 15 30 58 31\s+vaddbf16 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 15 20 58 71 7f\s+vaddbf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 15 b7 58 72 80\s+vaddbf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 15 07 58 b4 f5 00 00 00 10\s+vaddbf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 15 10 58 31\s+vaddbf16 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 15 00 58 71 7f\s+vaddbf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 15 97 58 72 80\s+vaddbf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 15 20 5e f4\s+vdivbf16 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 05 15 00 5e f4\s+vdivbf16 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 25 15 27 5e b4 f5 00 00 00 10\s+vdivbf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 15 30 5e 31\s+vdivbf16 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 15 20 5e 71 7f\s+vdivbf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 15 b7 5e 72 80\s+vdivbf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 15 07 5e b4 f5 00 00 00 10\s+vdivbf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 15 10 5e 31\s+vdivbf16 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 15 00 5e 71 7f\s+vdivbf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 15 97 5e 72 80\s+vdivbf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 15 20 5f f4\s+vmaxbf16 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 05 15 00 5f f4\s+vmaxbf16 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 25 15 27 5f b4 f5 00 00 00 10\s+vmaxbf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 15 30 5f 31\s+vmaxbf16 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 15 20 5f 71 7f\s+vmaxbf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 15 b7 5f 72 80\s+vmaxbf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 15 07 5f b4 f5 00 00 00 10\s+vmaxbf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 15 10 5f 31\s+vmaxbf16 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 15 00 5f 71 7f\s+vmaxbf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 15 97 5f 72 80\s+vmaxbf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 15 20 5d f4\s+vminbf16 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 05 15 00 5d f4\s+vminbf16 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 25 15 27 5d b4 f5 00 00 00 10\s+vminbf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 15 30 5d 31\s+vminbf16 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 15 20 5d 71 7f\s+vminbf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 15 b7 5d 72 80\s+vminbf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 15 07 5d b4 f5 00 00 00 10\s+vminbf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 15 10 5d 31\s+vminbf16 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 15 00 5d 71 7f\s+vminbf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 15 97 5d 72 80\s+vminbf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 15 20 59 f4\s+vmulbf16 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 05 15 00 59 f4\s+vmulbf16 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 25 15 27 59 b4 f5 00 00 00 10\s+vmulbf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 15 30 59 31\s+vmulbf16 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 15 20 59 71 7f\s+vmulbf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 15 b7 59 72 80\s+vmulbf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 15 07 59 b4 f5 00 00 00 10\s+vmulbf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 15 10 59 31\s+vmulbf16 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 15 00 59 71 7f\s+vmulbf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 15 97 59 72 80\s+vmulbf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 20 2c f4\s+vscalefbf16 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 06 14 00 2c f4\s+vscalefbf16 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 26 14 27 2c b4 f5 00 00 00 10\s+vscalefbf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 30 2c 31\s+vscalefbf16 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 20 2c 71 7f\s+vscalefbf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 66 14 b7 2c 72 80\s+vscalefbf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 26 14 07 2c b4 f5 00 00 00 10\s+vscalefbf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 10 2c 31\s+vscalefbf16 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 00 2c 71 7f\s+vscalefbf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 66 14 97 2c 72 80\s+vscalefbf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 15 20 5c f4\s+vsubbf16 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 05 15 00 5c f4\s+vsubbf16 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 25 15 27 5c b4 f5 00 00 00 10\s+vsubbf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 15 30 5c 31\s+vsubbf16 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 15 20 5c 71 7f\s+vsubbf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 15 b7 5c 72 80\s+vsubbf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 15 07 5c b4 f5 00 00 00 10\s+vsubbf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 15 10 5c 31\s+vsubbf16 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 15 00 5c 71 7f\s+vsubbf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 15 97 5c 72 80\s+vsubbf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 20 98 f4\s+vfmadd132bf16 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 06 14 00 98 f4\s+vfmadd132bf16 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 26 14 27 98 b4 f5 00 00 00 10\s+vfmadd132bf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 30 98 31\s+vfmadd132bf16 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 20 98 71 7f\s+vfmadd132bf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 66 14 b7 98 72 80\s+vfmadd132bf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 26 14 07 98 b4 f5 00 00 00 10\s+vfmadd132bf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 10 98 31\s+vfmadd132bf16 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 00 98 71 7f\s+vfmadd132bf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 66 14 97 98 72 80\s+vfmadd132bf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 20 a8 f4\s+vfmadd213bf16 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 06 14 00 a8 f4\s+vfmadd213bf16 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 26 14 27 a8 b4 f5 00 00 00 10\s+vfmadd213bf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 30 a8 31\s+vfmadd213bf16 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 20 a8 71 7f\s+vfmadd213bf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 66 14 b7 a8 72 80\s+vfmadd213bf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 26 14 07 a8 b4 f5 00 00 00 10\s+vfmadd213bf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 10 a8 31\s+vfmadd213bf16 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 00 a8 71 7f\s+vfmadd213bf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 66 14 97 a8 72 80\s+vfmadd213bf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 20 b8 f4\s+vfmadd231bf16 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 06 14 00 b8 f4\s+vfmadd231bf16 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 26 14 27 b8 b4 f5 00 00 00 10\s+vfmadd231bf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 30 b8 31\s+vfmadd231bf16 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 20 b8 71 7f\s+vfmadd231bf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 66 14 b7 b8 72 80\s+vfmadd231bf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 26 14 07 b8 b4 f5 00 00 00 10\s+vfmadd231bf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 10 b8 31\s+vfmadd231bf16 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 00 b8 71 7f\s+vfmadd231bf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 66 14 97 b8 72 80\s+vfmadd231bf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 20 9a f4\s+vfmsub132bf16 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 06 14 00 9a f4\s+vfmsub132bf16 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 26 14 27 9a b4 f5 00 00 00 10\s+vfmsub132bf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 30 9a 31\s+vfmsub132bf16 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 20 9a 71 7f\s+vfmsub132bf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 66 14 b7 9a 72 80\s+vfmsub132bf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 26 14 07 9a b4 f5 00 00 00 10\s+vfmsub132bf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 10 9a 31\s+vfmsub132bf16 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 00 9a 71 7f\s+vfmsub132bf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 66 14 97 9a 72 80\s+vfmsub132bf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 20 aa f4\s+vfmsub213bf16 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 06 14 00 aa f4\s+vfmsub213bf16 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 26 14 27 aa b4 f5 00 00 00 10\s+vfmsub213bf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 30 aa 31\s+vfmsub213bf16 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 20 aa 71 7f\s+vfmsub213bf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 66 14 b7 aa 72 80\s+vfmsub213bf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 26 14 07 aa b4 f5 00 00 00 10\s+vfmsub213bf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 10 aa 31\s+vfmsub213bf16 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 00 aa 71 7f\s+vfmsub213bf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 66 14 97 aa 72 80\s+vfmsub213bf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 20 ba f4\s+vfmsub231bf16 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 06 14 00 ba f4\s+vfmsub231bf16 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 26 14 27 ba b4 f5 00 00 00 10\s+vfmsub231bf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 30 ba 31\s+vfmsub231bf16 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 20 ba 71 7f\s+vfmsub231bf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 66 14 b7 ba 72 80\s+vfmsub231bf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 26 14 07 ba b4 f5 00 00 00 10\s+vfmsub231bf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 10 ba 31\s+vfmsub231bf16 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 00 ba 71 7f\s+vfmsub231bf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 66 14 97 ba 72 80\s+vfmsub231bf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 20 9c f4\s+vfnmadd132bf16 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 06 14 00 9c f4\s+vfnmadd132bf16 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 26 14 27 9c b4 f5 00 00 00 10\s+vfnmadd132bf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 30 9c 31\s+vfnmadd132bf16 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 20 9c 71 7f\s+vfnmadd132bf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 66 14 b7 9c 72 80\s+vfnmadd132bf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 26 14 07 9c b4 f5 00 00 00 10\s+vfnmadd132bf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 10 9c 31\s+vfnmadd132bf16 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 00 9c 71 7f\s+vfnmadd132bf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 66 14 97 9c 72 80\s+vfnmadd132bf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 20 ac f4\s+vfnmadd213bf16 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 06 14 00 ac f4\s+vfnmadd213bf16 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 26 14 27 ac b4 f5 00 00 00 10\s+vfnmadd213bf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 30 ac 31\s+vfnmadd213bf16 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 20 ac 71 7f\s+vfnmadd213bf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 66 14 b7 ac 72 80\s+vfnmadd213bf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 26 14 07 ac b4 f5 00 00 00 10\s+vfnmadd213bf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 10 ac 31\s+vfnmadd213bf16 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 00 ac 71 7f\s+vfnmadd213bf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 66 14 97 ac 72 80\s+vfnmadd213bf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 20 bc f4\s+vfnmadd231bf16 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 06 14 00 bc f4\s+vfnmadd231bf16 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 26 14 27 bc b4 f5 00 00 00 10\s+vfnmadd231bf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 30 bc 31\s+vfnmadd231bf16 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 20 bc 71 7f\s+vfnmadd231bf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 66 14 b7 bc 72 80\s+vfnmadd231bf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 26 14 07 bc b4 f5 00 00 00 10\s+vfnmadd231bf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 10 bc 31\s+vfnmadd231bf16 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 00 bc 71 7f\s+vfnmadd231bf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 66 14 97 bc 72 80\s+vfnmadd231bf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 20 9e f4\s+vfnmsub132bf16 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 06 14 00 9e f4\s+vfnmsub132bf16 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 26 14 27 9e b4 f5 00 00 00 10\s+vfnmsub132bf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 30 9e 31\s+vfnmsub132bf16 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 20 9e 71 7f\s+vfnmsub132bf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 66 14 b7 9e 72 80\s+vfnmsub132bf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 26 14 07 9e b4 f5 00 00 00 10\s+vfnmsub132bf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 10 9e 31\s+vfnmsub132bf16 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 00 9e 71 7f\s+vfnmsub132bf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 66 14 97 9e 72 80\s+vfnmsub132bf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 20 ae f4\s+vfnmsub213bf16 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 06 14 00 ae f4\s+vfnmsub213bf16 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 26 14 27 ae b4 f5 00 00 00 10\s+vfnmsub213bf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 30 ae 31\s+vfnmsub213bf16 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 20 ae 71 7f\s+vfnmsub213bf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 66 14 b7 ae 72 80\s+vfnmsub213bf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 26 14 07 ae b4 f5 00 00 00 10\s+vfnmsub213bf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 10 ae 31\s+vfnmsub213bf16 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 00 ae 71 7f\s+vfnmsub213bf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 66 14 97 ae 72 80\s+vfnmsub213bf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 20 be f4\s+vfnmsub231bf16 ymm30,ymm29,ymm28
\s*[a-f0-9]+:\s*62 06 14 00 be f4\s+vfnmsub231bf16 xmm30,xmm29,xmm28
\s*[a-f0-9]+:\s*62 26 14 27 be b4 f5 00 00 00 10\s+vfnmsub231bf16 ymm30\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 30 be 31\s+vfnmsub231bf16 ymm30,ymm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 20 be 71 7f\s+vfnmsub231bf16 ymm30,ymm29,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 66 14 b7 be 72 80\s+vfnmsub231bf16 ymm30\{k7\}\{z\},ymm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 26 14 07 be b4 f5 00 00 00 10\s+vfnmsub231bf16 xmm30\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 10 be 31\s+vfnmsub231bf16 xmm30,xmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 00 be 71 7f\s+vfnmsub231bf16 xmm30,xmm29,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 66 14 97 be 72 80\s+vfnmsub231bf16 xmm30\{k7\}\{z\},xmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 7c 08 42 f5\s+vgetexpbf16 xmm30,xmm29
\s*[a-f0-9]+:\s*62 06 7c 28 42 f5\s+vgetexpbf16 ymm30,ymm29
\s*[a-f0-9]+:\s*62 26 7c 0f 42 b4 f5 00 00 00 10\s+vgetexpbf16 xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 7c 18 42 31\s+vgetexpbf16 xmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 7c 08 42 71 7f\s+vgetexpbf16 xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 66 7c 9f 42 72 80\s+vgetexpbf16 xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 26 7c 2f 42 b4 f5 00 00 00 10\s+vgetexpbf16 ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 7c 38 42 31\s+vgetexpbf16 ymm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 7c 28 42 71 7f\s+vgetexpbf16 ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 66 7c bf 42 72 80\s+vgetexpbf16 ymm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 7c 08 4c f5\s+vrcpbf16 xmm30,xmm29
\s*[a-f0-9]+:\s*62 06 7c 28 4c f5\s+vrcpbf16 ymm30,ymm29
\s*[a-f0-9]+:\s*62 26 7c 0f 4c b4 f5 00 00 00 10\s+vrcpbf16 xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 7c 18 4c 31\s+vrcpbf16 xmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 7c 08 4c 71 7f\s+vrcpbf16 xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 66 7c 9f 4c 72 80\s+vrcpbf16 xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 26 7c 2f 4c b4 f5 00 00 00 10\s+vrcpbf16 ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 7c 38 4c 31\s+vrcpbf16 ymm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 7c 28 4c 71 7f\s+vrcpbf16 ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 66 7c bf 4c 72 80\s+vrcpbf16 ymm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 7c 08 4e f5\s+vrsqrtbf16 xmm30,xmm29
\s*[a-f0-9]+:\s*62 06 7c 28 4e f5\s+vrsqrtbf16 ymm30,ymm29
\s*[a-f0-9]+:\s*62 26 7c 0f 4e b4 f5 00 00 00 10\s+vrsqrtbf16 xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 7c 18 4e 31\s+vrsqrtbf16 xmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 7c 08 4e 71 7f\s+vrsqrtbf16 xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 66 7c 9f 4e 72 80\s+vrsqrtbf16 xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 26 7c 2f 4e b4 f5 00 00 00 10\s+vrsqrtbf16 ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 7c 38 4e 31\s+vrsqrtbf16 ymm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 7c 28 4e 71 7f\s+vrsqrtbf16 ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 66 7c bf 4e 72 80\s+vrsqrtbf16 ymm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7d 08 51 f5\s+vsqrtbf16 xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7d 28 51 f5\s+vsqrtbf16 ymm30,ymm29
\s*[a-f0-9]+:\s*62 25 7d 0f 51 b4 f5 00 00 00 10\s+vsqrtbf16 xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 18 51 31\s+vsqrtbf16 xmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 08 51 71 7f\s+vsqrtbf16 xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7d 9f 51 72 80\s+vsqrtbf16 xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 7d 2f 51 b4 f5 00 00 00 10\s+vsqrtbf16 ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 38 51 31\s+vsqrtbf16 ymm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 28 51 71 7f\s+vsqrtbf16 ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7d bf 51 72 80\s+vsqrtbf16 ymm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 03 7f 28 26 f5 7b\s+vgetmantbf16 ymm30,ymm29,0x7b
\s*[a-f0-9]+:\s*62 03 7f 08 26 f5 7b\s+vgetmantbf16 xmm30,xmm29,0x7b
\s*[a-f0-9]+:\s*62 23 7f 0f 26 b4 f5 00 00 00 10 7b\s+vgetmantbf16 xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 43 7f 18 26 31 7b\s+vgetmantbf16 xmm30,WORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 7f 08 26 71 7f 7b\s+vgetmantbf16 xmm30,XMMWORD PTR \[rcx\+0x7f0\],0x7b
\s*[a-f0-9]+:\s*62 63 7f 9f 26 72 80 7b\s+vgetmantbf16 xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 23 7f 2f 26 b4 f5 00 00 00 10 7b\s+vgetmantbf16 ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 43 7f 38 26 31 7b\s+vgetmantbf16 ymm30,WORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 7f 28 26 71 7f 7b\s+vgetmantbf16 ymm30,YMMWORD PTR \[rcx\+0xfe0\],0x7b
\s*[a-f0-9]+:\s*62 63 7f bf 26 72 80 7b\s+vgetmantbf16 ymm30\{k7\}\{z\},WORD BCST \[rdx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 03 7f 28 56 f5 7b\s+vreducebf16 ymm30,ymm29,0x7b
\s*[a-f0-9]+:\s*62 03 7f 08 56 f5 7b\s+vreducebf16 xmm30,xmm29,0x7b
\s*[a-f0-9]+:\s*62 23 7f 0f 56 b4 f5 00 00 00 10 7b\s+vreducebf16 xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 43 7f 18 56 31 7b\s+vreducebf16 xmm30,WORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 7f 08 56 71 7f 7b\s+vreducebf16 xmm30,XMMWORD PTR \[rcx\+0x7f0\],0x7b
\s*[a-f0-9]+:\s*62 63 7f 9f 56 72 80 7b\s+vreducebf16 xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 23 7f 2f 56 b4 f5 00 00 00 10 7b\s+vreducebf16 ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 43 7f 38 56 31 7b\s+vreducebf16 ymm30,WORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 7f 28 56 71 7f 7b\s+vreducebf16 ymm30,YMMWORD PTR \[rcx\+0xfe0\],0x7b
\s*[a-f0-9]+:\s*62 63 7f bf 56 72 80 7b\s+vreducebf16 ymm30\{k7\}\{z\},WORD BCST \[rdx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 03 7f 28 08 f5 7b\s+vrndscalebf16 ymm30,ymm29,0x7b
\s*[a-f0-9]+:\s*62 03 7f 08 08 f5 7b\s+vrndscalebf16 xmm30,xmm29,0x7b
\s*[a-f0-9]+:\s*62 23 7f 0f 08 b4 f5 00 00 00 10 7b\s+vrndscalebf16 xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 43 7f 18 08 31 7b\s+vrndscalebf16 xmm30,WORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 7f 08 08 71 7f 7b\s+vrndscalebf16 xmm30,XMMWORD PTR \[rcx\+0x7f0\],0x7b
\s*[a-f0-9]+:\s*62 63 7f 9f 08 72 80 7b\s+vrndscalebf16 xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 23 7f 2f 08 b4 f5 00 00 00 10 7b\s+vrndscalebf16 ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 43 7f 38 08 31 7b\s+vrndscalebf16 ymm30,WORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 7f 28 08 71 7f 7b\s+vrndscalebf16 ymm30,YMMWORD PTR \[rcx\+0xfe0\],0x7b
\s*[a-f0-9]+:\s*62 63 7f bf 08 72 80 7b\s+vrndscalebf16 ymm30\{k7\}\{z\},WORD BCST \[rdx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 93 17 20 c2 ec 7b\s+vcmpbf16 k5,ymm29,ymm28,0x7b
\s*[a-f0-9]+:\s*62 93 17 00 c2 ec 7b\s+vcmpbf16 k5,xmm29,xmm28,0x7b
\s*[a-f0-9]+:\s*62 b3 17 07 c2 ac f5 00 00 00 10 7b\s+vcmpbf16 k5\{k7\},xmm29,XMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 d3 17 10 c2 29 7b\s+vcmpbf16 k5,xmm29,WORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 f3 17 00 c2 69 7f 7b\s+vcmpbf16 k5,xmm29,XMMWORD PTR \[rcx\+0x7f0\],0x7b
\s*[a-f0-9]+:\s*62 f3 17 17 c2 6a 80 7b\s+vcmpbf16 k5\{k7\},xmm29,WORD BCST \[rdx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 b3 17 27 c2 ac f5 00 00 00 10 7b\s+vcmpbf16 k5\{k7\},ymm29,YMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 d3 17 30 c2 29 7b\s+vcmpbf16 k5,ymm29,WORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 f3 17 20 c2 69 7f 7b\s+vcmpbf16 k5,ymm29,YMMWORD PTR \[rcx\+0xfe0\],0x7b
\s*[a-f0-9]+:\s*62 f3 17 37 c2 6a 80 7b\s+vcmpbf16 k5\{k7\},ymm29,WORD BCST \[rdx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 05 7d 08 2f f5\s+vcomisbf16 xmm30,xmm29
\s*[a-f0-9]+:\s*62 25 7d 08 2f b4 f5 00 00 00 10\s+vcomisbf16 xmm30,WORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 08 2f 31\s+vcomisbf16 xmm30,WORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 08 2f 71 7f\s+vcomisbf16 xmm30,WORD PTR \[rcx\+0xfe\]
\s*[a-f0-9]+:\s*62 65 7d 08 2f 72 80\s+vcomisbf16 xmm30,WORD PTR \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 93 7f 28 66 ed 7b\s+vfpclassbf16 k5,ymm29,0x7b
\s*[a-f0-9]+:\s*62 93 7f 08 66 ed 7b\s+vfpclassbf16 k5,xmm29,0x7b
\s*[a-f0-9]+:\s*62 b3 7f 0f 66 ac f5 00 00 00 10 7b\s+vfpclassbf16 k5\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 d3 7f 18 66 29 7b\s+vfpclassbf16 k5,WORD BCST \[r9\]\{1to8\},0x7b
\s*[a-f0-9]+:\s*62 f3 7f 08 66 69 7f 7b\s+vfpclassbf16 k5,XMMWORD PTR \[rcx\+0x7f0\],0x7b
\s*[a-f0-9]+:\s*62 f3 7f 1f 66 6a 80 7b\s+vfpclassbf16 k5\{k7\},WORD BCST \[rdx-0x100\]\{1to8\},0x7b
\s*[a-f0-9]+:\s*62 d3 7f 38 66 29 7b\s+vfpclassbf16 k5,WORD BCST \[r9\]\{1to16\},0x7b
\s*[a-f0-9]+:\s*62 f3 7f 28 66 69 7f 7b\s+vfpclassbf16 k5,YMMWORD PTR \[rcx\+0xfe0\],0x7b
\s*[a-f0-9]+:\s*62 f3 7f 3f 66 6a 80 7b\s+vfpclassbf16 k5\{k7\},WORD BCST \[rdx-0x100\]\{1to16\},0x7b
#pass

#objdump: -dw -Mintel
#name: x86_64 AVX10.2/512 BF16 insns (Intel disassembly)
#source: x86-64-avx10_2-512-bf16.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 05 15 40 58 f4\s+vaddbf16 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 25 15 47 58 b4 f5 00 00 00 10\s+vaddbf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 15 50 58 31\s+vaddbf16 zmm30,zmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 15 40 58 71 7f\s+vaddbf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 15 d7 58 72 80\s+vaddbf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 15 40 5e f4\s+vdivbf16 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 25 15 47 5e b4 f5 00 00 00 10\s+vdivbf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 15 50 5e 31\s+vdivbf16 zmm30,zmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 15 40 5e 71 7f\s+vdivbf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 15 d7 5e 72 80\s+vdivbf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 15 40 5f f4\s+vmaxbf16 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 25 15 47 5f b4 f5 00 00 00 10\s+vmaxbf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 15 50 5f 31\s+vmaxbf16 zmm30,zmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 15 40 5f 71 7f\s+vmaxbf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 15 d7 5f 72 80\s+vmaxbf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 15 40 5d f4\s+vminbf16 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 25 15 47 5d b4 f5 00 00 00 10\s+vminbf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 15 50 5d 31\s+vminbf16 zmm30,zmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 15 40 5d 71 7f\s+vminbf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 15 d7 5d 72 80\s+vminbf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 15 40 59 f4\s+vmulbf16 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 25 15 47 59 b4 f5 00 00 00 10\s+vmulbf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 15 50 59 31\s+vmulbf16 zmm30,zmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 15 40 59 71 7f\s+vmulbf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 15 d7 59 72 80\s+vmulbf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 40 2c f4\s+vscalefbf16 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 26 14 47 2c b4 f5 00 00 00 10\s+vscalefbf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 50 2c 31\s+vscalefbf16 zmm30,zmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 40 2c 71 7f\s+vscalefbf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 66 14 d7 2c 72 80\s+vscalefbf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 15 40 5c f4\s+vsubbf16 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 25 15 47 5c b4 f5 00 00 00 10\s+vsubbf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 15 50 5c 31\s+vsubbf16 zmm30,zmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 15 40 5c 71 7f\s+vsubbf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 15 d7 5c 72 80\s+vsubbf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 40 98 f4\s+vfmadd132bf16 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 26 14 47 98 b4 f5 00 00 00 10\s+vfmadd132bf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 50 98 31\s+vfmadd132bf16 zmm30,zmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 40 98 71 7f\s+vfmadd132bf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 66 14 d7 98 72 80\s+vfmadd132bf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 40 a8 f4\s+vfmadd213bf16 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 26 14 47 a8 b4 f5 00 00 00 10\s+vfmadd213bf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 50 a8 31\s+vfmadd213bf16 zmm30,zmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 40 a8 71 7f\s+vfmadd213bf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 66 14 d7 a8 72 80\s+vfmadd213bf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 40 b8 f4\s+vfmadd231bf16 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 26 14 47 b8 b4 f5 00 00 00 10\s+vfmadd231bf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 50 b8 31\s+vfmadd231bf16 zmm30,zmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 40 b8 71 7f\s+vfmadd231bf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 66 14 d7 b8 72 80\s+vfmadd231bf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 40 9a f4\s+vfmsub132bf16 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 26 14 47 9a b4 f5 00 00 00 10\s+vfmsub132bf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 50 9a 31\s+vfmsub132bf16 zmm30,zmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 40 9a 71 7f\s+vfmsub132bf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 66 14 d7 9a 72 80\s+vfmsub132bf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 40 aa f4\s+vfmsub213bf16 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 26 14 47 aa b4 f5 00 00 00 10\s+vfmsub213bf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 50 aa 31\s+vfmsub213bf16 zmm30,zmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 40 aa 71 7f\s+vfmsub213bf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 66 14 d7 aa 72 80\s+vfmsub213bf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 40 ba f4\s+vfmsub231bf16 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 26 14 47 ba b4 f5 00 00 00 10\s+vfmsub231bf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 50 ba 31\s+vfmsub231bf16 zmm30,zmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 40 ba 71 7f\s+vfmsub231bf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 66 14 d7 ba 72 80\s+vfmsub231bf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 40 9c f4\s+vfnmadd132bf16 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 26 14 47 9c b4 f5 00 00 00 10\s+vfnmadd132bf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 50 9c 31\s+vfnmadd132bf16 zmm30,zmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 40 9c 71 7f\s+vfnmadd132bf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 66 14 d7 9c 72 80\s+vfnmadd132bf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 40 ac f4\s+vfnmadd213bf16 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 26 14 47 ac b4 f5 00 00 00 10\s+vfnmadd213bf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 50 ac 31\s+vfnmadd213bf16 zmm30,zmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 40 ac 71 7f\s+vfnmadd213bf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 66 14 d7 ac 72 80\s+vfnmadd213bf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 40 bc f4\s+vfnmadd231bf16 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 26 14 47 bc b4 f5 00 00 00 10\s+vfnmadd231bf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 50 bc 31\s+vfnmadd231bf16 zmm30,zmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 40 bc 71 7f\s+vfnmadd231bf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 66 14 d7 bc 72 80\s+vfnmadd231bf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 40 9e f4\s+vfnmsub132bf16 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 26 14 47 9e b4 f5 00 00 00 10\s+vfnmsub132bf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 50 9e 31\s+vfnmsub132bf16 zmm30,zmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 40 9e 71 7f\s+vfnmsub132bf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 66 14 d7 9e 72 80\s+vfnmsub132bf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 40 ae f4\s+vfnmsub213bf16 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 26 14 47 ae b4 f5 00 00 00 10\s+vfnmsub213bf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 50 ae 31\s+vfnmsub213bf16 zmm30,zmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 40 ae 71 7f\s+vfnmsub213bf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 66 14 d7 ae 72 80\s+vfnmsub213bf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 14 40 be f4\s+vfnmsub231bf16 zmm30,zmm29,zmm28
\s*[a-f0-9]+:\s*62 26 14 47 be b4 f5 00 00 00 10\s+vfnmsub231bf16 zmm30\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 14 50 be 31\s+vfnmsub231bf16 zmm30,zmm29,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 14 40 be 71 7f\s+vfnmsub231bf16 zmm30,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 66 14 d7 be 72 80\s+vfnmsub231bf16 zmm30\{k7\}\{z\},zmm29,WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 7c 48 42 f5\s+vgetexpbf16 zmm30,zmm29
\s*[a-f0-9]+:\s*62 26 7c 4f 42 b4 f5 00 00 00 10\s+vgetexpbf16 zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 7c 58 42 31\s+vgetexpbf16 zmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 7c 48 42 71 7f\s+vgetexpbf16 zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 66 7c df 42 72 80\s+vgetexpbf16 zmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 7c 48 4c f5\s+vrcpbf16 zmm30,zmm29
\s*[a-f0-9]+:\s*62 26 7c 4f 4c b4 f5 00 00 00 10\s+vrcpbf16 zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 7c 58 4c 31\s+vrcpbf16 zmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 7c 48 4c 71 7f\s+vrcpbf16 zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 66 7c df 4c 72 80\s+vrcpbf16 zmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 06 7c 48 4e f5\s+vrsqrtbf16 zmm30,zmm29
\s*[a-f0-9]+:\s*62 26 7c 4f 4e b4 f5 00 00 00 10\s+vrsqrtbf16 zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 46 7c 58 4e 31\s+vrsqrtbf16 zmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 66 7c 48 4e 71 7f\s+vrsqrtbf16 zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 66 7c df 4e 72 80\s+vrsqrtbf16 zmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7d 48 51 f5\s+vsqrtbf16 zmm30,zmm29
\s*[a-f0-9]+:\s*62 25 7d 4f 51 b4 f5 00 00 00 10\s+vsqrtbf16 zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 58 51 31\s+vsqrtbf16 zmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 48 51 71 7f\s+vsqrtbf16 zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 7d df 51 72 80\s+vsqrtbf16 zmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 03 7f 48 26 f5 7b\s+vgetmantbf16 zmm30,zmm29,0x7b
\s*[a-f0-9]+:\s*62 23 7f 4f 26 b4 f5 00 00 00 10 7b\s+vgetmantbf16 zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 43 7f 58 26 31 7b\s+vgetmantbf16 zmm30,WORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 7f 48 26 71 7f 7b\s+vgetmantbf16 zmm30,ZMMWORD PTR \[rcx\+0x1fc0\],0x7b
\s*[a-f0-9]+:\s*62 63 7f df 26 72 80 7b\s+vgetmantbf16 zmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 03 7f 48 56 f5 7b\s+vreducebf16 zmm30,zmm29,0x7b
\s*[a-f0-9]+:\s*62 23 7f 4f 56 b4 f5 00 00 00 10 7b\s+vreducebf16 zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 43 7f 58 56 31 7b\s+vreducebf16 zmm30,WORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 7f 48 56 71 7f 7b\s+vreducebf16 zmm30,ZMMWORD PTR \[rcx\+0x1fc0\],0x7b
\s*[a-f0-9]+:\s*62 63 7f df 56 72 80 7b\s+vreducebf16 zmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 03 7f 48 08 f5 7b\s+vrndscalebf16 zmm30,zmm29,0x7b
\s*[a-f0-9]+:\s*62 23 7f 4f 08 b4 f5 00 00 00 10 7b\s+vrndscalebf16 zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 43 7f 58 08 31 7b\s+vrndscalebf16 zmm30,WORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 63 7f 48 08 71 7f 7b\s+vrndscalebf16 zmm30,ZMMWORD PTR \[rcx\+0x1fc0\],0x7b
\s*[a-f0-9]+:\s*62 63 7f df 08 72 80 7b\s+vrndscalebf16 zmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 93 17 40 c2 ec 7b\s+vcmpbf16 k5,zmm29,zmm28,0x7b
\s*[a-f0-9]+:\s*62 b3 17 47 c2 ac f5 00 00 00 10 7b\s+vcmpbf16 k5\{k7\},zmm29,ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 d3 17 50 c2 29 7b\s+vcmpbf16 k5,zmm29,WORD BCST \[r9\],0x7b
\s*[a-f0-9]+:\s*62 f3 17 40 c2 69 7f 7b\s+vcmpbf16 k5,zmm29,ZMMWORD PTR \[rcx\+0x1fc0\],0x7b
\s*[a-f0-9]+:\s*62 f3 17 57 c2 6a 80 7b\s+vcmpbf16 k5\{k7\},zmm29,WORD BCST \[rdx-0x100\],0x7b
\s*[a-f0-9]+:\s*62 93 7f 48 66 ed 7b\s+vfpclassbf16 k5,zmm29,0x7b
\s*[a-f0-9]+:\s*62 b3 7f 4f 66 ac f5 00 00 00 10 7b\s+vfpclassbf16 k5\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\],0x7b
\s*[a-f0-9]+:\s*62 d3 7f 58 66 29 7b\s+vfpclassbf16 k5,WORD BCST \[r9\]\{1to32\},0x7b
\s*[a-f0-9]+:\s*62 f3 7f 48 66 69 7f 7b\s+vfpclassbf16 k5,ZMMWORD PTR \[rcx\+0x1fc0\],0x7b
\s*[a-f0-9]+:\s*62 f3 7f 5f 66 6a 80 7b\s+vfpclassbf16 k5\{k7\},WORD BCST \[rdx-0x100\]\{1to32\},0x7b
#pass

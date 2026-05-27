#objdump: -dw -Mintel
#name: x86_64 MOVRS insns (Intel disassembly)
#source: x86-64-movrs.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*66 42 0f 38 8b 94 f5 00 00 00 10\s+movrs  dx,WORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*66 41 0f 38 8b 11\s+movrs  dx,WORD PTR \[r9\]
\s*[a-f0-9]+:\s*66 0f 38 8b 91 fe 00 00 00\s+movrs  dx,WORD PTR \[rcx\+0xfe\]
\s*[a-f0-9]+:\s*66 0f 38 8b 92 00 ff ff ff\s+movrs  dx,WORD PTR \[rdx-0x100\]
\s*[a-f0-9]+:\s*42 0f 38 8b 94 f5 00 00 00 10\s+movrs  edx,DWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*41 0f 38 8b 11\s+movrs  edx,DWORD PTR \[r9\]
\s*[a-f0-9]+:\s*0f 38 8b 91 fc 01 00 00\s+movrs  edx,DWORD PTR \[rcx\+0x1fc\]
\s*[a-f0-9]+:\s*0f 38 8b 92 00 fe ff ff\s+movrs  edx,DWORD PTR \[rdx-0x200\]
\s*[a-f0-9]+:\s*4e 0f 38 8b a4 f5 00 00 00 10\s+movrs  r12,QWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*4d 0f 38 8b 21\s+movrs  r12,QWORD PTR \[r9\]
\s*[a-f0-9]+:\s*4c 0f 38 8b a1 f8 03 00 00\s+movrs  r12,QWORD PTR \[rcx\+0x3f8\]
\s*[a-f0-9]+:\s*4c 0f 38 8b a2 00 fc ff ff\s+movrs  r12,QWORD PTR \[rdx-0x400\]
\s*[a-f0-9]+:\s*42 0f 38 8a 9c f5 00 00 00 10\s+movrs  bl,BYTE PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*41 0f 38 8a 19\s+movrs  bl,BYTE PTR \[r9\]
\s*[a-f0-9]+:\s*0f 38 8a 59 7f\s+movrs  bl,BYTE PTR \[rcx\+0x7f\]
\s*[a-f0-9]+:\s*0f 38 8a 5a 80\s+movrs  bl,BYTE PTR \[rdx-0x80\]
\s*[a-f0-9]+:\s*42 0f 18 a4 f5 00 00 00 10\s+prefetchrst2 BYTE PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*41 0f 18 21\s+prefetchrst2 BYTE PTR \[r9\]
\s*[a-f0-9]+:\s*0f 18 61 7f\s+prefetchrst2 BYTE PTR \[rcx\+0x7f\]
\s*[a-f0-9]+:\s*0f 18 62 80\s+prefetchrst2 BYTE PTR \[rdx-0x80\]
#pass

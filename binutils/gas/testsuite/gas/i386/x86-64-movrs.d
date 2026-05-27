#objdump: -dw
#name: x86_64 MOVRS insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*66 42 0f 38 8b 94 f5 00 00 00 10\s+movrs  0x10000000\(%rbp,%r14,8\),%dx
\s*[a-f0-9]+:\s*66 41 0f 38 8b 11\s+movrs  \(%r9\),%dx
\s*[a-f0-9]+:\s*66 0f 38 8b 91 fe 00 00 00\s+movrs  0xfe\(%rcx\),%dx
\s*[a-f0-9]+:\s*66 0f 38 8b 92 00 ff ff ff\s+movrs  -0x100\(%rdx\),%dx
\s*[a-f0-9]+:\s*42 0f 38 8b 94 f5 00 00 00 10\s+movrs  0x10000000\(%rbp,%r14,8\),%edx
\s*[a-f0-9]+:\s*41 0f 38 8b 11\s+movrs  \(%r9\),%edx
\s*[a-f0-9]+:\s*0f 38 8b 91 fc 01 00 00\s+movrs  0x1fc\(%rcx\),%edx
\s*[a-f0-9]+:\s*0f 38 8b 92 00 fe ff ff\s+movrs  -0x200\(%rdx\),%edx
\s*[a-f0-9]+:\s*4e 0f 38 8b a4 f5 00 00 00 10\s+movrs  0x10000000\(%rbp,%r14,8\),%r12
\s*[a-f0-9]+:\s*4d 0f 38 8b 21\s+movrs  \(%r9\),%r12
\s*[a-f0-9]+:\s*4c 0f 38 8b a1 f8 03 00 00\s+movrs  0x3f8\(%rcx\),%r12
\s*[a-f0-9]+:\s*4c 0f 38 8b a2 00 fc ff ff\s+movrs  -0x400\(%rdx\),%r12
\s*[a-f0-9]+:\s*42 0f 38 8a 9c f5 00 00 00 10\s+movrs  0x10000000\(%rbp,%r14,8\),%bl
\s*[a-f0-9]+:\s*41 0f 38 8a 19\s+movrs  \(%r9\),%bl
\s*[a-f0-9]+:\s*0f 38 8a 59 7f\s+movrs  0x7f\(%rcx\),%bl
\s*[a-f0-9]+:\s*0f 38 8a 5a 80\s+movrs  -0x80\(%rdx\),%bl
\s*[a-f0-9]+:\s*42 0f 18 a4 f5 00 00 00 10\s+prefetchrst2 0x10000000\(%rbp,%r14,8\)
\s*[a-f0-9]+:\s*41 0f 18 21\s+prefetchrst2 \(%r9\)
\s*[a-f0-9]+:\s*0f 18 61 7f\s+prefetchrst2 0x7f\(%rcx\)
\s*[a-f0-9]+:\s*0f 18 62 80\s+prefetchrst2 -0x80\(%rdx\)
#pass

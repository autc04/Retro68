#objdump: -dw -Mintel
#name: x86_64 MOVRS, AVX10.2/512 insns (Intel disassembly)
#source: x86-64-movrs-avx10_2-512.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 25 7f 4f 6f b4 f5 00 00 00 10\s+vmovrsb zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7f 48 6f 31\s+vmovrsb zmm30,ZMMWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 65 7f 48 6f 71 7f\s+vmovrsb zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 7f cf 6f 72 80\s+vmovrsb zmm30\{k7\}\{z\},ZMMWORD PTR \[rdx-0x2000\]
\s*[a-f0-9]+:\s*62 25 7e 4f 6f b4 f5 00 00 00 10\s+vmovrsd zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7e 48 6f 31\s+vmovrsd zmm30,ZMMWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 65 7e 48 6f 71 7f\s+vmovrsd zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 7e cf 6f 72 80\s+vmovrsd zmm30\{k7\}\{z\},ZMMWORD PTR \[rdx-0x2000\]
\s*[a-f0-9]+:\s*62 25 fe 4f 6f b4 f5 00 00 00 10\s+vmovrsq zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 fe 48 6f 31\s+vmovrsq zmm30,ZMMWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 65 fe 48 6f 71 7f\s+vmovrsq zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 fe cf 6f 72 80\s+vmovrsq zmm30\{k7\}\{z\},ZMMWORD PTR \[rdx-0x2000\]
\s*[a-f0-9]+:\s*62 25 ff 4f 6f b4 f5 00 00 00 10\s+vmovrsw zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 ff 48 6f 31\s+vmovrsw zmm30,ZMMWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 65 ff 48 6f 71 7f\s+vmovrsw zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 ff cf 6f 72 80\s+vmovrsw zmm30\{k7\}\{z\},ZMMWORD PTR \[rdx-0x2000\]
#pass

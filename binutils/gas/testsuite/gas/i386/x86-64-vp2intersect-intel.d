#objdump: -dw -Mintel
#name: x86_64 VP2INTERSECT insns (Intel disassembly)
#source: x86-64-vp2intersect.s

.*: +file format .*


Disassembly of section \.text:

0+ <\.text>:
[ 	]*[a-f0-9]+:[ 	]*62 f2 6f 48 68 c1[ 	]*vp2intersectd k0,zmm2,zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 6f 48 68 40 01[ 	]*vp2intersectd k0,zmm2,ZMMWORD PTR \[rax\+0x40\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 6f 58 68 40 02[ 	]*vp2intersectd k0,zmm2,DWORD BCST \[rax\+0x8\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 6f 28 68 d1[ 	]*vp2intersectd k2,ymm2,ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 6f 28 68 50 01[ 	]*vp2intersectd k2,ymm2,YMMWORD PTR \[rax\+0x20\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 6f 38 68 50 02[ 	]*vp2intersectd k2,ymm2,DWORD BCST \[rax\+0x8\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 6f 08 68 e1[ 	]*vp2intersectd k4,xmm2,xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 6f 08 68 60 01[ 	]*vp2intersectd k4,xmm2,XMMWORD PTR \[rax\+0x10\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 6f 18 68 60 02[ 	]*vp2intersectd k4,xmm2,DWORD BCST \[rax\+0x8\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 ef 48 68 c1[ 	]*vp2intersectq k0,zmm2,zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 ef 48 68 40 01[ 	]*vp2intersectq k0,zmm2,ZMMWORD PTR \[rax\+0x40\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 ef 58 68 40 01[ 	]*vp2intersectq k0,zmm2,QWORD BCST \[rax\+0x8\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 ef 28 68 d1[ 	]*vp2intersectq k2,ymm2,ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 ef 28 68 50 01[ 	]*vp2intersectq k2,ymm2,YMMWORD PTR \[rax\+0x20\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 ef 38 68 50 01[ 	]*vp2intersectq k2,ymm2,QWORD BCST \[rax\+0x8\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 ef 08 68 e1[ 	]*vp2intersectq k4,xmm2,xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 ef 08 68 60 01[ 	]*vp2intersectq k4,xmm2,XMMWORD PTR \[rax\+0x10\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 ef 18 68 60 01[ 	]*vp2intersectq k4,xmm2,QWORD BCST \[rax\+0x8\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 6f 48 68 d1[ 	]*vp2intersectd k2,zmm2,zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 6f 48 68 50 01[ 	]*vp2intersectd k2,zmm2,ZMMWORD PTR \[rax\+0x40\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 6f 58 68 50 02[ 	]*vp2intersectd k2,zmm2,DWORD BCST \[rax\+0x8\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 6f 28 68 e1[ 	]*vp2intersectd k4,ymm2,ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 6f 28 68 60 01[ 	]*vp2intersectd k4,ymm2,YMMWORD PTR \[rax\+0x20\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 6f 38 68 60 02[ 	]*vp2intersectd k4,ymm2,DWORD BCST \[rax\+0x8\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 6f 08 68 f1[ 	]*vp2intersectd k6,xmm2,xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 6f 08 68 70 01[ 	]*vp2intersectd k6,xmm2,XMMWORD PTR \[rax\+0x10\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 6f 18 68 70 02[ 	]*vp2intersectd k6,xmm2,DWORD BCST \[rax\+0x8\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 ef 48 68 d1[ 	]*vp2intersectq k2,zmm2,zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 ef 48 68 50 01[ 	]*vp2intersectq k2,zmm2,ZMMWORD PTR \[rax\+0x40\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 ef 58 68 50 01[ 	]*vp2intersectq k2,zmm2,QWORD BCST \[rax\+0x8\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 ef 28 68 e1[ 	]*vp2intersectq k4,ymm2,ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 ef 28 68 60 01[ 	]*vp2intersectq k4,ymm2,YMMWORD PTR \[rax\+0x20\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 ef 38 68 60 01[ 	]*vp2intersectq k4,ymm2,QWORD BCST \[rax\+0x8\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 ef 08 68 f1[ 	]*vp2intersectq k6,xmm2,xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 ef 08 68 70 01[ 	]*vp2intersectq k6,xmm2,XMMWORD PTR \[rax\+0x10\]
[ 	]*[a-f0-9]+:[ 	]*62 f2 ef 18 68 70 01[ 	]*vp2intersectq k6,xmm2,QWORD BCST \[rax\+0x8\]
#pass

#objdump: -dw -Mintel
#name: x86-64 AVX10.2/512 satcvt insns (Intel disassembly)
#source: x86-64-avx10_2-512-satcvt.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 05 7f 48 69 f5\s+vcvtbf162ibs zmm30,zmm29
\s*[a-f0-9]+:\s*62 25 7f 4f 69 b4 f5 00 00 00 10\s+vcvtbf162ibs zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7f 58 69 31\s+vcvtbf162ibs zmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7f 48 69 71 7f\s+vcvtbf162ibs zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 7f df 69 72 80\s+vcvtbf162ibs zmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7c 48 69 f5\s+vcvtph2ibs zmm30,zmm29
\s*[a-f0-9]+:\s*62 05 7c 18 69 f5\s+vcvtph2ibs zmm30,zmm29\{rn-sae\}
\s*[a-f0-9]+:\s*62 25 7c 4f 69 b4 f5 00 00 00 10\s+vcvtph2ibs zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7c 58 69 31\s+vcvtph2ibs zmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7c 48 69 71 7f\s+vcvtph2ibs zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 7c df 69 72 80\s+vcvtph2ibs zmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7d 48 69 f5\s+vcvtps2ibs zmm30,zmm29
\s*[a-f0-9]+:\s*62 05 7d 18 69 f5\s+vcvtps2ibs zmm30,zmm29\{rn-sae\}
\s*[a-f0-9]+:\s*62 25 7d 4f 69 b4 f5 00 00 00 10\s+vcvtps2ibs zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 58 69 31\s+vcvtps2ibs zmm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 48 69 71 7f\s+vcvtps2ibs zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 7d df 69 72 80\s+vcvtps2ibs zmm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 05 7f 48 68 f5\s+vcvttbf162ibs zmm30,zmm29
\s*[a-f0-9]+:\s*62 25 7f 4f 68 b4 f5 00 00 00 10\s+vcvttbf162ibs zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7f 58 68 31\s+vcvttbf162ibs zmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7f 48 68 71 7f\s+vcvttbf162ibs zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 7f df 68 72 80\s+vcvttbf162ibs zmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7c 48 68 f5\s+vcvttph2ibs zmm30,zmm29
\s*[a-f0-9]+:\s*62 05 7c 18 68 f5\s+vcvttph2ibs zmm30,zmm29{sae}
\s*[a-f0-9]+:\s*62 25 7c 4f 68 b4 f5 00 00 00 10\s+vcvttph2ibs zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7c 58 68 31\s+vcvttph2ibs zmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7c 48 68 71 7f\s+vcvttph2ibs zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 7c df 68 72 80\s+vcvttph2ibs zmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7d 48 68 f5\s+vcvttps2ibs zmm30,zmm29
\s*[a-f0-9]+:\s*62 05 7d 18 68 f5\s+vcvttps2ibs zmm30,zmm29{sae}
\s*[a-f0-9]+:\s*62 25 7d 4f 68 b4 f5 00 00 00 10\s+vcvttps2ibs zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 58 68 31\s+vcvttps2ibs zmm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 48 68 71 7f\s+vcvttps2ibs zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 7d df 68 72 80\s+vcvttps2ibs zmm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 05 fc 48 6d f5\s+vcvttpd2dqs ymm30,zmm29
\s*[a-f0-9]+:\s*62 05 fc 18 6d f5\s+vcvttpd2dqs ymm30,zmm29\{sae\}
\s*[a-f0-9]+:\s*62 25 fc 4f 6d b4 f5 00 00 00 10\s+vcvttpd2dqs ymm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 fc 58 6d 31\s+vcvttpd2dqs ymm30,QWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 fc 48 6d 71 7f\s+vcvttpd2dqs ymm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 fc df 6d 72 80\s+vcvttpd2dqs ymm30\{k7\}\{z\},QWORD BCST \[rdx-0x400\]
\s*[a-f0-9]+:\s*62 05 fd 48 6d f5\s+vcvttpd2qqs zmm30,zmm29
\s*[a-f0-9]+:\s*62 05 fd 18 6d f5\s+vcvttpd2qqs zmm30,zmm29\{sae\}
\s*[a-f0-9]+:\s*62 25 fd 4f 6d b4 f5 00 00 00 10\s+vcvttpd2qqs zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 fd 58 6d 31\s+vcvttpd2qqs zmm30,QWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 fd 48 6d 71 7f\s+vcvttpd2qqs zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 fd df 6d 72 80\s+vcvttpd2qqs zmm30\{k7\}\{z\},QWORD BCST \[rdx-0x400\]
\s*[a-f0-9]+:\s*62 05 7c 48 6d f5\s+vcvttps2dqs zmm30,zmm29
\s*[a-f0-9]+:\s*62 05 7c 18 6d f5\s+vcvttps2dqs zmm30,zmm29\{sae\}
\s*[a-f0-9]+:\s*62 25 7c 4f 6d b4 f5 00 00 00 10\s+vcvttps2dqs zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7c 58 6d 31\s+vcvttps2dqs zmm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7c 48 6d 71 7f\s+vcvttps2dqs zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 7c df 6d 72 80\s+vcvttps2dqs zmm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 05 7d 48 6d f5\s+vcvttps2qqs zmm30,ymm29
\s*[a-f0-9]+:\s*62 05 7d 18 6d f5\s+vcvttps2qqs zmm30,ymm29\{sae\}
\s*[a-f0-9]+:\s*62 25 7d 4f 6d b4 f5 00 00 00 10\s+vcvttps2qqs zmm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 58 6d 31\s+vcvttps2qqs zmm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 48 6d 71 7f\s+vcvttps2qqs zmm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7d df 6d 72 80\s+vcvttps2qqs zmm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 05 7f 48 6b f5\s+vcvtbf162iubs zmm30,zmm29
\s*[a-f0-9]+:\s*62 25 7f 4f 6b b4 f5 00 00 00 10\s+vcvtbf162iubs zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7f 58 6b 31\s+vcvtbf162iubs zmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7f 48 6b 71 7f\s+vcvtbf162iubs zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 7f df 6b 72 80\s+vcvtbf162iubs zmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7c 48 6b f5\s+vcvtph2iubs zmm30,zmm29
\s*[a-f0-9]+:\s*62 05 7c 18 6b f5\s+vcvtph2iubs zmm30,zmm29\{rn-sae\}
\s*[a-f0-9]+:\s*62 25 7c 4f 6b b4 f5 00 00 00 10\s+vcvtph2iubs zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7c 58 6b 31\s+vcvtph2iubs zmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7c 48 6b 71 7f\s+vcvtph2iubs zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 7c df 6b 72 80\s+vcvtph2iubs zmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7d 48 6b f5\s+vcvtps2iubs zmm30,zmm29
\s*[a-f0-9]+:\s*62 05 7d 18 6b f5\s+vcvtps2iubs zmm30,zmm29\{rn-sae\}
\s*[a-f0-9]+:\s*62 25 7d 4f 6b b4 f5 00 00 00 10\s+vcvtps2iubs zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 58 6b 31\s+vcvtps2iubs zmm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 48 6b 71 7f\s+vcvtps2iubs zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 7d df 6b 72 80\s+vcvtps2iubs zmm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 05 7f 48 6a f5\s+vcvttbf162iubs zmm30,zmm29
\s*[a-f0-9]+:\s*62 25 7f 4f 6a b4 f5 00 00 00 10\s+vcvttbf162iubs zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7f 58 6a 31\s+vcvttbf162iubs zmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7f 48 6a 71 7f\s+vcvttbf162iubs zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 7f df 6a 72 80\s+vcvttbf162iubs zmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7c 48 6a f5\s+vcvttph2iubs zmm30,zmm29
\s*[a-f0-9]+:\s*62 05 7c 18 6a f5\s+vcvttph2iubs zmm30,zmm29{sae}
\s*[a-f0-9]+:\s*62 25 7c 4f 6a b4 f5 00 00 00 10\s+vcvttph2iubs zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7c 58 6a 31\s+vcvttph2iubs zmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7c 48 6a 71 7f\s+vcvttph2iubs zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 7c df 6a 72 80\s+vcvttph2iubs zmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7d 48 6a f5\s+vcvttps2iubs zmm30,zmm29
\s*[a-f0-9]+:\s*62 05 7d 18 6a f5\s+vcvttps2iubs zmm30,zmm29{sae}
\s*[a-f0-9]+:\s*62 25 7d 4f 6a b4 f5 00 00 00 10\s+vcvttps2iubs zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 58 6a 31\s+vcvttps2iubs zmm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 48 6a 71 7f\s+vcvttps2iubs zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 7d df 6a 72 80\s+vcvttps2iubs zmm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 05 fc 48 6c f5\s+vcvttpd2udqs ymm30,zmm29
\s*[a-f0-9]+:\s*62 05 fc 18 6c f5\s+vcvttpd2udqs ymm30,zmm29\{sae\}
\s*[a-f0-9]+:\s*62 25 fc 4f 6c b4 f5 00 00 00 10\s+vcvttpd2udqs ymm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 fc 58 6c 31\s+vcvttpd2udqs ymm30,QWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 fc 48 6c 71 7f\s+vcvttpd2udqs ymm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 fc df 6c 72 80\s+vcvttpd2udqs ymm30\{k7\}\{z\},QWORD BCST \[rdx-0x400\]
\s*[a-f0-9]+:\s*62 05 fd 48 6c f5\s+vcvttpd2uqqs zmm30,zmm29
\s*[a-f0-9]+:\s*62 05 fd 18 6c f5\s+vcvttpd2uqqs zmm30,zmm29\{sae\}
\s*[a-f0-9]+:\s*62 25 fd 4f 6c b4 f5 00 00 00 10\s+vcvttpd2uqqs zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 fd 58 6c 31\s+vcvttpd2uqqs zmm30,QWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 fd 48 6c 71 7f\s+vcvttpd2uqqs zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 fd df 6c 72 80\s+vcvttpd2uqqs zmm30\{k7\}\{z\},QWORD BCST \[rdx-0x400\]
\s*[a-f0-9]+:\s*62 05 7c 48 6c f5\s+vcvttps2udqs zmm30,zmm29
\s*[a-f0-9]+:\s*62 05 7c 18 6c f5\s+vcvttps2udqs zmm30,zmm29\{sae\}
\s*[a-f0-9]+:\s*62 25 7c 4f 6c b4 f5 00 00 00 10\s+vcvttps2udqs zmm30\{k7\},ZMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7c 58 6c 31\s+vcvttps2udqs zmm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7c 48 6c 71 7f\s+vcvttps2udqs zmm30,ZMMWORD PTR \[rcx\+0x1fc0\]
\s*[a-f0-9]+:\s*62 65 7c df 6c 72 80\s+vcvttps2udqs zmm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 05 7d 48 6c f5\s+vcvttps2uqqs zmm30,ymm29
\s*[a-f0-9]+:\s*62 05 7d 18 6c f5\s+vcvttps2uqqs zmm30,ymm29\{sae\}
\s*[a-f0-9]+:\s*62 25 7d 4f 6c b4 f5 00 00 00 10\s+vcvttps2uqqs zmm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 58 6c 31\s+vcvttps2uqqs zmm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 48 6c 71 7f\s+vcvttps2uqqs zmm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7d df 6c 72 80\s+vcvttps2uqqs zmm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
#pass

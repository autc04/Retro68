#objdump: -dw -Mintel
#name: x86-64 AVX10.2/256 satcvt insns (Intel disassembly)
#source: x86-64-avx10_2-256-satcvt.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 05 7f 08 69 f5\s+vcvtbf162ibs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7f 28 69 f5\s+vcvtbf162ibs ymm30,ymm29
\s*[a-f0-9]+:\s*62 25 7f 0f 69 b4 f5 00 00 00 10\s+vcvtbf162ibs xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7f 18 69 31\s+vcvtbf162ibs xmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7f 08 69 71 7f\s+vcvtbf162ibs xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7f 9f 69 72 80\s+vcvtbf162ibs xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 7f 2f 69 b4 f5 00 00 00 10\s+vcvtbf162ibs ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7f 38 69 31\s+vcvtbf162ibs ymm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7f 28 69 71 7f\s+vcvtbf162ibs ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7f bf 69 72 80\s+vcvtbf162ibs ymm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7c 08 69 f5\s+vcvtph2ibs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7c 28 69 f5\s+vcvtph2ibs ymm30,ymm29
\s*[a-f0-9]+:\s*62 25 7c 0f 69 b4 f5 00 00 00 10\s+vcvtph2ibs xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7c 18 69 31\s+vcvtph2ibs xmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7c 08 69 71 7f\s+vcvtph2ibs xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7c 9f 69 72 80\s+vcvtph2ibs xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 7c 2f 69 b4 f5 00 00 00 10\s+vcvtph2ibs ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7c 38 69 31\s+vcvtph2ibs ymm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7c 28 69 71 7f\s+vcvtph2ibs ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7c bf 69 72 80\s+vcvtph2ibs ymm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7d 08 69 f5\s+vcvtps2ibs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7d 28 69 f5\s+vcvtps2ibs ymm30,ymm29
\s*[a-f0-9]+:\s*62 25 7d 0f 69 b4 f5 00 00 00 10\s+vcvtps2ibs xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 18 69 31\s+vcvtps2ibs xmm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 08 69 71 7f\s+vcvtps2ibs xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7d 9f 69 72 80\s+vcvtps2ibs xmm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 25 7d 2f 69 b4 f5 00 00 00 10\s+vcvtps2ibs ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 38 69 31\s+vcvtps2ibs ymm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 28 69 71 7f\s+vcvtps2ibs ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7d bf 69 72 80\s+vcvtps2ibs ymm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 05 7f 08 68 f5\s+vcvttbf162ibs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7f 28 68 f5\s+vcvttbf162ibs ymm30,ymm29
\s*[a-f0-9]+:\s*62 25 7f 0f 68 b4 f5 00 00 00 10\s+vcvttbf162ibs xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7f 18 68 31\s+vcvttbf162ibs xmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7f 08 68 71 7f\s+vcvttbf162ibs xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7f 9f 68 72 80\s+vcvttbf162ibs xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 7f 2f 68 b4 f5 00 00 00 10\s+vcvttbf162ibs ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7f 38 68 31\s+vcvttbf162ibs ymm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7f 28 68 71 7f\s+vcvttbf162ibs ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7f bf 68 72 80\s+vcvttbf162ibs ymm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7c 08 68 f5\s+vcvttph2ibs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7c 28 68 f5\s+vcvttph2ibs ymm30,ymm29
\s*[a-f0-9]+:\s*62 25 7c 0f 68 b4 f5 00 00 00 10\s+vcvttph2ibs xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7c 18 68 31\s+vcvttph2ibs xmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7c 08 68 71 7f\s+vcvttph2ibs xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7c 9f 68 72 80\s+vcvttph2ibs xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 7c 2f 68 b4 f5 00 00 00 10\s+vcvttph2ibs ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7c 38 68 31\s+vcvttph2ibs ymm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7c 28 68 71 7f\s+vcvttph2ibs ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7c bf 68 72 80\s+vcvttph2ibs ymm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7d 08 68 f5\s+vcvttps2ibs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7d 28 68 f5\s+vcvttps2ibs ymm30,ymm29
\s*[a-f0-9]+:\s*62 25 7d 0f 68 b4 f5 00 00 00 10\s+vcvttps2ibs xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 18 68 31\s+vcvttps2ibs xmm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 08 68 71 7f\s+vcvttps2ibs xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7d 9f 68 72 80\s+vcvttps2ibs xmm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 25 7d 2f 68 b4 f5 00 00 00 10\s+vcvttps2ibs ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 38 68 31\s+vcvttps2ibs ymm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 28 68 71 7f\s+vcvttps2ibs ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7d bf 68 72 80\s+vcvttps2ibs ymm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 05 fc 08 6d f5\s+vcvttpd2dqs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 fc 28 6d f5\s+vcvttpd2dqs xmm30,ymm29
\s*[a-f0-9]+:\s*62 25 fc 0f 6d b4 f5 00 00 00 10\s+vcvttpd2dqs xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 fc 18 6d 31\s+vcvttpd2dqs xmm30,QWORD BCST \[r9\]\{1to2\}
\s*[a-f0-9]+:\s*62 65 fc 08 6d 71 7f\s+vcvttpd2dqs xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 fc 9f 6d 72 80\s+vcvttpd2dqs xmm30\{k7\}\{z\},QWORD BCST \[rdx-0x400\]\{1to2\}
\s*[a-f0-9]+:\s*62 45 fc 38 6d 31\s+vcvttpd2dqs xmm30,QWORD BCST \[r9\]\{1to4\}
\s*[a-f0-9]+:\s*62 65 fc 28 6d 71 7f\s+vcvttpd2dqs xmm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 fc bf 6d 72 80\s+vcvttpd2dqs xmm30\{k7\}\{z\},QWORD BCST \[rdx-0x400\]\{1to4\}
\s*[a-f0-9]+:\s*62 05 fd 08 6d f5\s+vcvttpd2qqs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 fd 28 6d f5\s+vcvttpd2qqs ymm30,ymm29
\s*[a-f0-9]+:\s*62 25 fd 0f 6d b4 f5 00 00 00 10\s+vcvttpd2qqs xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 fd 18 6d 31\s+vcvttpd2qqs xmm30,QWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 fd 08 6d 71 7f\s+vcvttpd2qqs xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 fd 9f 6d 72 80\s+vcvttpd2qqs xmm30\{k7\}\{z\},QWORD BCST \[rdx-0x400\]
\s*[a-f0-9]+:\s*62 25 fd 2f 6d b4 f5 00 00 00 10\s+vcvttpd2qqs ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 fd 38 6d 31\s+vcvttpd2qqs ymm30,QWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 fd 28 6d 71 7f\s+vcvttpd2qqs ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 fd bf 6d 72 80\s+vcvttpd2qqs ymm30\{k7\}\{z\},QWORD BCST \[rdx-0x400\]
\s*[a-f0-9]+:\s*62 05 7c 08 6d f5\s+vcvttps2dqs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7c 28 6d f5\s+vcvttps2dqs ymm30,ymm29
\s*[a-f0-9]+:\s*62 25 7c 0f 6d b4 f5 00 00 00 10\s+vcvttps2dqs xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7c 18 6d 31\s+vcvttps2dqs xmm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7c 08 6d 71 7f\s+vcvttps2dqs xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7c 9f 6d 72 80\s+vcvttps2dqs xmm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 25 7c 2f 6d b4 f5 00 00 00 10\s+vcvttps2dqs ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7c 38 6d 31\s+vcvttps2dqs ymm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7c 28 6d 71 7f\s+vcvttps2dqs ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7c bf 6d 72 80\s+vcvttps2dqs ymm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 05 7d 08 6d f5\s+vcvttps2qqs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7d 28 6d f5\s+vcvttps2qqs ymm30,xmm29
\s*[a-f0-9]+:\s*62 25 7d 0f 6d b4 f5 00 00 00 10\s+vcvttps2qqs xmm30\{k7\},QWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 18 6d 31\s+vcvttps2qqs xmm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 08 6d 71 7f\s+vcvttps2qqs xmm30,QWORD PTR \[rcx\+0x3f8\]
\s*[a-f0-9]+:\s*62 65 7d 9f 6d 72 80\s+vcvttps2qqs xmm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 25 7d 2f 6d b4 f5 00 00 00 10\s+vcvttps2qqs ymm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 38 6d 31\s+vcvttps2qqs ymm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 28 6d 71 7f\s+vcvttps2qqs ymm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7d bf 6d 72 80\s+vcvttps2qqs ymm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 95 7f 08 6d d6\s+vcvttsd2sis edx,xmm30
\s*[a-f0-9]+:\s*62 95 7f 18 6d d6\s+vcvttsd2sis edx,xmm30\{sae\}
\s*[a-f0-9]+:\s*62 15 ff 08 6d e6\s+vcvttsd2sis r12,xmm30
\s*[a-f0-9]+:\s*62 15 ff 18 6d e6\s+vcvttsd2sis r12,xmm30\{sae\}
\s*[a-f0-9]+:\s*62 b5 7f 08 6d 94 f5 00 00 00 10\s+vcvttsd2sis edx,QWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 d5 7f 08 6d 11\s+vcvttsd2sis edx,QWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 f5 7f 08 6d 51 7f\s+vcvttsd2sis edx,QWORD PTR \[rcx\+0x3f8\]
\s*[a-f0-9]+:\s*62 f5 7f 08 6d 52 80\s+vcvttsd2sis edx,QWORD PTR \[rdx-0x400\]
\s*[a-f0-9]+:\s*62 35 ff 08 6d a4 f5 00 00 00 10\s+vcvttsd2sis r12,QWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 55 ff 08 6d 21\s+vcvttsd2sis r12,QWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 75 ff 08 6d 61 7f\s+vcvttsd2sis r12,QWORD PTR \[rcx\+0x3f8\]
\s*[a-f0-9]+:\s*62 75 ff 08 6d 62 80\s+vcvttsd2sis r12,QWORD PTR \[rdx-0x400\]
\s*[a-f0-9]+:\s*62 95 7e 08 6d d6\s+vcvttss2sis edx,xmm30
\s*[a-f0-9]+:\s*62 95 7e 18 6d d6\s+vcvttss2sis edx,xmm30\{sae\}
\s*[a-f0-9]+:\s*62 15 fe 08 6d e6\s+vcvttss2sis r12,xmm30
\s*[a-f0-9]+:\s*62 15 fe 18 6d e6\s+vcvttss2sis r12,xmm30\{sae\}
\s*[a-f0-9]+:\s*62 b5 7e 08 6d 94 f5 00 00 00 10\s+vcvttss2sis edx,DWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 d5 7e 08 6d 11\s+vcvttss2sis edx,DWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 f5 7e 08 6d 51 7f\s+vcvttss2sis edx,DWORD PTR \[rcx\+0x1fc\]
\s*[a-f0-9]+:\s*62 f5 7e 08 6d 52 80\s+vcvttss2sis edx,DWORD PTR \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 35 fe 08 6d a4 f5 00 00 00 10\s+vcvttss2sis r12,DWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 55 fe 08 6d 21\s+vcvttss2sis r12,DWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 75 fe 08 6d 61 7f\s+vcvttss2sis r12,DWORD PTR \[rcx\+0x1fc\]
\s*[a-f0-9]+:\s*62 75 fe 08 6d 62 80\s+vcvttss2sis r12,DWORD PTR \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 05 7f 08 6b f5\s+vcvtbf162iubs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7f 28 6b f5\s+vcvtbf162iubs ymm30,ymm29
\s*[a-f0-9]+:\s*62 25 7f 0f 6b b4 f5 00 00 00 10\s+vcvtbf162iubs xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7f 18 6b 31\s+vcvtbf162iubs xmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7f 08 6b 71 7f\s+vcvtbf162iubs xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7f 9f 6b 72 80\s+vcvtbf162iubs xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 7f 2f 6b b4 f5 00 00 00 10\s+vcvtbf162iubs ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7f 38 6b 31\s+vcvtbf162iubs ymm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7f 28 6b 71 7f\s+vcvtbf162iubs ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7f bf 6b 72 80\s+vcvtbf162iubs ymm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7c 08 6b f5\s+vcvtph2iubs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7c 28 6b f5\s+vcvtph2iubs ymm30,ymm29
\s*[a-f0-9]+:\s*62 25 7c 0f 6b b4 f5 00 00 00 10\s+vcvtph2iubs xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7c 18 6b 31\s+vcvtph2iubs xmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7c 08 6b 71 7f\s+vcvtph2iubs xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7c 9f 6b 72 80\s+vcvtph2iubs xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 7c 2f 6b b4 f5 00 00 00 10\s+vcvtph2iubs ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7c 38 6b 31\s+vcvtph2iubs ymm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7c 28 6b 71 7f\s+vcvtph2iubs ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7c bf 6b 72 80\s+vcvtph2iubs ymm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7d 08 6b f5\s+vcvtps2iubs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7d 28 6b f5\s+vcvtps2iubs ymm30,ymm29
\s*[a-f0-9]+:\s*62 25 7d 0f 6b b4 f5 00 00 00 10\s+vcvtps2iubs xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 18 6b 31\s+vcvtps2iubs xmm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 08 6b 71 7f\s+vcvtps2iubs xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7d 9f 6b 72 80\s+vcvtps2iubs xmm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 25 7d 2f 6b b4 f5 00 00 00 10\s+vcvtps2iubs ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 38 6b 31\s+vcvtps2iubs ymm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 28 6b 71 7f\s+vcvtps2iubs ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7d bf 6b 72 80\s+vcvtps2iubs ymm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 05 7f 08 6a f5\s+vcvttbf162iubs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7f 28 6a f5\s+vcvttbf162iubs ymm30,ymm29
\s*[a-f0-9]+:\s*62 25 7f 0f 6a b4 f5 00 00 00 10\s+vcvttbf162iubs xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7f 18 6a 31\s+vcvttbf162iubs xmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7f 08 6a 71 7f\s+vcvttbf162iubs xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7f 9f 6a 72 80\s+vcvttbf162iubs xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 7f 2f 6a b4 f5 00 00 00 10\s+vcvttbf162iubs ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7f 38 6a 31\s+vcvttbf162iubs ymm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7f 28 6a 71 7f\s+vcvttbf162iubs ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7f bf 6a 72 80\s+vcvttbf162iubs ymm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7c 08 6a f5\s+vcvttph2iubs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7c 28 6a f5\s+vcvttph2iubs ymm30,ymm29
\s*[a-f0-9]+:\s*62 25 7c 0f 6a b4 f5 00 00 00 10\s+vcvttph2iubs xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7c 18 6a 31\s+vcvttph2iubs xmm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7c 08 6a 71 7f\s+vcvttph2iubs xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7c 9f 6a 72 80\s+vcvttph2iubs xmm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 25 7c 2f 6a b4 f5 00 00 00 10\s+vcvttph2iubs ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7c 38 6a 31\s+vcvttph2iubs ymm30,WORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7c 28 6a 71 7f\s+vcvttph2iubs ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7c bf 6a 72 80\s+vcvttph2iubs ymm30\{k7\}\{z\},WORD BCST \[rdx-0x100\]
\s*[a-f0-9]+:\s*62 05 7d 08 6a f5\s+vcvttps2iubs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7d 28 6a f5\s+vcvttps2iubs ymm30,ymm29
\s*[a-f0-9]+:\s*62 25 7d 0f 6a b4 f5 00 00 00 10\s+vcvttps2iubs xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 18 6a 31\s+vcvttps2iubs xmm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 08 6a 71 7f\s+vcvttps2iubs xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7d 9f 6a 72 80\s+vcvttps2iubs xmm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 25 7d 2f 6a b4 f5 00 00 00 10\s+vcvttps2iubs ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 38 6a 31\s+vcvttps2iubs ymm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 28 6a 71 7f\s+vcvttps2iubs ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7d bf 6a 72 80\s+vcvttps2iubs ymm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 05 fc 08 6c f5\s+vcvttpd2udqs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 fc 28 6c f5\s+vcvttpd2udqs xmm30,ymm29
\s*[a-f0-9]+:\s*62 25 fc 0f 6c b4 f5 00 00 00 10\s+vcvttpd2udqs xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 fc 18 6c 31\s+vcvttpd2udqs xmm30,QWORD BCST \[r9\]\{1to2\}
\s*[a-f0-9]+:\s*62 65 fc 08 6c 71 7f\s+vcvttpd2udqs xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 fc 9f 6c 72 80\s+vcvttpd2udqs xmm30\{k7\}\{z\},QWORD BCST \[rdx-0x400\]\{1to2\}
\s*[a-f0-9]+:\s*62 45 fc 38 6c 31\s+vcvttpd2udqs xmm30,QWORD BCST \[r9\]\{1to4\}
\s*[a-f0-9]+:\s*62 65 fc 28 6c 71 7f\s+vcvttpd2udqs xmm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 fc bf 6c 72 80\s+vcvttpd2udqs xmm30\{k7\}\{z\},QWORD BCST \[rdx-0x400\]\{1to4\}
\s*[a-f0-9]+:\s*62 05 fd 08 6c f5\s+vcvttpd2uqqs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 fd 28 6c f5\s+vcvttpd2uqqs ymm30,ymm29
\s*[a-f0-9]+:\s*62 25 fd 0f 6c b4 f5 00 00 00 10\s+vcvttpd2uqqs xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 fd 18 6c 31\s+vcvttpd2uqqs xmm30,QWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 fd 08 6c 71 7f\s+vcvttpd2uqqs xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 fd 9f 6c 72 80\s+vcvttpd2uqqs xmm30\{k7\}\{z\},QWORD BCST \[rdx-0x400\]
\s*[a-f0-9]+:\s*62 25 fd 2f 6c b4 f5 00 00 00 10\s+vcvttpd2uqqs ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 fd 38 6c 31\s+vcvttpd2uqqs ymm30,QWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 fd 28 6c 71 7f\s+vcvttpd2uqqs ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 fd bf 6c 72 80\s+vcvttpd2uqqs ymm30\{k7\}\{z\},QWORD BCST \[rdx-0x400\]
\s*[a-f0-9]+:\s*62 05 7c 08 6c f5\s+vcvttps2udqs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7c 28 6c f5\s+vcvttps2udqs ymm30,ymm29
\s*[a-f0-9]+:\s*62 25 7c 0f 6c b4 f5 00 00 00 10\s+vcvttps2udqs xmm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7c 18 6c 31\s+vcvttps2udqs xmm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7c 08 6c 71 7f\s+vcvttps2udqs xmm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7c 9f 6c 72 80\s+vcvttps2udqs xmm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 25 7c 2f 6c b4 f5 00 00 00 10\s+vcvttps2udqs ymm30\{k7\},YMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7c 38 6c 31\s+vcvttps2udqs ymm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7c 28 6c 71 7f\s+vcvttps2udqs ymm30,YMMWORD PTR \[rcx\+0xfe0\]
\s*[a-f0-9]+:\s*62 65 7c bf 6c 72 80\s+vcvttps2udqs ymm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 05 7d 08 6c f5\s+vcvttps2uqqs xmm30,xmm29
\s*[a-f0-9]+:\s*62 05 7d 28 6c f5\s+vcvttps2uqqs ymm30,xmm29
\s*[a-f0-9]+:\s*62 25 7d 0f 6c b4 f5 00 00 00 10\s+vcvttps2uqqs xmm30\{k7\},QWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 18 6c 31\s+vcvttps2uqqs xmm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 08 6c 71 7f\s+vcvttps2uqqs xmm30,QWORD PTR \[rcx\+0x3f8\]
\s*[a-f0-9]+:\s*62 65 7d 9f 6c 72 80\s+vcvttps2uqqs xmm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 25 7d 2f 6c b4 f5 00 00 00 10\s+vcvttps2uqqs ymm30\{k7\},XMMWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 45 7d 38 6c 31\s+vcvttps2uqqs ymm30,DWORD BCST \[r9\]
\s*[a-f0-9]+:\s*62 65 7d 28 6c 71 7f\s+vcvttps2uqqs ymm30,XMMWORD PTR \[rcx\+0x7f0\]
\s*[a-f0-9]+:\s*62 65 7d bf 6c 72 80\s+vcvttps2uqqs ymm30\{k7\}\{z\},DWORD BCST \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 95 7f 08 6c d6\s+vcvttsd2usis edx,xmm30
\s*[a-f0-9]+:\s*62 95 7f 18 6c d6\s+vcvttsd2usis edx,xmm30\{sae\}
\s*[a-f0-9]+:\s*62 15 ff 08 6c e6\s+vcvttsd2usis r12,xmm30
\s*[a-f0-9]+:\s*62 15 ff 18 6c e6\s+vcvttsd2usis r12,xmm30\{sae\}
\s*[a-f0-9]+:\s*62 b5 7f 08 6c 94 f5 00 00 00 10\s+vcvttsd2usis edx,QWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 d5 7f 08 6c 11\s+vcvttsd2usis edx,QWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 f5 7f 08 6c 51 7f\s+vcvttsd2usis edx,QWORD PTR \[rcx\+0x3f8\]
\s*[a-f0-9]+:\s*62 f5 7f 08 6c 52 80\s+vcvttsd2usis edx,QWORD PTR \[rdx-0x400\]
\s*[a-f0-9]+:\s*62 35 ff 08 6c a4 f5 00 00 00 10\s+vcvttsd2usis r12,QWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 55 ff 08 6c 21\s+vcvttsd2usis r12,QWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 75 ff 08 6c 61 7f\s+vcvttsd2usis r12,QWORD PTR \[rcx\+0x3f8\]
\s*[a-f0-9]+:\s*62 75 ff 08 6c 62 80\s+vcvttsd2usis r12,QWORD PTR \[rdx-0x400\]
\s*[a-f0-9]+:\s*62 95 7e 08 6c d6\s+vcvttss2usis edx,xmm30
\s*[a-f0-9]+:\s*62 95 7e 18 6c d6\s+vcvttss2usis edx,xmm30\{sae\}
\s*[a-f0-9]+:\s*62 15 fe 08 6c e6\s+vcvttss2usis r12,xmm30
\s*[a-f0-9]+:\s*62 15 fe 18 6c e6\s+vcvttss2usis r12,xmm30\{sae\}
\s*[a-f0-9]+:\s*62 b5 7e 08 6c 94 f5 00 00 00 10\s+vcvttss2usis edx,DWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 d5 7e 08 6c 11\s+vcvttss2usis edx,DWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 f5 7e 08 6c 51 7f\s+vcvttss2usis edx,DWORD PTR \[rcx\+0x1fc\]
\s*[a-f0-9]+:\s*62 f5 7e 08 6c 52 80\s+vcvttss2usis edx,DWORD PTR \[rdx-0x200\]
\s*[a-f0-9]+:\s*62 35 fe 08 6c a4 f5 00 00 00 10\s+vcvttss2usis r12,DWORD PTR \[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 55 fe 08 6c 21\s+vcvttss2usis r12,DWORD PTR \[r9\]
\s*[a-f0-9]+:\s*62 75 fe 08 6c 61 7f\s+vcvttss2usis r12,DWORD PTR \[rcx\+0x1fc\]
\s*[a-f0-9]+:\s*62 75 fe 08 6c 62 80\s+vcvttss2usis r12,DWORD PTR \[rdx-0x200\]
#pass

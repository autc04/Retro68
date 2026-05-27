#objdump: -dw -Mintel
#name: i386 AVX10.2/256 satcvt insns (Intel disassembly)
#source: avx10_2-256-satcvt.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 f5 7f 08 69 f5\s+vcvtbf162ibs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7f 28 69 f5\s+vcvtbf162ibs ymm6,ymm5
\s*[a-f0-9]+:\s*62 f5 7f 0f 69 b4 f4 00 00 00 10\s+vcvtbf162ibs xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7f 18 69 31\s+vcvtbf162ibs xmm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7f 08 69 71 7f\s+vcvtbf162ibs xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7f 9f 69 72 80\s+vcvtbf162ibs xmm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7f 2f 69 b4 f4 00 00 00 10\s+vcvtbf162ibs ymm6\{k7\},YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7f 38 69 31\s+vcvtbf162ibs ymm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7f 28 69 71 7f\s+vcvtbf162ibs ymm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 7f bf 69 72 80\s+vcvtbf162ibs ymm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7c 08 69 f5\s+vcvtph2ibs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7c 28 69 f5\s+vcvtph2ibs ymm6,ymm5
\s*[a-f0-9]+:\s*62 f5 7c 0f 69 b4 f4 00 00 00 10\s+vcvtph2ibs xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7c 18 69 31\s+vcvtph2ibs xmm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7c 08 69 71 7f\s+vcvtph2ibs xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7c 9f 69 72 80\s+vcvtph2ibs xmm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7c 2f 69 b4 f4 00 00 00 10\s+vcvtph2ibs ymm6\{k7\},YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7c 38 69 31\s+vcvtph2ibs ymm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7c 28 69 71 7f\s+vcvtph2ibs ymm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 7c bf 69 72 80\s+vcvtph2ibs ymm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7d 08 69 f5\s+vcvtps2ibs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7d 28 69 f5\s+vcvtps2ibs ymm6,ymm5
\s*[a-f0-9]+:\s*62 f5 7d 0f 69 b4 f4 00 00 00 10\s+vcvtps2ibs xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7d 18 69 31\s+vcvtps2ibs xmm6,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7d 08 69 71 7f\s+vcvtps2ibs xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7d 9f 69 72 80\s+vcvtps2ibs xmm6\{k7\}\{z\},DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f5 7d 2f 69 b4 f4 00 00 00 10\s+vcvtps2ibs ymm6\{k7\},YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7d 38 69 31\s+vcvtps2ibs ymm6,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7d 28 69 71 7f\s+vcvtps2ibs ymm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 7d bf 69 72 80\s+vcvtps2ibs ymm6\{k7\}\{z\},DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f5 7f 08 68 f5\s+vcvttbf162ibs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7f 28 68 f5\s+vcvttbf162ibs ymm6,ymm5
\s*[a-f0-9]+:\s*62 f5 7f 0f 68 b4 f4 00 00 00 10\s+vcvttbf162ibs xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7f 18 68 31\s+vcvttbf162ibs xmm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7f 08 68 71 7f\s+vcvttbf162ibs xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7f 9f 68 72 80\s+vcvttbf162ibs xmm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7f 2f 68 b4 f4 00 00 00 10\s+vcvttbf162ibs ymm6\{k7\},YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7f 38 68 31\s+vcvttbf162ibs ymm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7f 28 68 71 7f\s+vcvttbf162ibs ymm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 7f bf 68 72 80\s+vcvttbf162ibs ymm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7c 08 68 f5\s+vcvttph2ibs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7c 28 68 f5\s+vcvttph2ibs ymm6,ymm5
\s*[a-f0-9]+:\s*62 f5 7c 0f 68 b4 f4 00 00 00 10\s+vcvttph2ibs xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7c 18 68 31\s+vcvttph2ibs xmm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7c 08 68 71 7f\s+vcvttph2ibs xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7c 9f 68 72 80\s+vcvttph2ibs xmm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7c 2f 68 b4 f4 00 00 00 10\s+vcvttph2ibs ymm6\{k7\},YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7c 38 68 31\s+vcvttph2ibs ymm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7c 28 68 71 7f\s+vcvttph2ibs ymm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 7c bf 68 72 80\s+vcvttph2ibs ymm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7d 08 68 f5\s+vcvttps2ibs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7d 28 68 f5\s+vcvttps2ibs ymm6,ymm5
\s*[a-f0-9]+:\s*62 f5 7d 0f 68 b4 f4 00 00 00 10\s+vcvttps2ibs xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7d 18 68 31\s+vcvttps2ibs xmm6,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7d 08 68 71 7f\s+vcvttps2ibs xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7d 9f 68 72 80\s+vcvttps2ibs xmm6\{k7\}\{z\},DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f5 7d 2f 68 b4 f4 00 00 00 10\s+vcvttps2ibs ymm6\{k7\},YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7d 38 68 31\s+vcvttps2ibs ymm6,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7d 28 68 71 7f\s+vcvttps2ibs ymm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 7d bf 68 72 80\s+vcvttps2ibs ymm6\{k7\}\{z\},DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f5 fc 08 6d f5\s+vcvttpd2dqs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 fc 28 6d f5\s+vcvttpd2dqs xmm6,ymm5
\s*[a-f0-9]+:\s*62 f5 fc 0f 6d b4 f4 00 00 00 10\s+vcvttpd2dqs xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 fc 18 6d 31\s+vcvttpd2dqs xmm6,QWORD BCST \[ecx\]\{1to2\}
\s*[a-f0-9]+:\s*62 f5 fc 08 6d 71 7f\s+vcvttpd2dqs xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 fc 9f 6d 72 80\s+vcvttpd2dqs xmm6\{k7\}\{z\},QWORD BCST \[edx-0x400\]\{1to2\}
\s*[a-f0-9]+:\s*62 f5 fc 38 6d 31\s+vcvttpd2dqs xmm6,QWORD BCST \[ecx\]\{1to4\}
\s*[a-f0-9]+:\s*62 f5 fc 28 6d 71 7f\s+vcvttpd2dqs xmm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 fc bf 6d 72 80\s+vcvttpd2dqs xmm6\{k7\}\{z\},QWORD BCST \[edx-0x400\]\{1to4\}
\s*[a-f0-9]+:\s*62 f5 fd 08 6d f5\s+vcvttpd2qqs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 fd 28 6d f5\s+vcvttpd2qqs ymm6,ymm5
\s*[a-f0-9]+:\s*62 f5 fd 0f 6d b4 f4 00 00 00 10\s+vcvttpd2qqs xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 fd 18 6d 31\s+vcvttpd2qqs xmm6,QWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 fd 08 6d 71 7f\s+vcvttpd2qqs xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 fd 9f 6d 72 80\s+vcvttpd2qqs xmm6\{k7\}\{z\},QWORD BCST \[edx-0x400\]
\s*[a-f0-9]+:\s*62 f5 fd 2f 6d b4 f4 00 00 00 10\s+vcvttpd2qqs ymm6\{k7\},YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 fd 38 6d 31\s+vcvttpd2qqs ymm6,QWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 fd 28 6d 71 7f\s+vcvttpd2qqs ymm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 fd bf 6d 72 80\s+vcvttpd2qqs ymm6\{k7\}\{z\},QWORD BCST \[edx-0x400\]
\s*[a-f0-9]+:\s*62 f5 7c 08 6d f5\s+vcvttps2dqs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7c 28 6d f5\s+vcvttps2dqs ymm6,ymm5
\s*[a-f0-9]+:\s*62 f5 7c 0f 6d b4 f4 00 00 00 10\s+vcvttps2dqs xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7c 18 6d 31\s+vcvttps2dqs xmm6,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7c 08 6d 71 7f\s+vcvttps2dqs xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7c 9f 6d 72 80\s+vcvttps2dqs xmm6\{k7\}\{z\},DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f5 7c 2f 6d b4 f4 00 00 00 10\s+vcvttps2dqs ymm6\{k7\},YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7c 38 6d 31\s+vcvttps2dqs ymm6,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7c 28 6d 71 7f\s+vcvttps2dqs ymm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 7c bf 6d 72 80\s+vcvttps2dqs ymm6\{k7\}\{z\},DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f5 7d 08 6d f5\s+vcvttps2qqs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7d 28 6d f5\s+vcvttps2qqs ymm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7d 0f 6d b4 f4 00 00 00 10\s+vcvttps2qqs xmm6\{k7\},QWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7d 18 6d 31\s+vcvttps2qqs xmm6,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7d 08 6d 71 7f\s+vcvttps2qqs xmm6,QWORD PTR \[ecx\+0x3f8\]
\s*[a-f0-9]+:\s*62 f5 7d 9f 6d 72 80\s+vcvttps2qqs xmm6\{k7\}\{z\},DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f5 7d 2f 6d b4 f4 00 00 00 10\s+vcvttps2qqs ymm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7d 38 6d 31\s+vcvttps2qqs ymm6,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7d 28 6d 71 7f\s+vcvttps2qqs ymm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7d bf 6d 72 80\s+vcvttps2qqs ymm6\{k7\}\{z\},DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f5 7f 08 6d d6\s+vcvttsd2sis edx,xmm6
\s*[a-f0-9]+:\s*62 f5 7f 18 6d d6\s+vcvttsd2sis edx,xmm6\{sae\}
\s*[a-f0-9]+:\s*62 f5 7f 08 6d 94 f4 00 00 00 10\s+vcvttsd2sis edx,QWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7f 08 6d 11\s+vcvttsd2sis edx,QWORD PTR \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7f 08 6d 51 7f\s+vcvttsd2sis edx,QWORD PTR \[ecx\+0x3f8\]
\s*[a-f0-9]+:\s*62 f5 7f 08 6d 52 80\s+vcvttsd2sis edx,QWORD PTR \[edx-0x400\]
\s*[a-f0-9]+:\s*62 f5 7e 08 6d d6\s+vcvttss2sis edx,xmm6
\s*[a-f0-9]+:\s*62 f5 7e 18 6d d6\s+vcvttss2sis edx,xmm6\{sae\}
\s*[a-f0-9]+:\s*62 f5 7e 08 6d 94 f4 00 00 00 10\s+vcvttss2sis edx,DWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7e 08 6d 11\s+vcvttss2sis edx,DWORD PTR \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7e 08 6d 51 7f\s+vcvttss2sis edx,DWORD PTR \[ecx\+0x1fc\]
\s*[a-f0-9]+:\s*62 f5 7e 08 6d 52 80\s+vcvttss2sis edx,DWORD PTR \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f5 7f 08 6b f5\s+vcvtbf162iubs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7f 28 6b f5\s+vcvtbf162iubs ymm6,ymm5
\s*[a-f0-9]+:\s*62 f5 7f 0f 6b b4 f4 00 00 00 10\s+vcvtbf162iubs xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7f 18 6b 31\s+vcvtbf162iubs xmm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7f 08 6b 71 7f\s+vcvtbf162iubs xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7f 9f 6b 72 80\s+vcvtbf162iubs xmm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7f 2f 6b b4 f4 00 00 00 10\s+vcvtbf162iubs ymm6\{k7\},YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7f 38 6b 31\s+vcvtbf162iubs ymm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7f 28 6b 71 7f\s+vcvtbf162iubs ymm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 7f bf 6b 72 80\s+vcvtbf162iubs ymm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7c 08 6b f5\s+vcvtph2iubs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7c 28 6b f5\s+vcvtph2iubs ymm6,ymm5
\s*[a-f0-9]+:\s*62 f5 7c 0f 6b b4 f4 00 00 00 10\s+vcvtph2iubs xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7c 18 6b 31\s+vcvtph2iubs xmm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7c 08 6b 71 7f\s+vcvtph2iubs xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7c 9f 6b 72 80\s+vcvtph2iubs xmm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7c 2f 6b b4 f4 00 00 00 10\s+vcvtph2iubs ymm6\{k7\},YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7c 38 6b 31\s+vcvtph2iubs ymm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7c 28 6b 71 7f\s+vcvtph2iubs ymm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 7c bf 6b 72 80\s+vcvtph2iubs ymm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7d 08 6b f5\s+vcvtps2iubs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7d 28 6b f5\s+vcvtps2iubs ymm6,ymm5
\s*[a-f0-9]+:\s*62 f5 7d 0f 6b b4 f4 00 00 00 10\s+vcvtps2iubs xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7d 18 6b 31\s+vcvtps2iubs xmm6,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7d 08 6b 71 7f\s+vcvtps2iubs xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7d 9f 6b 72 80\s+vcvtps2iubs xmm6\{k7\}\{z\},DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f5 7d 2f 6b b4 f4 00 00 00 10\s+vcvtps2iubs ymm6\{k7\},YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7d 38 6b 31\s+vcvtps2iubs ymm6,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7d 28 6b 71 7f\s+vcvtps2iubs ymm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 7d bf 6b 72 80\s+vcvtps2iubs ymm6\{k7\}\{z\},DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f5 7f 08 6a f5\s+vcvttbf162iubs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7f 28 6a f5\s+vcvttbf162iubs ymm6,ymm5
\s*[a-f0-9]+:\s*62 f5 7f 0f 6a b4 f4 00 00 00 10\s+vcvttbf162iubs xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7f 18 6a 31\s+vcvttbf162iubs xmm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7f 08 6a 71 7f\s+vcvttbf162iubs xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7f 9f 6a 72 80\s+vcvttbf162iubs xmm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7f 2f 6a b4 f4 00 00 00 10\s+vcvttbf162iubs ymm6\{k7\},YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7f 38 6a 31\s+vcvttbf162iubs ymm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7f 28 6a 71 7f\s+vcvttbf162iubs ymm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 7f bf 6a 72 80\s+vcvttbf162iubs ymm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7c 08 6a f5\s+vcvttph2iubs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7c 28 6a f5\s+vcvttph2iubs ymm6,ymm5
\s*[a-f0-9]+:\s*62 f5 7c 0f 6a b4 f4 00 00 00 10\s+vcvttph2iubs xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7c 18 6a 31\s+vcvttph2iubs xmm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7c 08 6a 71 7f\s+vcvttph2iubs xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7c 9f 6a 72 80\s+vcvttph2iubs xmm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7c 2f 6a b4 f4 00 00 00 10\s+vcvttph2iubs ymm6\{k7\},YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7c 38 6a 31\s+vcvttph2iubs ymm6,WORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7c 28 6a 71 7f\s+vcvttph2iubs ymm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 7c bf 6a 72 80\s+vcvttph2iubs ymm6\{k7\}\{z\},WORD BCST \[edx-0x100\]
\s*[a-f0-9]+:\s*62 f5 7d 08 6a f5\s+vcvttps2iubs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7d 28 6a f5\s+vcvttps2iubs ymm6,ymm5
\s*[a-f0-9]+:\s*62 f5 7d 0f 6a b4 f4 00 00 00 10\s+vcvttps2iubs xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7d 18 6a 31\s+vcvttps2iubs xmm6,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7d 08 6a 71 7f\s+vcvttps2iubs xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7d 9f 6a 72 80\s+vcvttps2iubs xmm6\{k7\}\{z\},DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f5 7d 2f 6a b4 f4 00 00 00 10\s+vcvttps2iubs ymm6\{k7\},YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7d 38 6a 31\s+vcvttps2iubs ymm6,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7d 28 6a 71 7f\s+vcvttps2iubs ymm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 7d bf 6a 72 80\s+vcvttps2iubs ymm6\{k7\}\{z\},DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f5 fc 08 6c f5\s+vcvttpd2udqs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 fc 28 6c f5\s+vcvttpd2udqs xmm6,ymm5
\s*[a-f0-9]+:\s*62 f5 fc 0f 6c b4 f4 00 00 00 10\s+vcvttpd2udqs xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 fc 18 6c 31\s+vcvttpd2udqs xmm6,QWORD BCST \[ecx\]\{1to2\}
\s*[a-f0-9]+:\s*62 f5 fc 08 6c 71 7f\s+vcvttpd2udqs xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 fc 9f 6c 72 80\s+vcvttpd2udqs xmm6\{k7\}\{z\},QWORD BCST \[edx-0x400\]\{1to2\}
\s*[a-f0-9]+:\s*62 f5 fc 38 6c 31\s+vcvttpd2udqs xmm6,QWORD BCST \[ecx\]\{1to4\}
\s*[a-f0-9]+:\s*62 f5 fc 28 6c 71 7f\s+vcvttpd2udqs xmm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 fc bf 6c 72 80\s+vcvttpd2udqs xmm6\{k7\}\{z\},QWORD BCST \[edx-0x400\]\{1to4\}
\s*[a-f0-9]+:\s*62 f5 fd 08 6c f5\s+vcvttpd2uqqs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 fd 28 6c f5\s+vcvttpd2uqqs ymm6,ymm5
\s*[a-f0-9]+:\s*62 f5 fd 0f 6c b4 f4 00 00 00 10\s+vcvttpd2uqqs xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 fd 18 6c 31\s+vcvttpd2uqqs xmm6,QWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 fd 08 6c 71 7f\s+vcvttpd2uqqs xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 fd 9f 6c 72 80\s+vcvttpd2uqqs xmm6\{k7\}\{z\},QWORD BCST \[edx-0x400\]
\s*[a-f0-9]+:\s*62 f5 fd 2f 6c b4 f4 00 00 00 10\s+vcvttpd2uqqs ymm6\{k7\},YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 fd 38 6c 31\s+vcvttpd2uqqs ymm6,QWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 fd 28 6c 71 7f\s+vcvttpd2uqqs ymm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 fd bf 6c 72 80\s+vcvttpd2uqqs ymm6\{k7\}\{z\},QWORD BCST \[edx-0x400\]
\s*[a-f0-9]+:\s*62 f5 7c 08 6c f5\s+vcvttps2udqs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7c 28 6c f5\s+vcvttps2udqs ymm6,ymm5
\s*[a-f0-9]+:\s*62 f5 7c 0f 6c b4 f4 00 00 00 10\s+vcvttps2udqs xmm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7c 18 6c 31\s+vcvttps2udqs xmm6,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7c 08 6c 71 7f\s+vcvttps2udqs xmm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7c 9f 6c 72 80\s+vcvttps2udqs xmm6\{k7\}\{z\},DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f5 7c 2f 6c b4 f4 00 00 00 10\s+vcvttps2udqs ymm6\{k7\},YMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7c 38 6c 31\s+vcvttps2udqs ymm6,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7c 28 6c 71 7f\s+vcvttps2udqs ymm6,YMMWORD PTR \[ecx\+0xfe0\]
\s*[a-f0-9]+:\s*62 f5 7c bf 6c 72 80\s+vcvttps2udqs ymm6\{k7\}\{z\},DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f5 7d 08 6c f5\s+vcvttps2uqqs xmm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7d 28 6c f5\s+vcvttps2uqqs ymm6,xmm5
\s*[a-f0-9]+:\s*62 f5 7d 0f 6c b4 f4 00 00 00 10\s+vcvttps2uqqs xmm6\{k7\},QWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7d 18 6c 31\s+vcvttps2uqqs xmm6,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7d 08 6c 71 7f\s+vcvttps2uqqs xmm6,QWORD PTR \[ecx\+0x3f8\]
\s*[a-f0-9]+:\s*62 f5 7d 9f 6c 72 80\s+vcvttps2uqqs xmm6\{k7\}\{z\},DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f5 7d 2f 6c b4 f4 00 00 00 10\s+vcvttps2uqqs ymm6\{k7\},XMMWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7d 38 6c 31\s+vcvttps2uqqs ymm6,DWORD BCST \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7d 28 6c 71 7f\s+vcvttps2uqqs ymm6,XMMWORD PTR \[ecx\+0x7f0\]
\s*[a-f0-9]+:\s*62 f5 7d bf 6c 72 80\s+vcvttps2uqqs ymm6\{k7\}\{z\},DWORD BCST \[edx-0x200\]
\s*[a-f0-9]+:\s*62 f5 7f 08 6c d6\s+vcvttsd2usis edx,xmm6
\s*[a-f0-9]+:\s*62 f5 7f 18 6c d6\s+vcvttsd2usis edx,xmm6\{sae\}
\s*[a-f0-9]+:\s*62 f5 7f 08 6c 94 f4 00 00 00 10\s+vcvttsd2usis edx,QWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7f 08 6c 11\s+vcvttsd2usis edx,QWORD PTR \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7f 08 6c 51 7f\s+vcvttsd2usis edx,QWORD PTR \[ecx\+0x3f8\]
\s*[a-f0-9]+:\s*62 f5 7f 08 6c 52 80\s+vcvttsd2usis edx,QWORD PTR \[edx-0x400\]
\s*[a-f0-9]+:\s*62 f5 7e 08 6c d6\s+vcvttss2usis edx,xmm6
\s*[a-f0-9]+:\s*62 f5 7e 18 6c d6\s+vcvttss2usis edx,xmm6\{sae\}
\s*[a-f0-9]+:\s*62 f5 7e 08 6c 94 f4 00 00 00 10\s+vcvttss2usis edx,DWORD PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*62 f5 7e 08 6c 11\s+vcvttss2usis edx,DWORD PTR \[ecx\]
\s*[a-f0-9]+:\s*62 f5 7e 08 6c 51 7f\s+vcvttss2usis edx,DWORD PTR \[ecx\+0x1fc\]
\s*[a-f0-9]+:\s*62 f5 7e 08 6c 52 80\s+vcvttss2usis edx,DWORD PTR \[edx-0x200\]
#pass

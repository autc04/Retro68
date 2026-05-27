#objdump: -dw
#name: x86-64 AVX10.2/256 satcvt insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 05 7f 08 69 f5\s+vcvtbf162ibs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7f 28 69 f5\s+vcvtbf162ibs\s+%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7f 0f 69 b4 f5 00 00 00 10\s+vcvtbf162ibs\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7f 18 69 31\s+vcvtbf162ibs\s+\(%r9\)\{1to8\},%xmm30
\s*[a-f0-9]+:\s*62 65 7f 08 69 71 7f\s+vcvtbf162ibs\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7f 9f 69 72 80\s+vcvtbf162ibs\s+-0x100\(%rdx\)\{1to8\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 7f 2f 69 b4 f5 00 00 00 10\s+vcvtbf162ibs\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7f 38 69 31\s+vcvtbf162ibs\s+\(%r9\)\{1to16\},%ymm30
\s*[a-f0-9]+:\s*62 65 7f 28 69 71 7f\s+vcvtbf162ibs\s+0xfe0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7f bf 69 72 80\s+vcvtbf162ibs\s+-0x100\(%rdx\)\{1to16\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 7c 08 69 f5\s+vcvtph2ibs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7c 28 69 f5\s+vcvtph2ibs\s+%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7c 0f 69 b4 f5 00 00 00 10\s+vcvtph2ibs\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7c 18 69 31\s+vcvtph2ibs\s+\(%r9\)\{1to8\},%xmm30
\s*[a-f0-9]+:\s*62 65 7c 08 69 71 7f\s+vcvtph2ibs\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7c 9f 69 72 80\s+vcvtph2ibs\s+-0x100\(%rdx\)\{1to8\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 7c 2f 69 b4 f5 00 00 00 10\s+vcvtph2ibs\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7c 38 69 31\s+vcvtph2ibs\s+\(%r9\)\{1to16\},%ymm30
\s*[a-f0-9]+:\s*62 65 7c 28 69 71 7f\s+vcvtph2ibs\s+0xfe0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7c bf 69 72 80\s+vcvtph2ibs\s+-0x100\(%rdx\)\{1to16\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 7d 08 69 f5\s+vcvtps2ibs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7d 28 69 f5\s+vcvtps2ibs\s+%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7d 0f 69 b4 f5 00 00 00 10\s+vcvtps2ibs\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7d 18 69 31\s+vcvtps2ibs\s+\(%r9\)\{1to4\},%xmm30
\s*[a-f0-9]+:\s*62 65 7d 08 69 71 7f\s+vcvtps2ibs\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7d 9f 69 72 80\s+vcvtps2ibs\s+-0x200\(%rdx\)\{1to4\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 7d 2f 69 b4 f5 00 00 00 10\s+vcvtps2ibs\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7d 38 69 31\s+vcvtps2ibs\s+\(%r9\)\{1to8\},%ymm30
\s*[a-f0-9]+:\s*62 65 7d 28 69 71 7f\s+vcvtps2ibs\s+0xfe0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7d bf 69 72 80\s+vcvtps2ibs\s+-0x200\(%rdx\)\{1to8\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 7f 08 68 f5\s+vcvttbf162ibs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7f 28 68 f5\s+vcvttbf162ibs\s+%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7f 0f 68 b4 f5 00 00 00 10\s+vcvttbf162ibs\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7f 18 68 31\s+vcvttbf162ibs\s+\(%r9\)\{1to8\},%xmm30
\s*[a-f0-9]+:\s*62 65 7f 08 68 71 7f\s+vcvttbf162ibs\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7f 9f 68 72 80\s+vcvttbf162ibs\s+-0x100\(%rdx\)\{1to8\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 7f 2f 68 b4 f5 00 00 00 10\s+vcvttbf162ibs\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7f 38 68 31\s+vcvttbf162ibs\s+\(%r9\)\{1to16\},%ymm30
\s*[a-f0-9]+:\s*62 65 7f 28 68 71 7f\s+vcvttbf162ibs\s+0xfe0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7f bf 68 72 80\s+vcvttbf162ibs\s+-0x100\(%rdx\)\{1to16\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 7c 08 68 f5\s+vcvttph2ibs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7c 28 68 f5\s+vcvttph2ibs\s+%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7c 0f 68 b4 f5 00 00 00 10\s+vcvttph2ibs\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7c 18 68 31\s+vcvttph2ibs\s+\(%r9\)\{1to8\},%xmm30
\s*[a-f0-9]+:\s*62 65 7c 08 68 71 7f\s+vcvttph2ibs\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7c 9f 68 72 80\s+vcvttph2ibs\s+-0x100\(%rdx\)\{1to8\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 7c 2f 68 b4 f5 00 00 00 10\s+vcvttph2ibs\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7c 38 68 31\s+vcvttph2ibs\s+\(%r9\)\{1to16\},%ymm30
\s*[a-f0-9]+:\s*62 65 7c 28 68 71 7f\s+vcvttph2ibs\s+0xfe0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7c bf 68 72 80\s+vcvttph2ibs\s+-0x100\(%rdx\)\{1to16\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 7d 08 68 f5\s+vcvttps2ibs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7d 28 68 f5\s+vcvttps2ibs\s+%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7d 0f 68 b4 f5 00 00 00 10\s+vcvttps2ibs\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7d 18 68 31\s+vcvttps2ibs\s+\(%r9\)\{1to4\},%xmm30
\s*[a-f0-9]+:\s*62 65 7d 08 68 71 7f\s+vcvttps2ibs\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7d 9f 68 72 80\s+vcvttps2ibs\s+-0x200\(%rdx\)\{1to4\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 7d 2f 68 b4 f5 00 00 00 10\s+vcvttps2ibs\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7d 38 68 31\s+vcvttps2ibs\s+\(%r9\)\{1to8\},%ymm30
\s*[a-f0-9]+:\s*62 65 7d 28 68 71 7f\s+vcvttps2ibs\s+0xfe0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7d bf 68 72 80\s+vcvttps2ibs\s+-0x200\(%rdx\)\{1to8\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 fc 08 6d f5\s+vcvttpd2dqs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 fc 28 6d f5\s+vcvttpd2dqs\s+%ymm29,%xmm30
\s*[a-f0-9]+:\s*62 25 fc 0f 6d b4 f5 00 00 00 10\s+vcvttpd2dqsx\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 fc 18 6d 31\s+vcvttpd2dqs\s+\(%r9\)\{1to2\},%xmm30
\s*[a-f0-9]+:\s*62 65 fc 08 6d 71 7f\s+vcvttpd2dqsx\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 fc 9f 6d 72 80\s+vcvttpd2dqs\s+-0x400\(%rdx\)\{1to2\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 45 fc 38 6d 31\s+vcvttpd2dqs\s+\(%r9\)\{1to4\},%xmm30
\s*[a-f0-9]+:\s*62 65 fc 28 6d 71 7f\s+vcvttpd2dqsy\s+0xfe0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 fc bf 6d 72 80\s+vcvttpd2dqs\s+-0x400\(%rdx\)\{1to4\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 fd 08 6d f5\s+vcvttpd2qqs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 fd 28 6d f5\s+vcvttpd2qqs\s+%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 25 fd 0f 6d b4 f5 00 00 00 10\s+vcvttpd2qqs\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 fd 18 6d 31\s+vcvttpd2qqs\s+\(%r9\)\{1to2\},%xmm30
\s*[a-f0-9]+:\s*62 65 fd 08 6d 71 7f\s+vcvttpd2qqs\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 fd 9f 6d 72 80\s+vcvttpd2qqs\s+-0x400\(%rdx\)\{1to2\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 fd 2f 6d b4 f5 00 00 00 10\s+vcvttpd2qqs\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 fd 38 6d 31\s+vcvttpd2qqs\s+\(%r9\)\{1to4\},%ymm30
\s*[a-f0-9]+:\s*62 65 fd 28 6d 71 7f\s+vcvttpd2qqs\s+0xfe0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 fd bf 6d 72 80\s+vcvttpd2qqs\s+-0x400\(%rdx\)\{1to4\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 7c 08 6d f5\s+vcvttps2dqs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7c 28 6d f5\s+vcvttps2dqs\s+%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7c 0f 6d b4 f5 00 00 00 10\s+vcvttps2dqs\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7c 18 6d 31\s+vcvttps2dqs\s+\(%r9\)\{1to4\},%xmm30
\s*[a-f0-9]+:\s*62 65 7c 08 6d 71 7f\s+vcvttps2dqs\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7c 9f 6d 72 80\s+vcvttps2dqs\s+-0x200\(%rdx\)\{1to4\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 7c 2f 6d b4 f5 00 00 00 10\s+vcvttps2dqs\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7c 38 6d 31\s+vcvttps2dqs\s+\(%r9\)\{1to8\},%ymm30
\s*[a-f0-9]+:\s*62 65 7c 28 6d 71 7f\s+vcvttps2dqs\s+0xfe0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7c bf 6d 72 80\s+vcvttps2dqs\s+-0x200\(%rdx\)\{1to8\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 7d 08 6d f5\s+vcvttps2qqs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7d 28 6d f5\s+vcvttps2qqs\s+%xmm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7d 0f 6d b4 f5 00 00 00 10\s+vcvttps2qqs\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7d 18 6d 31\s+vcvttps2qqs\s+\(%r9\)\{1to2\},%xmm30
\s*[a-f0-9]+:\s*62 65 7d 08 6d 71 7f\s+vcvttps2qqs\s+0x3f8\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7d 9f 6d 72 80\s+vcvttps2qqs\s+-0x200\(%rdx\)\{1to2\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 7d 2f 6d b4 f5 00 00 00 10\s+vcvttps2qqs\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7d 38 6d 31\s+vcvttps2qqs\s+\(%r9\)\{1to4\},%ymm30
\s*[a-f0-9]+:\s*62 65 7d 28 6d 71 7f\s+vcvttps2qqs\s+0x7f0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7d bf 6d 72 80\s+vcvttps2qqs\s+-0x200\(%rdx\)\{1to4\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 95 7f 08 6d d6\s+vcvttsd2sis\s+%xmm30,%edx
\s*[a-f0-9]+:\s*62 95 7f 18 6d d6\s+vcvttsd2sis\s+\{sae\},%xmm30,%edx
\s*[a-f0-9]+:\s*62 15 ff 08 6d e6\s+vcvttsd2sis\s+%xmm30,%r12
\s*[a-f0-9]+:\s*62 15 ff 18 6d e6\s+vcvttsd2sis\s+\{sae\},%xmm30,%r12
\s*[a-f0-9]+:\s*62 b5 7f 08 6d 94 f5 00 00 00 10\s+vcvttsd2sis\s+0x10000000\(%rbp,%r14,8\),%edx
\s*[a-f0-9]+:\s*62 d5 7f 08 6d 11\s+vcvttsd2sis\s+\(%r9\),%edx
\s*[a-f0-9]+:\s*62 f5 7f 08 6d 51 7f\s+vcvttsd2sis\s+0x3f8\(%rcx\),%edx
\s*[a-f0-9]+:\s*62 f5 7f 08 6d 52 80\s+vcvttsd2sis\s+-0x400\(%rdx\),%edx
\s*[a-f0-9]+:\s*62 35 ff 08 6d a4 f5 00 00 00 10\s+vcvttsd2sis\s+0x10000000\(%rbp,%r14,8\),%r12
\s*[a-f0-9]+:\s*62 55 ff 08 6d 21\s+vcvttsd2sis\s+\(%r9\),%r12
\s*[a-f0-9]+:\s*62 75 ff 08 6d 61 7f\s+vcvttsd2sis\s+0x3f8\(%rcx\),%r12
\s*[a-f0-9]+:\s*62 75 ff 08 6d 62 80\s+vcvttsd2sis\s+-0x400\(%rdx\),%r12
\s*[a-f0-9]+:\s*62 95 7e 08 6d d6\s+vcvttss2sis\s+%xmm30,%edx
\s*[a-f0-9]+:\s*62 95 7e 18 6d d6\s+vcvttss2sis\s+\{sae\},%xmm30,%edx
\s*[a-f0-9]+:\s*62 15 fe 08 6d e6\s+vcvttss2sis\s+%xmm30,%r12
\s*[a-f0-9]+:\s*62 15 fe 18 6d e6\s+vcvttss2sis\s+\{sae\},%xmm30,%r12
\s*[a-f0-9]+:\s*62 b5 7e 08 6d 94 f5 00 00 00 10\s+vcvttss2sis\s+0x10000000\(%rbp,%r14,8\),%edx
\s*[a-f0-9]+:\s*62 d5 7e 08 6d 11\s+vcvttss2sis\s+\(%r9\),%edx
\s*[a-f0-9]+:\s*62 f5 7e 08 6d 51 7f\s+vcvttss2sis\s+0x1fc\(%rcx\),%edx
\s*[a-f0-9]+:\s*62 f5 7e 08 6d 52 80\s+vcvttss2sis\s+-0x200\(%rdx\),%edx
\s*[a-f0-9]+:\s*62 35 fe 08 6d a4 f5 00 00 00 10\s+vcvttss2sis\s+0x10000000\(%rbp,%r14,8\),%r12
\s*[a-f0-9]+:\s*62 55 fe 08 6d 21\s+vcvttss2sis\s+\(%r9\),%r12
\s*[a-f0-9]+:\s*62 75 fe 08 6d 61 7f\s+vcvttss2sis\s+0x1fc\(%rcx\),%r12
\s*[a-f0-9]+:\s*62 75 fe 08 6d 62 80\s+vcvttss2sis\s+-0x200\(%rdx\),%r12
\s*[a-f0-9]+:\s*62 05 7f 08 6b f5\s+vcvtbf162iubs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7f 28 6b f5\s+vcvtbf162iubs\s+%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7f 0f 6b b4 f5 00 00 00 10\s+vcvtbf162iubs\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7f 18 6b 31\s+vcvtbf162iubs\s+\(%r9\)\{1to8\},%xmm30
\s*[a-f0-9]+:\s*62 65 7f 08 6b 71 7f\s+vcvtbf162iubs\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7f 9f 6b 72 80\s+vcvtbf162iubs\s+-0x100\(%rdx\)\{1to8\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 7f 2f 6b b4 f5 00 00 00 10\s+vcvtbf162iubs\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7f 38 6b 31\s+vcvtbf162iubs\s+\(%r9\)\{1to16\},%ymm30
\s*[a-f0-9]+:\s*62 65 7f 28 6b 71 7f\s+vcvtbf162iubs\s+0xfe0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7f bf 6b 72 80\s+vcvtbf162iubs\s+-0x100\(%rdx\)\{1to16\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 7c 08 6b f5\s+vcvtph2iubs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7c 28 6b f5\s+vcvtph2iubs\s+%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7c 0f 6b b4 f5 00 00 00 10\s+vcvtph2iubs\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7c 18 6b 31\s+vcvtph2iubs\s+\(%r9\)\{1to8\},%xmm30
\s*[a-f0-9]+:\s*62 65 7c 08 6b 71 7f\s+vcvtph2iubs\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7c 9f 6b 72 80\s+vcvtph2iubs\s+-0x100\(%rdx\)\{1to8\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 7c 2f 6b b4 f5 00 00 00 10\s+vcvtph2iubs\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7c 38 6b 31\s+vcvtph2iubs\s+\(%r9\)\{1to16\},%ymm30
\s*[a-f0-9]+:\s*62 65 7c 28 6b 71 7f\s+vcvtph2iubs\s+0xfe0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7c bf 6b 72 80\s+vcvtph2iubs\s+-0x100\(%rdx\)\{1to16\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 7d 08 6b f5\s+vcvtps2iubs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7d 28 6b f5\s+vcvtps2iubs\s+%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7d 0f 6b b4 f5 00 00 00 10\s+vcvtps2iubs\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7d 18 6b 31\s+vcvtps2iubs\s+\(%r9\)\{1to4\},%xmm30
\s*[a-f0-9]+:\s*62 65 7d 08 6b 71 7f\s+vcvtps2iubs\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7d 9f 6b 72 80\s+vcvtps2iubs\s+-0x200\(%rdx\)\{1to4\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 7d 2f 6b b4 f5 00 00 00 10\s+vcvtps2iubs\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7d 38 6b 31\s+vcvtps2iubs\s+\(%r9\)\{1to8\},%ymm30
\s*[a-f0-9]+:\s*62 65 7d 28 6b 71 7f\s+vcvtps2iubs\s+0xfe0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7d bf 6b 72 80\s+vcvtps2iubs\s+-0x200\(%rdx\)\{1to8\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 7f 08 6a f5\s+vcvttbf162iubs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7f 28 6a f5\s+vcvttbf162iubs\s+%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7f 0f 6a b4 f5 00 00 00 10\s+vcvttbf162iubs\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7f 18 6a 31\s+vcvttbf162iubs\s+\(%r9\)\{1to8\},%xmm30
\s*[a-f0-9]+:\s*62 65 7f 08 6a 71 7f\s+vcvttbf162iubs\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7f 9f 6a 72 80\s+vcvttbf162iubs\s+-0x100\(%rdx\)\{1to8\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 7f 2f 6a b4 f5 00 00 00 10\s+vcvttbf162iubs\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7f 38 6a 31\s+vcvttbf162iubs\s+\(%r9\)\{1to16\},%ymm30
\s*[a-f0-9]+:\s*62 65 7f 28 6a 71 7f\s+vcvttbf162iubs\s+0xfe0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7f bf 6a 72 80\s+vcvttbf162iubs\s+-0x100\(%rdx\)\{1to16\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 7c 08 6a f5\s+vcvttph2iubs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7c 28 6a f5\s+vcvttph2iubs\s+%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7c 0f 6a b4 f5 00 00 00 10\s+vcvttph2iubs\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7c 18 6a 31\s+vcvttph2iubs\s+\(%r9\)\{1to8\},%xmm30
\s*[a-f0-9]+:\s*62 65 7c 08 6a 71 7f\s+vcvttph2iubs\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7c 9f 6a 72 80\s+vcvttph2iubs\s+-0x100\(%rdx\)\{1to8\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 7c 2f 6a b4 f5 00 00 00 10\s+vcvttph2iubs\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7c 38 6a 31\s+vcvttph2iubs\s+\(%r9\)\{1to16\},%ymm30
\s*[a-f0-9]+:\s*62 65 7c 28 6a 71 7f\s+vcvttph2iubs\s+0xfe0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7c bf 6a 72 80\s+vcvttph2iubs\s+-0x100\(%rdx\)\{1to16\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 7d 08 6a f5\s+vcvttps2iubs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7d 28 6a f5\s+vcvttps2iubs\s+%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7d 0f 6a b4 f5 00 00 00 10\s+vcvttps2iubs\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7d 18 6a 31\s+vcvttps2iubs\s+\(%r9\)\{1to4\},%xmm30
\s*[a-f0-9]+:\s*62 65 7d 08 6a 71 7f\s+vcvttps2iubs\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7d 9f 6a 72 80\s+vcvttps2iubs\s+-0x200\(%rdx\)\{1to4\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 7d 2f 6a b4 f5 00 00 00 10\s+vcvttps2iubs\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7d 38 6a 31\s+vcvttps2iubs\s+\(%r9\)\{1to8\},%ymm30
\s*[a-f0-9]+:\s*62 65 7d 28 6a 71 7f\s+vcvttps2iubs\s+0xfe0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7d bf 6a 72 80\s+vcvttps2iubs\s+-0x200\(%rdx\)\{1to8\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 fc 08 6c f5\s+vcvttpd2udqs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 fc 28 6c f5\s+vcvttpd2udqs\s+%ymm29,%xmm30
\s*[a-f0-9]+:\s*62 25 fc 0f 6c b4 f5 00 00 00 10\s+vcvttpd2udqsx\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 fc 18 6c 31\s+vcvttpd2udqs\s+\(%r9\)\{1to2\},%xmm30
\s*[a-f0-9]+:\s*62 65 fc 08 6c 71 7f\s+vcvttpd2udqsx\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 fc 9f 6c 72 80\s+vcvttpd2udqs\s+-0x400\(%rdx\)\{1to2\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 45 fc 38 6c 31\s+vcvttpd2udqs\s+\(%r9\)\{1to4\},%xmm30
\s*[a-f0-9]+:\s*62 65 fc 28 6c 71 7f\s+vcvttpd2udqsy\s+0xfe0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 fc bf 6c 72 80\s+vcvttpd2udqs\s+-0x400\(%rdx\)\{1to4\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 fd 08 6c f5\s+vcvttpd2uqqs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 fd 28 6c f5\s+vcvttpd2uqqs\s+%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 25 fd 0f 6c b4 f5 00 00 00 10\s+vcvttpd2uqqs\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 fd 18 6c 31\s+vcvttpd2uqqs\s+\(%r9\)\{1to2\},%xmm30
\s*[a-f0-9]+:\s*62 65 fd 08 6c 71 7f\s+vcvttpd2uqqs\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 fd 9f 6c 72 80\s+vcvttpd2uqqs\s+-0x400\(%rdx\)\{1to2\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 fd 2f 6c b4 f5 00 00 00 10\s+vcvttpd2uqqs\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 fd 38 6c 31\s+vcvttpd2uqqs\s+\(%r9\)\{1to4\},%ymm30
\s*[a-f0-9]+:\s*62 65 fd 28 6c 71 7f\s+vcvttpd2uqqs\s+0xfe0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 fd bf 6c 72 80\s+vcvttpd2uqqs\s+-0x400\(%rdx\)\{1to4\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 7c 08 6c f5\s+vcvttps2udqs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7c 28 6c f5\s+vcvttps2udqs\s+%ymm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7c 0f 6c b4 f5 00 00 00 10\s+vcvttps2udqs\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7c 18 6c 31\s+vcvttps2udqs\s+\(%r9\)\{1to4\},%xmm30
\s*[a-f0-9]+:\s*62 65 7c 08 6c 71 7f\s+vcvttps2udqs\s+0x7f0\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7c 9f 6c 72 80\s+vcvttps2udqs\s+-0x200\(%rdx\)\{1to4\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 7c 2f 6c b4 f5 00 00 00 10\s+vcvttps2udqs\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7c 38 6c 31\s+vcvttps2udqs\s+\(%r9\)\{1to8\},%ymm30
\s*[a-f0-9]+:\s*62 65 7c 28 6c 71 7f\s+vcvttps2udqs\s+0xfe0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7c bf 6c 72 80\s+vcvttps2udqs\s+-0x200\(%rdx\)\{1to8\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 05 7d 08 6c f5\s+vcvttps2uqqs\s+%xmm29,%xmm30
\s*[a-f0-9]+:\s*62 05 7d 28 6c f5\s+vcvttps2uqqs\s+%xmm29,%ymm30
\s*[a-f0-9]+:\s*62 25 7d 0f 6c b4 f5 00 00 00 10\s+vcvttps2uqqs\s+0x10000000\(%rbp,%r14,8\),%xmm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7d 18 6c 31\s+vcvttps2uqqs\s+\(%r9\)\{1to2\},%xmm30
\s*[a-f0-9]+:\s*62 65 7d 08 6c 71 7f\s+vcvttps2uqqs\s+0x3f8\(%rcx\),%xmm30
\s*[a-f0-9]+:\s*62 65 7d 9f 6c 72 80\s+vcvttps2uqqs\s+-0x200\(%rdx\)\{1to2\},%xmm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 25 7d 2f 6c b4 f5 00 00 00 10\s+vcvttps2uqqs\s+0x10000000\(%rbp,%r14,8\),%ymm30\{%k7\}
\s*[a-f0-9]+:\s*62 45 7d 38 6c 31\s+vcvttps2uqqs\s+\(%r9\)\{1to4\},%ymm30
\s*[a-f0-9]+:\s*62 65 7d 28 6c 71 7f\s+vcvttps2uqqs\s+0x7f0\(%rcx\),%ymm30
\s*[a-f0-9]+:\s*62 65 7d bf 6c 72 80\s+vcvttps2uqqs\s+-0x200\(%rdx\)\{1to4\},%ymm30\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 95 7f 08 6c d6\s+vcvttsd2usis\s+%xmm30,%edx
\s*[a-f0-9]+:\s*62 95 7f 18 6c d6\s+vcvttsd2usis\s+\{sae\},%xmm30,%edx
\s*[a-f0-9]+:\s*62 15 ff 08 6c e6\s+vcvttsd2usis\s+%xmm30,%r12
\s*[a-f0-9]+:\s*62 15 ff 18 6c e6\s+vcvttsd2usis\s+\{sae\},%xmm30,%r12
\s*[a-f0-9]+:\s*62 b5 7f 08 6c 94 f5 00 00 00 10\s+vcvttsd2usis\s+0x10000000\(%rbp,%r14,8\),%edx
\s*[a-f0-9]+:\s*62 d5 7f 08 6c 11\s+vcvttsd2usis\s+\(%r9\),%edx
\s*[a-f0-9]+:\s*62 f5 7f 08 6c 51 7f\s+vcvttsd2usis\s+0x3f8\(%rcx\),%edx
\s*[a-f0-9]+:\s*62 f5 7f 08 6c 52 80\s+vcvttsd2usis\s+-0x400\(%rdx\),%edx
\s*[a-f0-9]+:\s*62 35 ff 08 6c a4 f5 00 00 00 10\s+vcvttsd2usis\s+0x10000000\(%rbp,%r14,8\),%r12
\s*[a-f0-9]+:\s*62 55 ff 08 6c 21\s+vcvttsd2usis\s+\(%r9\),%r12
\s*[a-f0-9]+:\s*62 75 ff 08 6c 61 7f\s+vcvttsd2usis\s+0x3f8\(%rcx\),%r12
\s*[a-f0-9]+:\s*62 75 ff 08 6c 62 80\s+vcvttsd2usis\s+-0x400\(%rdx\),%r12
\s*[a-f0-9]+:\s*62 95 7e 08 6c d6\s+vcvttss2usis\s+%xmm30,%edx
\s*[a-f0-9]+:\s*62 95 7e 18 6c d6\s+vcvttss2usis\s+\{sae\},%xmm30,%edx
\s*[a-f0-9]+:\s*62 15 fe 08 6c e6\s+vcvttss2usis\s+%xmm30,%r12
\s*[a-f0-9]+:\s*62 15 fe 18 6c e6\s+vcvttss2usis\s+\{sae\},%xmm30,%r12
\s*[a-f0-9]+:\s*62 b5 7e 08 6c 94 f5 00 00 00 10\s+vcvttss2usis\s+0x10000000\(%rbp,%r14,8\),%edx
\s*[a-f0-9]+:\s*62 d5 7e 08 6c 11\s+vcvttss2usis\s+\(%r9\),%edx
\s*[a-f0-9]+:\s*62 f5 7e 08 6c 51 7f\s+vcvttss2usis\s+0x1fc\(%rcx\),%edx
\s*[a-f0-9]+:\s*62 f5 7e 08 6c 52 80\s+vcvttss2usis\s+-0x200\(%rdx\),%edx
\s*[a-f0-9]+:\s*62 35 fe 08 6c a4 f5 00 00 00 10\s+vcvttss2usis\s+0x10000000\(%rbp,%r14,8\),%r12
\s*[a-f0-9]+:\s*62 55 fe 08 6c 21\s+vcvttss2usis\s+\(%r9\),%r12
\s*[a-f0-9]+:\s*62 75 fe 08 6c 61 7f\s+vcvttss2usis\s+0x1fc\(%rcx\),%r12
\s*[a-f0-9]+:\s*62 75 fe 08 6c 62 80\s+vcvttss2usis\s+-0x200\(%rdx\),%r12
#pass

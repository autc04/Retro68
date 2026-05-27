#objdump: -dw
#name: i386 AVX10.2/256 satcvt insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 f5 7f 08 69 f5\s+vcvtbf162ibs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7f 28 69 f5\s+vcvtbf162ibs\s+%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7f 0f 69 b4 f4 00 00 00 10\s+vcvtbf162ibs\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7f 18 69 31\s+vcvtbf162ibs\s+\(%ecx\)\{1to8\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7f 08 69 71 7f\s+vcvtbf162ibs\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7f 9f 69 72 80\s+vcvtbf162ibs\s+-0x100\(%edx\)\{1to8\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7f 2f 69 b4 f4 00 00 00 10\s+vcvtbf162ibs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7f 38 69 31\s+vcvtbf162ibs\s+\(%ecx\)\{1to16\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7f 28 69 71 7f\s+vcvtbf162ibs\s+0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7f bf 69 72 80\s+vcvtbf162ibs\s+-0x100\(%edx\)\{1to16\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7c 08 69 f5\s+vcvtph2ibs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7c 28 69 f5\s+vcvtph2ibs\s+%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7c 0f 69 b4 f4 00 00 00 10\s+vcvtph2ibs\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7c 18 69 31\s+vcvtph2ibs\s+\(%ecx\)\{1to8\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7c 08 69 71 7f\s+vcvtph2ibs\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7c 9f 69 72 80\s+vcvtph2ibs\s+-0x100\(%edx\)\{1to8\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7c 2f 69 b4 f4 00 00 00 10\s+vcvtph2ibs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7c 38 69 31\s+vcvtph2ibs\s+\(%ecx\)\{1to16\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7c 28 69 71 7f\s+vcvtph2ibs\s+0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7c bf 69 72 80\s+vcvtph2ibs\s+-0x100\(%edx\)\{1to16\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 08 69 f5\s+vcvtps2ibs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 28 69 f5\s+vcvtps2ibs\s+%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7d 0f 69 b4 f4 00 00 00 10\s+vcvtps2ibs\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 18 69 31\s+vcvtps2ibs\s+\(%ecx\)\{1to4\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 08 69 71 7f\s+vcvtps2ibs\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 9f 69 72 80\s+vcvtps2ibs\s+-0x200\(%edx\)\{1to4\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 2f 69 b4 f4 00 00 00 10\s+vcvtps2ibs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 38 69 31\s+vcvtps2ibs\s+\(%ecx\)\{1to8\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7d 28 69 71 7f\s+vcvtps2ibs\s+0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7d bf 69 72 80\s+vcvtps2ibs\s+-0x200\(%edx\)\{1to8\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7f 08 68 f5\s+vcvttbf162ibs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7f 28 68 f5\s+vcvttbf162ibs\s+%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7f 0f 68 b4 f4 00 00 00 10\s+vcvttbf162ibs\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7f 18 68 31\s+vcvttbf162ibs\s+\(%ecx\)\{1to8\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7f 08 68 71 7f\s+vcvttbf162ibs\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7f 9f 68 72 80\s+vcvttbf162ibs\s+-0x100\(%edx\)\{1to8\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7f 2f 68 b4 f4 00 00 00 10\s+vcvttbf162ibs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7f 38 68 31\s+vcvttbf162ibs\s+\(%ecx\)\{1to16\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7f 28 68 71 7f\s+vcvttbf162ibs\s+0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7f bf 68 72 80\s+vcvttbf162ibs\s+-0x100\(%edx\)\{1to16\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7c 08 68 f5\s+vcvttph2ibs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7c 28 68 f5\s+vcvttph2ibs\s+%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7c 0f 68 b4 f4 00 00 00 10\s+vcvttph2ibs\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7c 18 68 31\s+vcvttph2ibs\s+\(%ecx\)\{1to8\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7c 08 68 71 7f\s+vcvttph2ibs\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7c 9f 68 72 80\s+vcvttph2ibs\s+-0x100\(%edx\)\{1to8\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7c 2f 68 b4 f4 00 00 00 10\s+vcvttph2ibs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7c 38 68 31\s+vcvttph2ibs\s+\(%ecx\)\{1to16\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7c 28 68 71 7f\s+vcvttph2ibs\s+0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7c bf 68 72 80\s+vcvttph2ibs\s+-0x100\(%edx\)\{1to16\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 08 68 f5\s+vcvttps2ibs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 28 68 f5\s+vcvttps2ibs\s+%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7d 0f 68 b4 f4 00 00 00 10\s+vcvttps2ibs\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 18 68 31\s+vcvttps2ibs\s+\(%ecx\)\{1to4\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 08 68 71 7f\s+vcvttps2ibs\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 9f 68 72 80\s+vcvttps2ibs\s+-0x200\(%edx\)\{1to4\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 2f 68 b4 f4 00 00 00 10\s+vcvttps2ibs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 38 68 31\s+vcvttps2ibs\s+\(%ecx\)\{1to8\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7d 28 68 71 7f\s+vcvttps2ibs\s+0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7d bf 68 72 80\s+vcvttps2ibs\s+-0x200\(%edx\)\{1to8\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 fc 08 6d f5\s+vcvttpd2dqs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 fc 28 6d f5\s+vcvttpd2dqs\s+%ymm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 fc 0f 6d b4 f4 00 00 00 10\s+vcvttpd2dqsx\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 fc 18 6d 31\s+vcvttpd2dqs\s+\(%ecx\)\{1to2\},%xmm6
\s*[a-f0-9]+:\s*62 f5 fc 08 6d 71 7f\s+vcvttpd2dqsx\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 fc 9f 6d 72 80\s+vcvttpd2dqs\s+-0x400\(%edx\)\{1to2\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 fc 38 6d 31\s+vcvttpd2dqs\s+\(%ecx\)\{1to4\},%xmm6
\s*[a-f0-9]+:\s*62 f5 fc 28 6d 71 7f\s+vcvttpd2dqsy\s+0xfe0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 fc bf 6d 72 80\s+vcvttpd2dqs\s+-0x400\(%edx\)\{1to4\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 fd 08 6d f5\s+vcvttpd2qqs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 fd 28 6d f5\s+vcvttpd2qqs\s+%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 fd 0f 6d b4 f4 00 00 00 10\s+vcvttpd2qqs\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 fd 18 6d 31\s+vcvttpd2qqs\s+\(%ecx\)\{1to2\},%xmm6
\s*[a-f0-9]+:\s*62 f5 fd 08 6d 71 7f\s+vcvttpd2qqs\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 fd 9f 6d 72 80\s+vcvttpd2qqs\s+-0x400\(%edx\)\{1to2\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 fd 2f 6d b4 f4 00 00 00 10\s+vcvttpd2qqs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 fd 38 6d 31\s+vcvttpd2qqs\s+\(%ecx\)\{1to4\},%ymm6
\s*[a-f0-9]+:\s*62 f5 fd 28 6d 71 7f\s+vcvttpd2qqs\s+0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 fd bf 6d 72 80\s+vcvttpd2qqs\s+-0x400\(%edx\)\{1to4\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7c 08 6d f5\s+vcvttps2dqs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7c 28 6d f5\s+vcvttps2dqs\s+%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7c 0f 6d b4 f4 00 00 00 10\s+vcvttps2dqs\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7c 18 6d 31\s+vcvttps2dqs\s+\(%ecx\)\{1to4\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7c 08 6d 71 7f\s+vcvttps2dqs\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7c 9f 6d 72 80\s+vcvttps2dqs\s+-0x200\(%edx\)\{1to4\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7c 2f 6d b4 f4 00 00 00 10\s+vcvttps2dqs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7c 38 6d 31\s+vcvttps2dqs\s+\(%ecx\)\{1to8\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7c 28 6d 71 7f\s+vcvttps2dqs\s+0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7c bf 6d 72 80\s+vcvttps2dqs\s+-0x200\(%edx\)\{1to8\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 08 6d f5\s+vcvttps2qqs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 28 6d f5\s+vcvttps2qqs\s+%xmm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7d 0f 6d b4 f4 00 00 00 10\s+vcvttps2qqs\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 18 6d 31\s+vcvttps2qqs\s+\(%ecx\)\{1to2\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 08 6d 71 7f\s+vcvttps2qqs\s+0x3f8\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 9f 6d 72 80\s+vcvttps2qqs\s+-0x200\(%edx\)\{1to2\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 2f 6d b4 f4 00 00 00 10\s+vcvttps2qqs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 38 6d 31\s+vcvttps2qqs\s+\(%ecx\)\{1to4\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7d 28 6d 71 7f\s+vcvttps2qqs\s+0x7f0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7d bf 6d 72 80\s+vcvttps2qqs\s+-0x200\(%edx\)\{1to4\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7f 08 6d d6\s+vcvttsd2sis\s+%xmm6,%edx
\s*[a-f0-9]+:\s*62 f5 7f 18 6d d6\s+vcvttsd2sis\s+\{sae\},%xmm6,%edx
\s*[a-f0-9]+:\s*62 f5 7f 08 6d 94 f4 00 00 00 10\s+vcvttsd2sis\s+0x10000000\(%esp,%esi,8\),%edx
\s*[a-f0-9]+:\s*62 f5 7f 08 6d 11\s+vcvttsd2sis\s+\(%ecx\),%edx
\s*[a-f0-9]+:\s*62 f5 7f 08 6d 51 7f\s+vcvttsd2sis\s+0x3f8\(%ecx\),%edx
\s*[a-f0-9]+:\s*62 f5 7f 08 6d 52 80\s+vcvttsd2sis\s+-0x400\(%edx\),%edx
\s*[a-f0-9]+:\s*62 f5 7e 08 6d d6\s+vcvttss2sis\s+%xmm6,%edx
\s*[a-f0-9]+:\s*62 f5 7e 18 6d d6\s+vcvttss2sis\s+\{sae\},%xmm6,%edx
\s*[a-f0-9]+:\s*62 f5 7e 08 6d 94 f4 00 00 00 10\s+vcvttss2sis\s+0x10000000\(%esp,%esi,8\),%edx
\s*[a-f0-9]+:\s*62 f5 7e 08 6d 11\s+vcvttss2sis\s+\(%ecx\),%edx
\s*[a-f0-9]+:\s*62 f5 7e 08 6d 51 7f\s+vcvttss2sis\s+0x1fc\(%ecx\),%edx
\s*[a-f0-9]+:\s*62 f5 7e 08 6d 52 80\s+vcvttss2sis\s+-0x200\(%edx\),%edx
\s*[a-f0-9]+:\s*62 f5 7f 08 6b f5\s+vcvtbf162iubs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7f 28 6b f5\s+vcvtbf162iubs\s+%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7f 0f 6b b4 f4 00 00 00 10\s+vcvtbf162iubs\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7f 18 6b 31\s+vcvtbf162iubs\s+\(%ecx\)\{1to8\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7f 08 6b 71 7f\s+vcvtbf162iubs\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7f 9f 6b 72 80\s+vcvtbf162iubs\s+-0x100\(%edx\)\{1to8\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7f 2f 6b b4 f4 00 00 00 10\s+vcvtbf162iubs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7f 38 6b 31\s+vcvtbf162iubs\s+\(%ecx\)\{1to16\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7f 28 6b 71 7f\s+vcvtbf162iubs\s+0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7f bf 6b 72 80\s+vcvtbf162iubs\s+-0x100\(%edx\)\{1to16\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7c 08 6b f5\s+vcvtph2iubs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7c 28 6b f5\s+vcvtph2iubs\s+%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7c 0f 6b b4 f4 00 00 00 10\s+vcvtph2iubs\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7c 18 6b 31\s+vcvtph2iubs\s+\(%ecx\)\{1to8\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7c 08 6b 71 7f\s+vcvtph2iubs\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7c 9f 6b 72 80\s+vcvtph2iubs\s+-0x100\(%edx\)\{1to8\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7c 2f 6b b4 f4 00 00 00 10\s+vcvtph2iubs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7c 38 6b 31\s+vcvtph2iubs\s+\(%ecx\)\{1to16\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7c 28 6b 71 7f\s+vcvtph2iubs\s+0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7c bf 6b 72 80\s+vcvtph2iubs\s+-0x100\(%edx\)\{1to16\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 08 6b f5\s+vcvtps2iubs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 28 6b f5\s+vcvtps2iubs\s+%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7d 0f 6b b4 f4 00 00 00 10\s+vcvtps2iubs\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 18 6b 31\s+vcvtps2iubs\s+\(%ecx\)\{1to4\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 08 6b 71 7f\s+vcvtps2iubs\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 9f 6b 72 80\s+vcvtps2iubs\s+-0x200\(%edx\)\{1to4\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 2f 6b b4 f4 00 00 00 10\s+vcvtps2iubs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 38 6b 31\s+vcvtps2iubs\s+\(%ecx\)\{1to8\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7d 28 6b 71 7f\s+vcvtps2iubs\s+0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7d bf 6b 72 80\s+vcvtps2iubs\s+-0x200\(%edx\)\{1to8\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7f 08 6a f5\s+vcvttbf162iubs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7f 28 6a f5\s+vcvttbf162iubs\s+%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7f 0f 6a b4 f4 00 00 00 10\s+vcvttbf162iubs\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7f 18 6a 31\s+vcvttbf162iubs\s+\(%ecx\)\{1to8\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7f 08 6a 71 7f\s+vcvttbf162iubs\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7f 9f 6a 72 80\s+vcvttbf162iubs\s+-0x100\(%edx\)\{1to8\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7f 2f 6a b4 f4 00 00 00 10\s+vcvttbf162iubs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7f 38 6a 31\s+vcvttbf162iubs\s+\(%ecx\)\{1to16\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7f 28 6a 71 7f\s+vcvttbf162iubs\s+0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7f bf 6a 72 80\s+vcvttbf162iubs\s+-0x100\(%edx\)\{1to16\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7c 08 6a f5\s+vcvttph2iubs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7c 28 6a f5\s+vcvttph2iubs\s+%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7c 0f 6a b4 f4 00 00 00 10\s+vcvttph2iubs\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7c 18 6a 31\s+vcvttph2iubs\s+\(%ecx\)\{1to8\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7c 08 6a 71 7f\s+vcvttph2iubs\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7c 9f 6a 72 80\s+vcvttph2iubs\s+-0x100\(%edx\)\{1to8\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7c 2f 6a b4 f4 00 00 00 10\s+vcvttph2iubs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7c 38 6a 31\s+vcvttph2iubs\s+\(%ecx\)\{1to16\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7c 28 6a 71 7f\s+vcvttph2iubs\s+0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7c bf 6a 72 80\s+vcvttph2iubs\s+-0x100\(%edx\)\{1to16\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 08 6a f5\s+vcvttps2iubs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 28 6a f5\s+vcvttps2iubs\s+%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7d 0f 6a b4 f4 00 00 00 10\s+vcvttps2iubs\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 18 6a 31\s+vcvttps2iubs\s+\(%ecx\)\{1to4\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 08 6a 71 7f\s+vcvttps2iubs\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 9f 6a 72 80\s+vcvttps2iubs\s+-0x200\(%edx\)\{1to4\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 2f 6a b4 f4 00 00 00 10\s+vcvttps2iubs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 38 6a 31\s+vcvttps2iubs\s+\(%ecx\)\{1to8\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7d 28 6a 71 7f\s+vcvttps2iubs\s+0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7d bf 6a 72 80\s+vcvttps2iubs\s+-0x200\(%edx\)\{1to8\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 fc 08 6c f5\s+vcvttpd2udqs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 fc 28 6c f5\s+vcvttpd2udqs\s+%ymm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 fc 0f 6c b4 f4 00 00 00 10\s+vcvttpd2udqsx\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 fc 18 6c 31\s+vcvttpd2udqs\s+\(%ecx\)\{1to2\},%xmm6
\s*[a-f0-9]+:\s*62 f5 fc 08 6c 71 7f\s+vcvttpd2udqsx\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 fc 9f 6c 72 80\s+vcvttpd2udqs\s+-0x400\(%edx\)\{1to2\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 fc 38 6c 31\s+vcvttpd2udqs\s+\(%ecx\)\{1to4\},%xmm6
\s*[a-f0-9]+:\s*62 f5 fc 28 6c 71 7f\s+vcvttpd2udqsy\s+0xfe0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 fc bf 6c 72 80\s+vcvttpd2udqs\s+-0x400\(%edx\)\{1to4\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 fd 08 6c f5\s+vcvttpd2uqqs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 fd 28 6c f5\s+vcvttpd2uqqs\s+%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 fd 0f 6c b4 f4 00 00 00 10\s+vcvttpd2uqqs\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 fd 18 6c 31\s+vcvttpd2uqqs\s+\(%ecx\)\{1to2\},%xmm6
\s*[a-f0-9]+:\s*62 f5 fd 08 6c 71 7f\s+vcvttpd2uqqs\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 fd 9f 6c 72 80\s+vcvttpd2uqqs\s+-0x400\(%edx\)\{1to2\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 fd 2f 6c b4 f4 00 00 00 10\s+vcvttpd2uqqs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 fd 38 6c 31\s+vcvttpd2uqqs\s+\(%ecx\)\{1to4\},%ymm6
\s*[a-f0-9]+:\s*62 f5 fd 28 6c 71 7f\s+vcvttpd2uqqs\s+0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 fd bf 6c 72 80\s+vcvttpd2uqqs\s+-0x400\(%edx\)\{1to4\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7c 08 6c f5\s+vcvttps2udqs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7c 28 6c f5\s+vcvttps2udqs\s+%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7c 0f 6c b4 f4 00 00 00 10\s+vcvttps2udqs\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7c 18 6c 31\s+vcvttps2udqs\s+\(%ecx\)\{1to4\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7c 08 6c 71 7f\s+vcvttps2udqs\s+0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7c 9f 6c 72 80\s+vcvttps2udqs\s+-0x200\(%edx\)\{1to4\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7c 2f 6c b4 f4 00 00 00 10\s+vcvttps2udqs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7c 38 6c 31\s+vcvttps2udqs\s+\(%ecx\)\{1to8\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7c 28 6c 71 7f\s+vcvttps2udqs\s+0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7c bf 6c 72 80\s+vcvttps2udqs\s+-0x200\(%edx\)\{1to8\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 08 6c f5\s+vcvttps2uqqs\s+%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 28 6c f5\s+vcvttps2uqqs\s+%xmm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7d 0f 6c b4 f4 00 00 00 10\s+vcvttps2uqqs\s+0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 18 6c 31\s+vcvttps2uqqs\s+\(%ecx\)\{1to2\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 08 6c 71 7f\s+vcvttps2uqqs\s+0x3f8\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 9f 6c 72 80\s+vcvttps2uqqs\s+-0x200\(%edx\)\{1to2\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 2f 6c b4 f4 00 00 00 10\s+vcvttps2uqqs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 38 6c 31\s+vcvttps2uqqs\s+\(%ecx\)\{1to4\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7d 28 6c 71 7f\s+vcvttps2uqqs\s+0x7f0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7d bf 6c 72 80\s+vcvttps2uqqs\s+-0x200\(%edx\)\{1to4\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7f 08 6c d6\s+vcvttsd2usis\s+%xmm6,%edx
\s*[a-f0-9]+:\s*62 f5 7f 18 6c d6\s+vcvttsd2usis\s+\{sae\},%xmm6,%edx
\s*[a-f0-9]+:\s*62 f5 7f 08 6c 94 f4 00 00 00 10\s+vcvttsd2usis\s+0x10000000\(%esp,%esi,8\),%edx
\s*[a-f0-9]+:\s*62 f5 7f 08 6c 11\s+vcvttsd2usis\s+\(%ecx\),%edx
\s*[a-f0-9]+:\s*62 f5 7f 08 6c 51 7f\s+vcvttsd2usis\s+0x3f8\(%ecx\),%edx
\s*[a-f0-9]+:\s*62 f5 7f 08 6c 52 80\s+vcvttsd2usis\s+-0x400\(%edx\),%edx
\s*[a-f0-9]+:\s*62 f5 7e 08 6c d6\s+vcvttss2usis\s+%xmm6,%edx
\s*[a-f0-9]+:\s*62 f5 7e 18 6c d6\s+vcvttss2usis\s+\{sae\},%xmm6,%edx
\s*[a-f0-9]+:\s*62 f5 7e 08 6c 94 f4 00 00 00 10\s+vcvttss2usis\s+0x10000000\(%esp,%esi,8\),%edx
\s*[a-f0-9]+:\s*62 f5 7e 08 6c 11\s+vcvttss2usis\s+\(%ecx\),%edx
\s*[a-f0-9]+:\s*62 f5 7e 08 6c 51 7f\s+vcvttss2usis\s+0x1fc\(%ecx\),%edx
\s*[a-f0-9]+:\s*62 f5 7e 08 6c 52 80\s+vcvttss2usis\s+-0x200\(%edx\),%edx
#pass

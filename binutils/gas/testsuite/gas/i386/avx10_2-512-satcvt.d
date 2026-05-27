#objdump: -dw
#name: i386 AVX10.2/512 satcvt insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 f5 7f 48 69 f5\s+vcvtbf162ibs\s+%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7f 4f 69 b4 f4 00 00 00 10\s+vcvtbf162ibs\s+0x10000000\(%esp,%esi,8\),%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7f 58 69 31\s+vcvtbf162ibs\s+\(%ecx\)\{1to32\},%zmm6
\s*[a-f0-9]+:\s*62 f5 7f 48 69 71 7f\s+vcvtbf162ibs\s+0x1fc0\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 7f df 69 72 80\s+vcvtbf162ibs\s+-0x100\(%edx\)\{1to32\},%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7c 48 69 f5\s+vcvtph2ibs\s+%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7c 18 69 f5\s+vcvtph2ibs\s+\{rn-sae\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7c 4f 69 b4 f4 00 00 00 10\s+vcvtph2ibs\s+0x10000000\(%esp,%esi,8\),%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7c 58 69 31\s+vcvtph2ibs\s+\(%ecx\)\{1to32\},%zmm6
\s*[a-f0-9]+:\s*62 f5 7c 48 69 71 7f\s+vcvtph2ibs\s+0x1fc0\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 7c df 69 72 80\s+vcvtph2ibs\s+-0x100\(%edx\)\{1to32\},%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 48 69 f5\s+vcvtps2ibs\s+%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7d 18 69 f5\s+vcvtps2ibs\s+\{rn-sae\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7d 4f 69 b4 f4 00 00 00 10\s+vcvtps2ibs\s+0x10000000\(%esp,%esi,8\),%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 58 69 31\s+vcvtps2ibs\s+\(%ecx\)\{1to16\},%zmm6
\s*[a-f0-9]+:\s*62 f5 7d 48 69 71 7f\s+vcvtps2ibs\s+0x1fc0\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 7d df 69 72 80\s+vcvtps2ibs\s+-0x200\(%edx\)\{1to16\},%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7f 48 68 f5\s+vcvttbf162ibs\s+%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7f 4f 68 b4 f4 00 00 00 10\s+vcvttbf162ibs\s+0x10000000\(%esp,%esi,8\),%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7f 58 68 31\s+vcvttbf162ibs\s+\(%ecx\)\{1to32\},%zmm6
\s*[a-f0-9]+:\s*62 f5 7f 48 68 71 7f\s+vcvttbf162ibs\s+0x1fc0\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 7f df 68 72 80\s+vcvttbf162ibs\s+-0x100\(%edx\)\{1to32\},%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7c 48 68 f5\s+vcvttph2ibs\s+%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7c 18 68 f5\s+vcvttph2ibs\s+\{sae\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7c 4f 68 b4 f4 00 00 00 10\s+vcvttph2ibs\s+0x10000000\(%esp,%esi,8\),%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7c 58 68 31\s+vcvttph2ibs\s+\(%ecx\)\{1to32\},%zmm6
\s*[a-f0-9]+:\s*62 f5 7c 48 68 71 7f\s+vcvttph2ibs\s+0x1fc0\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 7c df 68 72 80\s+vcvttph2ibs\s+-0x100\(%edx\)\{1to32\},%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 48 68 f5\s+vcvttps2ibs\s+%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7d 18 68 f5\s+vcvttps2ibs\s+\{sae\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7d 4f 68 b4 f4 00 00 00 10\s+vcvttps2ibs\s+0x10000000\(%esp,%esi,8\),%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 58 68 31\s+vcvttps2ibs\s+\(%ecx\)\{1to16\},%zmm6
\s*[a-f0-9]+:\s*62 f5 7d 48 68 71 7f\s+vcvttps2ibs\s+0x1fc0\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 7d df 68 72 80\s+vcvttps2ibs\s+-0x200\(%edx\)\{1to16\},%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 fc 48 6d f5\s+vcvttpd2dqs\s+%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 fc 18 6d f5\s+vcvttpd2dqs\s+\{sae\},%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 fc 4f 6d b4 f4 00 00 00 10\s+vcvttpd2dqs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 fc 58 6d 31\s+vcvttpd2dqs\s+\(%ecx\)\{1to8\},%ymm6
\s*[a-f0-9]+:\s*62 f5 fc 48 6d 71 7f\s+vcvttpd2dqs\s+0x1fc0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 fc df 6d 72 80\s+vcvttpd2dqs\s+-0x400\(%edx\)\{1to8\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 fd 48 6d f5\s+vcvttpd2qqs\s+%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 fd 18 6d f5\s+vcvttpd2qqs\s+\{sae\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 fd 4f 6d b4 f4 00 00 00 10\s+vcvttpd2qqs\s+0x10000000\(%esp,%esi,8\),%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 fd 58 6d 31\s+vcvttpd2qqs\s+\(%ecx\)\{1to8\},%zmm6
\s*[a-f0-9]+:\s*62 f5 fd 48 6d 71 7f\s+vcvttpd2qqs\s+0x1fc0\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 fd df 6d 72 80\s+vcvttpd2qqs\s+-0x400\(%edx\)\{1to8\},%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7c 48 6d f5\s+vcvttps2dqs\s+%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7c 18 6d f5\s+vcvttps2dqs\s+\{sae\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7c 4f 6d b4 f4 00 00 00 10\s+vcvttps2dqs\s+0x10000000\(%esp,%esi,8\),%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7c 58 6d 31\s+vcvttps2dqs\s+\(%ecx\)\{1to16\},%zmm6
\s*[a-f0-9]+:\s*62 f5 7c 48 6d 71 7f\s+vcvttps2dqs\s+0x1fc0\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 7c df 6d 72 80\s+vcvttps2dqs\s+-0x200\(%edx\)\{1to16\},%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 48 6d f5\s+vcvttps2qqs\s+%ymm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7d 18 6d f5\s+vcvttps2qqs\s+\{sae\},%ymm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7d 4f 6d b4 f4 00 00 00 10\s+vcvttps2qqs\s+0x10000000\(%esp,%esi,8\),%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 58 6d 31\s+vcvttps2qqs\s+\(%ecx\)\{1to8\},%zmm6
\s*[a-f0-9]+:\s*62 f5 7d 48 6d 71 7f\s+vcvttps2qqs\s+0xfe0\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 7d df 6d 72 80\s+vcvttps2qqs\s+-0x200\(%edx\)\{1to8\},%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7f 48 6b f5\s+vcvtbf162iubs\s+%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7f 4f 6b b4 f4 00 00 00 10\s+vcvtbf162iubs\s+0x10000000\(%esp,%esi,8\),%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7f 58 6b 31\s+vcvtbf162iubs\s+\(%ecx\)\{1to32\},%zmm6
\s*[a-f0-9]+:\s*62 f5 7f 48 6b 71 7f\s+vcvtbf162iubs\s+0x1fc0\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 7f df 6b 72 80\s+vcvtbf162iubs\s+-0x100\(%edx\)\{1to32\},%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7c 48 6b f5\s+vcvtph2iubs\s+%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7c 18 6b f5\s+vcvtph2iubs\s+\{rn-sae\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7c 4f 6b b4 f4 00 00 00 10\s+vcvtph2iubs\s+0x10000000\(%esp,%esi,8\),%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7c 58 6b 31\s+vcvtph2iubs\s+\(%ecx\)\{1to32\},%zmm6
\s*[a-f0-9]+:\s*62 f5 7c 48 6b 71 7f\s+vcvtph2iubs\s+0x1fc0\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 7c df 6b 72 80\s+vcvtph2iubs\s+-0x100\(%edx\)\{1to32\},%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 48 6b f5\s+vcvtps2iubs\s+%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7d 18 6b f5\s+vcvtps2iubs\s+\{rn-sae\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7d 4f 6b b4 f4 00 00 00 10\s+vcvtps2iubs\s+0x10000000\(%esp,%esi,8\),%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 58 6b 31\s+vcvtps2iubs\s+\(%ecx\)\{1to16\},%zmm6
\s*[a-f0-9]+:\s*62 f5 7d 48 6b 71 7f\s+vcvtps2iubs\s+0x1fc0\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 7d df 6b 72 80\s+vcvtps2iubs\s+-0x200\(%edx\)\{1to16\},%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7f 48 6a f5\s+vcvttbf162iubs\s+%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7f 4f 6a b4 f4 00 00 00 10\s+vcvttbf162iubs\s+0x10000000\(%esp,%esi,8\),%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7f 58 6a 31\s+vcvttbf162iubs\s+\(%ecx\)\{1to32\},%zmm6
\s*[a-f0-9]+:\s*62 f5 7f 48 6a 71 7f\s+vcvttbf162iubs\s+0x1fc0\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 7f df 6a 72 80\s+vcvttbf162iubs\s+-0x100\(%edx\)\{1to32\},%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7c 48 6a f5\s+vcvttph2iubs\s+%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7c 18 6a f5\s+vcvttph2iubs\s+\{sae\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7c 4f 6a b4 f4 00 00 00 10\s+vcvttph2iubs\s+0x10000000\(%esp,%esi,8\),%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7c 58 6a 31\s+vcvttph2iubs\s+\(%ecx\)\{1to32\},%zmm6
\s*[a-f0-9]+:\s*62 f5 7c 48 6a 71 7f\s+vcvttph2iubs\s+0x1fc0\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 7c df 6a 72 80\s+vcvttph2iubs\s+-0x100\(%edx\)\{1to32\},%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 48 6a f5\s+vcvttps2iubs\s+%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7d 18 6a f5\s+vcvttps2iubs\s+\{sae\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7d 4f 6a b4 f4 00 00 00 10\s+vcvttps2iubs\s+0x10000000\(%esp,%esi,8\),%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 58 6a 31\s+vcvttps2iubs\s+\(%ecx\)\{1to16\},%zmm6
\s*[a-f0-9]+:\s*62 f5 7d 48 6a 71 7f\s+vcvttps2iubs\s+0x1fc0\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 7d df 6a 72 80\s+vcvttps2iubs\s+-0x200\(%edx\)\{1to16\},%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 fc 48 6c f5\s+vcvttpd2udqs\s+%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 fc 18 6c f5\s+vcvttpd2udqs\s+\{sae\},%zmm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 fc 4f 6c b4 f4 00 00 00 10\s+vcvttpd2udqs\s+0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 fc 58 6c 31\s+vcvttpd2udqs\s+\(%ecx\)\{1to8\},%ymm6
\s*[a-f0-9]+:\s*62 f5 fc 48 6c 71 7f\s+vcvttpd2udqs\s+0x1fc0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 fc df 6c 72 80\s+vcvttpd2udqs\s+-0x400\(%edx\)\{1to8\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 fd 48 6c f5\s+vcvttpd2uqqs\s+%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 fd 18 6c f5\s+vcvttpd2uqqs\s+\{sae\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 fd 4f 6c b4 f4 00 00 00 10\s+vcvttpd2uqqs\s+0x10000000\(%esp,%esi,8\),%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 fd 58 6c 31\s+vcvttpd2uqqs\s+\(%ecx\)\{1to8\},%zmm6
\s*[a-f0-9]+:\s*62 f5 fd 48 6c 71 7f\s+vcvttpd2uqqs\s+0x1fc0\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 fd df 6c 72 80\s+vcvttpd2uqqs\s+-0x400\(%edx\)\{1to8\},%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7c 48 6c f5\s+vcvttps2udqs\s+%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7c 18 6c f5\s+vcvttps2udqs\s+\{sae\},%zmm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7c 4f 6c b4 f4 00 00 00 10\s+vcvttps2udqs\s+0x10000000\(%esp,%esi,8\),%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7c 58 6c 31\s+vcvttps2udqs\s+\(%ecx\)\{1to16\},%zmm6
\s*[a-f0-9]+:\s*62 f5 7c 48 6c 71 7f\s+vcvttps2udqs\s+0x1fc0\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 7c df 6c 72 80\s+vcvttps2udqs\s+-0x200\(%edx\)\{1to16\},%zmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 48 6c f5\s+vcvttps2uqqs\s+%ymm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7d 18 6c f5\s+vcvttps2uqqs\s+\{sae\},%ymm5,%zmm6
\s*[a-f0-9]+:\s*62 f5 7d 4f 6c b4 f4 00 00 00 10\s+vcvttps2uqqs\s+0x10000000\(%esp,%esi,8\),%zmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 58 6c 31\s+vcvttps2uqqs\s+\(%ecx\)\{1to8\},%zmm6
\s*[a-f0-9]+:\s*62 f5 7d 48 6c 71 7f\s+vcvttps2uqqs\s+0xfe0\(%ecx\),%zmm6
\s*[a-f0-9]+:\s*62 f5 7d df 6c 72 80\s+vcvttps2uqqs\s+-0x200\(%edx\)\{1to8\},%zmm6\{%k7\}\{z\}
#pass

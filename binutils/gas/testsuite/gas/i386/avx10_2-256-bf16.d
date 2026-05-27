#objdump: -dw
#name: i386 AVX10.2/256 BF16 insns

.*: +file format .*


Disassembly of section .text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 f5 55 28 58 f4\s+vaddbf16 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 55 08 58 f4\s+vaddbf16 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 55 2f 58 b4 f4 00 00 00 10\s+vaddbf16 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 55 38 58 31\s+vaddbf16 \(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 55 28 58 71 7f\s+vaddbf16 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 55 bf 58 72 80\s+vaddbf16 -0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 55 0f 58 b4 f4 00 00 00 10\s+vaddbf16 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 55 18 58 31\s+vaddbf16 \(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 55 08 58 71 7f\s+vaddbf16 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 55 9f 58 72 80\s+vaddbf16 -0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 55 28 5e f4\s+vdivbf16 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 55 08 5e f4\s+vdivbf16 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 55 2f 5e b4 f4 00 00 00 10\s+vdivbf16 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 55 38 5e 31\s+vdivbf16 \(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 55 28 5e 71 7f\s+vdivbf16 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 55 bf 5e 72 80\s+vdivbf16 -0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 55 0f 5e b4 f4 00 00 00 10\s+vdivbf16 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 55 18 5e 31\s+vdivbf16 \(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 55 08 5e 71 7f\s+vdivbf16 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 55 9f 5e 72 80\s+vdivbf16 -0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 55 28 5f f4\s+vmaxbf16 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 55 08 5f f4\s+vmaxbf16 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 55 2f 5f b4 f4 00 00 00 10\s+vmaxbf16 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 55 38 5f 31\s+vmaxbf16 \(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 55 28 5f 71 7f\s+vmaxbf16 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 55 bf 5f 72 80\s+vmaxbf16 -0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 55 0f 5f b4 f4 00 00 00 10\s+vmaxbf16 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 55 18 5f 31\s+vmaxbf16 \(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 55 08 5f 71 7f\s+vmaxbf16 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 55 9f 5f 72 80\s+vmaxbf16 -0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 55 28 5d f4\s+vminbf16 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 55 08 5d f4\s+vminbf16 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 55 2f 5d b4 f4 00 00 00 10\s+vminbf16 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 55 38 5d 31\s+vminbf16 \(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 55 28 5d 71 7f\s+vminbf16 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 55 bf 5d 72 80\s+vminbf16 -0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 55 0f 5d b4 f4 00 00 00 10\s+vminbf16 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 55 18 5d 31\s+vminbf16 \(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 55 08 5d 71 7f\s+vminbf16 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 55 9f 5d 72 80\s+vminbf16 -0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 55 28 59 f4\s+vmulbf16 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 55 08 59 f4\s+vmulbf16 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 55 2f 59 b4 f4 00 00 00 10\s+vmulbf16 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 55 38 59 31\s+vmulbf16 \(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 55 28 59 71 7f\s+vmulbf16 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 55 bf 59 72 80\s+vmulbf16 -0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 55 0f 59 b4 f4 00 00 00 10\s+vmulbf16 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 55 18 59 31\s+vmulbf16 \(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 55 08 59 71 7f\s+vmulbf16 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 55 9f 59 72 80\s+vmulbf16 -0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 28 2c f4\s+vscalefbf16 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 08 2c f4\s+vscalefbf16 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 2f 2c b4 f4 00 00 00 10\s+vscalefbf16 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 38 2c 31\s+vscalefbf16 \(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 28 2c 71 7f\s+vscalefbf16 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 bf 2c 72 80\s+vscalefbf16 -0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 0f 2c b4 f4 00 00 00 10\s+vscalefbf16 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 18 2c 31\s+vscalefbf16 \(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 08 2c 71 7f\s+vscalefbf16 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 9f 2c 72 80\s+vscalefbf16 -0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 55 28 5c f4\s+vsubbf16 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 55 08 5c f4\s+vsubbf16 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 55 2f 5c b4 f4 00 00 00 10\s+vsubbf16 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 55 38 5c 31\s+vsubbf16 \(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 55 28 5c 71 7f\s+vsubbf16 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 55 bf 5c 72 80\s+vsubbf16 -0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 55 0f 5c b4 f4 00 00 00 10\s+vsubbf16 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 55 18 5c 31\s+vsubbf16 \(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 55 08 5c 71 7f\s+vsubbf16 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 55 9f 5c 72 80\s+vsubbf16 -0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 28 98 f4\s+vfmadd132bf16 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 08 98 f4\s+vfmadd132bf16 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 2f 98 b4 f4 00 00 00 10\s+vfmadd132bf16 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 38 98 31\s+vfmadd132bf16 \(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 28 98 71 7f\s+vfmadd132bf16 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 bf 98 72 80\s+vfmadd132bf16 -0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 0f 98 b4 f4 00 00 00 10\s+vfmadd132bf16 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 18 98 31\s+vfmadd132bf16 \(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 08 98 71 7f\s+vfmadd132bf16 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 9f 98 72 80\s+vfmadd132bf16 -0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 28 a8 f4\s+vfmadd213bf16 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 08 a8 f4\s+vfmadd213bf16 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 2f a8 b4 f4 00 00 00 10\s+vfmadd213bf16 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 38 a8 31\s+vfmadd213bf16 \(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 28 a8 71 7f\s+vfmadd213bf16 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 bf a8 72 80\s+vfmadd213bf16 -0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 0f a8 b4 f4 00 00 00 10\s+vfmadd213bf16 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 18 a8 31\s+vfmadd213bf16 \(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 08 a8 71 7f\s+vfmadd213bf16 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 9f a8 72 80\s+vfmadd213bf16 -0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 28 b8 f4\s+vfmadd231bf16 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 08 b8 f4\s+vfmadd231bf16 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 2f b8 b4 f4 00 00 00 10\s+vfmadd231bf16 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 38 b8 31\s+vfmadd231bf16 \(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 28 b8 71 7f\s+vfmadd231bf16 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 bf b8 72 80\s+vfmadd231bf16 -0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 0f b8 b4 f4 00 00 00 10\s+vfmadd231bf16 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 18 b8 31\s+vfmadd231bf16 \(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 08 b8 71 7f\s+vfmadd231bf16 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 9f b8 72 80\s+vfmadd231bf16 -0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 28 9a f4\s+vfmsub132bf16 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 08 9a f4\s+vfmsub132bf16 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 2f 9a b4 f4 00 00 00 10\s+vfmsub132bf16 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 38 9a 31\s+vfmsub132bf16 \(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 28 9a 71 7f\s+vfmsub132bf16 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 bf 9a 72 80\s+vfmsub132bf16 -0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 0f 9a b4 f4 00 00 00 10\s+vfmsub132bf16 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 18 9a 31\s+vfmsub132bf16 \(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 08 9a 71 7f\s+vfmsub132bf16 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 9f 9a 72 80\s+vfmsub132bf16 -0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 28 aa f4\s+vfmsub213bf16 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 08 aa f4\s+vfmsub213bf16 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 2f aa b4 f4 00 00 00 10\s+vfmsub213bf16 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 38 aa 31\s+vfmsub213bf16 \(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 28 aa 71 7f\s+vfmsub213bf16 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 bf aa 72 80\s+vfmsub213bf16 -0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 0f aa b4 f4 00 00 00 10\s+vfmsub213bf16 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 18 aa 31\s+vfmsub213bf16 \(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 08 aa 71 7f\s+vfmsub213bf16 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 9f aa 72 80\s+vfmsub213bf16 -0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 28 ba f4\s+vfmsub231bf16 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 08 ba f4\s+vfmsub231bf16 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 2f ba b4 f4 00 00 00 10\s+vfmsub231bf16 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 38 ba 31\s+vfmsub231bf16 \(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 28 ba 71 7f\s+vfmsub231bf16 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 bf ba 72 80\s+vfmsub231bf16 -0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 0f ba b4 f4 00 00 00 10\s+vfmsub231bf16 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 18 ba 31\s+vfmsub231bf16 \(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 08 ba 71 7f\s+vfmsub231bf16 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 9f ba 72 80\s+vfmsub231bf16 -0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 28 9c f4\s+vfnmadd132bf16 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 08 9c f4\s+vfnmadd132bf16 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 2f 9c b4 f4 00 00 00 10\s+vfnmadd132bf16 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 38 9c 31\s+vfnmadd132bf16 \(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 28 9c 71 7f\s+vfnmadd132bf16 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 bf 9c 72 80\s+vfnmadd132bf16 -0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 0f 9c b4 f4 00 00 00 10\s+vfnmadd132bf16 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 18 9c 31\s+vfnmadd132bf16 \(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 08 9c 71 7f\s+vfnmadd132bf16 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 9f 9c 72 80\s+vfnmadd132bf16 -0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 28 ac f4\s+vfnmadd213bf16 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 08 ac f4\s+vfnmadd213bf16 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 2f ac b4 f4 00 00 00 10\s+vfnmadd213bf16 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 38 ac 31\s+vfnmadd213bf16 \(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 28 ac 71 7f\s+vfnmadd213bf16 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 bf ac 72 80\s+vfnmadd213bf16 -0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 0f ac b4 f4 00 00 00 10\s+vfnmadd213bf16 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 18 ac 31\s+vfnmadd213bf16 \(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 08 ac 71 7f\s+vfnmadd213bf16 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 9f ac 72 80\s+vfnmadd213bf16 -0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 28 bc f4\s+vfnmadd231bf16 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 08 bc f4\s+vfnmadd231bf16 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 2f bc b4 f4 00 00 00 10\s+vfnmadd231bf16 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 38 bc 31\s+vfnmadd231bf16 \(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 28 bc 71 7f\s+vfnmadd231bf16 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 bf bc 72 80\s+vfnmadd231bf16 -0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 0f bc b4 f4 00 00 00 10\s+vfnmadd231bf16 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 18 bc 31\s+vfnmadd231bf16 \(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 08 bc 71 7f\s+vfnmadd231bf16 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 9f bc 72 80\s+vfnmadd231bf16 -0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 28 9e f4\s+vfnmsub132bf16 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 08 9e f4\s+vfnmsub132bf16 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 2f 9e b4 f4 00 00 00 10\s+vfnmsub132bf16 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 38 9e 31\s+vfnmsub132bf16 \(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 28 9e 71 7f\s+vfnmsub132bf16 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 bf 9e 72 80\s+vfnmsub132bf16 -0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 0f 9e b4 f4 00 00 00 10\s+vfnmsub132bf16 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 18 9e 31\s+vfnmsub132bf16 \(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 08 9e 71 7f\s+vfnmsub132bf16 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 9f 9e 72 80\s+vfnmsub132bf16 -0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 28 ae f4\s+vfnmsub213bf16 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 08 ae f4\s+vfnmsub213bf16 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 2f ae b4 f4 00 00 00 10\s+vfnmsub213bf16 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 38 ae 31\s+vfnmsub213bf16 \(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 28 ae 71 7f\s+vfnmsub213bf16 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 bf ae 72 80\s+vfnmsub213bf16 -0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 0f ae b4 f4 00 00 00 10\s+vfnmsub213bf16 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 18 ae 31\s+vfnmsub213bf16 \(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 08 ae 71 7f\s+vfnmsub213bf16 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 9f ae 72 80\s+vfnmsub213bf16 -0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 28 be f4\s+vfnmsub231bf16 %ymm4,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 08 be f4\s+vfnmsub231bf16 %xmm4,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 2f be b4 f4 00 00 00 10\s+vfnmsub231bf16 0x10000000\(%esp,%esi,8\),%ymm5,%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 38 be 31\s+vfnmsub231bf16 \(%ecx\)\{1to16\},%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 28 be 71 7f\s+vfnmsub231bf16 0xfe0\(%ecx\),%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 54 bf be 72 80\s+vfnmsub231bf16 -0x100\(%edx\)\{1to16\},%ymm5,%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 54 0f be b4 f4 00 00 00 10\s+vfnmsub231bf16 0x10000000\(%esp,%esi,8\),%xmm5,%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 54 18 be 31\s+vfnmsub231bf16 \(%ecx\)\{1to8\},%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 08 be 71 7f\s+vfnmsub231bf16 0x7f0\(%ecx\),%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 54 9f be 72 80\s+vfnmsub231bf16 -0x100\(%edx\)\{1to8\},%xmm5,%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 7c 08 42 f5\s+vgetexpbf16 %xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 7c 28 42 f5\s+vgetexpbf16 %ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 7c 0f 42 b4 f4 00 00 00 10\s+vgetexpbf16 0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 7c 18 42 31\s+vgetexpbf16 \(%ecx\)\{1to8\},%xmm6
\s*[a-f0-9]+:\s*62 f6 7c 08 42 71 7f\s+vgetexpbf16 0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f6 7c 9f 42 72 80\s+vgetexpbf16 -0x100\(%edx\)\{1to8\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 7c 2f 42 b4 f4 00 00 00 10\s+vgetexpbf16 0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 7c 38 42 31\s+vgetexpbf16 \(%ecx\)\{1to16\},%ymm6
\s*[a-f0-9]+:\s*62 f6 7c 28 42 71 7f\s+vgetexpbf16 0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f6 7c bf 42 72 80\s+vgetexpbf16 -0x100\(%edx\)\{1to16\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 7c 08 4c f5\s+vrcpbf16 %xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 7c 28 4c f5\s+vrcpbf16 %ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 7c 0f 4c b4 f4 00 00 00 10\s+vrcpbf16 0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 7c 18 4c 31\s+vrcpbf16 \(%ecx\)\{1to8\},%xmm6
\s*[a-f0-9]+:\s*62 f6 7c 08 4c 71 7f\s+vrcpbf16 0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f6 7c 9f 4c 72 80\s+vrcpbf16 -0x100\(%edx\)\{1to8\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 7c 2f 4c b4 f4 00 00 00 10\s+vrcpbf16 0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 7c 38 4c 31\s+vrcpbf16 \(%ecx\)\{1to16\},%ymm6
\s*[a-f0-9]+:\s*62 f6 7c 28 4c 71 7f\s+vrcpbf16 0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f6 7c bf 4c 72 80\s+vrcpbf16 -0x100\(%edx\)\{1to16\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 7c 08 4e f5\s+vrsqrtbf16 %xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f6 7c 28 4e f5\s+vrsqrtbf16 %ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f6 7c 0f 4e b4 f4 00 00 00 10\s+vrsqrtbf16 0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 7c 18 4e 31\s+vrsqrtbf16 \(%ecx\)\{1to8\},%xmm6
\s*[a-f0-9]+:\s*62 f6 7c 08 4e 71 7f\s+vrsqrtbf16 0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f6 7c 9f 4e 72 80\s+vrsqrtbf16 -0x100\(%edx\)\{1to8\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f6 7c 2f 4e b4 f4 00 00 00 10\s+vrsqrtbf16 0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f6 7c 38 4e 31\s+vrsqrtbf16 \(%ecx\)\{1to16\},%ymm6
\s*[a-f0-9]+:\s*62 f6 7c 28 4e 71 7f\s+vrsqrtbf16 0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f6 7c bf 4e 72 80\s+vrsqrtbf16 -0x100\(%edx\)\{1to16\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 08 51 f5\s+vsqrtbf16 %xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 28 51 f5\s+vsqrtbf16 %ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f5 7d 0f 51 b4 f4 00 00 00 10\s+vsqrtbf16 0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 18 51 31\s+vsqrtbf16 \(%ecx\)\{1to8\},%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 08 51 71 7f\s+vsqrtbf16 0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 9f 51 72 80\s+vsqrtbf16 -0x100\(%edx\)\{1to8\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f5 7d 2f 51 b4 f4 00 00 00 10\s+vsqrtbf16 0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 38 51 31\s+vsqrtbf16 \(%ecx\)\{1to16\},%ymm6
\s*[a-f0-9]+:\s*62 f5 7d 28 51 71 7f\s+vsqrtbf16 0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f5 7d bf 51 72 80\s+vsqrtbf16 -0x100\(%edx\)\{1to16\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 7f 28 26 f5 7b\s+vgetmantbf16 \$0x7b,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f3 7f 08 26 f5 7b\s+vgetmantbf16 \$0x7b,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 7f 0f 26 b4 f4 00 00 00 10 7b\s+vgetmantbf16 \$0x7b,0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 7f 18 26 31 7b\s+vgetmantbf16 \$0x7b,\(%ecx\)\{1to8\},%xmm6
\s*[a-f0-9]+:\s*62 f3 7f 08 26 71 7f 7b\s+vgetmantbf16 \$0x7b,0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f3 7f 9f 26 72 80 7b\s+vgetmantbf16 \$0x7b,-0x100\(%edx\)\{1to8\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 7f 2f 26 b4 f4 00 00 00 10 7b\s+vgetmantbf16 \$0x7b,0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 7f 38 26 31 7b\s+vgetmantbf16 \$0x7b,\(%ecx\)\{1to16\},%ymm6
\s*[a-f0-9]+:\s*62 f3 7f 28 26 71 7f 7b\s+vgetmantbf16 \$0x7b,0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f3 7f bf 26 72 80 7b\s+vgetmantbf16 \$0x7b,-0x100\(%edx\)\{1to16\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 7f 28 56 f5 7b\s+vreducebf16 \$0x7b,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f3 7f 08 56 f5 7b\s+vreducebf16 \$0x7b,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 7f 0f 56 b4 f4 00 00 00 10 7b\s+vreducebf16 \$0x7b,0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 7f 18 56 31 7b\s+vreducebf16 \$0x7b,\(%ecx\)\{1to8\},%xmm6
\s*[a-f0-9]+:\s*62 f3 7f 08 56 71 7f 7b\s+vreducebf16 \$0x7b,0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f3 7f 9f 56 72 80 7b\s+vreducebf16 \$0x7b,-0x100\(%edx\)\{1to8\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 7f 2f 56 b4 f4 00 00 00 10 7b\s+vreducebf16 \$0x7b,0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 7f 38 56 31 7b\s+vreducebf16 \$0x7b,\(%ecx\)\{1to16\},%ymm6
\s*[a-f0-9]+:\s*62 f3 7f 28 56 71 7f 7b\s+vreducebf16 \$0x7b,0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f3 7f bf 56 72 80 7b\s+vreducebf16 \$0x7b,-0x100\(%edx\)\{1to16\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 7f 28 08 f5 7b\s+vrndscalebf16 \$0x7b,%ymm5,%ymm6
\s*[a-f0-9]+:\s*62 f3 7f 08 08 f5 7b\s+vrndscalebf16 \$0x7b,%xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f3 7f 0f 08 b4 f4 00 00 00 10 7b\s+vrndscalebf16 \$0x7b,0x10000000\(%esp,%esi,8\),%xmm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 7f 18 08 31 7b\s+vrndscalebf16 \$0x7b,\(%ecx\)\{1to8\},%xmm6
\s*[a-f0-9]+:\s*62 f3 7f 08 08 71 7f 7b\s+vrndscalebf16 \$0x7b,0x7f0\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f3 7f 9f 08 72 80 7b\s+vrndscalebf16 \$0x7b,-0x100\(%edx\)\{1to8\},%xmm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 7f 2f 08 b4 f4 00 00 00 10 7b\s+vrndscalebf16 \$0x7b,0x10000000\(%esp,%esi,8\),%ymm6\{%k7\}
\s*[a-f0-9]+:\s*62 f3 7f 38 08 31 7b\s+vrndscalebf16 \$0x7b,\(%ecx\)\{1to16\},%ymm6
\s*[a-f0-9]+:\s*62 f3 7f 28 08 71 7f 7b\s+vrndscalebf16 \$0x7b,0xfe0\(%ecx\),%ymm6
\s*[a-f0-9]+:\s*62 f3 7f bf 08 72 80 7b\s+vrndscalebf16 \$0x7b,-0x100\(%edx\)\{1to16\},%ymm6\{%k7\}\{z\}
\s*[a-f0-9]+:\s*62 f3 57 28 c2 ec 7b\s+vcmpbf16 \$0x7b,%ymm4,%ymm5,%k5
\s*[a-f0-9]+:\s*62 f3 57 08 c2 ec 7b\s+vcmpbf16 \$0x7b,%xmm4,%xmm5,%k5
\s*[a-f0-9]+:\s*62 f3 57 0f c2 ac f4 00 00 00 10 7b\s+vcmpbf16 \$0x7b,0x10000000\(%esp,%esi,8\),%xmm5,%k5\{%k7\}
\s*[a-f0-9]+:\s*62 f3 57 18 c2 29 7b\s+vcmpbf16 \$0x7b,\(%ecx\)\{1to8\},%xmm5,%k5
\s*[a-f0-9]+:\s*62 f3 57 08 c2 69 7f 7b\s+vcmpbf16 \$0x7b,0x7f0\(%ecx\),%xmm5,%k5
\s*[a-f0-9]+:\s*62 f3 57 1f c2 6a 80 7b\s+vcmpbf16 \$0x7b,-0x100\(%edx\)\{1to8\},%xmm5,%k5\{%k7\}
\s*[a-f0-9]+:\s*62 f3 57 2f c2 ac f4 00 00 00 10 7b\s+vcmpbf16 \$0x7b,0x10000000\(%esp,%esi,8\),%ymm5,%k5\{%k7\}
\s*[a-f0-9]+:\s*62 f3 57 38 c2 29 7b\s+vcmpbf16 \$0x7b,\(%ecx\)\{1to16\},%ymm5,%k5
\s*[a-f0-9]+:\s*62 f3 57 28 c2 69 7f 7b\s+vcmpbf16 \$0x7b,0xfe0\(%ecx\),%ymm5,%k5
\s*[a-f0-9]+:\s*62 f3 57 3f c2 6a 80 7b\s+vcmpbf16 \$0x7b,-0x100\(%edx\)\{1to16\},%ymm5,%k5\{%k7\}
\s*[a-f0-9]+:\s*62 f5 7d 08 2f f5\s+vcomisbf16 %xmm5,%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 08 2f b4 f4 00 00 00 10\s+vcomisbf16 0x10000000\(%esp,%esi,8\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 08 2f 31\s+vcomisbf16 \(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 08 2f 71 7f\s+vcomisbf16 0xfe\(%ecx\),%xmm6
\s*[a-f0-9]+:\s*62 f5 7d 08 2f 72 80\s+vcomisbf16 -0x100\(%edx\),%xmm6
\s*[a-f0-9]+:\s*62 f3 7f 28 66 ed 7b\s+vfpclassbf16 \$0x7b,%ymm5,%k5
\s*[a-f0-9]+:\s*62 f3 7f 08 66 ed 7b\s+vfpclassbf16 \$0x7b,%xmm5,%k5
\s*[a-f0-9]+:\s*62 f3 7f 0f 66 ac f4 00 00 00 10 7b\s+vfpclassbf16x \$0x7b,0x10000000\(%esp,%esi,8\),%k5\{%k7\}
\s*[a-f0-9]+:\s*62 f3 7f 18 66 29 7b\s+vfpclassbf16 \$0x7b,\(%ecx\)\{1to8\},%k5
\s*[a-f0-9]+:\s*62 f3 7f 08 66 69 7f 7b\s+vfpclassbf16x \$0x7b,0x7f0\(%ecx\),%k5
\s*[a-f0-9]+:\s*62 f3 7f 1f 66 6a 80 7b\s+vfpclassbf16 \$0x7b,-0x100\(%edx\)\{1to8\},%k5\{%k7\}
\s*[a-f0-9]+:\s*62 f3 7f 38 66 29 7b\s+vfpclassbf16 \$0x7b,\(%ecx\)\{1to16\},%k5
\s*[a-f0-9]+:\s*62 f3 7f 28 66 69 7f 7b\s+vfpclassbf16y \$0x7b,0xfe0\(%ecx\),%k5
\s*[a-f0-9]+:\s*62 f3 7f 3f 66 6a 80 7b\s+vfpclassbf16 \$0x7b,-0x100\(%edx\)\{1to16\},%k5\{%k7\}
#pass

#objdump: -dw -Mintel
#name: x86_64 AMX-AVX512 insns (Intel disassembly)
#source: x86-64-amx-avx512.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*62 62 6e 48 4a f5\s+tcvtrowd2ps zmm30,tmm5,edx
\s*[a-f0-9]+:\s*62 62 6e 48 4a f2\s+tcvtrowd2ps zmm30,tmm2,edx
\s*[a-f0-9]+:\s*62 63 7e 48 07 f5 7b\s+tcvtrowd2ps zmm30,tmm5,0x7b
\s*[a-f0-9]+:\s*62 63 7e 48 07 f2 7b\s+tcvtrowd2ps zmm30,tmm2,0x7b
\s*[a-f0-9]+:\s*62 62 6f 48 6d f5\s+tcvtrowps2bf16h zmm30,tmm5,edx
\s*[a-f0-9]+:\s*62 62 6f 48 6d f2\s+tcvtrowps2bf16h zmm30,tmm2,edx
\s*[a-f0-9]+:\s*62 63 7f 48 07 f5 7b\s+tcvtrowps2bf16h zmm30,tmm5,0x7b
\s*[a-f0-9]+:\s*62 63 7f 48 07 f2 7b\s+tcvtrowps2bf16h zmm30,tmm2,0x7b
\s*[a-f0-9]+:\s*62 62 6e 48 6d f5\s+tcvtrowps2bf16l zmm30,tmm5,edx
\s*[a-f0-9]+:\s*62 62 6e 48 6d f2\s+tcvtrowps2bf16l zmm30,tmm2,edx
\s*[a-f0-9]+:\s*62 63 7e 48 77 f5 7b\s+tcvtrowps2bf16l zmm30,tmm5,0x7b
\s*[a-f0-9]+:\s*62 63 7e 48 77 f2 7b\s+tcvtrowps2bf16l zmm30,tmm2,0x7b
\s*[a-f0-9]+:\s*62 62 6c 48 6d f5\s+tcvtrowps2phh zmm30,tmm5,edx
\s*[a-f0-9]+:\s*62 62 6c 48 6d f2\s+tcvtrowps2phh zmm30,tmm2,edx
\s*[a-f0-9]+:\s*62 63 7c 48 07 f5 7b\s+tcvtrowps2phh zmm30,tmm5,0x7b
\s*[a-f0-9]+:\s*62 63 7c 48 07 f2 7b\s+tcvtrowps2phh zmm30,tmm2,0x7b
\s*[a-f0-9]+:\s*62 62 6d 48 6d f5\s+tcvtrowps2phl zmm30,tmm5,edx
\s*[a-f0-9]+:\s*62 62 6d 48 6d f2\s+tcvtrowps2phl zmm30,tmm2,edx
\s*[a-f0-9]+:\s*62 63 7f 48 77 f5 7b\s+tcvtrowps2phl zmm30,tmm5,0x7b
\s*[a-f0-9]+:\s*62 63 7f 48 77 f2 7b\s+tcvtrowps2phl zmm30,tmm2,0x7b
\s*[a-f0-9]+:\s*62 62 6d 48 4a f5\s+tilemovrow zmm30,tmm5,edx
\s*[a-f0-9]+:\s*62 62 6d 48 4a f2\s+tilemovrow zmm30,tmm2,edx
\s*[a-f0-9]+:\s*62 63 7d 48 07 f5 7b\s+tilemovrow zmm30,tmm5,0x7b
\s*[a-f0-9]+:\s*62 63 7d 48 07 f2 7b\s+tilemovrow zmm30,tmm2,0x7b
#pass

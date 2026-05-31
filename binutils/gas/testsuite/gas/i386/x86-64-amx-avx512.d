#objdump: -dw
#name: x86_64 AMX-AVX512 insns
#source: x86-64-amx-avx512.s

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 62 6e 48 4a f5\s+tcvtrowd2ps %edx,%tmm5,%zmm30
\s*[a-f0-9]+:\s*62 62 6e 48 4a f2\s+tcvtrowd2ps %edx,%tmm2,%zmm30
\s*[a-f0-9]+:\s*62 63 7e 48 07 f5 7b\s+tcvtrowd2ps \$0x7b,%tmm5,%zmm30
\s*[a-f0-9]+:\s*62 63 7e 48 07 f2 7b\s+tcvtrowd2ps \$0x7b,%tmm2,%zmm30
\s*[a-f0-9]+:\s*62 62 6f 48 6d f5\s+tcvtrowps2bf16h %edx,%tmm5,%zmm30
\s*[a-f0-9]+:\s*62 62 6f 48 6d f2\s+tcvtrowps2bf16h %edx,%tmm2,%zmm30
\s*[a-f0-9]+:\s*62 63 7f 48 07 f5 7b\s+tcvtrowps2bf16h \$0x7b,%tmm5,%zmm30
\s*[a-f0-9]+:\s*62 63 7f 48 07 f2 7b\s+tcvtrowps2bf16h \$0x7b,%tmm2,%zmm30
\s*[a-f0-9]+:\s*62 62 6e 48 6d f5\s+tcvtrowps2bf16l %edx,%tmm5,%zmm30
\s*[a-f0-9]+:\s*62 62 6e 48 6d f2\s+tcvtrowps2bf16l %edx,%tmm2,%zmm30
\s*[a-f0-9]+:\s*62 63 7e 48 77 f5 7b\s+tcvtrowps2bf16l \$0x7b,%tmm5,%zmm30
\s*[a-f0-9]+:\s*62 63 7e 48 77 f2 7b\s+tcvtrowps2bf16l \$0x7b,%tmm2,%zmm30
\s*[a-f0-9]+:\s*62 62 6c 48 6d f5\s+tcvtrowps2phh %edx,%tmm5,%zmm30
\s*[a-f0-9]+:\s*62 62 6c 48 6d f2\s+tcvtrowps2phh %edx,%tmm2,%zmm30
\s*[a-f0-9]+:\s*62 63 7c 48 07 f5 7b\s+tcvtrowps2phh \$0x7b,%tmm5,%zmm30
\s*[a-f0-9]+:\s*62 63 7c 48 07 f2 7b\s+tcvtrowps2phh \$0x7b,%tmm2,%zmm30
\s*[a-f0-9]+:\s*62 62 6d 48 6d f5\s+tcvtrowps2phl %edx,%tmm5,%zmm30
\s*[a-f0-9]+:\s*62 62 6d 48 6d f2\s+tcvtrowps2phl %edx,%tmm2,%zmm30
\s*[a-f0-9]+:\s*62 63 7f 48 77 f5 7b\s+tcvtrowps2phl \$0x7b,%tmm5,%zmm30
\s*[a-f0-9]+:\s*62 63 7f 48 77 f2 7b\s+tcvtrowps2phl \$0x7b,%tmm2,%zmm30
\s*[a-f0-9]+:\s*62 62 6d 48 4a f5\s+tilemovrow %edx,%tmm5,%zmm30
\s*[a-f0-9]+:\s*62 62 6d 48 4a f2\s+tilemovrow %edx,%tmm2,%zmm30
\s*[a-f0-9]+:\s*62 63 7d 48 07 f5 7b\s+tilemovrow \$0x7b,%tmm5,%zmm30
\s*[a-f0-9]+:\s*62 63 7d 48 07 f2 7b\s+tilemovrow \$0x7b,%tmm2,%zmm30
#pass

#objdump: -dw
#name: x86_64 AVX512_BMM BAD insns
#source: x86-64-avx512_bmm-bad.s

.*: +file format .*

Disassembly of section \.text:

[0-9a-f]+ <\.text>:
[\s]*[a-f0-9]+:[\s]*62 f6 6c 08 80[\s]*\(bad\)
[\s]*[a-f0-9]+:[\s]*c7[\s]*\(bad\)
[\s]*[a-f0-9]+:[\s]*62 f6 ec 08 80[\s]*\(bad\)
[\s]*[a-f0-9]+:[\s]*c7[\s]*.*
#pass

#name: objdump --disassemble= of consecutive same-name functions (2)
#source: multi2.s
#source: multi1.s
#ld: -r
#objdump: --disassemble=func2 -wz
# ECOFF disassembly omits local symbols, for whatever reason.
#xfail: "alpha*-*-*ecoff" "alpha*-*-osf*"

.*: +file format .*

Disassembly of section .*:

0+ <func2>:
[ 	]*[0-9a-f]+:	[0-9a-f][0-9a-f].*
#?[ 	]*[0-9a-f]+:	[0-9a-f][0-9a-f].*
#?[ 	]*[0-9a-f]+:	[0-9a-f][0-9a-f].*

# HPPA 32-bit ELF "ld -r" leaves .text unmerged.
#?Disassembly of section .*:

0+[0-3][0-9a-f] <func2>:
[ 	]*[0-9a-f]+:	[0-9a-f][0-9a-f].*
#pass

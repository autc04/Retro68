#name: objdump --disassemble= of consecutive same-name functions (1)
#source: multi1.s
#source: multi2.s
#ld: -r
#objdump: --disassemble=func -wz
# ECOFF disassembly omits local symbols, for whatever reason.
#xfail: "alpha*-*-*ecoff" "alpha*-*-osf*"

.*: +file format .*

Disassembly of section .*:

0+ <func>:
[ 	]*[0-9a-f]+:	[0-9a-f][0-9a-f].*
#?[ 	]*[0-9a-f]+:	[0-9a-f][0-9a-f].*
#?[ 	]*[0-9a-f]+:	[0-9a-f][0-9a-f].*

# HPPA 32-bit ELF "ld -r" leaves .text unmerged.
#?Disassembly of section .*:

0+[0-3][0-9a-f] <func>:
[ 	]*[0-9a-f]+:	[0-9a-f][0-9a-f].*
#pass

#name: ix86 nojumps
#objdump: -drw -Mi8086
#warning_output: nojumps.e

.*: +file format .*86.*

Disassembly of section \.text:

0+ <early>:
[ 	]*[a-f0-9]+:	73 03                	jae    5 <early\+0x5>
[ 	]*[a-f0-9]+:	e9 81 00             	jmp    86 <late>
[ 	]*[a-f0-9]+:	70 (00|ff)                	jo     [76] <.*>	6: R_(386|X86_64)_PC8	undef.*
[ 	]*[a-f0-9]+:	7a (00|ff)                	jp     [98] <.*>	8: R_(386|X86_64)_PC8	.*
[ 	]*[a-f0-9]+:	eb 7b                	jmp    86 <late>
#...
0+86 <late>:
[ 	]*[a-f0-9]+:	75 03                	jne    8b <late\+0x5>
[ 	]*[a-f0-9]+:	e9 75 ff             	jmp    0 <early>
[ 	]*[a-f0-9]+:	74 03                	je     90 <late\+0xa>
[ 	]*[a-f0-9]+:	e9 (00|fe) (00|ff)             	jmp    (90|8e) <.*>	8e: R_(386|X86_64)_PC16	.*
[ 	]*[a-f0-9]+:	75 03                	jne    95 <late\+0xf>
[ 	]*[a-f0-9]+:	e9 (00|fe) (00|ff)             	jmp    9[53] <.*>	93: R_(386|X86_64)_PC16	undef.*
[ 	]*[a-f0-9]+:	79 03                	jns    9a <late\+0x14>
[ 	]*[a-f0-9]+:	e9 66 ff             	jmp    0 <early>
[ 	]*[a-f0-9]+:	c3                   	ret
#...
Disassembly of section \.text\.other:

0+ <other>:
[ 	]*[a-f0-9]+:	78 (00|ff)                	js     [21] <.*>	1: R_(386|X86_64)_PC8	.*
#pass

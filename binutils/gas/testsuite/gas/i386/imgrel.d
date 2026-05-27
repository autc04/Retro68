#objdump: -rs
#name: i386 imgrel (RVA) reloc

.*: +file format pe-i386

RELOCATION RECORDS FOR \[\.text\]:
OFFSET[ 	]+TYPE[ 	]+VALUE
0+01 rva32             \.text
0+06 rva32             \.text
0+0c rva32             \.data
0+12 rva32             \.data
0+17 rva32             \.text
0+1d rva32             \.text
0+23 rva32             Xtrn
0+29 rva32             Xtrn

RELOCATION RECORDS FOR \[\.data\]:
OFFSET[ 	]+TYPE[ 	]+VALUE
0+00 rva32             \.text
0+04 rva32             \.text
0+08 rva32             \.text
0+0c rva32             \.data
0+10 rva32             \.data
0+14 rva32             \.data
0+18 rva32             \.data
0+1c rva32             \.data
0+20 rva32             \.data
0+24 rva32             Xtrn
0+28 rva32             Xtrn
0+2c rva32             Xtrn

Contents of section \.text:
 0000 b8000000 00b90000 00000305 00000000  .*
 0010 030d0000 00002d16 00000081 e91b0000  .*
 0020 00338300 00000033 8b000000 00.*

Contents of section \.data:
 0000 00000000 00000000 00000000 00000000  .*
 0010 00000000 00000000 18000000 1c000000  .*
 0020 20000000 00000000 00000000 00000000  .*

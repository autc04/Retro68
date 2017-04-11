#source: start.s
#ld: -u undefd -m elf64mmix
#readelf: -S -s

There are 5 section headers, starting at offset .*:

Section Headers:
 +\[Nr\] Name +Type +Address +Offset
 +Size +EntSize +Flags +Link +Info +Align
 +\[ 0\] +NULL +0+ +0+
 +0+ +0+ +0 +0 +0
 +\[ 1\] \.text +PROGBITS +0+ +0+78
 +0+4 +0+ +AX +0 +0 +4
 +\[ 2\] \.symtab +SYMTAB +0+ .*
 +0+a8 +0+18 +3 +2 +8
 +\[ 3\] \.strtab +STRTAB +0+ .*
 +0+21 +0+ +0 +0 +1
 +\[ 4\] \.shstrtab +STRTAB +0+ +[0-9a-f]+
 +0+21 +0+ +0 +0 +1
Key to Flags:
#...

Symbol table '\.symtab' contains 7 entries:
 +Num: +Value +Size +Type +Bind +Vis +Ndx +Name
 +0: 0+ +0 +NOTYPE +LOCAL +DEFAULT +UND 
 +1: 0+ +0 +SECTION +LOCAL +DEFAULT +1 
 +2: 0+ +0 +NOTYPE +GLOBAL +DEFAULT +1 _start
 +3: 2000000000000000 +0 +NOTYPE +GLOBAL +DEFAULT +1 __bss_start
 +4: 2000000000000000 +0 +NOTYPE +GLOBAL +DEFAULT +1 _edata
 +5: 2000000000000000 +0 +NOTYPE +GLOBAL +DEFAULT +1 _end
 +6: 0+ +0 +NOTYPE +GLOBAL +DEFAULT +1 _start\.

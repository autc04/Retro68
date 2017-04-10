#source: ilp32-4.s
#as: --x32
#ld: -m elf32_x86_64_nacl -shared --no-ld-generated-unwind-info
#readelf: -d -S --wide
#target: x86_64-*-nacl*

There are 9 section headers, starting at offset 0x[0-9a-f]+:

Section Headers:
 +\[Nr\] Name +Type +Addr +Off +Size +ES +Flg +Lk +Inf +Al
 +\[ 0\] +NULL +0+ 0+ 0+ 00 +0 +0 +0
 +\[ 1\] \.text +PROGBITS +0+ 0+10000 +0+1 +00 +AX +0 +0 +1
 +\[ 2\] \.hash +HASH +100000b4 +0+b4 +0+28 +04 +A +3 +0 +4
 +\[ 3\] \.dynsym +DYNSYM +100000dc +0+dc +0+50 +10 +A +4 +1 +4
 +\[ 4\] \.dynstr +STRTAB +1000012c +0+12c +0+19 +00 +A +0 +0 +1
 +\[ 5\] \.dynamic +DYNAMIC +10010148 +0+148 +0+58 +08 +WA +4 +0 +4
 +\[ 6\] \.symtab +SYMTAB +0+0 +[0-9a-f]+ +[0-9a-f]+ +10 +7 +[0-9] +4
 +\[ 7\] \.strtab +STRTAB +0+ +[0-9a-f]+ +[0-9a-f]+ +00 +0 +0 +1
 +\[ 8\] \.shstrtab +STRTAB +0+ +[0-9a-f]+ +0+40 +00 +0 +0 +1
Key to Flags:
#...

Dynamic section at offset 0x148 contains 6 entries:
  Tag        Type                         Name/Value
 0x00000004 \(HASH\)                       0x100000b4
 0x00000005 \(STRTAB\)                     0x1000012c
 0x00000006 \(SYMTAB\)                     0x100000dc
 0x0000000a \(STRSZ\)                      25 \(bytes\)
 0x0000000b \(SYMENT\)                     16 \(bytes\)
 0x00000000 \(NULL\)                       0x0

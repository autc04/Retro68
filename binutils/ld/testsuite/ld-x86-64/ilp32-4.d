#as: --x32
#ld: -m elf32_x86_64 -shared --no-ld-generated-unwind-info
#readelf: -d -S --wide
#target: x86_64-*-linux*

There are 9 section headers, starting at offset .*:

Section Headers:
  \[Nr\] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
  \[ 0\]                   NULL            00000000 000000 000000 00      0   0  0
  \[ 1\] .hash             HASH            00000094 000094 000028 04   A  2   0  4
  \[ 2\] .dynsym           DYNSYM          000000bc 0000bc 000050 10   A  3   1  4
  \[ 3\] .dynstr           STRTAB          0000010c 00010c 000019 00   A  0   0  1
  \[ 4\] .text             PROGBITS        00000125 000125 000001 00  AX  0   0  1
  \[ 5\] .dynamic          DYNAMIC         00200128 000128 000058 08  WA  3   0  4
  \[ 6\] .symtab           SYMTAB          00000000 [0-9a-f]+ [0-9a-f]+ 10      7   [0-9]  4
  \[ 7\] .strtab           STRTAB          00000000 [0-9a-f]+ [0-9a-f]+ 00      0   0  1
  \[ 8\] .shstrtab         STRTAB          00000000 [0-9a-f]+ 000040 00      0   0  1
Key to Flags:
#...

Dynamic section at offset 0x128 contains 6 entries:
  Tag        Type                         Name/Value
 0x00000004 \(HASH\)                       0x94
 0x00000005 \(STRTAB\)                     0x10c
 0x00000006 \(SYMTAB\)                     0xbc
 0x0000000a \(STRSZ\)                      25 \(bytes\)
 0x0000000b \(SYMENT\)                     16 \(bytes\)
 0x00000000 \(NULL\)                       0x0

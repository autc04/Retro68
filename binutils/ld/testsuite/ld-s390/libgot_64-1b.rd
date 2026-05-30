ELF Header:
  Magic:   7f 45 4c 46 02 02 01 00 00 00 00 00 00 00 00 00 
  Class:                             ELF64
  Data:                              2's complement, big endian
  Version:                           1 \(current\)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              DYN \(Shared object file\)
  Machine:                           IBM S/390
  Version:                           0x1
  Entry point address:               0x0
  Start of program headers:          64 \(bytes into file\)
  Start of section headers:          1456 \(bytes into file\)
  Flags:                             0x0
  Size of this header:               64 \(bytes\)
  Size of program headers:           56 \(bytes\)
  Number of program headers:         4
  Size of section headers:           64 \(bytes\)
  Number of section headers:         13
  Section header string table index: 12

Section Headers:
  \[Nr\] Name              Type            Address          Off    Size   ES Flg Lk Inf Al
  \[ 0\]                   NULL            0000000000000000 000000 000000 00      0   0  0
  \[ 1\] .hash             HASH            0000000000000120 000120 000050 08   A  2   0  8
  \[ 2\] .dynsym           DYNSYM          0000000000000170 000170 000078 18   A  3   2  8
  \[ 3\] .dynstr           STRTAB          00000000000001e8 0001e8 00000e 00   A  0   0  1
  \[ 4\] .rela.dyn         RELA            00000000000001f8 0001f8 000018 18   A  2   0  8
  \[ 5\] .rela.plt         RELA            0000000000000210 000210 000018 18  AI  2   9  8
  \[ 6\] .plt              PROGBITS        0000000000000228 000228 000040 20  AX  0   0  4
  \[ 7\] .text             PROGBITS        0000000000000268 000268 00000c 00  AX  0   0  4
  \[ 8\] .dynamic          DYNAMIC         0000000000200278 000278 000120 10  WA  3   0  8
  \[ 9\] .got              PROGBITS        0000000000200398 000398 000028 08  WA  0   0  8
  \[10\] .symtab           SYMTAB          0000000000000000 0003c0 000168 18     11  12  8
  \[11\] .strtab           STRTAB          0000000000000000 000528 00002d 00      0   0  1
  \[12\] .shstrtab         STRTAB          0000000000000000 000555 000059 00      0   0  1
Key to Flags:
  W \(write\), A \(alloc\), X \(execute\), M \(merge\), S \(strings\), I \(info\),
  L \(link order\), O \(extra OS processing required\), G \(group\), T \(TLS\),
  C \(compressed\), x \(unknown\), o \(OS specific\), E \(exclude\),
  D \(mbind\), p \(processor specific\)

There are no section groups in this file.

Program Headers:
  Type           Offset   VirtAddr           PhysAddr           FileSiz  MemSiz   Flg Align
  LOAD           0x000000 0x0000000000000000 0x0000000000000000 0x000274 0x000274 R E 0x200000
  LOAD           0x000278 0x0000000000200278 0x0000000000200278 0x000148 0x000148 RW  0x200000
  DYNAMIC        0x000278 0x0000000000200278 0x0000000000200278 0x000120 0x000120 RW  0x8
  GNU_STACK      0x000000 0x0000000000000000 0x0000000000000000 0x000000 0x000000 RW  0x10

 Section to Segment mapping:
  Segment Sections...
   00     .hash .dynsym .dynstr .rela.dyn .rela.plt .plt .text 
   01     .dynamic .got 
   02     .dynamic 
   03     

Dynamic section at offset 0x278 contains 13 entries:
  Tag        Type                         Name/Value
 0x0000000000000004 \(HASH\)               0x120
 0x0000000000000005 \(STRTAB\)             0x1e8
 0x0000000000000006 \(SYMTAB\)             0x170
 0x000000000000000a \(STRSZ\)              14 \(bytes\)
 0x000000000000000b \(SYMENT\)             24 \(bytes\)
 0x0000000000000003 \(PLTGOT\)             0x200398
 0x0000000000000002 \(PLTRELSZ\)           24 \(bytes\)
 0x0000000000000014 \(PLTREL\)             RELA
 0x0000000000000017 \(JMPREL\)             0x210
 0x0000000000000007 \(RELA\)               0x1f8
 0x0000000000000008 \(RELASZ\)             24 \(bytes\)
 0x0000000000000009 \(RELAENT\)            24 \(bytes\)
 0x0000000000000000 \(NULL\)               0x0

Relocation section '.rela.dyn' at offset 0x1f8 contains 1 entry:
    Offset             Info             Type               Symbol's Value  Symbol's Name \+ Addend
0+2003b8  000000030000000a R_390_GLOB_DAT         0000000000000000 foo \+ 0

Relocation section '.rela.plt' at offset 0x210 contains 1 entry:
    Offset             Info             Type               Symbol's Value  Symbol's Name \+ Addend
0+2003b0  000000040000000b R_390_JMP_SLOT         0000000000000000 bar \+ 0
The decoding of unwind sections for machine type IBM S/390 is not currently supported.

Symbol table '.dynsym' contains 5 entries:
   Num:    Value          Size Type    Bind   Vis      Ndx Name
 +[a-f0-9]+: 0000000000000000     0 NOTYPE  LOCAL  DEFAULT  UND 
 +[a-f0-9]+: 0000000000000268     0 SECTION LOCAL  DEFAULT    7 .text
 +[a-f0-9]+: 0000000000000268     0 FUNC    GLOBAL DEFAULT    7 func
 +[a-f0-9]+: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND foo
 +[a-f0-9]+: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND bar

Symbol table '.symtab' contains 15 entries:
   Num:    Value          Size Type    Bind   Vis      Ndx Name
 +[a-f0-9]+: 0000000000000000     0 NOTYPE  LOCAL  DEFAULT  UND 
 +[a-f0-9]+: 0000000000000120     0 SECTION LOCAL  DEFAULT    1 .hash
 +[a-f0-9]+: 0000000000000170     0 SECTION LOCAL  DEFAULT    2 .dynsym
 +[a-f0-9]+: 00000000000001e8     0 SECTION LOCAL  DEFAULT    3 .dynstr
 +[a-f0-9]+: 00000000000001f8     0 SECTION LOCAL  DEFAULT    4 .rela.dyn
 +[a-f0-9]+: 0000000000000210     0 SECTION LOCAL  DEFAULT    5 .rela.plt
 +[a-f0-9]+: 0000000000000228     0 SECTION LOCAL  DEFAULT    6 .plt
 +[a-f0-9]+: 0000000000000268     0 SECTION LOCAL  DEFAULT    7 .text
 +[a-f0-9]+: 0000000000200278     0 SECTION LOCAL  DEFAULT    8 .dynamic
 +[a-f0-9]+: 0000000000200398     0 SECTION LOCAL  DEFAULT    9 .got
 +[a-f0-9]+: 0000000000200278     0 OBJECT  LOCAL  DEFAULT  ABS _DYNAMIC
 +[a-f0-9]+: 0000000000200398     0 OBJECT  LOCAL  DEFAULT  ABS _GLOBAL_OFFSET_TABLE_
 +[a-f0-9]+: 0000000000000268     0 FUNC    GLOBAL DEFAULT    7 func
 +[a-f0-9]+: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND foo
 +[a-f0-9]+: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND bar

Histogram for bucket list length \(total of 3 buckets\):
 Length  Number     % of total  Coverage
      0  1          \( 33.3%\)
      1  1          \( 33.3%\)     33.3%
      2  1          \( 33.3%\)    100.0%

No version information found in this file.

Global Offset Table '.got' contains 5 entries:
   Index:      Address          Reloc             Sym. Name \+ Addend/Value
 +[0-9]+: 0000000000200398                        0
 +[0-9]+: 00000000002003a0                        200278
 +[0-9]+: 00000000002003a8                        0
 +[0-9]+: 00000000002003b0 R_390_JMP_SLOT         bar \+ 0
 +[0-9]+: 00000000002003b8 R_390_GLOB_DAT         foo \+ 0
#pass

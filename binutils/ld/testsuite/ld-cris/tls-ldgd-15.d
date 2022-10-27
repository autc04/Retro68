#source: tls128g.s
#source: tls-ld-7.s
#source: tls-gd-2.s
#source: tls-ldgd-15.s
#source: tls-x.s
#source: tls-z.s
#source: tls-hx1x2.s
#as: --pic --no-underscore --em=criself
#ld: --shared -m crislinux --hash-style=sysv
#objdump: -s -t -R -p -T

# Check that we have proper NPTL/TLS markings and GOT for two
# R_CRIS_32_GOT_GD and two R_CRIS_32_DTPRELs against different
# variables in a DSO.

.*:     file format elf32-cris

Program Header:
    LOAD off    0x0+ vaddr 0x0+ paddr 0x0+ align 2\*\*13
         filesz 0x0+1e8 memsz 0x0+1e8 flags r-x
    LOAD off    0x0+1e8 vaddr 0x0+21e8 paddr 0x0+21e8 align 2\*\*13
         filesz 0x0+124 memsz 0x0+124 flags rw-
 DYNAMIC off    0x0+278 vaddr 0x0+2278 paddr 0x0+2278 align 2\*\*2
         filesz 0x0+70 memsz 0x0+70 flags rw-
     TLS off    0x0+1e8 vaddr 0x0+21e8 paddr 0x0+21e8 align 2\*\*2
         filesz 0x0+90 memsz 0x0+90 flags r--

Dynamic Section:
  HASH                 0x0+b4
  STRTAB               0x0+17c
  SYMTAB               0x0+ec
  STRSZ                0x0+2a
  SYMENT               0x0+10
  RELA                 0x0+1a8
  RELASZ               0x0+24
  RELAENT              0x0+c
private flags = 0:

SYMBOL TABLE:
#...
0+8c l       \.tdata	0+4 x2
#...
0+88 l       \.tdata	0+4 x1
#...
0+80 g       \.tdata	0+4 x
#...
0+84 g       \.tdata	0+4 z
#...
DYNAMIC SYMBOL TABLE:
#...
0+80 g    D  \.tdata	0+4 x
#...
0+84 g    D  \.tdata	0+4 z
#...

DYNAMIC RELOCATION RECORDS
OFFSET   TYPE              VALUE 
0+22f4 R_CRIS_DTPMOD     \*ABS\*
0+22fc R_CRIS_DTP        x
0+2304 R_CRIS_DTP        z

Contents of section \.hash:
#...
Contents of section \.text:
 01cc 6fae8800 00006fbe 8c000000 6fae1400  .*
 01dc 0+ 6fae1c00 0+           .*
Contents of section .tdata:
#...
Contents of section \.got:
 22e8 78220+ 0+ 0+ 0+  .*
 22f8 0+ 0+ 0+ 0+  .*
 2308 0+                             .*

#as: --pic --no-underscore --em=criself
#ld: --shared -m crislinux --hash-style=sysv
#source: tls-ld-7.s
#source: tls128g.s
#source: tls-hx1x2.s
#objdump: -s -t -R -p

# DSO with two R_CRIS_32_DTPRELs against different hidden symbols.
# Check that we have proper NPTL/TLS markings and GOT.

.*:     file format elf32-cris

Program Header:
    LOAD off    0x0+ vaddr 0x0+ paddr 0x0+ align 2\*\*13
         filesz 0x0+150 memsz 0x0+150 flags r-x
    LOAD off    0x0+150 vaddr 0x0+2150 paddr 0x0+2150 align 2\*\*13
         filesz 0x0+10c memsz 0x0+10c flags rw-
 DYNAMIC off    0x0+1d8 vaddr 0x0+21d8 paddr 0x0+21d8 align 2\*\*2
         filesz 0x0+70 memsz 0x0+70 flags rw-
     TLS off    0x0+150 vaddr 0x0+2150 paddr 0x0+2150 align 2\*\*2
         filesz 0x0+88 memsz 0x0+88 flags r--

Dynamic Section:
  HASH                 0x0+b4
  STRTAB               0x0+124
  SYMTAB               0x0+d4
  STRSZ                0x0+11
  SYMENT               0x0+10
  RELA                 0x0+138
  RELASZ               0x0+c
  RELAENT              0x0+c
private flags = 0:

SYMBOL TABLE:
#...
0+84 l       \.tdata	0+4 x2
0+80 l       \.tdata	0+4 x1
#...

DYNAMIC RELOCATION RECORDS
OFFSET   TYPE              VALUE 
0+2254 R_CRIS_DTPMOD     \*ABS\*

Contents of section \.hash:
#...
Contents of section \.text:
 0144 6fae80+ 0+6fbe 840+     .*
#...
Contents of section \.got:
 2248 d8210+ 0+ 0+ 0+  .*
 2258 0+                             .*

#as: --pic --no-underscore --em=criself
#ld: --shared -m crislinux --hash-style=sysv
#source: tls-ie-8.s
#source: tls128g.s
#source: tls-x.s
#objdump: -s -t -R -p -T

# DSO with a single R_CRIS_16_GOT_TPREL.  Check that we have proper
# NPTL/TLS markings and GOT.

.*:     file format elf32-cris

Program Header:
    LOAD off    0x0+ vaddr 0x0+ paddr 0x0+ align 2\*\*13
         filesz 0x0+164 memsz 0x0+164 flags r-x
    LOAD off    0x0+164 vaddr 0x0+2164 paddr 0x0+2164 align 2\*\*13
         filesz 0x0+10c memsz 0x0+10c flags rw-
 DYNAMIC off    0x0+1e8 vaddr 0x0+21e8 paddr 0x0+21e8 align 2\*\*2
         filesz 0x0+78 memsz 0x0+78 flags rw-
     TLS off    0x0+164 vaddr 0x0+2164 paddr 0x0+2164 align 2\*\*2
         filesz 0x0+84 memsz 0x0+84 flags r--

Dynamic Section:
  HASH                 0x0+b4
  STRTAB               0x0+140
  SYMTAB               0x0+e0
  STRSZ                0x0+13
  SYMENT               0x0+10
  RELA                 0x0+154
  RELASZ               0x0+c
  RELAENT              0x0+c
  FLAGS                0x0+10
private flags = 0:

SYMBOL TABLE:
#...
0+80 g       \.tdata	0+4 x
#...
DYNAMIC SYMBOL TABLE:
#...
0+80 g    D  \.tdata	0+4 x
#...

DYNAMIC RELOCATION RECORDS
OFFSET   TYPE              VALUE 
0+226c R_CRIS_32_TPREL   x

Contents of section \.hash:
#...
Contents of section \.text:
 0160 5fae0c00                             .*
#...
Contents of section \.got:
 2260 e8210+ 0+ 0+ 0+  .*

#source: reloc2.s
#as: --no-pad-sections
#name: PE .reloc section attributes (builtin+custom)
#ld: --enable-reloc-section --section-align=0x1000 -e _start
#objdump: -hpwPsections

.*:     file format .*

#...
PE File Base Relocations.*
Virtual Address: .* Number of fixups 2
[ 	]*reloc    0 offset    0 .* HIGHLOW
[ 	]*reloc    1 offset    [48] .* HIGHLOW

Virtual Address: .* Number of fixups 2
[ 	]*reloc    0 offset    0 .* (HIGHLOW|DIR64)
[ 	]*reloc    1 offset    [48] .* (HIGHLOW|DIR64)

#?private flags = .*

Section headers.*:
 # Name    *paddr *vaddr *size  .* Flags
 1 \.text  *0000.* 0.*000 0*200 .* EXECUTE,READ,CODE
 2 \.data  *0000.* 0.*000 0*200 .* READ,WRITE,INITIALIZED DATA
 3 \.rdata *0000.* 0.*000 0*200 .* READ,INITIALIZED DATA
 4 \.idata *0000.* 0.*000 0*200 .* READ,INITIALIZED DATA
 5 \.reloc *0000.* 0.*000 0*200 .* READ,INITIALIZED DATA

Sections:
Idx Name    *Size     *VMA    *LMA  *File off  .* Flags
  0 \.text  *0*(1?4|8|10) .*000  .*000  0*0000... .* CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 \.data  *0*(8|10) .*000  .*000  0*0000... .* CONTENTS, ALLOC, LOAD, DATA
  2 \.rdata *0*0000.. .*000  .*000  0*0000... .* CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 \.idata *0*1(4|8) .*000  .*000  0*0000... .* CONTENTS, ALLOC, LOAD, READONLY, DATA
  4 \.reloc *0*000018 .*000  .*000  0*0000... .* CONTENTS, ALLOC, LOAD, READONLY, DATA

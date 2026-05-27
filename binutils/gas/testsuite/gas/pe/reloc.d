#as: --no-pad-sections
#objdump: -wPsections
#name: .reloc section attributes

.*: .*

Section headers.*:
 # Name    *paddr *vaddr *size  .* Flags
 1 \.text  *0*0000 0*0000 0*0(4|10) .* Align: (4|16) EXECUTE,READ,CODE
 2 \.data  *0*0000 0*0000 0*0(8|10) .* Align: (4|16) READ,WRITE,INITIALIZED DATA
 3 \.bss   .*
 4 \.rdata *0*0000 0*0000 0*0(8|10) .* Align: (4|16) READ,INITIALIZED DATA
 5 \.reloc *0*0000 0*0000 0*00c .* Align: 4 READ,INITIALIZED DATA

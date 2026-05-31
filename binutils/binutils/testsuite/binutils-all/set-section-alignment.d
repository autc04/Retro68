#source: pr23633.s
#PROG: objcopy
#objcopy: --set-section-alignment .text=16
#objdump: --section-headers
#target: [is_elf_format] || [is_coff_format]
#xfail: rx-*-* *c30-*-* z8k-*-*

#...
.*\.text.*2\*\*4
#pass

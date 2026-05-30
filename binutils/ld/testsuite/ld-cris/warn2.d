#source: start1.s
#source: globsym1ref.s
#source: globsymw1.s
#target: cris-*-*elf* cris-*-*aout*
#as: --emulation=criself
#ld: -mcriself
#objdump: -p
# There should be no warning, since the symbol warned about is
# missing from the construct.
.*:     file format elf32.*-cris
#pass

#source: start1.s
#source: stabs1.s
#source: globsymw1.s
#target: cris-*-*elf* cris-*-*aout*
#as: --emulation=crisaout
#ld: -mcrisaout
#objdump: -p
# Just checking that undef2 links correctly when given a symbol.
.*:     file format a\.out-cris
#pass

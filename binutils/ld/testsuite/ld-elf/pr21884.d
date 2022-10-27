#source: pr21884a.s
#source: pr21884b.s
#ld: -T pr21884.t
#objdump: -b binary -s
#notarget: aarch64*-*-* arm*-*-* avr-*-* hppa-*-* ia64-*-* m68hc1*-*-* nds32*-*-* riscv*-*-* score-*-* v850-*-*
# Skip targets which can't change output format to binary.

.*:     file format binary

Contents of section .data:
#pass

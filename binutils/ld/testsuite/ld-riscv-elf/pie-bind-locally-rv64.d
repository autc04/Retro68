#source: pie-bind-locally-a.s
#source: pie-bind-locally-b.s
#as: -march=rv64i -mabi=lp64 -defsym __64_bit__=1
#ld: -m[riscv_choose_lp64_emul] -pie
#readelf: -Wr

Relocation section '\.rela\.dyn' at offset .* contains 2 entries:
[ ]+Offset[ ]+Info[ ]+Type[ ]+.*
[0-9a-f]+[ 	]+[0-9a-f]+[ 	]+R_RISCV_RELATIVE[ ].*
[0-9a-f]+[ 	]+[0-9a-f]+[ 	]+R_RISCV_RELATIVE[ ].*

#source: pie-bind-locally-a.s
#source: pie-bind-locally-b.s
#as: -march=rv32i -mabi=ilp32
#ld: -m[riscv_choose_ilp32_emul] -pie
#readelf: -Wr

Relocation section '\.rela\.dyn' at offset .* contains 2 entries:
[ ]+Offset[ ]+Info[ ]+Type[ ]+.*
[0-9a-f]+[ 	]+[0-9a-f]+[ 	]+R_RISCV_RELATIVE[ ].*
[0-9a-f]+[ 	]+[0-9a-f]+[ 	]+R_RISCV_RELATIVE[ ].*

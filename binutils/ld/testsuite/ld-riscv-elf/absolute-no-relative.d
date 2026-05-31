#source: absolute-no-relative.s
#as:
#ld: -Tabsolute-no-relative.ld -pie
#readelf: -Wr

Relocation section '.rela.dyn' at .*
[ ]+Offset[ ]+Info[ ]+Type[ ]+.*
0+[ 	]+0+[ 	]+R_RISCV_NONE[ 	]+0
0+[ 	]+0+[ 	]+R_RISCV_NONE[ 	]+0

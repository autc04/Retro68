#source: discard.s
#as:
#ld: -pie -Tdiscard.ld
#readelf: -rW

Relocation section '\.rela\.dyn'.*
[ 	]+Offset[ 	]+Info[ 	]+Type.*
0+0[ 	]+0+0[ 	]+R_RISCV_NONE[ 	]+0
0+0[ 	]+0+0[ 	]+R_RISCV_NONE[ 	]+0

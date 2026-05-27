#source: discard.s
#as:
#ld: -shared -Tdiscard.ld
#readelf: -rW

Relocation section '\.rela\.dyn'.*
[ 	]+Offset[ 	]+Info[ 	]+Type.*
0+0[ 	]+0+0[ 	]+R_RISCV_NONE[ 	]+0
0+(20008|20010)[ 	]+[0-9a-f]+[ 	]+R_RISCV_(32|64)[ 	]+0+10008[ 	]+sym_global \+ 0

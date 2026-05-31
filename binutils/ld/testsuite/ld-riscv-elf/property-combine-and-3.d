#name: RISC-V GNU Property (multiple inputs, combine section) - 3
#source: property1.s
#source: property4.s
#as: -march=rv64g -mlittle-endian
#ld: -shared -melf64lriscv
#readelf: -n

Displaying notes found in: .note.gnu.property
[ 	]+Owner[ 	]+Data size[ 	]+Description
[ 	]+GNU[ 	]+0x00000010[ 	]+NT_GNU_PROPERTY_TYPE_0
[ 	]+Properties: RISC-V AND feature: CFI_SS

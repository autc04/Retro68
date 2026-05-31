#name: GNU Property (single input, CFI_SS)
#source: property-zicfiss.s
#as: -march=rv64g -mlittle-endian
#ld: -shared -melf64lriscv
#readelf: -n

Displaying notes found in: .note.gnu.property
[ 	]+Owner[ 	]+Data size[ 	]+Description
[ 	]+GNU[ 	]+0x00000010[ 	]+NT_GNU_PROPERTY_TYPE_0
[ 	]+Properties: RISC-V AND feature: CFI_SS

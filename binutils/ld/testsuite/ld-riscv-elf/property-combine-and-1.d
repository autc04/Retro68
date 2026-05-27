#name: RISC-V GNU Property (multiple inputs, combine section) - 1
#source: property1.s
#source: property2.s
#as: -march=rv64g -mlittle-endian
#ld: -shared -melf64lriscv
#readelf: -n

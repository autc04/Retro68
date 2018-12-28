#name: %pcrel_lo with an addend
#source: pcrel-lo-addend.s
#as: -march=rv32ic
#ld: -melf32lriscv
#error: .*dangerous relocation: %pcrel_lo with addend

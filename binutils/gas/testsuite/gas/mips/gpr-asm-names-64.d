#as: -march=mips3 -mabi=64
#objdump: -dr --prefix-addresses --show-raw-insn -M gpr-names=numeric
#name: MIPS GPR assembly (n64)
#source: gpr-asm-names.s
#dump: gpr-asm-names-32.d

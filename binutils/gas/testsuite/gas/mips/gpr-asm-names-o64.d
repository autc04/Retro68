#as: -march=mips3 -mabi=o64 --defsym OLDABI=1
#objdump: -dr --prefix-addresses --show-raw-insn -M gpr-names=numeric
#name: MIPS GPR assembly (o64)
#source: gpr-asm-names.s
#dump: gpr-asm-names-32.d

#as: -march=mips3 -mabi=o64 --defsym MIPS_SIM=2
#objdump: -dr --prefix-addresses --show-raw-insn -M gpr-names=numeric,fpr-names=numeric
#name: MIPS FPR assembly (o64)
#source: fpr-asm-names.s
#dump: fpr-asm-names-32.d

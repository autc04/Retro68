#as: -march=mips3 -mabi=64 --defsym MIPS_SIM=4
#objdump: -dr --prefix-addresses --show-raw-insn -M gpr-names=numeric,fpr-names=numeric
#name: MIPS FPR assembly (n64)
#source: fpr-asm-names.s
#dump: fpr-asm-names-32.d

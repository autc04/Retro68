#as: -march=mips3 -mabi=n32 --defsym MIPS_SIM=3
#objdump: -dr --prefix-addresses --show-raw-insn -M gpr-names=numeric,fpr-names=numeric
#name: MIPS FPR assembly (n32)
#source: fpr-asm-names.s
#dump: fpr-asm-names-32.d

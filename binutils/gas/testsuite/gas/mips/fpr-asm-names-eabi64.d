#as: -march=mips3 -mabi=eabi -mgp64 -mfp64 --defsym MIPS_SIM=6
#objdump: -dr --prefix-addresses --show-raw-insn -M gpr-names=numeric,fpr-names=numeric
#name: MIPS FPR assembly (eabi64)
#source: fpr-asm-names.s
#dump: fpr-asm-names-32.d

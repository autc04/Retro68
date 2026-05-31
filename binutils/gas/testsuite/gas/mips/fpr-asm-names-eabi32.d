#as: -march=mips3 -mabi=eabi -mgp32 -mfp32 --defsym MIPS_SIM=5
#objdump: -dr --prefix-addresses --show-raw-insn -M gpr-names=numeric,fpr-names=numeric
#name: MIPS FPR assembly (eabi32)
#source: fpr-asm-names.s
#dump: fpr-asm-names-32.d

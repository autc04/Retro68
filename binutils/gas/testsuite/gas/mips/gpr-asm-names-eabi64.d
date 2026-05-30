#as: -march=mips3 -mabi=eabi -mgp64 -mfp64
#objdump: -dr --prefix-addresses --show-raw-insn -M gpr-names=numeric
#name: MIPS GPR assembly (eabi64)
#source: gpr-asm-names.s
#dump: gpr-asm-names-32.d

#objdump: -dr --prefix-addresses --show-raw-insn
#name: MIPS relaxed macro with branch swapping
#as: -32
#source: relax-swap3.s
#error-output: mips16@relax-swap3.l

# This test used to cover the MIPS16 LA macro, but ceased to work when a
# regression in MIPS16 relocation processing has been corrected, because
# we have no external relocation available to represent the expression.
# It is left in place to trigger if we ever get R_MIPS16_PC16 relocation
# support.

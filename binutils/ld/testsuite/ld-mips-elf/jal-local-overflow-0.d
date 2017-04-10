#name: MIPS JAL to local symbol overflow 0
#source: jal-local-overflow.s
#as: -EB -32
#ld: -EB -Ttext 0x20000000 -e 0x20000000
#objdump: -dr --prefix-addresses --show-raw-insn
#dump: jal-global-overflow-0.d

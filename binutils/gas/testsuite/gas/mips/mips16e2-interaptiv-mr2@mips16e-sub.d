#objdump: -dr --prefix-address --show-raw-insn
#as: -32 -I$srcdir/$subdir
#name: MIPS16e ISA subset disassembly
#stderr: mips16e2-interaptiv-mr2@mips16e-sub.l
#source: mips16e-sub.s
#dump: mips16e-sub.d

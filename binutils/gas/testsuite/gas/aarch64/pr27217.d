# Check that expressions that generate relocations work when the symbol is a constant.
#name: PR27217
#objdump: -rd
# This test is only valid on ELF based ports.
#notarget: *-*-*coff *-*-pe *-*-wince *-*-*aout* *-*-netbsd

.*:     file format .*

Disassembly of section \.text:

0+000 <.*>:
[ 	]+0:[ 	]+90000000[ 	]+adrp[ 	]+x0, [0-9]*[ 	]+<.*>
[ 	]+0:[ 	]+R_AARCH64(|_P32)_ADR_PREL_PG_HI21[ 	]+bar
[ 	]+4:[ 	]+91000000[ 	]+add[ 	]+x0, x0, #0x0
[ 	]+4:[ 	]+R_AARCH64(|_P32)_ADD_ABS_LO12_NC[ 	]+bar
[ 	]+8:[ 	]+d65f03c0[ 	]+ret
#...
0+010 <.*>:
[ 	]+10:[ 	]+90000000[ 	]+adrp[ 	]+x0, [0-9]*[ 	]+<.*>
[ 	]+10:[ 	]+R_AARCH64(|_P32)_ADR_PREL_PG_HI21[ 	]+\.text\+0x10
[ 	]+14:[ 	]+91000000[ 	]+add[ 	]+x0, x0, #0x0
[ 	]+14:[ 	]+R_AARCH64(|_P32)_ADD_ABS_LO12_NC[ 	]+\.text\+0x10
[ 	]+18:[ 	]+90000001[ 	]+adrp[ 	]+x1, [0-9]*[ 	]+<.*>
[ 	]+18:[ 	]+R_AARCH64(|_P32)_ADR_PREL_PG_HI21[ 	]+\.text\+0x1c
[ 	]+1c:[ 	]+91000021[ 	]+add[ 	]+x1, x1, #0x0
[ 	]+1c:[ 	]+R_AARCH64(|_P32)_ADD_ABS_LO12_NC[ 	]+\.text\+0x1c
[ 	]+20:[ 	]+d65f03c0[ 	]+ret
#pass

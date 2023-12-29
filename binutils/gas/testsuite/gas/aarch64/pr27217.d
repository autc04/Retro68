# Check that expressions that generate relocations work when the symbol is a constant.
#name: PR27217
#objdump: -rd

.*:     file format .*

Disassembly of section \.text:

0+000 <.*>:
[ 	]+0:[ 	]+90000000[ 	]+adrp[ 	]+x0, 12345678[ 	]+<bar>
[ 	]+0:[ 	]+R_AARCH64(|_P32)_ADR_PREL_PG_HI21[ 	]+bar
[ 	]+4:[ 	]+91000000[ 	]+add[ 	]+x0, x0, #0x0
[ 	]+4:[ 	]+R_AARCH64(|_P32)_ADD_ABS_LO12_NC[ 	]+bar
[ 	]+8:[ 	]+d65f03c0[ 	]+ret
#pass

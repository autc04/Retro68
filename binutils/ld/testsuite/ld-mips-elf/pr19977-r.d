#name: pr19977 MIPS -r
#source: pr19977-r.s
#source: ../../../gas/testsuite/gas/mips/pr19977.s
#objdump: -dr
#ld: -r

.*

Disassembly of section \.text:

0+ <foo>:
   0:	.*	li	v1,4387
			0: R_(|MICRO)MIPS(|16)_TLS_TPREL_HI16	\$loc0
   4:	.*	sll	.*
   8:	.*	addiu	v1(|,v1),-26232
			8: R_(|MICRO)MIPS(|16)_TLS_TPREL_LO16	\$loc0
   c:	.*	li	v1,4387
			c: R_(|MICRO)MIPS(|16)_TLS_DTPREL_HI16	\$loc0
  10:	.*	sll	.*
  14:	.*	addiu	v1(|,v1),-26232
			14: R_(|MICRO)MIPS(|16)_TLS_DTPREL_LO16	\$loc0
  18:	.*	li	v1,4387
			18: R_(|MICRO)MIPS(|16)_TLS_TPREL_HI16	\.tdata
  1c:	.*	sll	.*
  20:	.*	addiu	v1(|,v1),-30328
			20: R_(|MICRO)MIPS(|16)_TLS_TPREL_LO16	\.tdata
  24:	.*	li	v1,4387
			24: R_(|MICRO)MIPS(|16)_TLS_DTPREL_HI16	\.tdata
  28:	.*	sll	.*
  2c:	.*	addiu	v1(|,v1),-30328
			2c: R_(|MICRO)MIPS(|16)_TLS_DTPREL_LO16	\.tdata
#pass

#as: -march=rv32i_zcmt
#source: zcmt.s
#objdump: -dr -Mno-aliases

.*:[	 ]+file format .*


Disassembly of section .text:

0+000 <target>:
[	 ]*[0-9a-f]+:[	 ]+a002[	 ]+cm.jt[	 ]+0
[	 ]*[0-9a-f]+:[	 ]+a07e[	 ]+cm.jt[	 ]+31
[	 ]*[0-9a-f]+:[	 ]+a102[	 ]+cm.jalt[	 ]+64
[	 ]*[0-9a-f]+:[	 ]+a3fe[	 ]+cm.jalt[	 ]+255

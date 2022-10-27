#as: -march=rv64ima_zqinx
#source: zqinx.s
#objdump: -dr

.*:[ 	]+file format .*

Disassembly of section .text:

0+000 <target>:
[ 	]+[0-9a-f]+:[ 	]+06c5f553[ 	]+fadd.q[ 	]+a0,a1,a2
[ 	]+[0-9a-f]+:[ 	]+0ec5f553[ 	]+fsub.q[ 	]+a0,a1,a2
[ 	]+[0-9a-f]+:[ 	]+16c5f553[ 	]+fmul.q[ 	]+a0,a1,a2
[ 	]+[0-9a-f]+:[ 	]+1ec5f553[ 	]+fdiv.q[ 	]+a0,a1,a2
[ 	]+[0-9a-f]+:[ 	]+5e057553[ 	]+fsqrt.q[ 	]+a0,a0
[ 	]+[0-9a-f]+:[ 	]+2ec58553[ 	]+fmin.q[ 	]+a0,a1,a2
[ 	]+[0-9a-f]+:[ 	]+2ec59553[ 	]+fmax.q[ 	]+a0,a1,a2
[ 	]+[0-9a-f]+:[ 	]+6ec5f543[ 	]+fmadd.q[ 	]+a0,a1,a2,a3
[ 	]+[0-9a-f]+:[ 	]+6ec5f54f[ 	]+fnmadd.q[ 	]+a0,a1,a2,a3
[ 	]+[0-9a-f]+:[ 	]+6ec5f547[ 	]+fmsub.q[ 	]+a0,a1,a2,a3
[ 	]+[0-9a-f]+:[ 	]+6ec5f54b[ 	]+fnmsub.q[ 	]+a0,a1,a2,a3
[ 	]+[0-9a-f]+:[ 	]+c605f553[ 	]+fcvt.w.q[ 	]+a0,a1
[ 	]+[0-9a-f]+:[ 	]+c615f553[ 	]+fcvt.wu.q[ 	]+a0,a1
[ 	]+[0-9a-f]+:[ 	]+c625f553[ 	]+fcvt.l.q[ 	]+a0,a1
[ 	]+[0-9a-f]+:[ 	]+c635f553[ 	]+fcvt.lu.q[ 	]+a0,a1
[ 	]+[0-9a-f]+:[ 	]+4035f553[ 	]+fcvt.s.q[ 	]+a0,a1
[ 	]+[0-9a-f]+:[ 	]+4235f553[ 	]+fcvt.d.q[ 	]+a0,a1
[ 	]+[0-9a-f]+:[ 	]+46058553[ 	]+fcvt.q.s[ 	]+a0,a1
[ 	]+[0-9a-f]+:[ 	]+46158553[ 	]+fcvt.q.d[ 	]+a0,a1
[ 	]+[0-9a-f]+:[ 	]+d6058553[ 	]+fcvt.q.w[ 	]+a0,a1
[ 	]+[0-9a-f]+:[ 	]+d6158553[ 	]+fcvt.q.wu[ 	]+a0,a1
[ 	]+[0-9a-f]+:[ 	]+d6258553[ 	]+fcvt.q.l[ 	]+a0,a1
[ 	]+[0-9a-f]+:[ 	]+d6358553[ 	]+fcvt.q.lu[ 	]+a0,a1
[ 	]+[0-9a-f]+:[ 	]+26c58553[ 	]+fsgnj.q[ 	]+a0,a1,a2
[ 	]+[0-9a-f]+:[ 	]+26c59553[ 	]+fsgnjn.q[ 	]+a0,a1,a2
[ 	]+[0-9a-f]+:[ 	]+26c5a553[ 	]+fsgnjx.q[ 	]+a0,a1,a2
[ 	]+[0-9a-f]+:[ 	]+a6c5a553[ 	]+feq.q[ 	]+a0,a1,a2
[ 	]+[0-9a-f]+:[ 	]+a6c59553[ 	]+flt.q[ 	]+a0,a1,a2
[ 	]+[0-9a-f]+:[ 	]+a6c58553[ 	]+fle.q[ 	]+a0,a1,a2
[ 	]+[0-9a-f]+:[ 	]+a6b61553[ 	]+flt.q[ 	]+a0,a2,a1
[ 	]+[0-9a-f]+:[ 	]+a6b60553[ 	]+fle.q[ 	]+a0,a2,a1
[ 	]+[0-9a-f]+:[ 	]+26a51553[ 	]+fneg.q[ 	]+a0,a0
[ 	]+[0-9a-f]+:[ 	]+26a52553[ 	]+fabs.q[ 	]+a0,a0
[ 	]+[0-9a-f]+:[ 	]+e6059553[ 	]+fclass.q[ 	]+a0,a1

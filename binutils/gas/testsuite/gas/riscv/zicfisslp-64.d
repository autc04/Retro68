#as: -march=rv64gc_zicfiss_zicfilp
#objdump: -dr

.*:[    ]+file format .*


Disassembly of section .text:

0+000 <.text>:
[ 	]+[0-9a-f]+:[ 	]+ce104073[ 	]+sspush[ 	]+ra
[ 	]+[0-9a-f]+:[ 	]+ce504073[ 	]+sspush[ 	]+t0
[ 	]+[0-9a-f]+:[ 	]+cdc0c073[ 	]+sspopchk[ 	]+ra
[ 	]+[0-9a-f]+:[ 	]+cdc2c073[ 	]+sspopchk[ 	]+t0
[ 	]+[0-9a-f]+:[ 	]+cdc04573[ 	]+ssrdp[ 	]+a0
[ 	]+[0-9a-f]+:[ 	]+48a5252f[ 	]+ssamoswap.w[ 	]+a0,a0,\(a0\)
[ 	]+[0-9a-f]+:[ 	]+48a5252f[ 	]+ssamoswap.w[ 	]+a0,a0,\(a0\)
[ 	]+[0-9a-f]+:[ 	]+4ca5252f[ 	]+ssamoswap.w.aq[ 	]+a0,a0,\(a0\)
[ 	]+[0-9a-f]+:[ 	]+4ca5252f[ 	]+ssamoswap.w.aq[ 	]+a0,a0,\(a0\)
[ 	]+[0-9a-f]+:[ 	]+4aa5252f[ 	]+ssamoswap.w.rl[ 	]+a0,a0,\(a0\)
[ 	]+[0-9a-f]+:[ 	]+4aa5252f[ 	]+ssamoswap.w.rl[ 	]+a0,a0,\(a0\)
[ 	]+[0-9a-f]+:[ 	]+4ea5252f[ 	]+ssamoswap.w.aqrl[ 	]+a0,a0,\(a0\)
[ 	]+[0-9a-f]+:[ 	]+4ea5252f[ 	]+ssamoswap.w.aqrl[ 	]+a0,a0,\(a0\)
[ 	]+[0-9a-f]+:[ 	]+48a5352f[ 	]+ssamoswap.d[ 	]+a0,a0,\(a0\)
[ 	]+[0-9a-f]+:[ 	]+48a5352f[ 	]+ssamoswap.d[ 	]+a0,a0,\(a0\)
[ 	]+[0-9a-f]+:[ 	]+4ca5352f[ 	]+ssamoswap.d.aq[ 	]+a0,a0,\(a0\)
[ 	]+[0-9a-f]+:[ 	]+4ca5352f[ 	]+ssamoswap.d.aq[ 	]+a0,a0,\(a0\)
[ 	]+[0-9a-f]+:[ 	]+4aa5352f[ 	]+ssamoswap.d.rl[ 	]+a0,a0,\(a0\)
[ 	]+[0-9a-f]+:[ 	]+4aa5352f[ 	]+ssamoswap.d.rl[ 	]+a0,a0,\(a0\)
[ 	]+[0-9a-f]+:[ 	]+4ea5352f[ 	]+ssamoswap.d.aqrl[ 	]+a0,a0,\(a0\)
[ 	]+[0-9a-f]+:[ 	]+4ea5352f[ 	]+ssamoswap.d.aqrl[ 	]+a0,a0,\(a0\)
[ 	]+[0-9a-f]+:[ 	]+6081[ 	]+sspush[ 	]+ra
[ 	]+[0-9a-f]+:[ 	]+6081[ 	]+sspush[ 	]+ra
[ 	]+[0-9a-f]+:[ 	]+6281[ 	]+sspopchk[ 	]+t0
[ 	]+[0-9a-f]+:[ 	]+6281[ 	]+sspopchk[ 	]+t0
[ 	]+[0-9a-f]+:[ 	]+00111017[ 	]+lpad[ 	]+0x111

#as: -march=rv32ima_zilsd_zclsd
#source: zilsd-zclsd.s
#objdump: -d -Mno-aliases

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <target>:
[ 	]+0:[ 	]+0007b303[ 	]+ld[ 	]+t1,0\(a5\)
[ 	]+4:[ 	]+00883903[ 	]+ld[ 	]+s2,8\(a6\)
[ 	]+8:[ 	]+0105ba03[ 	]+ld[ 	]+s4,16\(a1\)
[ 	]+c:[ 	]+0067b023[ 	]+sd[ 	]+t1,0\(a5\)
[ 	]+10:[ 	]+01283423[ 	]+sd[ 	]+s2,8\(a6\)
[ 	]+14:[ 	]+0145b823[ 	]+sd[ 	]+s4,16\(a1\)
[ 	]+18:[ 	]+6380[ 	]+c.ld[ 	]+s0,0\(a5\)
[ 	]+1a:[ 	]+6408[ 	]+c.ld[ 	]+a0,8\(s0\)
[ 	]+1c:[ 	]+6a90[ 	]+c.ld[ 	]+a2,16\(a3\)
[ 	]+1e:[ 	]+e380[ 	]+c.sd[ 	]+s0,0\(a5\)
[ 	]+20:[ 	]+e408[ 	]+c.sd[ 	]+a0,8\(s0\)
[ 	]+22:[ 	]+ea90[ 	]+c.sd[ 	]+a2,16\(a3\)
[ 	]+24:[ 	]+6122[ 	]+c.ldsp[ 	]+sp,8\(sp\)
[ 	]+26:[ 	]+652a[ 	]+c.ldsp[ 	]+a0,136\(sp\)
[ 	]+28:[ 	]+7f7e[ 	]+c.ldsp[ 	]+t5,504\(sp\)
[ 	]+2a:[ 	]+e002[ 	]+c.sdsp[ 	]+zero,0\(sp\)
[ 	]+2c:[ 	]+e40a[ 	]+c.sdsp[ 	]+sp,8\(sp\)
[ 	]+2e:[ 	]+e52a[ 	]+c.sdsp[ 	]+a0,136\(sp\)
[ 	]+30:[ 	]+fffa[ 	]+c.sdsp[ 	]+t5,504\(sp\)

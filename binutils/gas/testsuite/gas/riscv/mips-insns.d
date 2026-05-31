#as:
#objdump: -dr

.*:[   ]+file format .*


Disassembly of section .text:

0+000 <.text>:
[ 	]+[0-9a-f]+:[ 	]+0003000b[ 	]+mips.pref[ 	]+0x0,0x0\(t1\)
[ 	]+[0-9a-f]+:[ 	]+1ff38f8b[ 	]+mips.pref[ 	]+0x1f,0x1ff\(t2\)
[ 	]+[0-9a-f]+:[ 	]+6eb6350b[ 	]+mips.ccmov[ 	]+a0,a1,a2,a3
[ 	]+[0-9a-f]+:[ 	]+00301013[ 	]+mips.ehb
[ 	]+[0-9a-f]+:[ 	]+00101013[ 	]+mips.ihb
[ 	]+[0-9a-f]+:[ 	]+00501013[ 	]+mips.pause
[ 	]+[0-9a-f]+:[ 	]+e80f4e0b[ 	]+mips.ldp[ 	]+t3,t4,0\(t5\)
[ 	]+[0-9a-f]+:[ 	]+e88f4e0b[ 	]+mips.ldp[ 	]+t3,t4,8\(t5\)
[ 	]+[0-9a-f]+:[ 	]+1f00cf8b[ 	]+mips.ldp[ 	]+t6,gp,112\(ra\)
[ 	]+[0-9a-f]+:[ 	]+1f80cf8b[ 	]+mips.ldp[ 	]+t6,gp,120\(ra\)
[ 	]+[0-9a-f]+:[ 	]+5816450b[ 	]+mips.lwp[ 	]+a0,a1,0\(a2\)
[ 	]+[0-9a-f]+:[ 	]+5856450b[ 	]+mips.lwp[ 	]+a0,a1,4\(a2\)
[ 	]+[0-9a-f]+:[ 	]+7797c68b[ 	]+mips.lwp[ 	]+a3,a4,120\(a5\)
[ 	]+[0-9a-f]+:[ 	]+77d7c68b[ 	]+mips.lwp[ 	]+a3,a4,124\(a5\)
[ 	]+[0-9a-f]+:[ 	]+e9cf500b[ 	]+mips.sdp[ 	]+t3,t4,0\(t5\)
[ 	]+[0-9a-f]+:[ 	]+e9cf540b[ 	]+mips.sdp[ 	]+t3,t4,8\(t5\)
[ 	]+[0-9a-f]+:[ 	]+1ff0d80b[ 	]+mips.sdp[ 	]+t6,gp,112\(ra\)
[ 	]+[0-9a-f]+:[ 	]+1ff0dc0b[ 	]+mips.sdp[ 	]+t6,gp,120\(ra\)
[ 	]+[0-9a-f]+:[ 	]+58a6508b[ 	]+mips.swp[ 	]+a0,a1,0\(a2\)
[ 	]+[0-9a-f]+:[ 	]+58a6528b[ 	]+mips.swp[ 	]+a0,a1,4\(a2\)
[ 	]+[0-9a-f]+:[ 	]+76d7dc8b[ 	]+mips.swp[ 	]+a3,a4,120\(a5\)
[ 	]+[0-9a-f]+:[ 	]+76d7de8b[ 	]+mips.swp[ 	]+a3,a4,124\(a5\)

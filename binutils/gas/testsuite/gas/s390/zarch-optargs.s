.text
foo:
# nopr [R1]
	nopr
	nopr	%r1
# nop [D1(X1,B1)]
	nop
	nop	4095
	nop	4095(%r2)
	nop	4095(%r1,0)
	nop	4095(%r1,%r2)
# cu12 R1,R2[,M3]
	cu12	%r2,%r4
	cu12	%r2,%r4,3
# vst V1,D2(X2,B2)[,M3]
	vst     %v1,16
	vst     %v1,16,3
	vst     %v1,16(%r3)
	vst     %v1,16(%r3),3
	vst     %v1,16(%r2,0)
	vst     %v1,16(%r2,0),3
	vst	%v1,16(%r2,%r3)
	vst	%v1,16(%r2,%r3),3
# idte R1,R3,R2[,M4]
	idte	%r1,%r3,%r2
	idte	%r1,%r3,%r2,4
# ipte R1,R2[,R3[,M4]]
	ipte	%r1,%r2
	ipte	%r1,%r2,%r3
	ipte	%r1,%r2,%r3,4
# vstm V1,V3,D2(B2)[,M4]
	vstm	%v1,%v3,16
	vstm	%v1,%v3,16,4
	vstm	%v1,%v3,16(%r2)
	vstm	%v1,%v3,16(%r2),4
# risbg R1,R2,I3,I4[,I5]
	risbg	%r1,%r2,3,4
	risbg	%r1,%r2,3,4,5
# vfae V1,V2,V3,M4[,M5]
	vfae	%v1,%v2,%v3,4
	vfae	%v1,%v2,%v3,4,5
# vstrc V1,V2,V3,V4,M5[,M6]
	vstrc	%v1,%v2,%v3,%v4,5
	vstrc	%v1,%v2,%v3,%v4,5,6

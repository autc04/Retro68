addqp z0.b, z0.b, z0.b
addqp z31.b, z0.b, z0.b
addqp z0.b, z31.b, z0.b
addqp z0.b, z0.b, z31.b
addqp z0.h, z0.h, z0.h
addqp z31.h, z0.h, z0.h
addqp z0.h, z31.h, z0.h
addqp z0.h, z0.h, z31.h
addqp z0.s, z0.s, z0.s
addqp z31.s, z0.s, z0.s
addqp z0.s, z31.s, z0.s
addqp z0.s, z0.s, z31.s
addqp z0.d, z0.d, z0.d
addqp z31.d, z0.d, z0.d
addqp z0.d, z31.d, z0.d
addqp z0.d, z0.d, z31.d

addsubp z0.b, z0.b, z0.b
addsubp z31.b, z0.b, z0.b
addsubp z0.b, z31.b, z0.b
addsubp z0.b, z0.b, z31.b
addsubp z0.h, z0.h, z0.h
addsubp z31.h, z0.h, z0.h
addsubp z0.h, z31.h, z0.h
addsubp z0.h, z0.h, z31.h
addsubp z0.s, z0.s, z0.s
addsubp z31.s, z0.s, z0.s
addsubp z0.s, z31.s, z0.s
addsubp z0.s, z0.s, z31.s
addsubp z0.d, z0.d, z0.d
addsubp z31.d, z0.d, z0.d
addsubp z0.d, z31.d, z0.d
addsubp z0.d, z0.d, z31.d

fcvtzsn z0.b, { z0.h-z1.h }
fcvtzsn z31.b, { z0.h-z1.h }
fcvtzsn z0.b, { z30.h-z31.h }
fcvtzsn z0.h, { z0.s-z1.s }
fcvtzsn z31.h, { z0.s-z1.s }
fcvtzsn z0.h, { z30.s-z31.s }
fcvtzsn z0.s, { z0.d-z1.d }
fcvtzsn z31.s, { z0.d-z1.d }
fcvtzsn z0.s, { z30.d-z31.d }

fcvtzun z0.b, { z0.h-z1.h }
fcvtzun z31.b, { z0.h-z1.h }
fcvtzun z0.b, { z30.h-z31.h }
fcvtzun z0.h, { z0.s-z1.s }
fcvtzun z31.h, { z0.s-z1.s }
fcvtzun z0.h, { z30.s-z31.s }
fcvtzun z0.s, { z0.d-z1.d }
fcvtzun z31.s, { z0.d-z1.d }
fcvtzun z0.s, { z30.d-z31.d }

luti6 z0.h, { z0.h, z1.h }, z0[0]
luti6 z31.h, { z0.h, z1.h }, z0[0]
luti6 z0.h, { z31.h, z0.h }, z0[0]
luti6 z0.h, { z0.h, z1.h }, z31[0]
luti6 z0.h, { z0.h, z1.h }, z0[1]

sabal z0.h, z0.b, z0.b
sabal z31.h, z0.b, z0.b
sabal z0.h, z31.b, z0.b
sabal z0.h, z0.b, z31.b
sabal z0.s, z0.h, z0.h
sabal z31.s, z0.h, z0.h
sabal z0.s, z31.h, z0.h
sabal z0.s, z0.h, z31.h
sabal z0.d, z0.s, z0.s
sabal z31.d, z0.s, z0.s
sabal z0.d, z31.s, z0.s
sabal z0.d, z0.s, z31.s

scvtf z0.h, z0.b
scvtf z31.h, z0.b
scvtf z0.h, z31.b
scvtf z0.s, z0.h
scvtf z31.s, z0.h
scvtf z0.s, z31.h
scvtf z0.d, z0.s
scvtf z31.d, z0.s
scvtf z0.d, z31.s

scvtflt z0.h, z0.b
scvtflt z31.h, z0.b
scvtflt z0.h, z31.b
scvtflt z0.s, z0.h
scvtflt z31.s, z0.h
scvtflt z0.s, z31.h
scvtflt z0.d, z0.s
scvtflt z31.d, z0.s
scvtflt z0.d, z31.s

sdot z0.h, z0.b, z0.b
sdot z31.h, z0.b, z0.b
sdot z0.h, z31.b, z0.b
sdot z0.h, z0.b, z31.b
sdot z0.h, z0.b, z0.b[0]
sdot z31.h, z0.b, z0.b[0]
sdot z0.h, z31.b, z0.b[0]
sdot z0.h, z0.b, z7.b[0]
sdot z0.h, z0.b, z0.b[3]
sdot z0.h, z0.b, z0.b[7]

sqrshrn z0.b, { z0.h-z1.h }, #8
sqrshrn z31.b, { z0.h-z1.h }, #8
sqrshrn z0.b, { z30.h-z31.h }, #8
sqrshrn z0.b, { z0.h-z1.h }, #5
sqrshrn z0.b, { z0.h-z1.h }, #1

sqrshrun z0.b, { z0.h-z1.h }, #8
sqrshrun z31.b, { z0.h-z1.h }, #8
sqrshrun z0.b, { z30.h-z31.h }, #8
sqrshrun z0.b, { z0.h-z1.h }, #5
sqrshrun z0.b, { z0.h-z1.h }, #1

sqshrn z0.b, { z0.h-z1.h }, #8
sqshrn z31.b, { z0.h-z1.h }, #8
sqshrn z0.b, { z30.h-z31.h }, #8
sqshrn z0.b, { z0.h-z1.h }, #5
sqshrn z0.b, { z0.h-z1.h }, #1
sqshrn z0.h, { z0.s-z1.s }, #16
sqshrn z31.h, { z0.s-z1.s }, #16
sqshrn z0.h, { z30.s-z31.s }, #16
sqshrn z0.h, { z0.s-z1.s }, #5
sqshrn z0.h, { z0.s-z1.s }, #1

sqshrun z0.b, { z0.h-z1.h }, #8
sqshrun z31.b, { z0.h-z1.h }, #8
sqshrun z0.b, { z30.h-z31.h }, #8
sqshrun z0.b, { z0.h-z1.h }, #5
sqshrun z0.b, { z0.h-z1.h }, #1
sqshrun z0.h, { z0.s-z1.s }, #16
sqshrun z31.h, { z0.s-z1.s }, #16
sqshrun z0.h, { z30.s-z31.s }, #16
sqshrun z0.h, { z0.s-z1.s }, #5
sqshrun z0.h, { z0.s-z1.s }, #1

subp z0.b, p0/m, z0.b, z0.b
subp z31.b, p0/m, z31.b, z0.b
subp z0.b, p0/m, z0.b, z31.b
subp z0.b, p7/m, z0.b, z0.b
subp z0.h, p0/m, z0.h, z0.h
subp z31.h, p0/m, z31.h, z0.h
subp z0.h, p0/m, z0.h, z31.h
subp z0.h, p7/m, z0.h, z0.h
subp z0.s, p0/m, z0.s, z0.s
subp z31.s, p0/m, z31.s, z0.s
subp z0.s, p0/m, z0.s, z31.s
subp z0.s, p7/m, z0.s, z0.s
subp z0.d, p0/m, z0.d, z0.d
subp z31.d, p0/m, z31.d, z0.d
subp z0.d, p0/m, z0.d, z31.d
subp z0.d, p7/m, z0.d, z0.d

uabal z0.h, z0.b, z0.b
uabal z31.h, z0.b, z0.b
uabal z0.h, z31.b, z0.b
uabal z0.h, z0.b, z31.b
uabal z0.s, z0.h, z0.h
uabal z31.s, z0.h, z0.h
uabal z0.s, z31.h, z0.h
uabal z0.s, z0.h, z31.h
uabal z0.d, z0.s, z0.s
uabal z31.d, z0.s, z0.s
uabal z0.d, z31.s, z0.s
uabal z0.d, z0.s, z31.s

ucvtf z0.h, z0.b
ucvtf z31.h, z0.b
ucvtf z0.h, z31.b
ucvtf z0.s, z0.h
ucvtf z31.s, z0.h
ucvtf z0.s, z31.h
ucvtf z0.d, z0.s
ucvtf z31.d, z0.s
ucvtf z0.d, z31.s

ucvtflt z0.h, z0.b
ucvtflt z31.h, z0.b
ucvtflt z0.h, z31.b
ucvtflt z0.s, z0.h
ucvtflt z31.s, z0.h
ucvtflt z0.s, z31.h
ucvtflt z0.d, z0.s
ucvtflt z31.d, z0.s
ucvtflt z0.d, z31.s

udot z0.h, z0.b, z0.b
udot z31.h, z0.b, z0.b
udot z0.h, z31.b, z0.b
udot z0.h, z0.b, z31.b
udot z0.s, z0.h, z0.h
udot z31.s, z0.h, z0.h
udot z0.s, z31.h, z0.h
udot z0.s, z0.h, z31.h
udot z0.h, z0.b, z0.b[0]
udot z31.h, z0.b, z0.b[0]
udot z0.h, z31.b, z0.b[0]
udot z0.h, z0.b, z7.b[0]
udot z0.h, z0.b, z0.b[3]
udot z0.h, z0.b, z0.b[7]
udot z0.s, z0.h, z0.h[0]
udot z31.s, z0.h, z0.h[0]
udot z0.s, z31.h, z0.h[0]
udot z0.s, z0.h, z7.h[0]
udot z0.s, z0.h, z0.h[1]
udot z0.s, z0.h, z0.h[3]

uqrshrn z0.b, { z0.h-z1.h }, #8
uqrshrn z31.b, { z0.h-z1.h }, #8
uqrshrn z0.b, { z30.h-z31.h }, #8
uqrshrn z0.b, { z0.h-z1.h }, #5
uqrshrn z0.b, { z0.h-z1.h }, #1

uqrshrn z0.h, { z0.s-z1.s }, #16
uqrshrn z31.h, { z0.s-z1.s }, #16
uqrshrn z0.h, { z30.s-z31.s }, #16
uqrshrn z0.h, { z0.s-z1.s },  #5
uqrshrn z0.h, { z0.s-z1.s },  #1

uqshrn z0.b, { z0.h-z1.h }, #8
uqshrn z31.b, { z0.h-z1.h }, #8
uqshrn z0.b, { z30.h-z31.h }, #8
uqshrn z0.b, { z0.h-z1.h }, #5
uqshrn z0.b, { z0.h-z1.h }, #1

uqshrn z0.h, { z0.s-z1.s }, #16
uqshrn z31.h, { z0.s-z1.s }, #16
uqshrn z0.h, { z30.s-z31.s }, #16
uqshrn z0.h, { z0.s-z1.s }, #5
uqshrn z0.h, { z0.s-z1.s }, #1

.arch armv8-a+sve2p3
luti6 z0.b, { z0.b, z1.b }, z0
luti6 z31.b, { z0.b, z1.b }, z0
luti6 z0.b, { z31.b, z0.b }, z0
luti6 z0.b, { z0.b, z1.b }, z31

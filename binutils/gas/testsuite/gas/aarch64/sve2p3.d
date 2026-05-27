#as: -march=armv8-a+sve2p3
#as: -march=armv8-a+sme2p3
#as: -march=armv9.7-a
#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	04207800 	addqp	z0\.b, z0\.b, z0\.b
 *[0-9a-f]+:	0420781f 	addqp	z31\.b, z0\.b, z0\.b
 *[0-9a-f]+:	04207be0 	addqp	z0\.b, z31\.b, z0\.b
 *[0-9a-f]+:	043f7800 	addqp	z0\.b, z0\.b, z31\.b
 *[0-9a-f]+:	04607800 	addqp	z0\.h, z0\.h, z0\.h
 *[0-9a-f]+:	0460781f 	addqp	z31\.h, z0\.h, z0\.h
 *[0-9a-f]+:	04607be0 	addqp	z0\.h, z31\.h, z0\.h
 *[0-9a-f]+:	047f7800 	addqp	z0\.h, z0\.h, z31\.h
 *[0-9a-f]+:	04a07800 	addqp	z0\.s, z0\.s, z0\.s
 *[0-9a-f]+:	04a0781f 	addqp	z31\.s, z0\.s, z0\.s
 *[0-9a-f]+:	04a07be0 	addqp	z0\.s, z31\.s, z0\.s
 *[0-9a-f]+:	04bf7800 	addqp	z0\.s, z0\.s, z31\.s
 *[0-9a-f]+:	04e07800 	addqp	z0\.d, z0\.d, z0\.d
 *[0-9a-f]+:	04e0781f 	addqp	z31\.d, z0\.d, z0\.d
 *[0-9a-f]+:	04e07be0 	addqp	z0\.d, z31\.d, z0\.d
 *[0-9a-f]+:	04ff7800 	addqp	z0\.d, z0\.d, z31\.d

 *[0-9a-f]+:	04207c00 	addsubp	z0\.b, z0\.b, z0\.b
 *[0-9a-f]+:	04207c1f 	addsubp	z31\.b, z0\.b, z0\.b
 *[0-9a-f]+:	04207fe0 	addsubp	z0\.b, z31\.b, z0\.b
 *[0-9a-f]+:	043f7c00 	addsubp	z0\.b, z0\.b, z31\.b
 *[0-9a-f]+:	04607c00 	addsubp	z0\.h, z0\.h, z0\.h
 *[0-9a-f]+:	04607c1f 	addsubp	z31\.h, z0\.h, z0\.h
 *[0-9a-f]+:	04607fe0 	addsubp	z0\.h, z31\.h, z0\.h
 *[0-9a-f]+:	047f7c00 	addsubp	z0\.h, z0\.h, z31\.h
 *[0-9a-f]+:	04a07c00 	addsubp	z0\.s, z0\.s, z0\.s
 *[0-9a-f]+:	04a07c1f 	addsubp	z31\.s, z0\.s, z0\.s
 *[0-9a-f]+:	04a07fe0 	addsubp	z0\.s, z31\.s, z0\.s
 *[0-9a-f]+:	04bf7c00 	addsubp	z0\.s, z0\.s, z31\.s
 *[0-9a-f]+:	04e07c00 	addsubp	z0\.d, z0\.d, z0\.d
 *[0-9a-f]+:	04e07c1f 	addsubp	z31\.d, z0\.d, z0\.d
 *[0-9a-f]+:	04e07fe0 	addsubp	z0\.d, z31\.d, z0\.d
 *[0-9a-f]+:	04ff7c00 	addsubp	z0\.d, z0\.d, z31\.d

 *[0-9a-f]+:	654d3000 	fcvtzsn	z0\.b, {z0\.h-z1\.h}
 *[0-9a-f]+:	654d301f 	fcvtzsn	z31\.b, {z0\.h-z1\.h}
 *[0-9a-f]+:	654d33c0 	fcvtzsn	z0\.b, {z30\.h-z31\.h}
 *[0-9a-f]+:	658d3000 	fcvtzsn	z0\.h, {z0\.s-z1\.s}
 *[0-9a-f]+:	658d301f 	fcvtzsn	z31\.h, {z0\.s-z1\.s}
 *[0-9a-f]+:	658d33c0 	fcvtzsn	z0\.h, {z30\.s-z31\.s}
 *[0-9a-f]+:	65cd3000 	fcvtzsn	z0\.s, {z0\.d-z1\.d}
 *[0-9a-f]+:	65cd301f 	fcvtzsn	z31\.s, {z0\.d-z1\.d}
 *[0-9a-f]+:	65cd33c0 	fcvtzsn	z0\.s, {z30\.d-z31\.d}

 *[0-9a-f]+:	654d3400 	fcvtzun	z0\.b, {z0\.h-z1\.h}
 *[0-9a-f]+:	654d341f 	fcvtzun	z31\.b, {z0\.h-z1\.h}
 *[0-9a-f]+:	654d37c0 	fcvtzun	z0\.b, {z30\.h-z31\.h}
 *[0-9a-f]+:	658d3400 	fcvtzun	z0\.h, {z0\.s-z1\.s}
 *[0-9a-f]+:	658d341f 	fcvtzun	z31\.h, {z0\.s-z1\.s}
 *[0-9a-f]+:	658d37c0 	fcvtzun	z0\.h, {z30\.s-z31\.s}
 *[0-9a-f]+:	65cd3400 	fcvtzun	z0\.s, {z0\.d-z1\.d}
 *[0-9a-f]+:	65cd341f 	fcvtzun	z31\.s, {z0\.d-z1\.d}
 *[0-9a-f]+:	65cd37c0 	fcvtzun	z0\.s, {z30\.d-z31\.d}

 *[0-9a-f]+:	4560ac00 	luti6	z0.h, {z0.h-z1.h}, z0\[0\]
 *[0-9a-f]+:	4560ac1f 	luti6	z31.h, {z0.h-z1.h}, z0\[0\]
 *[0-9a-f]+:	4560afe0 	luti6	z0.h, {z31.h-z0.h}, z0\[0\]
 *[0-9a-f]+:	457fac00 	luti6	z0.h, {z0.h-z1.h}, z31\[0\]
 *[0-9a-f]+:	45e0ac00 	luti6	z0.h, {z0.h-z1.h}, z0\[1\]

 *[0-9a-f]+:	4440d400 	sabal	z0\.h, z0\.b, z0\.b
 *[0-9a-f]+:	4440d41f 	sabal	z31\.h, z0\.b, z0\.b
 *[0-9a-f]+:	4440d7e0 	sabal	z0\.h, z31\.b, z0\.b
 *[0-9a-f]+:	445fd400 	sabal	z0\.h, z0\.b, z31\.b
 *[0-9a-f]+:	4480d400 	sabal	z0\.s, z0\.h, z0\.h
 *[0-9a-f]+:	4480d41f 	sabal	z31\.s, z0\.h, z0\.h
 *[0-9a-f]+:	4480d7e0 	sabal	z0\.s, z31\.h, z0\.h
 *[0-9a-f]+:	449fd400 	sabal	z0\.s, z0\.h, z31\.h
 *[0-9a-f]+:	44c0d400 	sabal	z0\.d, z0\.s, z0\.s
 *[0-9a-f]+:	44c0d41f 	sabal	z31\.d, z0\.s, z0\.s
 *[0-9a-f]+:	44c0d7e0 	sabal	z0\.d, z31\.s, z0\.s
 *[0-9a-f]+:	44dfd400 	sabal	z0\.d, z0\.s, z31\.s

 *[0-9a-f]+:	654c3000 	scvtf	z0\.h, z0\.b
 *[0-9a-f]+:	654c301f 	scvtf	z31\.h, z0\.b
 *[0-9a-f]+:	654c33e0 	scvtf	z0\.h, z31\.b
 *[0-9a-f]+:	658c3000 	scvtf	z0\.s, z0\.h
 *[0-9a-f]+:	658c301f 	scvtf	z31\.s, z0\.h
 *[0-9a-f]+:	658c33e0 	scvtf	z0\.s, z31\.h
 *[0-9a-f]+:	65cc3000 	scvtf	z0\.d, z0\.s
 *[0-9a-f]+:	65cc301f 	scvtf	z31\.d, z0\.s
 *[0-9a-f]+:	65cc33e0 	scvtf	z0\.d, z31\.s

 *[0-9a-f]+:	654c3800 	scvtflt	z0\.h, z0\.b
 *[0-9a-f]+:	654c381f 	scvtflt	z31\.h, z0\.b
 *[0-9a-f]+:	654c3be0 	scvtflt	z0\.h, z31\.b
 *[0-9a-f]+:	658c3800 	scvtflt	z0\.s, z0\.h
 *[0-9a-f]+:	658c381f 	scvtflt	z31\.s, z0\.h
 *[0-9a-f]+:	658c3be0 	scvtflt	z0\.s, z31\.h
 *[0-9a-f]+:	65cc3800 	scvtflt	z0\.d, z0\.s
 *[0-9a-f]+:	65cc381f 	scvtflt	z31\.d, z0\.s
 *[0-9a-f]+:	65cc3be0 	scvtflt	z0\.d, z31\.s

 *[0-9a-f]+:	44400000 	sdot	z0\.h, z0\.b, z0\.b
 *[0-9a-f]+:	4440001f 	sdot	z31\.h, z0\.b, z0\.b
 *[0-9a-f]+:	444003e0 	sdot	z0\.h, z31\.b, z0\.b
 *[0-9a-f]+:	445f0000 	sdot	z0\.h, z0\.b, z31\.b
 *[0-9a-f]+:	44200000 	sdot	z0\.h, z0\.b, z0\.b\[0\]
 *[0-9a-f]+:	4420001f 	sdot	z31\.h, z0\.b, z0\.b\[0\]
 *[0-9a-f]+:	442003e0 	sdot	z0\.h, z31\.b, z0\.b\[0\]
 *[0-9a-f]+:	44270000 	sdot	z0\.h, z0\.b, z7\.b\[0\]
 *[0-9a-f]+:	44380000 	sdot	z0\.h, z0\.b, z0\.b\[3\]
 *[0-9a-f]+:	44780000 	sdot	z0\.h, z0\.b, z0\.b\[7\]

 *[0-9a-f]+:[ \t]+45a82800[ \t]+sqrshrn[ \t]+z0\.b,[ \t]+{z0\.h-z1\.h},[ \t]+#8
 *[0-9a-f]+:[ \t]+45a8281f[ \t]+sqrshrn[ \t]+z31\.b,[ \t]+{z0\.h-z1\.h},[ \t]+#8
 *[0-9a-f]+:[ \t]+45a82bc0[ \t]+sqrshrn[ \t]+z0\.b,[ \t]+{z30\.h-z31\.h},[ \t]+#8
 *[0-9a-f]+:[ \t]+45ab2800[ \t]+sqrshrn[ \t]+z0\.b,[ \t]+{z0\.h-z1\.h},[ \t]+#5
 *[0-9a-f]+:[ \t]+45af2800[ \t]+sqrshrn[ \t]+z0\.b,[ \t]+{z0\.h-z1\.h},[ \t]+#1

 *[0-9a-f]+:[ \t]+45a80800[ \t]+sqrshrun[ \t]+z0\.b,[ \t]+{z0\.h-z1\.h},[ \t]+#8
 *[0-9a-f]+:[ \t]+45a8081f[ \t]+sqrshrun[ \t]+z31\.b,[ \t]+{z0\.h-z1\.h},[ \t]+#8
 *[0-9a-f]+:[ \t]+45a80bc0[ \t]+sqrshrun[ \t]+z0\.b,[ \t]+{z30\.h-z31\.h},[ \t]+#8
 *[0-9a-f]+:[ \t]+45ab0800[ \t]+sqrshrun[ \t]+z0\.b,[ \t]+{z0\.h-z1\.h},[ \t]+#5
 *[0-9a-f]+:[ \t]+45af0800[ \t]+sqrshrun[ \t]+z0\.b,[ \t]+{z0\.h-z1\.h},[ \t]+#1

 *[0-9a-f]+:[ \t]+45a80000[ \t]+sqshrn[ \t]+z0\.b,[ \t]+{z0\.h-z1\.h},[ \t]+#8
 *[0-9a-f]+:[ \t]+45a8001f[ \t]+sqshrn[ \t]+z31\.b,[ \t]+{z0\.h-z1\.h},[ \t]+#8
 *[0-9a-f]+:[ \t]+45a803c0[ \t]+sqshrn[ \t]+z0\.b,[ \t]+{z30\.h-z31\.h},[ \t]+#8
 *[0-9a-f]+:[ \t]+45ab0000[ \t]+sqshrn[ \t]+z0\.b,[ \t]+{z0\.h-z1\.h},[ \t]+#5
 *[0-9a-f]+:[ \t]+45af0000[ \t]+sqshrn[ \t]+z0\.b,[ \t]+{z0\.h-z1\.h},[ \t]+#1
 *[0-9a-f]+:[ \t]+45b00000[ \t]+sqshrn[ \t]+z0\.h,[ \t]+{z0\.s-z1\.s},[ \t]+#16
 *[0-9a-f]+:[ \t]+45b0001f[ \t]+sqshrn[ \t]+z31\.h,[ \t]+{z0\.s-z1\.s},[ \t]+#16
 *[0-9a-f]+:[ \t]+45b003c0[ \t]+sqshrn[ \t]+z0\.h,[ \t]+{z30\.s-z31\.s},[ \t]+#16
 *[0-9a-f]+:[ \t]+45bb0000[ \t]+sqshrn[ \t]+z0\.h,[ \t]+{z0\.s-z1\.s},[ \t]+#5
 *[0-9a-f]+:[ \t]+45bf0000[ \t]+sqshrn[ \t]+z0\.h,[ \t]+{z0\.s-z1\.s},[ \t]+#1

 *[0-9a-f]+:[ \t]+45a82000[ \t]+sqshrun[ \t]+z0\.b,[ \t]+{z0\.h-z1\.h},[ \t]+#8
 *[0-9a-f]+:[ \t]+45a8201f[ \t]+sqshrun[ \t]+z31\.b,[ \t]+{z0\.h-z1\.h},[ \t]+#8
 *[0-9a-f]+:[ \t]+45a823c0[ \t]+sqshrun[ \t]+z0\.b,[ \t]+{z30\.h-z31\.h},[ \t]+#8
 *[0-9a-f]+:[ \t]+45ab2000[ \t]+sqshrun[ \t]+z0\.b,[ \t]+{z0\.h-z1\.h},[ \t]+#5
 *[0-9a-f]+:[ \t]+45af2000[ \t]+sqshrun[ \t]+z0\.b,[ \t]+{z0\.h-z1\.h},[ \t]+#1
 *[0-9a-f]+:[ \t]+45b02000[ \t]+sqshrun[ \t]+z0\.h,[ \t]+{z0\.s-z1\.s},[ \t]+#16
 *[0-9a-f]+:[ \t]+45b0201f[ \t]+sqshrun[ \t]+z31\.h,[ \t]+{z0\.s-z1\.s},[ \t]+#16
 *[0-9a-f]+:[ \t]+45b023c0[ \t]+sqshrun[ \t]+z0\.h,[ \t]+{z30\.s-z31\.s},[ \t]+#16
 *[0-9a-f]+:[ \t]+45bb2000[ \t]+sqshrun[ \t]+z0\.h,[ \t]+{z0\.s-z1\.s},[ \t]+#5
 *[0-9a-f]+:[ \t]+45bf2000[ \t]+sqshrun[ \t]+z0\.h,[ \t]+{z0\.s-z1\.s},[ \t]+#1

 *[0-9a-f]+:	4410a000 	subp	z0\.b, p0/m, z0\.b, z0\.b
 *[0-9a-f]+:	4410a01f 	subp	z31\.b, p0/m, z31\.b, z0\.b
 *[0-9a-f]+:	4410a3e0 	subp	z0\.b, p0/m, z0\.b, z31\.b
 *[0-9a-f]+:	4410bc00 	subp	z0\.b, p7/m, z0\.b, z0\.b
 *[0-9a-f]+:	4450a000 	subp	z0\.h, p0/m, z0\.h, z0\.h
 *[0-9a-f]+:	4450a01f 	subp	z31\.h, p0/m, z31\.h, z0\.h
 *[0-9a-f]+:	4450a3e0 	subp	z0\.h, p0/m, z0\.h, z31\.h
 *[0-9a-f]+:	4450bc00 	subp	z0\.h, p7/m, z0\.h, z0\.h
 *[0-9a-f]+:	4490a000 	subp	z0\.s, p0/m, z0\.s, z0\.s
 *[0-9a-f]+:	4490a01f 	subp	z31\.s, p0/m, z31\.s, z0\.s
 *[0-9a-f]+:	4490a3e0 	subp	z0\.s, p0/m, z0\.s, z31\.s
 *[0-9a-f]+:	4490bc00 	subp	z0\.s, p7/m, z0\.s, z0\.s
 *[0-9a-f]+:	44d0a000 	subp	z0\.d, p0/m, z0\.d, z0\.d
 *[0-9a-f]+:	44d0a01f 	subp	z31\.d, p0/m, z31\.d, z0\.d
 *[0-9a-f]+:	44d0a3e0 	subp	z0\.d, p0/m, z0\.d, z31\.d
 *[0-9a-f]+:	44d0bc00 	subp	z0\.d, p7/m, z0\.d, z0\.d

 *[0-9a-f]+:	4440dc00 	uabal	z0\.h, z0\.b, z0\.b
 *[0-9a-f]+:	4440dc1f 	uabal	z31\.h, z0\.b, z0\.b
 *[0-9a-f]+:	4440dfe0 	uabal	z0\.h, z31\.b, z0\.b
 *[0-9a-f]+:	445fdc00 	uabal	z0\.h, z0\.b, z31\.b
 *[0-9a-f]+:	4480dc00 	uabal	z0\.s, z0\.h, z0\.h
 *[0-9a-f]+:	4480dc1f 	uabal	z31\.s, z0\.h, z0\.h
 *[0-9a-f]+:	4480dfe0 	uabal	z0\.s, z31\.h, z0\.h
 *[0-9a-f]+:	449fdc00 	uabal	z0\.s, z0\.h, z31\.h
 *[0-9a-f]+:	44c0dc00 	uabal	z0\.d, z0\.s, z0\.s
 *[0-9a-f]+:	44c0dc1f 	uabal	z31\.d, z0\.s, z0\.s
 *[0-9a-f]+:	44c0dfe0 	uabal	z0\.d, z31\.s, z0\.s
 *[0-9a-f]+:	44dfdc00 	uabal	z0\.d, z0\.s, z31\.s

 *[0-9a-f]+:	654c3400 	ucvtf	z0.h, z0.b
 *[0-9a-f]+:	654c341f 	ucvtf	z31.h, z0.b
 *[0-9a-f]+:	654c37e0 	ucvtf	z0.h, z31.b
 *[0-9a-f]+:	658c3400 	ucvtf	z0.s, z0.h
 *[0-9a-f]+:	658c341f 	ucvtf	z31.s, z0.h
 *[0-9a-f]+:	658c37e0 	ucvtf	z0.s, z31.h
 *[0-9a-f]+:	65cc3400 	ucvtf	z0.d, z0.s
 *[0-9a-f]+:	65cc341f 	ucvtf	z31.d, z0.s
 *[0-9a-f]+:	65cc37e0 	ucvtf	z0.d, z31.s

 *[0-9a-f]+:	654c3c00 	ucvtflt	z0.h, z0.b
 *[0-9a-f]+:	654c3c1f 	ucvtflt	z31.h, z0.b
 *[0-9a-f]+:	654c3fe0 	ucvtflt	z0.h, z31.b
 *[0-9a-f]+:	658c3c00 	ucvtflt	z0.s, z0.h
 *[0-9a-f]+:	658c3c1f 	ucvtflt	z31.s, z0.h
 *[0-9a-f]+:	658c3fe0 	ucvtflt	z0.s, z31.h
 *[0-9a-f]+:	65cc3c00 	ucvtflt	z0.d, z0.s
 *[0-9a-f]+:	65cc3c1f 	ucvtflt	z31.d, z0.s
 *[0-9a-f]+:	65cc3fe0 	ucvtflt	z0.d, z31.s

 *[0-9a-f]+:	44400400 	udot	z0\.h, z0\.b, z0\.b
 *[0-9a-f]+:	4440041f 	udot	z31\.h, z0\.b, z0\.b
 *[0-9a-f]+:	444007e0 	udot	z0\.h, z31\.b, z0\.b
 *[0-9a-f]+:	445f0400 	udot	z0\.h, z0\.b, z31\.b
 *[0-9a-f]+:	4400cc00 	udot	z0\.s, z0.h, z0\.h
 *[0-9a-f]+:	4400cc1f 	udot	z31\.s, z0.h, z0\.h
 *[0-9a-f]+:	4400cfe0 	udot	z0\.s, z31.h, z0\.h
 *[0-9a-f]+:	441fcc00 	udot	z0\.s, z0.h, z31\.h
 *[0-9a-f]+:	44200400 	udot	z0\.h, z0\.b, z0\.b\[0\]
 *[0-9a-f]+:	4420041f 	udot	z31\.h, z0\.b, z0\.b\[0\]
 *[0-9a-f]+:	442007e0 	udot	z0\.h, z31\.b, z0\.b\[0\]
 *[0-9a-f]+:	44270400 	udot	z0\.h, z0\.b, z7\.b\[0\]
 *[0-9a-f]+:	44380400 	udot	z0\.h, z0\.b, z0\.b\[3\]
 *[0-9a-f]+:	44780400 	udot	z0\.h, z0\.b, z0\.b\[7\]
 *[0-9a-f]+:	4480cc00 	udot	z0\.s, z0\.h, z0\.h\[0\]
 *[0-9a-f]+:	4480cc1f 	udot	z31\.s, z0\.h, z0\.h\[0\]
 *[0-9a-f]+:	4480cfe0 	udot	z0\.s, z31\.h, z0\.h\[0\]
 *[0-9a-f]+:	4487cc00 	udot	z0\.s, z0\.h, z7\.h\[0\]
 *[0-9a-f]+:	4488cc00 	udot	z0\.s, z0\.h, z0\.h\[1\]
 *[0-9a-f]+:	4498cc00 	udot	z0\.s, z0\.h, z0\.h\[3\]

 *[0-9a-f]+:	45a83800 	uqrshrn	z0\.b, {z0\.h-z1\.h}, #8
 *[0-9a-f]+:	45a8381f 	uqrshrn	z31\.b, {z0\.h-z1\.h}, #8
 *[0-9a-f]+:	45a83bc0 	uqrshrn	z0\.b, {z30\.h-z31\.h}, #8
 *[0-9a-f]+:	45ab3800 	uqrshrn	z0\.b, {z0\.h-z1\.h}, #5
 *[0-9a-f]+:	45af3800 	uqrshrn	z0\.b, {z0\.h-z1\.h}, #1

 *[0-9a-f]+:	45b03800 	uqrshrn	z0\.h, {z0.s-z1.s}, #16
 *[0-9a-f]+:	45b0381f 	uqrshrn	z31\.h, {z0.s-z1.s}, #16
 *[0-9a-f]+:	45b03bc0 	uqrshrn	z0\.h, {z30.s-z31.s}, #16
 *[0-9a-f]+:	45bb3800 	uqrshrn	z0\.h, {z0.s-z1.s}, #5
 *[0-9a-f]+:	45bf3800 	uqrshrn	z0\.h, {z0.s-z1.s}, #1

 *[0-9a-f]+:	45a81000 	uqshrn	z0\.b, {z0\.h-z1\.h}, #8
 *[0-9a-f]+:	45a8101f 	uqshrn	z31\.b, {z0\.h-z1\.h}, #8
 *[0-9a-f]+:	45a813c0 	uqshrn	z0\.b, {z30\.h-z31\.h}, #8
 *[0-9a-f]+:	45ab1000 	uqshrn	z0\.b, {z0\.h-z1\.h}, #5
 *[0-9a-f]+:	45af1000 	uqshrn	z0\.b, {z0\.h-z1\.h}, #1

 *[0-9a-f]+:	45b01000 	uqshrn	z0\.h, {z0.s-z1.s}, #16
 *[0-9a-f]+:	45b0101f 	uqshrn	z31\.h, {z0.s-z1.s}, #16
 *[0-9a-f]+:	45b013c0 	uqshrn	z0\.h, {z30.s-z31.s}, #16
 *[0-9a-f]+:	45bb1000 	uqshrn	z0\.h, {z0.s-z1.s}, #5
 *[0-9a-f]+:	45bf1000 	uqshrn	z0\.h, {z0.s-z1.s}, #1

 *[0-9a-f]+:	4520ac00 	luti6	z0.b, {z0.b-z1.b}, z0
 *[0-9a-f]+:	4520ac1f 	luti6	z31.b, {z0.b-z1.b}, z0
 *[0-9a-f]+:	4520afe0 	luti6	z0.b, {z31.b-z0.b}, z0
 *[0-9a-f]+:	453fac00 	luti6	z0.b, {z0.b-z1.b}, z31

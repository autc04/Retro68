#name: F8F32MM FMMLA instructions
#as: -march=armv8-a+f8f32mm
#objdump: -dr

.*:     file format .*


Disassembly of section .*:

.* <a>:
.*:	6e80ec00 	fmmla	v0.4s, v0.16b, v0.16b
.*:	6e9fec00 	fmmla	v0.4s, v0.16b, v31.16b
.*:	6e80efe0 	fmmla	v0.4s, v31.16b, v0.16b
.*:	6e9fefe0 	fmmla	v0.4s, v31.16b, v31.16b
.*:	6e80ec1f 	fmmla	v31.4s, v0.16b, v0.16b
.*:	6e9fec1f 	fmmla	v31.4s, v0.16b, v31.16b
.*:	6e80efff 	fmmla	v31.4s, v31.16b, v0.16b
.*:	6e9fefff 	fmmla	v31.4s, v31.16b, v31.16b

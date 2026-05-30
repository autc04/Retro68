#name: F8F16MM FMMLA instructions
#as: -march=armv8-a+f8f16mm
#objdump: -dr

.*:     file format .*


Disassembly of section .*:

.* <a>:
.*:	6e00ec00 	fmmla	v0.8h, v0.16b, v0.16b
.*:	6e1fec00 	fmmla	v0.8h, v0.16b, v31.16b
.*:	6e00efe0 	fmmla	v0.8h, v31.16b, v0.16b
.*:	6e1fefe0 	fmmla	v0.8h, v31.16b, v31.16b
.*:	6e00ec1f 	fmmla	v31.8h, v0.16b, v0.16b
.*:	6e1fec1f 	fmmla	v31.8h, v0.16b, v31.16b
.*:	6e00efff 	fmmla	v31.8h, v31.16b, v0.16b
.*:	6e1fefff 	fmmla	v31.8h, v31.16b, v31.16b

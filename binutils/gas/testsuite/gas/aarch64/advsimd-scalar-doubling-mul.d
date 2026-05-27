#as: -march=armv8-a
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	5e609000 	sqdmlal	s0, h0, h0
 *[0-9a-f]+:	5e60901f 	sqdmlal	s31, h0, h0
 *[0-9a-f]+:	5e6093e0 	sqdmlal	s0, h31, h0
 *[0-9a-f]+:	5e7f9000 	sqdmlal	s0, h0, h31
 *[0-9a-f]+:	5ea09000 	sqdmlal	d0, s0, s0
 *[0-9a-f]+:	5ea0901f 	sqdmlal	d31, s0, s0
 *[0-9a-f]+:	5ea093e0 	sqdmlal	d0, s31, s0
 *[0-9a-f]+:	5ebf9000 	sqdmlal	d0, s0, s31
 *[0-9a-f]+:	5e60b000 	sqdmlsl	s0, h0, h0
 *[0-9a-f]+:	5e60b01f 	sqdmlsl	s31, h0, h0
 *[0-9a-f]+:	5e60b3e0 	sqdmlsl	s0, h31, h0
 *[0-9a-f]+:	5e7fb000 	sqdmlsl	s0, h0, h31
 *[0-9a-f]+:	5ea0b000 	sqdmlsl	d0, s0, s0
 *[0-9a-f]+:	5ea0b01f 	sqdmlsl	d31, s0, s0
 *[0-9a-f]+:	5ea0b3e0 	sqdmlsl	d0, s31, s0
 *[0-9a-f]+:	5ebfb000 	sqdmlsl	d0, s0, s31
 *[0-9a-f]+:	5e60d000 	sqdmull	s0, h0, h0
 *[0-9a-f]+:	5e60d01f 	sqdmull	s31, h0, h0
 *[0-9a-f]+:	5e60d3e0 	sqdmull	s0, h31, h0
 *[0-9a-f]+:	5e7fd000 	sqdmull	s0, h0, h31
 *[0-9a-f]+:	5ea0d000 	sqdmull	d0, s0, s0
 *[0-9a-f]+:	5ea0d01f 	sqdmull	d31, s0, s0
 *[0-9a-f]+:	5ea0d3e0 	sqdmull	d0, s31, s0
 *[0-9a-f]+:	5ebfd000 	sqdmull	d0, s0, s31
 *[0-9a-f]+:	5f403000 	sqdmlal	s0, h0, v0\.h\[0\]
 *[0-9a-f]+:	5f40301f 	sqdmlal	s31, h0, v0\.h\[0\]
 *[0-9a-f]+:	5f4033e0 	sqdmlal	s0, h31, v0\.h\[0\]
 *[0-9a-f]+:	5f4f3000 	sqdmlal	s0, h0, v15\.h\[0\]
 *[0-9a-f]+:	5f503000 	sqdmlal	s0, h0, v0\.h\[1\]
 *[0-9a-f]+:	5f703000 	sqdmlal	s0, h0, v0\.h\[3\]
 *[0-9a-f]+:	5f703800 	sqdmlal	s0, h0, v0\.h\[7\]
 *[0-9a-f]+:	5f803000 	sqdmlal	d0, s0, v0\.s\[0\]
 *[0-9a-f]+:	5f80301f 	sqdmlal	d31, s0, v0\.s\[0\]
 *[0-9a-f]+:	5f8033e0 	sqdmlal	d0, s31, v0\.s\[0\]
 *[0-9a-f]+:	5f9f3000 	sqdmlal	d0, s0, v31\.s\[0\]
 *[0-9a-f]+:	5fa03000 	sqdmlal	d0, s0, v0\.s\[1\]
 *[0-9a-f]+:	5fa03800 	sqdmlal	d0, s0, v0\.s\[3\]
 *[0-9a-f]+:	5f407000 	sqdmlsl	s0, h0, v0\.h\[0\]
 *[0-9a-f]+:	5f40701f 	sqdmlsl	s31, h0, v0\.h\[0\]
 *[0-9a-f]+:	5f4073e0 	sqdmlsl	s0, h31, v0\.h\[0\]
 *[0-9a-f]+:	5f4f7000 	sqdmlsl	s0, h0, v15\.h\[0\]
 *[0-9a-f]+:	5f507000 	sqdmlsl	s0, h0, v0\.h\[1\]
 *[0-9a-f]+:	5f707000 	sqdmlsl	s0, h0, v0\.h\[3\]
 *[0-9a-f]+:	5f707800 	sqdmlsl	s0, h0, v0\.h\[7\]
 *[0-9a-f]+:	5f807000 	sqdmlsl	d0, s0, v0\.s\[0\]
 *[0-9a-f]+:	5f80701f 	sqdmlsl	d31, s0, v0\.s\[0\]
 *[0-9a-f]+:	5f8073e0 	sqdmlsl	d0, s31, v0\.s\[0\]
 *[0-9a-f]+:	5f9f7000 	sqdmlsl	d0, s0, v31\.s\[0\]
 *[0-9a-f]+:	5fa07000 	sqdmlsl	d0, s0, v0\.s\[1\]
 *[0-9a-f]+:	5fa07800 	sqdmlsl	d0, s0, v0\.s\[3\]
 *[0-9a-f]+:	5f40b000 	sqdmull	s0, h0, v0\.h\[0\]
 *[0-9a-f]+:	5f40b01f 	sqdmull	s31, h0, v0\.h\[0\]
 *[0-9a-f]+:	5f40b3e0 	sqdmull	s0, h31, v0\.h\[0\]
 *[0-9a-f]+:	5f4fb000 	sqdmull	s0, h0, v15\.h\[0\]
 *[0-9a-f]+:	5f50b000 	sqdmull	s0, h0, v0\.h\[1\]
 *[0-9a-f]+:	5f70b000 	sqdmull	s0, h0, v0\.h\[3\]
 *[0-9a-f]+:	5f70b800 	sqdmull	s0, h0, v0\.h\[7\]
 *[0-9a-f]+:	5f80b000 	sqdmull	d0, s0, v0\.s\[0\]
 *[0-9a-f]+:	5f80b01f 	sqdmull	d31, s0, v0\.s\[0\]
 *[0-9a-f]+:	5f80b3e0 	sqdmull	d0, s31, v0\.s\[0\]
 *[0-9a-f]+:	5f9fb000 	sqdmull	d0, s0, v31\.s\[0\]
 *[0-9a-f]+:	5fa0b000 	sqdmull	d0, s0, v0\.s\[1\]
 *[0-9a-f]+:	5fa0b800 	sqdmull	d0, s0, v0\.s\[3\]
 *[0-9a-f]+:	5f40c000 	sqdmulh	h0, h0, v0\.h\[0\]
 *[0-9a-f]+:	5f40c01f 	sqdmulh	h31, h0, v0\.h\[0\]
 *[0-9a-f]+:	5f40c3e0 	sqdmulh	h0, h31, v0\.h\[0\]
 *[0-9a-f]+:	5f4fc000 	sqdmulh	h0, h0, v15\.h\[0\]
 *[0-9a-f]+:	5f50c000 	sqdmulh	h0, h0, v0\.h\[1\]
 *[0-9a-f]+:	5f70c000 	sqdmulh	h0, h0, v0\.h\[3\]
 *[0-9a-f]+:	5f70c800 	sqdmulh	h0, h0, v0\.h\[7\]
 *[0-9a-f]+:	5f80c000 	sqdmulh	s0, s0, v0\.s\[0\]
 *[0-9a-f]+:	5f80c01f 	sqdmulh	s31, s0, v0\.s\[0\]
 *[0-9a-f]+:	5f80c3e0 	sqdmulh	s0, s31, v0\.s\[0\]
 *[0-9a-f]+:	5f9fc000 	sqdmulh	s0, s0, v31\.s\[0\]
 *[0-9a-f]+:	5fa0c000 	sqdmulh	s0, s0, v0\.s\[1\]
 *[0-9a-f]+:	5fa0c800 	sqdmulh	s0, s0, v0\.s\[3\]
 *[0-9a-f]+:	5f40d000 	sqrdmulh	h0, h0, v0\.h\[0\]
 *[0-9a-f]+:	5f40d01f 	sqrdmulh	h31, h0, v0\.h\[0\]
 *[0-9a-f]+:	5f40d3e0 	sqrdmulh	h0, h31, v0\.h\[0\]
 *[0-9a-f]+:	5f4fd000 	sqrdmulh	h0, h0, v15\.h\[0\]
 *[0-9a-f]+:	5f50d000 	sqrdmulh	h0, h0, v0\.h\[1\]
 *[0-9a-f]+:	5f70d000 	sqrdmulh	h0, h0, v0\.h\[3\]
 *[0-9a-f]+:	5f70d800 	sqrdmulh	h0, h0, v0\.h\[7\]
 *[0-9a-f]+:	5f80d000 	sqrdmulh	s0, s0, v0\.s\[0\]
 *[0-9a-f]+:	5f80d01f 	sqrdmulh	s31, s0, v0\.s\[0\]
 *[0-9a-f]+:	5f80d3e0 	sqrdmulh	s0, s31, v0\.s\[0\]
 *[0-9a-f]+:	5f9fd000 	sqrdmulh	s0, s0, v31\.s\[0\]
 *[0-9a-f]+:	5fa0d000 	sqrdmulh	s0, s0, v0\.s\[1\]
 *[0-9a-f]+:	5fa0d800 	sqrdmulh	s0, s0, v0\.s\[3\]

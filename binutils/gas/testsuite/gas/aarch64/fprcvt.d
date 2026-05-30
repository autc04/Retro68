#name: FPRCVT instructions
#as: -march=armv8-a+fprcvt
#objdump: -dr

.*:     file format .*


Disassembly of section .*:

.* <a>:
.*:	1efa0000 	fcvtas	s0, h0
.*:	1efa001f 	fcvtas	s31, h0
.*:	1efa03e0 	fcvtas	s0, h31
.*:	9e3a0000 	fcvtas	d0, s0
.*:	9e3a001f 	fcvtas	d31, s0
.*:	9e3a03e0 	fcvtas	d0, s31
.*:	9efa0000 	fcvtas	d0, h0
.*:	9efa001f 	fcvtas	d31, h0
.*:	9efa03e0 	fcvtas	d0, h31
.*:	1e7a0000 	fcvtas	s0, d0
.*:	1e7a001f 	fcvtas	s31, d0
.*:	1e7a03e0 	fcvtas	s0, d31

.* <b>:
.*:	1efb0000 	fcvtau	s0, h0
.*:	1efb001f 	fcvtau	s31, h0
.*:	1efb03e0 	fcvtau	s0, h31
.*:	9e3b0000 	fcvtau	d0, s0
.*:	9e3b001f 	fcvtau	d31, s0
.*:	9e3b03e0 	fcvtau	d0, s31
.*:	9efb0000 	fcvtau	d0, h0
.*:	9efb001f 	fcvtau	d31, h0
.*:	9efb03e0 	fcvtau	d0, h31
.*:	1e7b0000 	fcvtau	s0, d0
.*:	1e7b001f 	fcvtau	s31, d0
.*:	1e7b03e0 	fcvtau	s0, d31

.* <c>:
.*:	1ef40000 	fcvtms	s0, h0
.*:	1ef4001f 	fcvtms	s31, h0
.*:	1ef403e0 	fcvtms	s0, h31
.*:	9e340000 	fcvtms	d0, s0
.*:	9e34001f 	fcvtms	d31, s0
.*:	9e3403e0 	fcvtms	d0, s31
.*:	9ef40000 	fcvtms	d0, h0
.*:	9ef4001f 	fcvtms	d31, h0
.*:	9ef403e0 	fcvtms	d0, h31
.*:	1e740000 	fcvtms	s0, d0
.*:	1e74001f 	fcvtms	s31, d0
.*:	1e7403e0 	fcvtms	s0, d31

.* <d>:
.*:	1ef50000 	fcvtmu	s0, h0
.*:	1ef5001f 	fcvtmu	s31, h0
.*:	1ef503e0 	fcvtmu	s0, h31
.*:	9e350000 	fcvtmu	d0, s0
.*:	9e35001f 	fcvtmu	d31, s0
.*:	9e3503e0 	fcvtmu	d0, s31
.*:	9ef50000 	fcvtmu	d0, h0
.*:	9ef5001f 	fcvtmu	d31, h0
.*:	9ef503e0 	fcvtmu	d0, h31
.*:	1e750000 	fcvtmu	s0, d0
.*:	1e75001f 	fcvtmu	s31, d0
.*:	1e7503e0 	fcvtmu	s0, d31

.* <e>:
.*:	1eea0000 	fcvtns	s0, h0
.*:	1eea001f 	fcvtns	s31, h0
.*:	1eea03e0 	fcvtns	s0, h31
.*:	9e2a0000 	fcvtns	d0, s0
.*:	9e2a001f 	fcvtns	d31, s0
.*:	9e2a03e0 	fcvtns	d0, s31
.*:	9eea0000 	fcvtns	d0, h0
.*:	9eea001f 	fcvtns	d31, h0
.*:	9eea03e0 	fcvtns	d0, h31
.*:	1e6a0000 	fcvtns	s0, d0
.*:	1e6a001f 	fcvtns	s31, d0
.*:	1e6a03e0 	fcvtns	s0, d31

.* <f>:
.*:	1eeb0000 	fcvtnu	s0, h0
.*:	1eeb001f 	fcvtnu	s31, h0
.*:	1eeb03e0 	fcvtnu	s0, h31
.*:	9e2b0000 	fcvtnu	d0, s0
.*:	9e2b001f 	fcvtnu	d31, s0
.*:	9e2b03e0 	fcvtnu	d0, s31
.*:	9eeb0000 	fcvtnu	d0, h0
.*:	9eeb001f 	fcvtnu	d31, h0
.*:	9eeb03e0 	fcvtnu	d0, h31
.*:	1e6b0000 	fcvtnu	s0, d0
.*:	1e6b001f 	fcvtnu	s31, d0
.*:	1e6b03e0 	fcvtnu	s0, d31

.* <g>:
.*:	1ef20000 	fcvtps	s0, h0
.*:	1ef2001f 	fcvtps	s31, h0
.*:	1ef203e0 	fcvtps	s0, h31
.*:	9e320000 	fcvtps	d0, s0
.*:	9e32001f 	fcvtps	d31, s0
.*:	9e3203e0 	fcvtps	d0, s31
.*:	9ef20000 	fcvtps	d0, h0
.*:	9ef2001f 	fcvtps	d31, h0
.*:	9ef203e0 	fcvtps	d0, h31
.*:	1e720000 	fcvtps	s0, d0
.*:	1e72001f 	fcvtps	s31, d0
.*:	1e7203e0 	fcvtps	s0, d31

.* <h>:
.*:	1ef30000 	fcvtpu	s0, h0
.*:	1ef3001f 	fcvtpu	s31, h0
.*:	1ef303e0 	fcvtpu	s0, h31
.*:	9e330000 	fcvtpu	d0, s0
.*:	9e33001f 	fcvtpu	d31, s0
.*:	9e3303e0 	fcvtpu	d0, s31
.*:	9ef30000 	fcvtpu	d0, h0
.*:	9ef3001f 	fcvtpu	d31, h0
.*:	9ef303e0 	fcvtpu	d0, h31
.*:	1e730000 	fcvtpu	s0, d0
.*:	1e73001f 	fcvtpu	s31, d0
.*:	1e7303e0 	fcvtpu	s0, d31

.* <i>:
.*:	1ef60000 	fcvtzs	s0, h0
.*:	1ef6001f 	fcvtzs	s31, h0
.*:	1ef603e0 	fcvtzs	s0, h31
.*:	9e360000 	fcvtzs	d0, s0
.*:	9e36001f 	fcvtzs	d31, s0
.*:	9e3603e0 	fcvtzs	d0, s31
.*:	9ef60000 	fcvtzs	d0, h0
.*:	9ef6001f 	fcvtzs	d31, h0
.*:	9ef603e0 	fcvtzs	d0, h31
.*:	1e760000 	fcvtzs	s0, d0
.*:	1e76001f 	fcvtzs	s31, d0
.*:	1e7603e0 	fcvtzs	s0, d31

.* <j>:
.*:	1ef70000 	fcvtzu	s0, h0
.*:	1ef7001f 	fcvtzu	s31, h0
.*:	1ef703e0 	fcvtzu	s0, h31
.*:	9e370000 	fcvtzu	d0, s0
.*:	9e37001f 	fcvtzu	d31, s0
.*:	9e3703e0 	fcvtzu	d0, s31
.*:	9ef70000 	fcvtzu	d0, h0
.*:	9ef7001f 	fcvtzu	d31, h0
.*:	9ef703e0 	fcvtzu	d0, h31
.*:	1e770000 	fcvtzu	s0, d0
.*:	1e77001f 	fcvtzu	s31, d0
.*:	1e7703e0 	fcvtzu	s0, d31

.* <k>:
.*:	1efc0000 	scvtf	h0, s0
.*:	1efc001f 	scvtf	h31, s0
.*:	1efc03e0 	scvtf	h0, s31
.*:	1e7c0000 	scvtf	d0, s0
.*:	1e7c001f 	scvtf	d31, s0
.*:	1e7c03e0 	scvtf	d0, s31
.*:	9efc0000 	scvtf	h0, d0
.*:	9efc001f 	scvtf	h31, d0
.*:	9efc03e0 	scvtf	h0, d31
.*:	9e3c0000 	scvtf	s0, d0
.*:	9e3c001f 	scvtf	s31, d0
.*:	9e3c03e0 	scvtf	s0, d31

.* <l>:
.*:	1efd0000 	ucvtf	h0, s0
.*:	1efd001f 	ucvtf	h31, s0
.*:	1efd03e0 	ucvtf	h0, s31
.*:	1e7d0000 	ucvtf	d0, s0
.*:	1e7d001f 	ucvtf	d31, s0
.*:	1e7d03e0 	ucvtf	d0, s31
.*:	9efd0000 	ucvtf	h0, d0
.*:	9efd001f 	ucvtf	h31, d0
.*:	9efd03e0 	ucvtf	h0, d31
.*:	9e3d0000 	ucvtf	s0, d0
.*:	9e3d001f 	ucvtf	s31, d0
.*:	9e3d03e0 	ucvtf	s0, d31

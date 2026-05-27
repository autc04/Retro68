#name: Test for FEAT_CMPBR
#as: -march=armv8-a+cmpbr
#as: -march=armv9.6-a
#objdump: -dr

.*:     file format .*

Disassembly of section .text:

.* <cbgt_0>:
.*:	75000000 	cbgt	w0, #0, 0 <cbgt_0>
.*:	75003fe0 	cbgt	w0, #0, 0 <cbgt_0>

.* <cbgt_1>:
.*:	751f8000 	cbgt	w0, #63, 8 <cbgt_1>
.*:	751fbfe0 	cbgt	w0, #63, 8 <cbgt_1>

.* <cbgt_2>:
.*:	7500001f 	cbgt	wzr, #0, 10 <cbgt_2>
.*:	75003fff 	cbgt	wzr, #0, 10 <cbgt_2>

.* <cbgt_3>:
.*:	751f801f 	cbgt	wzr, #63, 18 <cbgt_3>
.*:	751fbfff 	cbgt	wzr, #63, 18 <cbgt_3>

.* <cbgt_4>:
.*:	f5000000 	cbgt	x0, #0, 20 <cbgt_4>
.*:	f5003fe0 	cbgt	x0, #0, 20 <cbgt_4>

.* <cbgt_5>:
.*:	f51f8000 	cbgt	x0, #63, 28 <cbgt_5>
.*:	f51fbfe0 	cbgt	x0, #63, 28 <cbgt_5>

.* <cbgt_6>:
.*:	f500001f 	cbgt	xzr, #0, 30 <cbgt_6>
.*:	f5003fff 	cbgt	xzr, #0, 30 <cbgt_6>

.* <cbgt_7>:
.*:	f51f801f 	cbgt	xzr, #63, 38 <cbgt_7>
.*:	f51fbfff 	cbgt	xzr, #63, 38 <cbgt_7>

.* <cblt_0>:
.*:	75200000 	cblt	w0, #0, 40 <cblt_0>
.*:	75203fe0 	cblt	w0, #0, 40 <cblt_0>

.* <cblt_1>:
.*:	753f8000 	cblt	w0, #63, 48 <cblt_1>
.*:	753fbfe0 	cblt	w0, #63, 48 <cblt_1>

.* <cblt_2>:
.*:	7520001f 	cblt	wzr, #0, 50 <cblt_2>
.*:	75203fff 	cblt	wzr, #0, 50 <cblt_2>

.* <cblt_3>:
.*:	753f801f 	cblt	wzr, #63, 58 <cblt_3>
.*:	753fbfff 	cblt	wzr, #63, 58 <cblt_3>

.* <cblt_4>:
.*:	f5200000 	cblt	x0, #0, 60 <cblt_4>
.*:	f5203fe0 	cblt	x0, #0, 60 <cblt_4>

.* <cblt_5>:
.*:	f53f8000 	cblt	x0, #63, 68 <cblt_5>
.*:	f53fbfe0 	cblt	x0, #63, 68 <cblt_5>

.* <cblt_6>:
.*:	f520001f 	cblt	xzr, #0, 70 <cblt_6>
.*:	f5203fff 	cblt	xzr, #0, 70 <cblt_6>

.* <cblt_7>:
.*:	f53f801f 	cblt	xzr, #63, 78 <cblt_7>
.*:	f53fbfff 	cblt	xzr, #63, 78 <cblt_7>

.* <cbhi_0>:
.*:	75400000 	cbhi	w0, #0, 80 <cbhi_0>
.*:	75403fe0 	cbhi	w0, #0, 80 <cbhi_0>

.* <cbhi_1>:
.*:	755f8000 	cbhi	w0, #63, 88 <cbhi_1>
.*:	755fbfe0 	cbhi	w0, #63, 88 <cbhi_1>

.* <cbhi_2>:
.*:	7540001f 	cbhi	wzr, #0, 90 <cbhi_2>
.*:	75403fff 	cbhi	wzr, #0, 90 <cbhi_2>

.* <cbhi_3>:
.*:	755f801f 	cbhi	wzr, #63, 98 <cbhi_3>
.*:	755fbfff 	cbhi	wzr, #63, 98 <cbhi_3>

.* <cbhi_4>:
.*:	f5400000 	cbhi	x0, #0, a0 <cbhi_4>
.*:	f5403fe0 	cbhi	x0, #0, a0 <cbhi_4>

.* <cbhi_5>:
.*:	f55f8000 	cbhi	x0, #63, a8 <cbhi_5>
.*:	f55fbfe0 	cbhi	x0, #63, a8 <cbhi_5>

.* <cbhi_6>:
.*:	f540001f 	cbhi	xzr, #0, b0 <cbhi_6>
.*:	f5403fff 	cbhi	xzr, #0, b0 <cbhi_6>

.* <cbhi_7>:
.*:	f55f801f 	cbhi	xzr, #63, b8 <cbhi_7>
.*:	f55fbfff 	cbhi	xzr, #63, b8 <cbhi_7>

.* <cblo_0>:
.*:	75600000 	cblo	w0, #0, c0 <cblo_0>
.*:	75603fe0 	cblo	w0, #0, c0 <cblo_0>

.* <cblo_1>:
.*:	757f8000 	cblo	w0, #63, c8 <cblo_1>
.*:	757fbfe0 	cblo	w0, #63, c8 <cblo_1>

.* <cblo_2>:
.*:	7560001f 	cblo	wzr, #0, d0 <cblo_2>
.*:	75603fff 	cblo	wzr, #0, d0 <cblo_2>

.* <cblo_3>:
.*:	757f801f 	cblo	wzr, #63, d8 <cblo_3>
.*:	757fbfff 	cblo	wzr, #63, d8 <cblo_3>

.* <cblo_4>:
.*:	f5600000 	cblo	x0, #0, e0 <cblo_4>
.*:	f5603fe0 	cblo	x0, #0, e0 <cblo_4>

.* <cblo_5>:
.*:	f57f8000 	cblo	x0, #63, e8 <cblo_5>
.*:	f57fbfe0 	cblo	x0, #63, e8 <cblo_5>

.* <cblo_6>:
.*:	f560001f 	cblo	xzr, #0, f0 <cblo_6>
.*:	f5603fff 	cblo	xzr, #0, f0 <cblo_6>

.* <cblo_7>:
.*:	f57f801f 	cblo	xzr, #63, f8 <cblo_7>
.*:	f57fbfff 	cblo	xzr, #63, f8 <cblo_7>

.* <cbeq_0>:
.*:	75c00000 	cbeq	w0, #0, 100 <cbeq_0>
.*:	75c03fe0 	cbeq	w0, #0, 100 <cbeq_0>

.* <cbeq_1>:
.*:	75df8000 	cbeq	w0, #63, 108 <cbeq_1>
.*:	75dfbfe0 	cbeq	w0, #63, 108 <cbeq_1>

.* <cbeq_2>:
.*:	75c0001f 	cbeq	wzr, #0, 110 <cbeq_2>
.*:	75c03fff 	cbeq	wzr, #0, 110 <cbeq_2>

.* <cbeq_3>:
.*:	75df801f 	cbeq	wzr, #63, 118 <cbeq_3>
.*:	75dfbfff 	cbeq	wzr, #63, 118 <cbeq_3>

.* <cbeq_4>:
.*:	f5c00000 	cbeq	x0, #0, 120 <cbeq_4>
.*:	f5c03fe0 	cbeq	x0, #0, 120 <cbeq_4>

.* <cbeq_5>:
.*:	f5df8000 	cbeq	x0, #63, 128 <cbeq_5>
.*:	f5dfbfe0 	cbeq	x0, #63, 128 <cbeq_5>

.* <cbeq_6>:
.*:	f5c0001f 	cbeq	xzr, #0, 130 <cbeq_6>
.*:	f5c03fff 	cbeq	xzr, #0, 130 <cbeq_6>

.* <cbeq_7>:
.*:	f5df801f 	cbeq	xzr, #63, 138 <cbeq_7>
.*:	f5dfbfff 	cbeq	xzr, #63, 138 <cbeq_7>

.* <cbne_0>:
.*:	75e00000 	cbne	w0, #0, 140 <cbne_0>
.*:	75e03fe0 	cbne	w0, #0, 140 <cbne_0>

.* <cbne_1>:
.*:	75ff8000 	cbne	w0, #63, 148 <cbne_1>
.*:	75ffbfe0 	cbne	w0, #63, 148 <cbne_1>

.* <cbne_2>:
.*:	75e0001f 	cbne	wzr, #0, 150 <cbne_2>
.*:	75e03fff 	cbne	wzr, #0, 150 <cbne_2>

.* <cbne_3>:
.*:	75ff801f 	cbne	wzr, #63, 158 <cbne_3>
.*:	75ffbfff 	cbne	wzr, #63, 158 <cbne_3>

.* <cbne_4>:
.*:	f5e00000 	cbne	x0, #0, 160 <cbne_4>
.*:	f5e03fe0 	cbne	x0, #0, 160 <cbne_4>

.* <cbne_5>:
.*:	f5ff8000 	cbne	x0, #63, 168 <cbne_5>
.*:	f5ffbfe0 	cbne	x0, #63, 168 <cbne_5>

.* <cbne_6>:
.*:	f5e0001f 	cbne	xzr, #0, 170 <cbne_6>
.*:	f5e03fff 	cbne	xzr, #0, 170 <cbne_6>

.* <cbne_7>:
.*:	f5ff801f 	cbne	xzr, #63, 178 <cbne_7>
.*:	f5ffbfff 	cbne	xzr, #63, 178 <cbne_7>

.* <cbgt_8>:
.*:	74000000 	cbgt	w0, w0, 180 <cbgt_8>
.*:	74003fe0 	cbgt	w0, w0, 180 <cbgt_8>

.* <cbgt_9>:
.*:	741f0000 	cbgt	w0, wzr, 188 <cbgt_9>
.*:	741f3fe0 	cbgt	w0, wzr, 188 <cbgt_9>

.* <cbgt_10>:
.*:	7400001f 	cbgt	wzr, w0, 190 <cbgt_10>
.*:	74003fff 	cbgt	wzr, w0, 190 <cbgt_10>

.* <cbgt_11>:
.*:	741f001f 	cbgt	wzr, wzr, 198 <cbgt_11>
.*:	741f3fff 	cbgt	wzr, wzr, 198 <cbgt_11>

.* <cbgt_12>:
.*:	f4000000 	cbgt	x0, x0, 1a0 <cbgt_12>
.*:	f4003fe0 	cbgt	x0, x0, 1a0 <cbgt_12>

.* <cbgt_13>:
.*:	f41f0000 	cbgt	x0, xzr, 1a8 <cbgt_13>
.*:	f41f3fe0 	cbgt	x0, xzr, 1a8 <cbgt_13>

.* <cbgt_14>:
.*:	f400001f 	cbgt	xzr, x0, 1b0 <cbgt_14>
.*:	f4003fff 	cbgt	xzr, x0, 1b0 <cbgt_14>

.* <cbgt_15>:
.*:	f41f001f 	cbgt	xzr, xzr, 1b8 <cbgt_15>
.*:	f41f3fff 	cbgt	xzr, xzr, 1b8 <cbgt_15>

.* <cbge_8>:
.*:	74200000 	cbge	w0, w0, 1c0 <cbge_8>
.*:	74203fe0 	cbge	w0, w0, 1c0 <cbge_8>

.* <cbge_9>:
.*:	743f0000 	cbge	w0, wzr, 1c8 <cbge_9>
.*:	743f3fe0 	cbge	w0, wzr, 1c8 <cbge_9>

.* <cbge_10>:
.*:	7420001f 	cbge	wzr, w0, 1d0 <cbge_10>
.*:	74203fff 	cbge	wzr, w0, 1d0 <cbge_10>

.* <cbge_11>:
.*:	743f001f 	cbge	wzr, wzr, 1d8 <cbge_11>
.*:	743f3fff 	cbge	wzr, wzr, 1d8 <cbge_11>

.* <cbge_12>:
.*:	f4200000 	cbge	x0, x0, 1e0 <cbge_12>
.*:	f4203fe0 	cbge	x0, x0, 1e0 <cbge_12>

.* <cbge_13>:
.*:	f43f0000 	cbge	x0, xzr, 1e8 <cbge_13>
.*:	f43f3fe0 	cbge	x0, xzr, 1e8 <cbge_13>

.* <cbge_14>:
.*:	f420001f 	cbge	xzr, x0, 1f0 <cbge_14>
.*:	f4203fff 	cbge	xzr, x0, 1f0 <cbge_14>

.* <cbge_15>:
.*:	f43f001f 	cbge	xzr, xzr, 1f8 <cbge_15>
.*:	f43f3fff 	cbge	xzr, xzr, 1f8 <cbge_15>

.* <cbhi_8>:
.*:	74400000 	cbhi	w0, w0, 200 <cbhi_8>
.*:	74403fe0 	cbhi	w0, w0, 200 <cbhi_8>

.* <cbhi_9>:
.*:	745f0000 	cbhi	w0, wzr, 208 <cbhi_9>
.*:	745f3fe0 	cbhi	w0, wzr, 208 <cbhi_9>

.* <cbhi_10>:
.*:	7440001f 	cbhi	wzr, w0, 210 <cbhi_10>
.*:	74403fff 	cbhi	wzr, w0, 210 <cbhi_10>

.* <cbhi_11>:
.*:	745f001f 	cbhi	wzr, wzr, 218 <cbhi_11>
.*:	745f3fff 	cbhi	wzr, wzr, 218 <cbhi_11>

.* <cbhi_12>:
.*:	f4400000 	cbhi	x0, x0, 220 <cbhi_12>
.*:	f4403fe0 	cbhi	x0, x0, 220 <cbhi_12>

.* <cbhi_13>:
.*:	f45f0000 	cbhi	x0, xzr, 228 <cbhi_13>
.*:	f45f3fe0 	cbhi	x0, xzr, 228 <cbhi_13>

.* <cbhi_14>:
.*:	f440001f 	cbhi	xzr, x0, 230 <cbhi_14>
.*:	f4403fff 	cbhi	xzr, x0, 230 <cbhi_14>

.* <cbhi_15>:
.*:	f45f001f 	cbhi	xzr, xzr, 238 <cbhi_15>
.*:	f45f3fff 	cbhi	xzr, xzr, 238 <cbhi_15>

.* <cbhs_8>:
.*:	74600000 	cbhs	w0, w0, 240 <cbhs_8>
.*:	74603fe0 	cbhs	w0, w0, 240 <cbhs_8>

.* <cbhs_9>:
.*:	747f0000 	cbhs	w0, wzr, 248 <cbhs_9>
.*:	747f3fe0 	cbhs	w0, wzr, 248 <cbhs_9>

.* <cbhs_10>:
.*:	7460001f 	cbhs	wzr, w0, 250 <cbhs_10>
.*:	74603fff 	cbhs	wzr, w0, 250 <cbhs_10>

.* <cbhs_11>:
.*:	747f001f 	cbhs	wzr, wzr, 258 <cbhs_11>
.*:	747f3fff 	cbhs	wzr, wzr, 258 <cbhs_11>

.* <cbhs_12>:
.*:	f4600000 	cbhs	x0, x0, 260 <cbhs_12>
.*:	f4603fe0 	cbhs	x0, x0, 260 <cbhs_12>

.* <cbhs_13>:
.*:	f47f0000 	cbhs	x0, xzr, 268 <cbhs_13>
.*:	f47f3fe0 	cbhs	x0, xzr, 268 <cbhs_13>

.* <cbhs_14>:
.*:	f460001f 	cbhs	xzr, x0, 270 <cbhs_14>
.*:	f4603fff 	cbhs	xzr, x0, 270 <cbhs_14>

.* <cbhs_15>:
.*:	f47f001f 	cbhs	xzr, xzr, 278 <cbhs_15>
.*:	f47f3fff 	cbhs	xzr, xzr, 278 <cbhs_15>

.* <cbeq_8>:
.*:	74c00000 	cbeq	w0, w0, 280 <cbeq_8>
.*:	74c03fe0 	cbeq	w0, w0, 280 <cbeq_8>

.* <cbeq_9>:
.*:	74df0000 	cbeq	w0, wzr, 288 <cbeq_9>
.*:	74df3fe0 	cbeq	w0, wzr, 288 <cbeq_9>

.* <cbeq_10>:
.*:	74c0001f 	cbeq	wzr, w0, 290 <cbeq_10>
.*:	74c03fff 	cbeq	wzr, w0, 290 <cbeq_10>

.* <cbeq_11>:
.*:	74df001f 	cbeq	wzr, wzr, 298 <cbeq_11>
.*:	74df3fff 	cbeq	wzr, wzr, 298 <cbeq_11>

.* <cbeq_12>:
.*:	f4c00000 	cbeq	x0, x0, 2a0 <cbeq_12>
.*:	f4c03fe0 	cbeq	x0, x0, 2a0 <cbeq_12>

.* <cbeq_13>:
.*:	f4df0000 	cbeq	x0, xzr, 2a8 <cbeq_13>
.*:	f4df3fe0 	cbeq	x0, xzr, 2a8 <cbeq_13>

.* <cbeq_14>:
.*:	f4c0001f 	cbeq	xzr, x0, 2b0 <cbeq_14>
.*:	f4c03fff 	cbeq	xzr, x0, 2b0 <cbeq_14>

.* <cbeq_15>:
.*:	f4df001f 	cbeq	xzr, xzr, 2b8 <cbeq_15>
.*:	f4df3fff 	cbeq	xzr, xzr, 2b8 <cbeq_15>

.* <cbne_8>:
.*:	74e00000 	cbne	w0, w0, 2c0 <cbne_8>
.*:	74e03fe0 	cbne	w0, w0, 2c0 <cbne_8>

.* <cbne_9>:
.*:	74ff0000 	cbne	w0, wzr, 2c8 <cbne_9>
.*:	74ff3fe0 	cbne	w0, wzr, 2c8 <cbne_9>

.* <cbne_10>:
.*:	74e0001f 	cbne	wzr, w0, 2d0 <cbne_10>
.*:	74e03fff 	cbne	wzr, w0, 2d0 <cbne_10>

.* <cbne_11>:
.*:	74ff001f 	cbne	wzr, wzr, 2d8 <cbne_11>
.*:	74ff3fff 	cbne	wzr, wzr, 2d8 <cbne_11>

.* <cbne_12>:
.*:	f4e00000 	cbne	x0, x0, 2e0 <cbne_12>
.*:	f4e03fe0 	cbne	x0, x0, 2e0 <cbne_12>

.* <cbne_13>:
.*:	f4ff0000 	cbne	x0, xzr, 2e8 <cbne_13>
.*:	f4ff3fe0 	cbne	x0, xzr, 2e8 <cbne_13>

.* <cbne_14>:
.*:	f4e0001f 	cbne	xzr, x0, 2f0 <cbne_14>
.*:	f4e03fff 	cbne	xzr, x0, 2f0 <cbne_14>

.* <cbne_15>:
.*:	f4ff001f 	cbne	xzr, xzr, 2f8 <cbne_15>
.*:	f4ff3fff 	cbne	xzr, xzr, 2f8 <cbne_15>

.* <cbbgt_0>:
.*:	74008000 	cbbgt	w0, w0, 300 <cbbgt_0>
.*:	7400bfe0 	cbbgt	w0, w0, 300 <cbbgt_0>

.* <cbbgt_1>:
.*:	741f8000 	cbbgt	w0, wzr, 308 <cbbgt_1>
.*:	741fbfe0 	cbbgt	w0, wzr, 308 <cbbgt_1>

.* <cbbgt_2>:
.*:	7400801f 	cbbgt	wzr, w0, 310 <cbbgt_2>
.*:	7400bfff 	cbbgt	wzr, w0, 310 <cbbgt_2>

.* <cbbgt_3>:
.*:	741f801f 	cbbgt	wzr, wzr, 318 <cbbgt_3>
.*:	741fbfff 	cbbgt	wzr, wzr, 318 <cbbgt_3>

.* <cbbge_0>:
.*:	74208000 	cbbge	w0, w0, 320 <cbbge_0>
.*:	7420bfe0 	cbbge	w0, w0, 320 <cbbge_0>

.* <cbbge_1>:
.*:	743f8000 	cbbge	w0, wzr, 328 <cbbge_1>
.*:	743fbfe0 	cbbge	w0, wzr, 328 <cbbge_1>

.* <cbbge_2>:
.*:	7420801f 	cbbge	wzr, w0, 330 <cbbge_2>
.*:	7420bfff 	cbbge	wzr, w0, 330 <cbbge_2>

.* <cbbge_3>:
.*:	743f801f 	cbbge	wzr, wzr, 338 <cbbge_3>
.*:	743fbfff 	cbbge	wzr, wzr, 338 <cbbge_3>

.* <cbbhi_0>:
.*:	74408000 	cbbhi	w0, w0, 340 <cbbhi_0>
.*:	7440bfe0 	cbbhi	w0, w0, 340 <cbbhi_0>

.* <cbbhi_1>:
.*:	745f8000 	cbbhi	w0, wzr, 348 <cbbhi_1>
.*:	745fbfe0 	cbbhi	w0, wzr, 348 <cbbhi_1>

.* <cbbhi_2>:
.*:	7440801f 	cbbhi	wzr, w0, 350 <cbbhi_2>
.*:	7440bfff 	cbbhi	wzr, w0, 350 <cbbhi_2>

.* <cbbhi_3>:
.*:	745f801f 	cbbhi	wzr, wzr, 358 <cbbhi_3>
.*:	745fbfff 	cbbhi	wzr, wzr, 358 <cbbhi_3>

.* <cbbhs_0>:
.*:	74608000 	cbbhs	w0, w0, 360 <cbbhs_0>
.*:	7460bfe0 	cbbhs	w0, w0, 360 <cbbhs_0>

.* <cbbhs_1>:
.*:	747f8000 	cbbhs	w0, wzr, 368 <cbbhs_1>
.*:	747fbfe0 	cbbhs	w0, wzr, 368 <cbbhs_1>

.* <cbbhs_2>:
.*:	7460801f 	cbbhs	wzr, w0, 370 <cbbhs_2>
.*:	7460bfff 	cbbhs	wzr, w0, 370 <cbbhs_2>

.* <cbbhs_3>:
.*:	747f801f 	cbbhs	wzr, wzr, 378 <cbbhs_3>
.*:	747fbfff 	cbbhs	wzr, wzr, 378 <cbbhs_3>

.* <cbbeq_0>:
.*:	74c08000 	cbbeq	w0, w0, 380 <cbbeq_0>
.*:	74c0bfe0 	cbbeq	w0, w0, 380 <cbbeq_0>

.* <cbbeq_1>:
.*:	74df8000 	cbbeq	w0, wzr, 388 <cbbeq_1>
.*:	74dfbfe0 	cbbeq	w0, wzr, 388 <cbbeq_1>

.* <cbbeq_2>:
.*:	74c0801f 	cbbeq	wzr, w0, 390 <cbbeq_2>
.*:	74c0bfff 	cbbeq	wzr, w0, 390 <cbbeq_2>

.* <cbbeq_3>:
.*:	74df801f 	cbbeq	wzr, wzr, 398 <cbbeq_3>
.*:	74dfbfff 	cbbeq	wzr, wzr, 398 <cbbeq_3>

.* <cbbne_0>:
.*:	74e08000 	cbbne	w0, w0, 3a0 <cbbne_0>
.*:	74e0bfe0 	cbbne	w0, w0, 3a0 <cbbne_0>

.* <cbbne_1>:
.*:	74ff8000 	cbbne	w0, wzr, 3a8 <cbbne_1>
.*:	74ffbfe0 	cbbne	w0, wzr, 3a8 <cbbne_1>

.* <cbbne_2>:
.*:	74e0801f 	cbbne	wzr, w0, 3b0 <cbbne_2>
.*:	74e0bfff 	cbbne	wzr, w0, 3b0 <cbbne_2>

.* <cbbne_3>:
.*:	74ff801f 	cbbne	wzr, wzr, 3b8 <cbbne_3>
.*:	74ffbfff 	cbbne	wzr, wzr, 3b8 <cbbne_3>

.* <cbhgt_0>:
.*:	7400c000 	cbhgt	w0, w0, 3c0 <cbhgt_0>
.*:	7400ffe0 	cbhgt	w0, w0, 3c0 <cbhgt_0>

.* <cbhgt_1>:
.*:	741fc000 	cbhgt	w0, wzr, 3c8 <cbhgt_1>
.*:	741fffe0 	cbhgt	w0, wzr, 3c8 <cbhgt_1>

.* <cbhgt_2>:
.*:	7400c01f 	cbhgt	wzr, w0, 3d0 <cbhgt_2>
.*:	7400ffff 	cbhgt	wzr, w0, 3d0 <cbhgt_2>

.* <cbhgt_3>:
.*:	741fc01f 	cbhgt	wzr, wzr, 3d8 <cbhgt_3>
.*:	741fffff 	cbhgt	wzr, wzr, 3d8 <cbhgt_3>

.* <cbhge_0>:
.*:	7420c000 	cbhge	w0, w0, 3e0 <cbhge_0>
.*:	7420ffe0 	cbhge	w0, w0, 3e0 <cbhge_0>

.* <cbhge_1>:
.*:	743fc000 	cbhge	w0, wzr, 3e8 <cbhge_1>
.*:	743fffe0 	cbhge	w0, wzr, 3e8 <cbhge_1>

.* <cbhge_2>:
.*:	7420c01f 	cbhge	wzr, w0, 3f0 <cbhge_2>
.*:	7420ffff 	cbhge	wzr, w0, 3f0 <cbhge_2>

.* <cbhge_3>:
.*:	743fc01f 	cbhge	wzr, wzr, 3f8 <cbhge_3>
.*:	743fffff 	cbhge	wzr, wzr, 3f8 <cbhge_3>

.* <cbhhi_0>:
.*:	7440c000 	cbhhi	w0, w0, 400 <cbhhi_0>
.*:	7440ffe0 	cbhhi	w0, w0, 400 <cbhhi_0>

.* <cbhhi_1>:
.*:	745fc000 	cbhhi	w0, wzr, 408 <cbhhi_1>
.*:	745fffe0 	cbhhi	w0, wzr, 408 <cbhhi_1>

.* <cbhhi_2>:
.*:	7440c01f 	cbhhi	wzr, w0, 410 <cbhhi_2>
.*:	7440ffff 	cbhhi	wzr, w0, 410 <cbhhi_2>

.* <cbhhi_3>:
.*:	745fc01f 	cbhhi	wzr, wzr, 418 <cbhhi_3>
.*:	745fffff 	cbhhi	wzr, wzr, 418 <cbhhi_3>

.* <cbhhs_0>:
.*:	7460c000 	cbhhs	w0, w0, 420 <cbhhs_0>
.*:	7460ffe0 	cbhhs	w0, w0, 420 <cbhhs_0>

.* <cbhhs_1>:
.*:	747fc000 	cbhhs	w0, wzr, 428 <cbhhs_1>
.*:	747fffe0 	cbhhs	w0, wzr, 428 <cbhhs_1>

.* <cbhhs_2>:
.*:	7460c01f 	cbhhs	wzr, w0, 430 <cbhhs_2>
.*:	7460ffff 	cbhhs	wzr, w0, 430 <cbhhs_2>

.* <cbhhs_3>:
.*:	747fc01f 	cbhhs	wzr, wzr, 438 <cbhhs_3>
.*:	747fffff 	cbhhs	wzr, wzr, 438 <cbhhs_3>

.* <cbheq_0>:
.*:	74c0c000 	cbheq	w0, w0, 440 <cbheq_0>
.*:	74c0ffe0 	cbheq	w0, w0, 440 <cbheq_0>

.* <cbheq_1>:
.*:	74dfc000 	cbheq	w0, wzr, 448 <cbheq_1>
.*:	74dfffe0 	cbheq	w0, wzr, 448 <cbheq_1>

.* <cbheq_2>:
.*:	74c0c01f 	cbheq	wzr, w0, 450 <cbheq_2>
.*:	74c0ffff 	cbheq	wzr, w0, 450 <cbheq_2>

.* <cbheq_3>:
.*:	74dfc01f 	cbheq	wzr, wzr, 458 <cbheq_3>
.*:	74dfffff 	cbheq	wzr, wzr, 458 <cbheq_3>

.* <cbhne_0>:
.*:	74e0c000 	cbhne	w0, w0, 460 <cbhne_0>
.*:	74e0ffe0 	cbhne	w0, w0, 460 <cbhne_0>

.* <cbhne_1>:
.*:	74ffc000 	cbhne	w0, wzr, 468 <cbhne_1>
.*:	74ffffe0 	cbhne	w0, wzr, 468 <cbhne_1>

.* <cbhne_2>:
.*:	74e0c01f 	cbhne	wzr, w0, 470 <cbhne_2>
.*:	74e0ffff 	cbhne	wzr, w0, 470 <cbhne_2>

.* <cbhne_3>:
.*:	74ffc01f 	cbhne	wzr, wzr, 478 <cbhne_3>
.*:	74ffffff 	cbhne	wzr, wzr, 478 <cbhne_3>

.* <cbge_0>:
.*:	75000000 	cbgt	w0, #0, 480 <cbge_0>
.*:	75003fe0 	cbgt	w0, #0, 480 <cbge_0>

.* <cbge_1>:
.*:	751f8000 	cbgt	w0, #63, 488 <cbge_1>
.*:	751fbfe0 	cbgt	w0, #63, 488 <cbge_1>

.* <cbge_2>:
.*:	7500001f 	cbgt	wzr, #0, 490 <cbge_2>
.*:	75003fff 	cbgt	wzr, #0, 490 <cbge_2>

.* <cbge_3>:
.*:	751f801f 	cbgt	wzr, #63, 498 <cbge_3>
.*:	751fbfff 	cbgt	wzr, #63, 498 <cbge_3>

.* <cbge_4>:
.*:	f5000000 	cbgt	x0, #0, 4a0 <cbge_4>
.*:	f5003fe0 	cbgt	x0, #0, 4a0 <cbge_4>

.* <cbge_5>:
.*:	f51f8000 	cbgt	x0, #63, 4a8 <cbge_5>
.*:	f51fbfe0 	cbgt	x0, #63, 4a8 <cbge_5>

.* <cbge_6>:
.*:	f500001f 	cbgt	xzr, #0, 4b0 <cbge_6>
.*:	f5003fff 	cbgt	xzr, #0, 4b0 <cbge_6>

.* <cbge_7>:
.*:	f51f801f 	cbgt	xzr, #63, 4b8 <cbge_7>
.*:	f51fbfff 	cbgt	xzr, #63, 4b8 <cbge_7>

.* <cble_0>:
.*:	75200000 	cblt	w0, #0, 4c0 <cble_0>
.*:	75203fe0 	cblt	w0, #0, 4c0 <cble_0>

.* <cble_1>:
.*:	753f8000 	cblt	w0, #63, 4c8 <cble_1>
.*:	753fbfe0 	cblt	w0, #63, 4c8 <cble_1>

.* <cble_2>:
.*:	7520001f 	cblt	wzr, #0, 4d0 <cble_2>
.*:	75203fff 	cblt	wzr, #0, 4d0 <cble_2>

.* <cble_3>:
.*:	753f801f 	cblt	wzr, #63, 4d8 <cble_3>
.*:	753fbfff 	cblt	wzr, #63, 4d8 <cble_3>

.* <cble_4>:
.*:	f5200000 	cblt	x0, #0, 4e0 <cble_4>
.*:	f5203fe0 	cblt	x0, #0, 4e0 <cble_4>

.* <cble_5>:
.*:	f53f8000 	cblt	x0, #63, 4e8 <cble_5>
.*:	f53fbfe0 	cblt	x0, #63, 4e8 <cble_5>

.* <cble_6>:
.*:	f520001f 	cblt	xzr, #0, 4f0 <cble_6>
.*:	f5203fff 	cblt	xzr, #0, 4f0 <cble_6>

.* <cble_7>:
.*:	f53f801f 	cblt	xzr, #63, 4f8 <cble_7>
.*:	f53fbfff 	cblt	xzr, #63, 4f8 <cble_7>

.* <cbhs_0>:
.*:	75400000 	cbhi	w0, #0, 500 <cbhs_0>
.*:	75403fe0 	cbhi	w0, #0, 500 <cbhs_0>

.* <cbhs_1>:
.*:	755f8000 	cbhi	w0, #63, 508 <cbhs_1>
.*:	755fbfe0 	cbhi	w0, #63, 508 <cbhs_1>

.* <cbhs_2>:
.*:	7540001f 	cbhi	wzr, #0, 510 <cbhs_2>
.*:	75403fff 	cbhi	wzr, #0, 510 <cbhs_2>

.* <cbhs_3>:
.*:	755f801f 	cbhi	wzr, #63, 518 <cbhs_3>
.*:	755fbfff 	cbhi	wzr, #63, 518 <cbhs_3>

.* <cbhs_4>:
.*:	f5400000 	cbhi	x0, #0, 520 <cbhs_4>
.*:	f5403fe0 	cbhi	x0, #0, 520 <cbhs_4>

.* <cbhs_5>:
.*:	f55f8000 	cbhi	x0, #63, 528 <cbhs_5>
.*:	f55fbfe0 	cbhi	x0, #63, 528 <cbhs_5>

.* <cbhs_6>:
.*:	f540001f 	cbhi	xzr, #0, 530 <cbhs_6>
.*:	f5403fff 	cbhi	xzr, #0, 530 <cbhs_6>

.* <cbhs_7>:
.*:	f55f801f 	cbhi	xzr, #63, 538 <cbhs_7>
.*:	f55fbfff 	cbhi	xzr, #63, 538 <cbhs_7>

.* <cbls_0>:
.*:	75600000 	cblo	w0, #0, 540 <cbls_0>
.*:	75603fe0 	cblo	w0, #0, 540 <cbls_0>

.* <cbls_1>:
.*:	757f8000 	cblo	w0, #63, 548 <cbls_1>
.*:	757fbfe0 	cblo	w0, #63, 548 <cbls_1>

.* <cbls_2>:
.*:	7560001f 	cblo	wzr, #0, 550 <cbls_2>
.*:	75603fff 	cblo	wzr, #0, 550 <cbls_2>

.* <cbls_3>:
.*:	757f801f 	cblo	wzr, #63, 558 <cbls_3>
.*:	757fbfff 	cblo	wzr, #63, 558 <cbls_3>

.* <cbls_4>:
.*:	f5600000 	cblo	x0, #0, 560 <cbls_4>
.*:	f5603fe0 	cblo	x0, #0, 560 <cbls_4>

.* <cbls_5>:
.*:	f57f8000 	cblo	x0, #63, 568 <cbls_5>
.*:	f57fbfe0 	cblo	x0, #63, 568 <cbls_5>

.* <cbls_6>:
.*:	f560001f 	cblo	xzr, #0, 570 <cbls_6>
.*:	f5603fff 	cblo	xzr, #0, 570 <cbls_6>

.* <cbls_7>:
.*:	f57f801f 	cblo	xzr, #63, 578 <cbls_7>
.*:	f57fbfff 	cblo	xzr, #63, 578 <cbls_7>

.* <cblt_8>:
.*:	74000000 	cbgt	w0, w0, 580 <cblt_8>
.*:	74003fe0 	cbgt	w0, w0, 580 <cblt_8>

.* <cblt_9>:
.*:	7400001f 	cbgt	wzr, w0, 588 <cblt_9>
.*:	74003fff 	cbgt	wzr, w0, 588 <cblt_9>

.* <cblt_10>:
.*:	741f0000 	cbgt	w0, wzr, 590 <cblt_10>
.*:	741f3fe0 	cbgt	w0, wzr, 590 <cblt_10>

.* <cblt_11>:
.*:	741f001f 	cbgt	wzr, wzr, 598 <cblt_11>
.*:	741f3fff 	cbgt	wzr, wzr, 598 <cblt_11>

.* <cblt_12>:
.*:	f4000000 	cbgt	x0, x0, 5a0 <cblt_12>
.*:	f4003fe0 	cbgt	x0, x0, 5a0 <cblt_12>

.* <cblt_13>:
.*:	f400001f 	cbgt	xzr, x0, 5a8 <cblt_13>
.*:	f4003fff 	cbgt	xzr, x0, 5a8 <cblt_13>

.* <cblt_14>:
.*:	f41f0000 	cbgt	x0, xzr, 5b0 <cblt_14>
.*:	f41f3fe0 	cbgt	x0, xzr, 5b0 <cblt_14>

.* <cblt_15>:
.*:	f41f001f 	cbgt	xzr, xzr, 5b8 <cblt_15>
.*:	f41f3fff 	cbgt	xzr, xzr, 5b8 <cblt_15>

.* <cble_8>:
.*:	74200000 	cbge	w0, w0, 5c0 <cble_8>
.*:	74203fe0 	cbge	w0, w0, 5c0 <cble_8>

.* <cble_9>:
.*:	7420001f 	cbge	wzr, w0, 5c8 <cble_9>
.*:	74203fff 	cbge	wzr, w0, 5c8 <cble_9>

.* <cble_10>:
.*:	743f0000 	cbge	w0, wzr, 5d0 <cble_10>
.*:	743f3fe0 	cbge	w0, wzr, 5d0 <cble_10>

.* <cble_11>:
.*:	743f001f 	cbge	wzr, wzr, 5d8 <cble_11>
.*:	743f3fff 	cbge	wzr, wzr, 5d8 <cble_11>

.* <cble_12>:
.*:	f4200000 	cbge	x0, x0, 5e0 <cble_12>
.*:	f4203fe0 	cbge	x0, x0, 5e0 <cble_12>

.* <cble_13>:
.*:	f420001f 	cbge	xzr, x0, 5e8 <cble_13>
.*:	f4203fff 	cbge	xzr, x0, 5e8 <cble_13>

.* <cble_14>:
.*:	f43f0000 	cbge	x0, xzr, 5f0 <cble_14>
.*:	f43f3fe0 	cbge	x0, xzr, 5f0 <cble_14>

.* <cble_15>:
.*:	f43f001f 	cbge	xzr, xzr, 5f8 <cble_15>
.*:	f43f3fff 	cbge	xzr, xzr, 5f8 <cble_15>

.* <cblo_8>:
.*:	74400000 	cbhi	w0, w0, 600 <cblo_8>
.*:	74403fe0 	cbhi	w0, w0, 600 <cblo_8>

.* <cblo_9>:
.*:	7440001f 	cbhi	wzr, w0, 608 <cblo_9>
.*:	74403fff 	cbhi	wzr, w0, 608 <cblo_9>

.* <cblo_10>:
.*:	745f0000 	cbhi	w0, wzr, 610 <cblo_10>
.*:	745f3fe0 	cbhi	w0, wzr, 610 <cblo_10>

.* <cblo_11>:
.*:	745f001f 	cbhi	wzr, wzr, 618 <cblo_11>
.*:	745f3fff 	cbhi	wzr, wzr, 618 <cblo_11>

.* <cblo_12>:
.*:	f4400000 	cbhi	x0, x0, 620 <cblo_12>
.*:	f4403fe0 	cbhi	x0, x0, 620 <cblo_12>

.* <cblo_13>:
.*:	f440001f 	cbhi	xzr, x0, 628 <cblo_13>
.*:	f4403fff 	cbhi	xzr, x0, 628 <cblo_13>

.* <cblo_14>:
.*:	f45f0000 	cbhi	x0, xzr, 630 <cblo_14>
.*:	f45f3fe0 	cbhi	x0, xzr, 630 <cblo_14>

.* <cblo_15>:
.*:	f45f001f 	cbhi	xzr, xzr, 638 <cblo_15>
.*:	f45f3fff 	cbhi	xzr, xzr, 638 <cblo_15>

.* <cbls_8>:
.*:	74600000 	cbhs	w0, w0, 640 <cbls_8>
.*:	74603fe0 	cbhs	w0, w0, 640 <cbls_8>

.* <cbls_9>:
.*:	7460001f 	cbhs	wzr, w0, 648 <cbls_9>
.*:	74603fff 	cbhs	wzr, w0, 648 <cbls_9>

.* <cbls_10>:
.*:	747f0000 	cbhs	w0, wzr, 650 <cbls_10>
.*:	747f3fe0 	cbhs	w0, wzr, 650 <cbls_10>

.* <cbls_11>:
.*:	747f001f 	cbhs	wzr, wzr, 658 <cbls_11>
.*:	747f3fff 	cbhs	wzr, wzr, 658 <cbls_11>

.* <cbls_12>:
.*:	f4600000 	cbhs	x0, x0, 660 <cbls_12>
.*:	f4603fe0 	cbhs	x0, x0, 660 <cbls_12>

.* <cbls_13>:
.*:	f460001f 	cbhs	xzr, x0, 668 <cbls_13>
.*:	f4603fff 	cbhs	xzr, x0, 668 <cbls_13>

.* <cbls_14>:
.*:	f47f0000 	cbhs	x0, xzr, 670 <cbls_14>
.*:	f47f3fe0 	cbhs	x0, xzr, 670 <cbls_14>

.* <cbls_15>:
.*:	f47f001f 	cbhs	xzr, xzr, 678 <cbls_15>
.*:	f47f3fff 	cbhs	xzr, xzr, 678 <cbls_15>

.* <cbblt_0>:
.*:	74008000 	cbbgt	w0, w0, 680 <cbblt_0>
.*:	7400bfe0 	cbbgt	w0, w0, 680 <cbblt_0>

.* <cbblt_1>:
.*:	7400801f 	cbbgt	wzr, w0, 688 <cbblt_1>
.*:	7400bfff 	cbbgt	wzr, w0, 688 <cbblt_1>

.* <cbblt_2>:
.*:	741f8000 	cbbgt	w0, wzr, 690 <cbblt_2>
.*:	741fbfe0 	cbbgt	w0, wzr, 690 <cbblt_2>

.* <cbblt_3>:
.*:	741f801f 	cbbgt	wzr, wzr, 698 <cbblt_3>
.*:	741fbfff 	cbbgt	wzr, wzr, 698 <cbblt_3>

.* <cbble_0>:
.*:	74208000 	cbbge	w0, w0, 6a0 <cbble_0>
.*:	7420bfe0 	cbbge	w0, w0, 6a0 <cbble_0>

.* <cbble_1>:
.*:	7420801f 	cbbge	wzr, w0, 6a8 <cbble_1>
.*:	7420bfff 	cbbge	wzr, w0, 6a8 <cbble_1>

.* <cbble_2>:
.*:	743f8000 	cbbge	w0, wzr, 6b0 <cbble_2>
.*:	743fbfe0 	cbbge	w0, wzr, 6b0 <cbble_2>

.* <cbble_3>:
.*:	743f801f 	cbbge	wzr, wzr, 6b8 <cbble_3>
.*:	743fbfff 	cbbge	wzr, wzr, 6b8 <cbble_3>

.* <cbblo_0>:
.*:	74408000 	cbbhi	w0, w0, 6c0 <cbblo_0>
.*:	7440bfe0 	cbbhi	w0, w0, 6c0 <cbblo_0>

.* <cbblo_1>:
.*:	7440801f 	cbbhi	wzr, w0, 6c8 <cbblo_1>
.*:	7440bfff 	cbbhi	wzr, w0, 6c8 <cbblo_1>

.* <cbblo_2>:
.*:	745f8000 	cbbhi	w0, wzr, 6d0 <cbblo_2>
.*:	745fbfe0 	cbbhi	w0, wzr, 6d0 <cbblo_2>

.* <cbblo_3>:
.*:	745f801f 	cbbhi	wzr, wzr, 6d8 <cbblo_3>
.*:	745fbfff 	cbbhi	wzr, wzr, 6d8 <cbblo_3>

.* <cbbls_0>:
.*:	74608000 	cbbhs	w0, w0, 6e0 <cbbls_0>
.*:	7460bfe0 	cbbhs	w0, w0, 6e0 <cbbls_0>

.* <cbbls_1>:
.*:	7460801f 	cbbhs	wzr, w0, 6e8 <cbbls_1>
.*:	7460bfff 	cbbhs	wzr, w0, 6e8 <cbbls_1>

.* <cbbls_2>:
.*:	747f8000 	cbbhs	w0, wzr, 6f0 <cbbls_2>
.*:	747fbfe0 	cbbhs	w0, wzr, 6f0 <cbbls_2>

.* <cbbls_3>:
.*:	747f801f 	cbbhs	wzr, wzr, 6f8 <cbbls_3>
.*:	747fbfff 	cbbhs	wzr, wzr, 6f8 <cbbls_3>

.* <cbhlt_0>:
.*:	7400c000 	cbhgt	w0, w0, 700 <cbhlt_0>
.*:	7400ffe0 	cbhgt	w0, w0, 700 <cbhlt_0>

.* <cbhlt_1>:
.*:	7400c01f 	cbhgt	wzr, w0, 708 <cbhlt_1>
.*:	7400ffff 	cbhgt	wzr, w0, 708 <cbhlt_1>

.* <cbhlt_2>:
.*:	741fc000 	cbhgt	w0, wzr, 710 <cbhlt_2>
.*:	741fffe0 	cbhgt	w0, wzr, 710 <cbhlt_2>

.* <cbhlt_3>:
.*:	741fc01f 	cbhgt	wzr, wzr, 718 <cbhlt_3>
.*:	741fffff 	cbhgt	wzr, wzr, 718 <cbhlt_3>

.* <cbhle_0>:
.*:	7420c000 	cbhge	w0, w0, 720 <cbhle_0>
.*:	7420ffe0 	cbhge	w0, w0, 720 <cbhle_0>

.* <cbhle_1>:
.*:	7420c01f 	cbhge	wzr, w0, 728 <cbhle_1>
.*:	7420ffff 	cbhge	wzr, w0, 728 <cbhle_1>

.* <cbhle_2>:
.*:	743fc000 	cbhge	w0, wzr, 730 <cbhle_2>
.*:	743fffe0 	cbhge	w0, wzr, 730 <cbhle_2>

.* <cbhle_3>:
.*:	743fc01f 	cbhge	wzr, wzr, 738 <cbhle_3>
.*:	743fffff 	cbhge	wzr, wzr, 738 <cbhle_3>

.* <cbhlo_0>:
.*:	7440c000 	cbhhi	w0, w0, 740 <cbhlo_0>
.*:	7440ffe0 	cbhhi	w0, w0, 740 <cbhlo_0>

.* <cbhlo_1>:
.*:	7440c01f 	cbhhi	wzr, w0, 748 <cbhlo_1>
.*:	7440ffff 	cbhhi	wzr, w0, 748 <cbhlo_1>

.* <cbhlo_2>:
.*:	745fc000 	cbhhi	w0, wzr, 750 <cbhlo_2>
.*:	745fffe0 	cbhhi	w0, wzr, 750 <cbhlo_2>

.* <cbhlo_3>:
.*:	745fc01f 	cbhhi	wzr, wzr, 758 <cbhlo_3>
.*:	745fffff 	cbhhi	wzr, wzr, 758 <cbhlo_3>

.* <cbhls_0>:
.*:	7460c000 	cbhhs	w0, w0, 760 <cbhls_0>
.*:	7460ffe0 	cbhhs	w0, w0, 760 <cbhls_0>

.* <cbhls_1>:
.*:	7460c01f 	cbhhs	wzr, w0, 768 <cbhls_1>
.*:	7460ffff 	cbhhs	wzr, w0, 768 <cbhls_1>

.* <cbhls_2>:
.*:	747fc000 	cbhhs	w0, wzr, 770 <cbhls_2>
.*:	747fffe0 	cbhhs	w0, wzr, 770 <cbhls_2>

.* <cbhls_3>:
.*:	747fc01f 	cbhhs	wzr, wzr, 778 <cbhls_3>
.*:	747fffff 	cbhhs	wzr, wzr, 778 <cbhls_3>

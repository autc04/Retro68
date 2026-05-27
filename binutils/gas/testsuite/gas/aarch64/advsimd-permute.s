	ext	v0.8b, v0.8b, v0.8b, #0
	ext	v31.8b, v0.8b, v0.8b, #0
	ext	v0.8b, v31.8b, v0.8b, #0
	ext	v0.8b, v0.8b, v31.8b, #0
	ext	v0.8b, v0.8b, v0.8b, #7
	ext	v0.16b, v0.16b, v0.16b, #0
	ext	v31.16b, v0.16b, v0.16b, #0
	ext	v0.16b, v31.16b, v0.16b, #0
	ext	v0.16b, v0.16b, v31.16b, #0
	ext	v0.16b, v0.16b, v0.16b, #15

	uzp1	v0.8b, v0.8b, v0.8b
	uzp1	v31.8b, v0.8b, v0.8b
	uzp1	v0.8b, v31.8b, v0.8b
	uzp1	v0.8b, v0.8b, v31.8b
	uzp1	v0.4h, v0.4h, v0.4h
	uzp1	v31.4h, v0.4h, v0.4h
	uzp1	v0.4h, v31.4h, v0.4h
	uzp1	v0.4h, v0.4h, v31.4h
	uzp1	v0.2s, v0.2s, v0.2s
	uzp1	v31.2s, v0.2s, v0.2s
	uzp1	v0.2s, v31.2s, v0.2s
	uzp1	v0.2s, v0.2s, v31.2s
	uzp1	v0.16b, v0.16b, v0.16b
	uzp1	v31.16b, v0.16b, v0.16b
	uzp1	v0.16b, v31.16b, v0.16b
	uzp1	v0.16b, v0.16b, v31.16b
	uzp1	v0.8h, v0.8h, v0.8h
	uzp1	v31.8h, v0.8h, v0.8h
	uzp1	v0.8h, v31.8h, v0.8h
	uzp1	v0.8h, v0.8h, v31.8h
	uzp1	v0.4s, v0.4s, v0.4s
	uzp1	v31.4s, v0.4s, v0.4s
	uzp1	v0.4s, v31.4s, v0.4s
	uzp1	v0.4s, v0.4s, v31.4s
	uzp1	v0.2d, v0.2d, v0.2d
	uzp1	v31.2d, v0.2d, v0.2d
	uzp1	v0.2d, v31.2d, v0.2d
	uzp1	v0.2d, v0.2d, v31.2d

	trn1	v0.8b, v0.8b, v0.8b
	trn1	v31.8b, v0.8b, v0.8b
	trn1	v0.8b, v31.8b, v0.8b
	trn1	v0.8b, v0.8b, v31.8b
	trn1	v0.4h, v0.4h, v0.4h
	trn1	v31.4h, v0.4h, v0.4h
	trn1	v0.4h, v31.4h, v0.4h
	trn1	v0.4h, v0.4h, v31.4h
	trn1	v0.2s, v0.2s, v0.2s
	trn1	v31.2s, v0.2s, v0.2s
	trn1	v0.2s, v31.2s, v0.2s
	trn1	v0.2s, v0.2s, v31.2s
	trn1	v0.16b, v0.16b, v0.16b
	trn1	v31.16b, v0.16b, v0.16b
	trn1	v0.16b, v31.16b, v0.16b
	trn1	v0.16b, v0.16b, v31.16b
	trn1	v0.8h, v0.8h, v0.8h
	trn1	v31.8h, v0.8h, v0.8h
	trn1	v0.8h, v31.8h, v0.8h
	trn1	v0.8h, v0.8h, v31.8h
	trn1	v0.4s, v0.4s, v0.4s
	trn1	v31.4s, v0.4s, v0.4s
	trn1	v0.4s, v31.4s, v0.4s
	trn1	v0.4s, v0.4s, v31.4s
	trn1	v0.2d, v0.2d, v0.2d
	trn1	v31.2d, v0.2d, v0.2d
	trn1	v0.2d, v31.2d, v0.2d
	trn1	v0.2d, v0.2d, v31.2d

	zip1	v0.8b, v0.8b, v0.8b
	zip1	v31.8b, v0.8b, v0.8b
	zip1	v0.8b, v31.8b, v0.8b
	zip1	v0.8b, v0.8b, v31.8b
	zip1	v0.4h, v0.4h, v0.4h
	zip1	v31.4h, v0.4h, v0.4h
	zip1	v0.4h, v31.4h, v0.4h
	zip1	v0.4h, v0.4h, v31.4h
	zip1	v0.2s, v0.2s, v0.2s
	zip1	v31.2s, v0.2s, v0.2s
	zip1	v0.2s, v31.2s, v0.2s
	zip1	v0.2s, v0.2s, v31.2s
	zip1	v0.16b, v0.16b, v0.16b
	zip1	v31.16b, v0.16b, v0.16b
	zip1	v0.16b, v31.16b, v0.16b
	zip1	v0.16b, v0.16b, v31.16b
	zip1	v0.8h, v0.8h, v0.8h
	zip1	v31.8h, v0.8h, v0.8h
	zip1	v0.8h, v31.8h, v0.8h
	zip1	v0.8h, v0.8h, v31.8h
	zip1	v0.4s, v0.4s, v0.4s
	zip1	v31.4s, v0.4s, v0.4s
	zip1	v0.4s, v31.4s, v0.4s
	zip1	v0.4s, v0.4s, v31.4s
	zip1	v0.2d, v0.2d, v0.2d
	zip1	v31.2d, v0.2d, v0.2d
	zip1	v0.2d, v31.2d, v0.2d
	zip1	v0.2d, v0.2d, v31.2d

	uzp2	v0.8b, v0.8b, v0.8b
	uzp2	v31.8b, v0.8b, v0.8b
	uzp2	v0.8b, v31.8b, v0.8b
	uzp2	v0.8b, v0.8b, v31.8b
	uzp2	v0.4h, v0.4h, v0.4h
	uzp2	v31.4h, v0.4h, v0.4h
	uzp2	v0.4h, v31.4h, v0.4h
	uzp2	v0.4h, v0.4h, v31.4h
	uzp2	v0.2s, v0.2s, v0.2s
	uzp2	v31.2s, v0.2s, v0.2s
	uzp2	v0.2s, v31.2s, v0.2s
	uzp2	v0.2s, v0.2s, v31.2s
	uzp2	v0.16b, v0.16b, v0.16b
	uzp2	v31.16b, v0.16b, v0.16b
	uzp2	v0.16b, v31.16b, v0.16b
	uzp2	v0.16b, v0.16b, v31.16b
	uzp2	v0.8h, v0.8h, v0.8h
	uzp2	v31.8h, v0.8h, v0.8h
	uzp2	v0.8h, v31.8h, v0.8h
	uzp2	v0.8h, v0.8h, v31.8h
	uzp2	v0.4s, v0.4s, v0.4s
	uzp2	v31.4s, v0.4s, v0.4s
	uzp2	v0.4s, v31.4s, v0.4s
	uzp2	v0.4s, v0.4s, v31.4s
	uzp2	v0.2d, v0.2d, v0.2d
	uzp2	v31.2d, v0.2d, v0.2d
	uzp2	v0.2d, v31.2d, v0.2d
	uzp2	v0.2d, v0.2d, v31.2d

	trn2	v0.8b, v0.8b, v0.8b
	trn2	v31.8b, v0.8b, v0.8b
	trn2	v0.8b, v31.8b, v0.8b
	trn2	v0.8b, v0.8b, v31.8b
	trn2	v0.4h, v0.4h, v0.4h
	trn2	v31.4h, v0.4h, v0.4h
	trn2	v0.4h, v31.4h, v0.4h
	trn2	v0.4h, v0.4h, v31.4h
	trn2	v0.2s, v0.2s, v0.2s
	trn2	v31.2s, v0.2s, v0.2s
	trn2	v0.2s, v31.2s, v0.2s
	trn2	v0.2s, v0.2s, v31.2s
	trn2	v0.16b, v0.16b, v0.16b
	trn2	v31.16b, v0.16b, v0.16b
	trn2	v0.16b, v31.16b, v0.16b
	trn2	v0.16b, v0.16b, v31.16b
	trn2	v0.8h, v0.8h, v0.8h
	trn2	v31.8h, v0.8h, v0.8h
	trn2	v0.8h, v31.8h, v0.8h
	trn2	v0.8h, v0.8h, v31.8h
	trn2	v0.4s, v0.4s, v0.4s
	trn2	v31.4s, v0.4s, v0.4s
	trn2	v0.4s, v31.4s, v0.4s
	trn2	v0.4s, v0.4s, v31.4s
	trn2	v0.2d, v0.2d, v0.2d
	trn2	v31.2d, v0.2d, v0.2d
	trn2	v0.2d, v31.2d, v0.2d
	trn2	v0.2d, v0.2d, v31.2d

	zip2	v0.8b, v0.8b, v0.8b
	zip2	v31.8b, v0.8b, v0.8b
	zip2	v0.8b, v31.8b, v0.8b
	zip2	v0.8b, v0.8b, v31.8b
	zip2	v0.4h, v0.4h, v0.4h
	zip2	v31.4h, v0.4h, v0.4h
	zip2	v0.4h, v31.4h, v0.4h
	zip2	v0.4h, v0.4h, v31.4h
	zip2	v0.2s, v0.2s, v0.2s
	zip2	v31.2s, v0.2s, v0.2s
	zip2	v0.2s, v31.2s, v0.2s
	zip2	v0.2s, v0.2s, v31.2s
	zip2	v0.16b, v0.16b, v0.16b
	zip2	v31.16b, v0.16b, v0.16b
	zip2	v0.16b, v31.16b, v0.16b
	zip2	v0.16b, v0.16b, v31.16b
	zip2	v0.8h, v0.8h, v0.8h
	zip2	v31.8h, v0.8h, v0.8h
	zip2	v0.8h, v31.8h, v0.8h
	zip2	v0.8h, v0.8h, v31.8h
	zip2	v0.4s, v0.4s, v0.4s
	zip2	v31.4s, v0.4s, v0.4s
	zip2	v0.4s, v31.4s, v0.4s
	zip2	v0.4s, v0.4s, v31.4s
	zip2	v0.2d, v0.2d, v0.2d
	zip2	v31.2d, v0.2d, v0.2d
	zip2	v0.2d, v31.2d, v0.2d
	zip2	v0.2d, v0.2d, v31.2d

	tbl	v0.8b, {v0.16b}, v0.8b
	tbl	v31.8b, {v0.16b}, v0.8b
	tbl	v0.8b, {v31.16b}, v0.8b
	tbl	v0.8b, {v0.16b}, v31.8b
	tbl	v0.16b, {v0.16b}, v0.16b
	tbl	v31.16b, {v0.16b}, v0.16b
	tbl	v0.16b, {v31.16b}, v0.16b
	tbl	v0.16b, {v0.16b}, v31.16b
	tbl	v0.8b, {v0.16b, v1.16b}, v0.8b
	tbl	v31.8b, {v0.16b, v1.16b}, v0.8b
	tbl	v0.8b, {v31.16b, v0.16b}, v0.8b
	tbl	v0.8b, {v0.16b, v1.16b}, v31.8b
	tbl	v0.16b, {v0.16b, v1.16b}, v0.16b
	tbl	v31.16b, {v0.16b, v1.16b}, v0.16b
	tbl	v0.16b, {v31.16b, v0.16b}, v0.16b
	tbl	v0.16b, {v0.16b, v1.16b}, v31.16b
	tbl	v0.8b, {v0.16b, v1.16b, v2.16b}, v0.8b
	tbl	v31.8b, {v0.16b, v1.16b, v2.16b}, v0.8b
	tbl	v0.8b, {v31.16b, v0.16b, v1.16b}, v0.8b
	tbl	v0.8b, {v0.16b, v1.16b, v2.16b}, v31.8b
	tbl	v0.16b, {v0.16b, v1.16b, v2.16b}, v0.16b
	tbl	v31.16b, {v0.16b, v1.16b, v2.16b}, v0.16b
	tbl	v0.16b, {v31.16b, v0.16b, v1.16b}, v0.16b
	tbl	v0.16b, {v0.16b, v1.16b, v2.16b}, v31.16b
	tbl	v0.8b, {v0.16b, v1.16b, v2.16b, v3.16b}, v0.8b
	tbl	v31.8b, {v0.16b, v1.16b, v2.16b, v3.16b}, v0.8b
	tbl	v0.8b, {v31.16b, v0.16b, v1.16b, v2.16b}, v0.8b
	tbl	v0.8b, {v0.16b, v1.16b, v2.16b, v3.16b}, v31.8b
	tbl	v0.16b, {v0.16b, v1.16b, v2.16b, v3.16b}, v0.16b
	tbl	v31.16b, {v0.16b, v1.16b, v2.16b, v3.16b}, v0.16b
	tbl	v0.16b, {v31.16b, v0.16b, v1.16b, v2.16b}, v0.16b
	tbl	v0.16b, {v0.16b, v1.16b, v2.16b, v3.16b}, v31.16b

	tbx	v0.8b, {v0.16b}, v0.8b
	tbx	v31.8b, {v0.16b}, v0.8b
	tbx	v0.8b, {v31.16b}, v0.8b
	tbx	v0.8b, {v0.16b}, v31.8b
	tbx	v0.16b, {v0.16b}, v0.16b
	tbx	v31.16b, {v0.16b}, v0.16b
	tbx	v0.16b, {v31.16b}, v0.16b
	tbx	v0.16b, {v0.16b}, v31.16b
	tbx	v0.8b, {v0.16b, v1.16b}, v0.8b
	tbx	v31.8b, {v0.16b, v1.16b}, v0.8b
	tbx	v0.8b, {v31.16b, v0.16b}, v0.8b
	tbx	v0.8b, {v0.16b, v1.16b}, v31.8b
	tbx	v0.16b, {v0.16b, v1.16b}, v0.16b
	tbx	v31.16b, {v0.16b, v1.16b}, v0.16b
	tbx	v0.16b, {v31.16b, v0.16b}, v0.16b
	tbx	v0.16b, {v0.16b, v1.16b}, v31.16b
	tbx	v0.8b, {v0.16b, v1.16b, v2.16b}, v0.8b
	tbx	v31.8b, {v0.16b, v1.16b, v2.16b}, v0.8b
	tbx	v0.8b, {v31.16b, v0.16b, v1.16b}, v0.8b
	tbx	v0.8b, {v0.16b, v1.16b, v2.16b}, v31.8b
	tbx	v0.16b, {v0.16b, v1.16b, v2.16b}, v0.16b
	tbx	v31.16b, {v0.16b, v1.16b, v2.16b}, v0.16b
	tbx	v0.16b, {v31.16b, v0.16b, v1.16b}, v0.16b
	tbx	v0.16b, {v0.16b, v1.16b, v2.16b}, v31.16b
	tbx	v0.8b, {v0.16b, v1.16b, v2.16b, v3.16b}, v0.8b
	tbx	v31.8b, {v0.16b, v1.16b, v2.16b, v3.16b}, v0.8b
	tbx	v0.8b, {v31.16b, v0.16b, v1.16b, v2.16b}, v0.8b
	tbx	v0.8b, {v0.16b, v1.16b, v2.16b, v3.16b}, v31.8b
	tbx	v0.16b, {v0.16b, v1.16b, v2.16b, v3.16b}, v0.16b
	tbx	v31.16b, {v0.16b, v1.16b, v2.16b, v3.16b}, v0.16b
	tbx	v0.16b, {v31.16b, v0.16b, v1.16b, v2.16b}, v0.16b
	tbx	v0.16b, {v0.16b, v1.16b, v2.16b, v3.16b}, v31.16b

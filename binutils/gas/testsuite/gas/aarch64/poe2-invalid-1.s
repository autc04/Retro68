#TCHANGEF (register) instructions
	tchangef x0, x31
	tchangef x31, x3
	tchangef x7
	tchangef x15, x30,
	tchangef x30, x0, x10
	tchangef x10 x0
	tchangef #1, #100
	tchangef #10, x0

#TCHANGEF (register) instructions with not_balanced
	tchangef x0, x1, nbb
	tchangef x1, x3 nb
	tchangef x3, x7, n
	tchangef x7, x15, nb, nb
	tchangef x10, NB, NB
	tchangef NB, x10, NB

#TCHANGEF (immediate) instructions
	tchangef x0, #-10
	tchangef x0, #128
	tchangef x1, #3111
	tchangef x3, #
	tchangef x31, #15
	tchangef x10, nb, #127

#TCHANGEF (immediate) instructions with not_balanced
	tchangef x0, #-10, nb
	tchangef x3, #777, nb
	tchangef x7, #15, nbb
	tchangef x15, #31 NB
	tchangef x31, #63, nb
	tchangef NB, x10, #127
	tchangef x10, NB, #128

#TCHANGEB (register) instructions
	tchangeb x0, x31
	tchangeb x31, x3
	tchangeb x7
	tchangeb x15, x30,
	tchangeb x30, x0, x10
	tchangeb x10 x0
	tchangeb #1, #100
	tchangeb #10, x0

#TCHANGEB (register) instructions with not_balanced
	tchangeb x0, x1, nbb
	tchangeb x1, x3 nb
	tchangeb x3, x7, n
	tchangeb x7, x15, nb, nb
	tchangeb x10, NB, NB
	tchangeb NB, x10, NB

#TCHANGEB (immediate) instructions
	tchangeb x0, #-10
	tchangeb x0, #128
	tchangeb x1, #3111
	tchangeb x3, #
	tchangeb x31, #15
	tchangeb x10, nb, #127

#TCHANGEB (immediate) instructions with not_balanced
	tchangeb x0, #-10, nb
	tchangeb x3, #777, nb
	tchangeb x7, #15, nbb
	tchangeb x15, #31 NB
	tchangeb x31, #63, nb
	tchangeb NB, x10, #127
	tchangeb x10, NB, #128

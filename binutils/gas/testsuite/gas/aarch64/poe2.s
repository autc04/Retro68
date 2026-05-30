#TCHANGEF (register) instructions
	tchangef x0, x1
	tchangef xzr, x0
	tchangef x1, xzr

#TCHANGEF (register) instructions with not_balanced
	tchangef x0, x1, nb
	tchangef xzr, x0, Nb
	tchangef x0, xzr, nB
	tchangef x0, x15, NB

#TCHANGEF (immediate) instructions
	tchangef x0, #0
	tchangef xzr, #1
	tchangef x10, #127

#TCHANGEF (immediate) instructions with not_balanced
	tchangef x0, #0, nb
	tchangef xzr, #1, NB
	tchangef x30, #63, nB
	tchangef x10, #127, Nb

#TCHANGEB (register) instructions
	tchangeb x0, x1
	tchangeb xzr, x0
	tchangeb x0, xzr

#TCHANGEB (register) instructions with not_balanced
	tchangeb x0, x1, nb
	tchangeb xzr, x0, Nb
	tchangeb x0, xzr, nB
	tchangeb x0, x15, NB

#TCHANGEB (immediate) instructions
	tchangeb x0, #0
	tchangeb xzr, #1
	tchangeb x10, #127

#TCHANGEB (immediate) instructions with not_balanced
	tchangeb x0, #0, nb
	tchangeb xzr, #1, NB
	tchangeb x30, #63, nB
	tchangeb x15, #127, Nb

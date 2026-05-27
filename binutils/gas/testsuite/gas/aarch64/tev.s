#TENTER instruction
        tenter #0
        tenter #1
        tenter #3
        tenter #7
        tenter #15
        tenter #31
        tenter #63
	tenter #127

#TENTER  instruction with not_balanced
        tenter #0, nb
        tenter #1, nb
        tenter #3, nb
        tenter #7, nb
        tenter #15, nb
        tenter #31, NB
        tenter #63, nb
	tenter #127, NB

#TEXIT instruction
	texit

#TEXIT instruction with not_balanced
	texit nb
	texit NB
	texit nB
	texit Nb

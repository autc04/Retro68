#TENTER instructions
        tenter #-10
        tenter #128
        tenter #3111
        tenter #777
	tenter nb, #127

#TENTER instructions with not_balanced
        tenter  #-10, nb
        tenter  #777, nb
        tenter  #15, nbb
        tenter  #15, nb,nb
        tenter  #31 NB
	tenter  x10, #127
	tenter  NB, #128

#TEXIT instructions
	texit x0
	texit #10
	texit n
	texit nN
	texit x0, nb

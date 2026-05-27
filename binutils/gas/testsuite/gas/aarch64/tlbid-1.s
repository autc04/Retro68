	tlbi 	alle1is
	tlbi 	vmalle1is
	tlbi 	alle1is
	tlbi 	vmalle1is

	.arch armv8-a+tlbid
	tlbi 	alle1is, x0
	tlbi 	alle2is, x0
	tlbi 	vmalle1is, x0
	tlbi 	vmalls12e1is, x0
	tlbi 	alle1is, x30
	tlbi 	alle2is, x30
	tlbi 	vmalle1is, x30
	tlbi 	vmalls12e1is, x30

	.arch armv9.4-a+tlbid
	tlbi 	alle1os, x0
	tlbi 	alle2os, x0
	tlbi 	vmalle1os, x0
	tlbi 	vmalls12e1os, x0
	tlbi 	vmallws2e1is, x0
	tlbi 	vmallws2e1os, x0
	tlbi 	alle1os, x30
	tlbi 	alle2os, x30
	tlbi 	vmalle1os, x30
	tlbi 	vmalls12e1os, x30
	tlbi 	vmallws2e1is, x30
	tlbi 	vmallws2e1os, x30

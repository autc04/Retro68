	bfmop4a	za0.s, z1.h, z16.h
	fmop4a	za0.s, z15.h, z16.h
	bfmop4a	za0.s, z16.h, { z16.h-z17.h }
	fmop4a	za0.s, z17.h, { z16.h-z17.h }
	bfmop4a	za0.s, { z1.h-z2.h }, z16.h
	fmop4a	za0.s, { z15.h-z16.h }, z16.h
	bfmop4a	za0.s, { z16.h-z17.h }, { z16.h-z17.h }
	fmop4a	za0.s, { z17.h-z18.h }, { z16.h-z17.h }
	smop4a	za0.s, z0.h, z14.h
	smop4a	za0.s, z0.b, z15.b
	umop4a	za0.s, { z0.h-z1.h }, z17.h
	smop4a	za0.s, z0.h, { z14.h-z15.h }
	smop4a	za0.s, z0.b, { z15.b-z16.b }
	umop4a	za0.s, { z0.h-z1.h }, { z17.h-z18.h }

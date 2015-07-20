type 'CODE' (0) {
	longint; // size above A5
	longint; // size of application globals
	longint = (jtend - jtstart) / 8; // size of jump table
	longint; // a5 offset of jump tabe
jtstart:
	array {
		integer;	// offset
		integer = 0x3f3c;
		integer;	// segment
		integer = 0xa9f0;
	};
jtend:
	;
};

#define RETRO68_CODE_TYPE	\
		hex string dontBreakAtEntry = $"", breakAtEntry = $"A9FF";	\
		longint = 0x61000002;	/* bsr *+2 */	\
	relativeTo:	\
		integer = 0x0697; /* addi.l #_, (a7) */ \
		longint = $$long(fltfile + 8*8) + (fltfile-relativeTo)/8;	\
		integer = 0x4e75; /* rts */	\
		longint = fltfile/8;	\
	fltfile:					\
		hex string;



type 'CODE' (1) {
	integer = 0;
	integer = 1;
	RETRO68_CODE_TYPE
};

#define RETRO68_JUMP_TABLE {	\
	0x28, 0, 0x20,				\
	{							\
		0, 1;					\
	};							\
}

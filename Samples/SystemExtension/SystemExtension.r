type 'INIT' (0) {
	hex string dontBreakAtEntry = $"", breakAtEntry = $"A9FF";
	longint = 0x61000002;	// bsr *+2
	integer = 0x0697; // addi.l #_, (a7)
	longint = $$long(fltfile + 8*8) + 8;
	integer = 0x4e75; // rts
fltfile:
	hex string;
};

resource 'INIT' (0) {
	dontBreakAtEntry, $$read("SystemExtension.flt");
};

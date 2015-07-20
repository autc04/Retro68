type 'INIT' {
	hex string dontBreakAtEntry = $"", breakAtEntry = $"A9FF";
	longint = 0x61000002;	// bsr *+2
relativeTo:
	integer = 0x0697; // addi.l #_, (a7)
	longint = $$long(fltfile + 8*8) + (fltfile-relativeTo)/8;
	integer = 0x4e75; // rts
	longint = fltfile/8;
fltfile:
	hex string;
};

resource 'INIT' (128) {
	dontBreakAtEntry, $$read("SystemExtension.flt");
};

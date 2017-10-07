SECTIONS {
    .foo : {
	PROVIDE (__start_scnfoo = .);
	*(scnfoo)
	PROVIDE (__stop_scnfoo = .);
    }
}

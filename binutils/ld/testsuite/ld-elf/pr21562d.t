SECTIONS {
	PROVIDE (__start_scnfoo = .);
	.foo : { *(scnfoo) }
	PROVIDE (__stop_scnfoo = .);
}

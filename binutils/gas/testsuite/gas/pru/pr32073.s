# Source file used to test the whitespace parsing.

foo:
	mov	r1 /* comment */, r2	/* ... */
	mov	r1	/* comment */, r2	/* ... */
	mov	/* x */ r1	/* comment */ , r2	/* ... */

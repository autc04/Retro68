/* Adapted from classicvirtio (https://github.com/elliotnunn/classicvirtio) */
/* Copyright (c) 2024 Elliot Nunn */
/* Licensed under the MIT license */

/*
Produce output that MakePEF turns into an "ndrv" driver

- The plethora of XCOFF sections are annotated with their x_smclas values
- A nasty DisposePtr bug is worked around by padding the data inside .data
- An ndrv is never memory mapped, so RO data is best put in the (compressible) .data
*/

SECTIONS {
	.text 0 : {
		*(.text) /* ELF section name */
		*(.pr) /* 0. RO program code */
		*(.gl) /* 6. RO global linkage */
	}

	/* .text and .data don't clash so no need for --no-check-sections */
	.data 0 : AT(0x80000000) {
		/* Work around a ROM bug: an errant DisposePtr on TheDriverDescription
		   by well-meaning ROM code can destroy our entire globals section,
		   so add a tiny offset.
		*/
		LONG(0);

		*(.ro) /* 1. RO constants */
		*(.db) /* 2. RO debug dictionary table */
		*(.tc) /* 3. RW general TOC entry */
		*(.ua) /* 4. RW unclassified */
		*(.rw) /* 5. RW data */
		*(.xo) /* 7. RO extended operation */
		*(.sv) /* 8. RO supervisor call descriptor */
		*(.ds) /* 10. RW descriptor csect */
		*(.ti) /* 12. RO traceback index csect */
		*(.tb) /* 13. RO traceback table csect */
		*(.tc0) /* 15. RW TOC anchor for addressability */
		*(.td) /* 16. RW data in TOC */
		*(.sv64) /* 17. RO 64 bit supervisor call */
		*(.sv3264) /* 18. RO 32 or 64 bit supervisor call */
	}
	.bss : {
		*(.tocbss) /* not sure where this one comes from */
		*(.bss) /* ELF section name */
		*(.bs) /* 9. RW BSS */
		*(.uc) /* 11. RW unnamed Fortran common */
		*(COMMON) /* traditional */
	}

	.loader : {
		*(.loader)
	}

	.debug : {
		*(.debug)
	}
}

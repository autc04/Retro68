/* RME Granule Protection Check 3 Extension.  */

	/* Read from system register.  */
	mrs x0, gpcbw_el3

	/* Write to system register.  */
	msr gpcbw_el3, x0

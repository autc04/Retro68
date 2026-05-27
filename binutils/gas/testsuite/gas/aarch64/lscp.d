#name: LSCP instructions
#as: -march=armv8-a+lscp
#objdump: -dr
#warning_output: lscp-warn.l

.*:     file format .*


Disassembly of section .*:

.* <a>:
.*:	d9405800 	ldap	x0, x0, \[x0\]
.*:	d940581f 	ldap	xzr, x0, \[x0\]
.*:	d95f5800 	ldap	x0, xzr, \[x0\]
.*:	d9405be0 	ldap	x0, x0, \[sp\]

.* <b>:
.*:	d9407800 	ldapp	x0, x0, \[x0\]
.*:	d940781f 	ldapp	xzr, x0, \[x0\]
.*:	d95f7800 	ldapp	x0, xzr, \[x0\]
.*:	d9407be0 	ldapp	x0, x0, \[sp\]

.* <c>:
.*:	d9005800 	stlp	x0, x0, \[x0\]
.*:	d900581f 	stlp	xzr, x0, \[x0\]
.*:	d91f5800 	stlp	x0, xzr, \[x0\]
.*:	d9005be0 	stlp	x0, x0, \[sp\]

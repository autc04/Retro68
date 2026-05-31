/* Load acquire and store release pair instructions.  */

a:
	ldap x0, x0, [x0]
	ldap xzr, x0, [x0]
	ldap x0, xzr, [x0]
	ldap x0, x0, [sp]

b:
	ldapp x0, x0, [x0]
	ldapp xzr, x0, [x0]
	ldapp x0, xzr, [x0]
	ldapp x0, x0, [sp]

c:
	stlp x0, x0, [x0]
	stlp xzr, x0, [x0]
	stlp x0, xzr, [x0]
	stlp x0, x0, [sp]

.set ATTR_TYPE_uleb128,   0
.set ATTR_TYPE_asciz,     1

.set SUBSEC_required,     0
.set SUBSEC_optional,     1

/* Integer literals.  */
.aeabi_subsection foo_01, 0, 0
.aeabi_subsection foo_02, 0, 1
.aeabi_subsection foo_03, 1, 0
.aeabi_subsection foo_04, 1, 1

/* Known identifiers.  */
.aeabi_subsection foo_05, required, uleb128
.aeabi_subsection foo_06, optional, ULEB128
.aeabi_subsection foo_07, optional, ntbs
.aeabi_subsection foo_08, required, NTBS

/* Symbol look-up.  */
.aeabi_subsection foo_09, SUBSEC_required, ATTR_TYPE_uleb128
.aeabi_subsection foo_10, SUBSEC_optional, ATTR_TYPE_asciz

/* Switch back to the section without specifying the comprehension and
   encoding. */
.aeabi_subsection foo_01
.aeabi_subsection foo_03

/* Switch back to the section without specifying the encoding. */
.aeabi_subsection foo_01, required
.aeabi_subsection foo_03, optional

/* Switch back to the section while specifying the comprehension and
   encoding. */
.aeabi_subsection foo_01, 0, 0
.aeabi_subsection foo_02, 0, 1
.aeabi_subsection foo_01, required, uleb128
.aeabi_subsection foo_02, required, ntbs

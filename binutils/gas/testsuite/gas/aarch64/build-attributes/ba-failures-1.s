.set ATTR_TYPE_uleb128,   0
.set ATTR_TYPE_asciz,     1

/* The definition of an attribute cannot appear before a subsection was
   declared.  */
.aeabi_attribute  1, 0

/* aeabi_attribute with the same key should have the same value in the same
   compilation unit.  */
.aeabi_subsection vendor_1_subsection_1, optional, uleb128
.aeabi_attribute  1, 0
.aeabi_attribute  1, 1

/* Only unsigned integer are allowed for attribute keys.  */
.aeabi_attribute  -1, 1
/* Unknown tag identifier.  */
.aeabi_attribute  Tag_Unknown, 1

/* Mismatch between the type expected from the subsection definition, and the
   type provided to the attribute directive.  */
.aeabi_attribute  2, -1
.aeabi_attribute  3, "foo"
.aeabi_subsection vendor_1_subsection_2, optional, ntbs
/* Mismatch between type of the value and the one expected by the subsection.  */
.aeabi_attribute  1, 1
/* aeabi_attribute with the same key should have the same value in the same
   compilation unit.  */
.aeabi_attribute  4, "ABC"
.aeabi_attribute  4, "DEF"

/* The comprehension and encoding cannot be omitted on the first declaration.  */
.aeabi_subsection vendor_1_subsection_3

/* Subsections with the same name should have the same parameters.  */
.aeabi_subsection vendor_1_subsection_3, required, ntbs
.aeabi_subsection vendor_1_subsection_3, optional, ntbs
.aeabi_subsection vendor_1_subsection_3, required, uleb128
.aeabi_subsection vendor_1_subsection_3, optional, uleb128

/* Omitted paramaters have to be omitted in the reverse order.  */
.aeabi_subsection vendor_1_subsection_3, ntbs
.aeabi_subsection vendor_1_subsection_3, uleb128

/* Invalid subsection name should raise an error.  */
.aeabi_subsection .vendor, optional, uleb128

/* Swap <optional> and <encoding>.  */
.aeabi_subsection vendor_1_subsection_4, uleb128, optional

/* Unknown identifier for <optional>, and <encoding>. */
.aeabi_subsection vendor_1_subsection_4, optial, uleb128
.aeabi_subsection vendor_1_subsection_4, optional, ul128

/* Invalid value for optional and format.  */
.aeabi_subsection vendor_1_subsection_4, 2, 1
.aeabi_subsection vendor_1_subsection_4, 1, 2

/* Wrong comma in the declaration of a subsection.  */
.aeabi_subsection vendor_1_subsection_4, , 1
.aeabi_subsection vendor_1_subsection_4, 1, 1, 1
.aeabi_subsection , vendor_1_subsection_4, 1
.aeabi_subsection vendor_1_subsection_4, 1 1

/* Wrong comma in the declaration of an attribute.  */
.aeabi_attribute 1, , 1
.aeabi_attribute 1, "dead", 1, 1
.aeabi_attribute , 1, 1
.aeabi_attribute 1, "beef" 1

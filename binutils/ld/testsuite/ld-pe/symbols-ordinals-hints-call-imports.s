.ifdef UNDERSCORE
 .global _func
_func:
  .dc.a __imp__sym1
  .dc.a __imp__sym2
  .dc.a __imp__sym3
  .dc.a __imp__sym4
  .dc.a __imp__sym5
.else
 .global func
func:
  .dc.a __imp_sym1
  .dc.a __imp_sym2
  .dc.a __imp_sym3
  .dc.a __imp_sym4
  .dc.a __imp_sym5
.endif

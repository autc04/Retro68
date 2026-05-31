# define symbols in no specific order
.ifdef UNDERSCORE
 .global _sym2
 .global _sym5
 .global _sym3
 .global _sym1
 .global _sym4
_sym2:
_sym5:
_sym3:
_sym1:
_sym4:
.else
 .global sym2
 .global sym5
 .global sym3
 .global sym1
 .global sym4
sym2:
sym5:
sym3:
sym1:
sym4:
.endif
 .nop

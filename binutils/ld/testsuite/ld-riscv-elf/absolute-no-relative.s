.text
.global _start
_start:
lga	x1, symbol_abs
lga	x1, __symbol_abs__

.global symbol_abs
.set symbol_abs, 0x100

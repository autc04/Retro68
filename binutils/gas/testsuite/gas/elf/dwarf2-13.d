#as:
#readelf: -x.rodata -wL
#name: DWARF2 13
# The am33 avr cr16 crx ft32 mn10 msp430 nds32 pru rl78 and xtensa targets do not evaluate the subtraction of symbols at assembly time.
# The riscv targets do not support the subtraction of symbols.
# The tile targets require 8-byte instructions, but the test only simulates 4-byte instructions.
#not-target: am3*-* avr-* cr16-* crx-* ft32*-* mn10*-* msp430-* nds32*-* pru-* riscv*-* rl78-* tile*-* xtensa-*

Hex dump of section '\.rodata':
  0x00000000 01 *.*

Contents of the \.debug_line section:

CU: dwarf2-13\.c:
File name  *Line number  *Starting address  *View
dwarf2-13\.c  *1  *0x4
dwarf2-13\.c  *2  *0x8
dwarf2-13\.c  *3  *0x8  *1
dwarf2-13\.c  *3  *0xc

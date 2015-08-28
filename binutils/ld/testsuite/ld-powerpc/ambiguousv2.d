#source: startv2.s
#source: funref.s
#as: -a64
#ld: -melf64ppc --emit-stub-syms
#ld_after_inputfiles: tmpdir/funv2.so
#readelf: -rs --wide
# Check that we do the right thing with funref.s that doesn't have
# anything to mark it as ELFv1 or ELFv2.  We should get a dynamic
# reloc on the function address, not have a global entry stub, and
# my_func should be undefined dynamic with value zero.
# FIXME someday: No need for a plt entry.

Relocation section .* contains 1 entries:
.*
.* R_PPC64_ADDR64 .* my_func \+ 0

Relocation section .* contains 1 entries:
.*
.* R_PPC64_JMP_SLOT .* my_func \+ 0

Symbol table '\.dynsym' contains 5 entries:
.*
     0: .*
     1: 0+00000000     0 FUNC    GLOBAL DEFAULT  UND my_func
     2: 0+10010508     0 NOTYPE  GLOBAL DEFAULT   12 __bss_start
     3: 0+10010508     0 NOTYPE  GLOBAL DEFAULT   11 _edata
     4: 0+10010520     0 NOTYPE  GLOBAL DEFAULT   12 _end

Symbol table '\.symtab' contains 21 entries:
.*
     0: .*
     1: 0+10000158     0 SECTION LOCAL  DEFAULT    1 
     2: 0+10000170     0 SECTION LOCAL  DEFAULT    2 
     3: 0+10000198     0 SECTION LOCAL  DEFAULT    3 
     4: 0+10000210     0 SECTION LOCAL  DEFAULT    4 
     5: 0+10000248     0 SECTION LOCAL  DEFAULT    5 
     6: 0+10000260     0 SECTION LOCAL  DEFAULT    6 
     7: 0+10000278     0 SECTION LOCAL  DEFAULT    7 
     8: 0+100002c4     0 SECTION LOCAL  DEFAULT    8 
     9: 0+100102c8     0 SECTION LOCAL  DEFAULT    9 
    10: 0+10010428     0 SECTION LOCAL  DEFAULT   10 
    11: 0+10010500     0 SECTION LOCAL  DEFAULT   11 
    12: 0+10010508     0 SECTION LOCAL  DEFAULT   12 
    13: 0+100102c8     0 OBJECT  LOCAL  DEFAULT    9 _DYNAMIC
    14: 0+10000288     0 NOTYPE  LOCAL  DEFAULT    7 __glink_PLTresolve
    15: 0+10010428     0 NOTYPE  GLOBAL DEFAULT   10 func_tab
    16: 0+00000000     0 FUNC    GLOBAL DEFAULT  UND my_func
    17: 0+10000278     0 NOTYPE  GLOBAL DEFAULT    7 _start
    18: 0+10010508     0 NOTYPE  GLOBAL DEFAULT   12 __bss_start
    19: 0+10010508     0 NOTYPE  GLOBAL DEFAULT   11 _edata
    20: 0+10010520     0 NOTYPE  GLOBAL DEFAULT   12 _end

#source: startv2.s
#source: funref2.s
#as: -a64
#ld: -melf64ppc --emit-stub-syms
#ld_after_inputfiles: tmpdir/funv2.so
#readelf: -rs --wide
# Check that we do the right thing with funref2.s that doesn't have
# anything to mark it as ELFv1 or ELFv2.  Since my_func address is
# taken in a read-only section we should get a plt entry, a global
# entry stub, and my_func should be undefined dynamic with non-zero
# value.

Relocation section .* contains 1 entries:
.*
.* R_PPC64_JMP_SLOT .* my_func \+ 0

Symbol table '\.dynsym' contains 5 entries:
.*
     0: .*
     1: 0+100002b8     0 FUNC    GLOBAL DEFAULT  UND my_func
     2: 0+10010408     0 NOTYPE  GLOBAL DEFAULT   11 __bss_start
     3: 0+10010408     0 NOTYPE  GLOBAL DEFAULT   10 _edata
     4: 0+10010420     0 NOTYPE  GLOBAL DEFAULT   11 _end

Symbol table '\.symtab' contains 21 entries:
.*
     0: .*
     1: 0+10000158     0 SECTION LOCAL  DEFAULT    1 
     2: 0+10000170     0 SECTION LOCAL  DEFAULT    2 
     3: 0+10000198     0 SECTION LOCAL  DEFAULT    3 
     4: 0+10000210     0 SECTION LOCAL  DEFAULT    4 
     5: 0+10000248     0 SECTION LOCAL  DEFAULT    5 
     6: 0+10000260     0 SECTION LOCAL  DEFAULT    6 
     7: 0+100002c8     0 SECTION LOCAL  DEFAULT    7 
     8: 0+100002d0     0 SECTION LOCAL  DEFAULT    8 
     9: 0+100102d0     0 SECTION LOCAL  DEFAULT    9 
    10: 0+10010400     0 SECTION LOCAL  DEFAULT   10 
    11: 0+10010408     0 SECTION LOCAL  DEFAULT   11 
    12: 0+100102d0     0 OBJECT  LOCAL  DEFAULT    9 _DYNAMIC
    13: 0+100002b8     0 NOTYPE  LOCAL  DEFAULT    6 00000011\.global_entry\.my_func
    14: 0+10000270     0 NOTYPE  LOCAL  DEFAULT    6 __glink_PLTresolve
    15: 0+100002c8     0 NOTYPE  GLOBAL DEFAULT    7 func_tab
    16: 0+100002b8     0 FUNC    GLOBAL DEFAULT  UND my_func
    17: 0+10000260     0 NOTYPE  GLOBAL DEFAULT    6 _start
    18: 0+10010408     0 NOTYPE  GLOBAL DEFAULT   11 __bss_start
    19: 0+10010408     0 NOTYPE  GLOBAL DEFAULT   10 _edata
    20: 0+10010420     0 NOTYPE  GLOBAL DEFAULT   11 _end

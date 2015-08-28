#source: startv1.s
#source: funref.s
#as: -a64
#ld: -melf64ppc --emit-stub-syms
#ld_after_inputfiles: tmpdir/funv1.so
#readelf: -rs --wide
# Check that we do the right thing with funref.s that doesn't have
# anything to mark it as ELFv1 or ELFv2.  We should get a dynamic
# reloc on the function address, and my_func should be undefined
# dynamic with value zero.

Relocation section .* contains 1 entries:
.*
.* R_PPC64_ADDR64 +0+ my_func \+ 0

Symbol table '\.dynsym' contains 5 entries:
.*
     0: .*
     1: 0+00000000     0 FUNC    GLOBAL DEFAULT  UND my_func
     2: 0+10010408     0 NOTYPE  GLOBAL DEFAULT   11 __bss_start
     3: 0+10010408     0 NOTYPE  GLOBAL DEFAULT   11 _edata
     4: 0+10010408     0 NOTYPE  GLOBAL DEFAULT   11 _end

Symbol table '\.symtab' contains 19 entries:
   Num:    Value          Size Type    Bind   Vis      Ndx Name
     0: .*
     1: 0+10000158     0 SECTION LOCAL  DEFAULT    1 
     2: 0+10000170     0 SECTION LOCAL  DEFAULT    2 
     3: 0+10000198     0 SECTION LOCAL  DEFAULT    3 
     4: 0+10000210     0 SECTION LOCAL  DEFAULT    4 
     5: 0+10000248     0 SECTION LOCAL  DEFAULT    5 
     6: 0+10000260     0 SECTION LOCAL  DEFAULT    6 
     7: 0+10000264     0 SECTION LOCAL  DEFAULT    7 
     8: 0+10010268     0 SECTION LOCAL  DEFAULT    8 
     9: 0+10010368     0 SECTION LOCAL  DEFAULT    9 
    10: 0+10010370     0 SECTION LOCAL  DEFAULT   10 
    11: 0+10010400     0 SECTION LOCAL  DEFAULT   11 
    12: 0+10010268     0 OBJECT  LOCAL  DEFAULT    8 _DYNAMIC
    13: 0+10010368     0 NOTYPE  GLOBAL DEFAULT    9 func_tab
    14: 0+00000000     0 FUNC    GLOBAL DEFAULT  UND my_func
    15: 0+10010370     0 FUNC    GLOBAL DEFAULT   10 _start
    16: 0+10010408     0 NOTYPE  GLOBAL DEFAULT   11 __bss_start
    17: 0+10010408     0 NOTYPE  GLOBAL DEFAULT   11 _edata
    18: 0+10010408     0 NOTYPE  GLOBAL DEFAULT   11 _end

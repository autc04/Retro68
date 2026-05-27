#source: dwarf5a.s
#source: dwarf4.s
#source: dwarf5b.s
#as: --64
#ld: -r -m elf_x86_64
#readelf: --wide --debug-dump=loc

Contents of the .*ebug_loc section:

    Offset   Begin            End              Expression

    00000000 v000000000000000 v000000000000000 location view pair
    00000002 v000000000000000 v000000000000000 location view pair

    00000004 v000000000000000 v000000000000000 views at 00000000 for:
             0000000000000000 000000000000000a \(DW_OP_reg5 \(rdi\)\)
    00000017 v000000000000000 v000000000000000 views at 00000002 for:
             000000000000000a 0000000000000016 \(DW_OP_GNU_entry_value: \(DW_OP_reg5 \(rdi\)\); DW_OP_stack_value\)
    0000002d <End of list>

    0000003d v000000000000002 v000000000000000 location view pair
    0000003f v000000000000000 v000000000000001 location view pair
    00000041 v000000000000001 v000000000000000 location view pair

    00000043 v000000000000002 v000000000000000 views at 0000003d for:
             0000000000000000 000000000000000a \(DW_OP_reg5 \(rdi\)\)
    00000056 v000000000000000 v000000000000001 views at 0000003f for:
             000000000000000a 000000000000000b \(DW_OP_GNU_entry_value: \(DW_OP_reg5 \(rdi\)\); DW_OP_stack_value\)
    0000006c v000000000000001 v000000000000000 views at 00000041 for:
             000000000000000b 0000000000000016 \(DW_OP_const1u: 123; DW_OP_stack_value\)
    00000081 <End of list>

Contents of the .*ebug_loclists section:

Table at Offset 0
  Length:          0x34
  DWARF version:   5
  Address size:    8
  Segment size:    0
  Offset entries:  0

    Offset   Begin            End              Expression

    0000000c v000000000000002 v000000000000000 location view pair
    0000000e v000000000000001 v000000000000001 location view pair
    00000010 v000000000000001 v000000000000000 location view pair

    00000012 0000000000000000 \(base address\)
    0000001b v000000000000002 v000000000000000 views at 0000000c for:
             0000000000000000 000000000000000d \(DW_OP_addr: 0\)
    00000028 v000000000000001 v000000000000001 views at 0000000e for:
             000000000000000e 0000000000000018 \(DW_OP_const1u: 123; DW_OP_stack_value\)
    0000002f v000000000000001 v000000000000000 views at 00000010 for:
             0000000000000018 000000000000001f \(DW_OP_const2u: 456; DW_OP_stack_value\)
    00000037 <End of list>
Table at Offset 0x38
  Length:          0x12
  DWARF version:   5
  Address size:    8
  Segment size:    0
  Offset entries:  0

    Offset   Begin            End              Expression

    00000044 v000000000000001 v000000000000000 location view pair

    00000046 v000000000000001 v000000000000000 views at 00000044 for:
             000000000000002f 000000000000003d \(DW_OP_const1u: 123; DW_OP_stack_value\)
    0000004d <End of list>

#pass

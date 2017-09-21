#! /bin/sh
# Copyright (C) 2015 Red Hat, Inc.
# This file is part of elfutils.
#
# This file is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# elfutils is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

. $srcdir/test-subr.sh

# - testfile-zdebug-rel.c
# #define UINT64_MAX 18446744073709551615UL
#
# int
# main (int argc, char **argv)
# {
#   unsigned long a = UINT64_MAX - 8;
#   unsigned long b = 42 + argc;
#
#   if ( a + b < b )
#     argc = a + argc;
#   else
#      b--;
#
#   return a - b;
# }
#
# gcc -Og -g -Xassembler --compress-debug-sections=none \
#     -c -o testfile-debug-rel.o testfile-zdebug-rel.c
# gcc -Og -g -Xassembler --compress-debug-sections=zlib-gnu \
#     -c -o testfile-debug-rel-g.o testfile-zdebug-rel.c
# gcc -Og -g -Xassembler --compress-debug-sections=zlib-gabi \
#     -c -o testfile-debug-rel-z.o testfile-zdebug-rel.c

testfiles testfile-debug-rel.o testfile-debug-rel-g.o testfile-debug-rel-z.o
tempfiles readelf.out
tempfiles info.out loc.out

cat > info.out << \EOF

DWARF section [ 4] '.debug_info' at offset 0x58:
 [Offset]
 Compilation unit at offset 0:
 Version: 4, Abbreviation section offset: 0, Address size: 8, Offset size: 4
 [     b]  compile_unit
           producer             (strp) "GNU C11 5.3.1 20151207 (Red Hat 5.3.1-2) -mtune=generic -march=x86-64 -g -Og"
           language             (data1) C99 (12)
           name                 (strp) "testfile-zdebug-rel.c"
           comp_dir             (strp) "/tmp"
           low_pc               (addr) 000000000000000000
           high_pc              (data8) 24 (0x0000000000000018)
           stmt_list            (sec_offset) 0
 [    2d]    subprogram
             external             (flag_present) yes
             name                 (strp) "main"
             decl_file            (data1) 1
             decl_line            (data1) 4
             prototyped           (flag_present) yes
             type                 (ref4) [    80]
             low_pc               (addr) 000000000000000000
             high_pc              (data8) 24 (0x0000000000000018)
             frame_base           (exprloc) 
              [   0] call_frame_cfa
             GNU_all_call_sites   (flag_present) yes
             sibling              (ref4) [    80]
 [    4e]      formal_parameter
               name                 (strp) "argc"
               decl_file            (data1) 1
               decl_line            (data1) 4
               type                 (ref4) [    80]
               location             (sec_offset) location list [     0]
 [    5d]      formal_parameter
               name                 (strp) "argv"
               decl_file            (data1) 1
               decl_line            (data1) 4
               type                 (ref4) [    87]
               location             (exprloc) 
                [   0] reg4
 [    6a]      variable
               name                 (string) "a"
               decl_file            (data1) 1
               decl_line            (data1) 6
               type                 (ref4) [    9a]
               const_value          (sdata) -9
 [    74]      variable
               name                 (string) "b"
               decl_file            (data1) 1
               decl_line            (data1) 7
               type                 (ref4) [    9a]
               location             (exprloc) 
                [   0] reg5
 [    80]    base_type
             byte_size            (data1) 4
             encoding             (data1) signed (5)
             name                 (string) "int"
 [    87]    pointer_type
             byte_size            (data1) 8
             type                 (ref4) [    8d]
 [    8d]    pointer_type
             byte_size            (data1) 8
             type                 (ref4) [    93]
 [    93]    base_type
             byte_size            (data1) 1
             encoding             (data1) signed_char (6)
             name                 (strp) "char"
 [    9a]    base_type
             byte_size            (data1) 8
             encoding             (data1) unsigned (7)
             name                 (strp) "long unsigned int"
EOF

cat info.out | testrun_compare ${abs_top_builddir}/src/readelf -U --debug-dump=info testfile-debug-rel.o

cat info.out | sed -e "s/'.debug_info'/'.zdebug_info'/" | testrun_compare ${abs_top_builddir}/src/readelf -U --debug-dump=info testfile-debug-rel-g.o

cat info.out | testrun_compare ${abs_top_builddir}/src/readelf -U --debug-dump=info testfile-debug-rel-z.o

cat > loc.out << \EOF

DWARF section [ 7] '.debug_loc' at offset 0x185:
 [     0]  000000000000000000..0x0000000000000003 [   0] reg5
           0x0000000000000003..0x0000000000000010 [   0] breg5 -42
                                                  [   2] stack_value
           0x0000000000000010..0x0000000000000018 [   0] GNU_entry_value:
       [   0] reg5
                                                  [   3] stack_value
EOF

cat loc.out | testrun_compare ${abs_top_builddir}/src/readelf -U --debug-dump=loc testfile-debug-rel.o

cat loc.out | sed -e "s/'.debug_loc' at offset 0x185/'.zdebug_loc' at offset 0x138/" | testrun_compare ${abs_top_builddir}/src/readelf -U --debug-dump=loc testfile-debug-rel-g.o

cat loc.out | sed -e "s/at offset 0x185/at offset 0x150/" | testrun_compare ${abs_top_builddir}/src/readelf -U --debug-dump=loc testfile-debug-rel-z.o

exit 0

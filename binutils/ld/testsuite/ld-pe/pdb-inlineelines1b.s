.equ CV_SIGNATURE_C13, 4

.equ DEBUG_S_STRINGTABLE, 0xf3
.equ DEBUG_S_FILECHKSMS, 0xf4
.equ DEBUG_S_INLINEELINES, 0xf6
.equ CHKSUM_TYPE_MD5, 1

.equ NUM_MD5_BYTES, 16

.equ T_VOID, 0x0003
.equ T_UINT4, 0x0075

.equ LF_ARGLIST, 0x1201
.equ LF_PROCEDURE, 0x1008
.equ LF_FUNC_ID, 0x1601
.equ LF_STRING_ID, 0x1605

.equ CV_INLINEE_SOURCE_LINE_SIGNATURE, 0

.section ".debug$T", "rn"

.long CV_SIGNATURE_C13

/* Type 1000, string "world" */
.string1:
.short .arglist1 - .string1 - 2
.short LF_STRING_ID
.long 0 /* sub-string */
.asciz "world"
.byte 0xf2 /* padding */
.byte 0xf1 /* padding */

/* Type 1001, arglist (uint32_t) */
.arglist1:
.short .proctype1 - .arglist1 - 2
.short LF_ARGLIST
.long 1 /* no. entries */
.long T_UINT4

/* Type 1002, procedure (return type T_VOID, arglist 1001) */
.proctype1:
.short .funcid1 - .proctype1 - 2
.short LF_PROCEDURE
.long T_VOID
.byte 0 /* calling convention */
.byte 0 /* attributes */
.short 1 /* no. parameters */
.long 0x1001

/* Type 1003, func ID for proc1 */
.funcid1:
.short .funcid2 - .funcid1 - 2
.short LF_FUNC_ID
.long 0 /* parent scope */
.long 0x1002 /* type */
.asciz "proc1"
.byte 0xf2 /* padding */
.byte 0xf1 /* padding */

/* Type 1004, func ID for proc2 */
.funcid2:
.short .types_end - .funcid2 - 2
.short LF_FUNC_ID
.long 0 /* parent scope */
.long 0x1002 /* type */
.asciz "proc2"
.byte 0xf2 /* padding */
.byte 0xf1 /* padding */

.types_end:

.section ".debug$S", "rn"
.long CV_SIGNATURE_C13

/*
  *** STRINGTABLE

  00000000
  00000001 foo.c
  00000007 bar.c
*/

.long DEBUG_S_STRINGTABLE
.long .strings_end - .strings_start

.strings_start:

.asciz ""

.src1:
.asciz "foo.c"

.src2:
.asciz "bar.c"

.strings_end:

.balign 4

/*
  *** FILECHKSUMS

  FileId  St.Offset  Cb  Type  ChksumBytes
      0   00000001   10  MD5   67452301EFCDAB8998BADCFE10234567
      18  00000007   10  MD5   98BADCFE1023456767452301EFCDAB89
*/

.long DEBUG_S_FILECHKSMS
.long .chksms_end - .chksms_start

.chksms_start:

.file1:
.long .src1 - .strings_start
.byte NUM_MD5_BYTES
.byte CHKSUM_TYPE_MD5
.long 0x01234567
.long 0x89abcdef
.long 0xfedcba98
.long 0x67452310
.short 0 /* padding */

.file2:
.long .src2 - .strings_start
.byte NUM_MD5_BYTES
.byte CHKSUM_TYPE_MD5
.long 0xfedcba98
.long 0x67452310
.long 0x01234567
.long 0x89abcdef
.short 0 /* padding */

.chksms_end:

.balign 4

/*
  *** INLINEE LINES

  InlineeId  FileId  StaringLine
       1003       0           42
       1004      18           28
*/

.long DEBUG_S_INLINEELINES
.long .lines_end - .lines_start

.lines_start:

.long CV_INLINEE_SOURCE_LINE_SIGNATURE

.long 0x1003
.long .file1 - .chksms_start
.long 42

.long 0x1004
.long .file2 - .chksms_start
.long 28

.lines_end:

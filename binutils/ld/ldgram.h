/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     INT = 258,
     NAME = 259,
     LNAME = 260,
     OREQ = 261,
     ANDEQ = 262,
     RSHIFTEQ = 263,
     LSHIFTEQ = 264,
     DIVEQ = 265,
     MULTEQ = 266,
     MINUSEQ = 267,
     PLUSEQ = 268,
     OROR = 269,
     ANDAND = 270,
     NE = 271,
     EQ = 272,
     GE = 273,
     LE = 274,
     RSHIFT = 275,
     LSHIFT = 276,
     UNARY = 277,
     END = 278,
     ALIGN_K = 279,
     BLOCK = 280,
     BIND = 281,
     QUAD = 282,
     SQUAD = 283,
     LONG = 284,
     SHORT = 285,
     BYTE = 286,
     SECTIONS = 287,
     PHDRS = 288,
     INSERT_K = 289,
     AFTER = 290,
     BEFORE = 291,
     DATA_SEGMENT_ALIGN = 292,
     DATA_SEGMENT_RELRO_END = 293,
     DATA_SEGMENT_END = 294,
     SORT_BY_NAME = 295,
     SORT_BY_ALIGNMENT = 296,
     SIZEOF_HEADERS = 297,
     OUTPUT_FORMAT = 298,
     FORCE_COMMON_ALLOCATION = 299,
     OUTPUT_ARCH = 300,
     INHIBIT_COMMON_ALLOCATION = 301,
     SEGMENT_START = 302,
     INCLUDE = 303,
     MEMORY = 304,
     REGION_ALIAS = 305,
     NOLOAD = 306,
     DSECT = 307,
     COPY = 308,
     INFO = 309,
     OVERLAY = 310,
     DEFINED = 311,
     TARGET_K = 312,
     SEARCH_DIR = 313,
     MAP = 314,
     ENTRY = 315,
     NEXT = 316,
     SIZEOF = 317,
     ALIGNOF = 318,
     ADDR = 319,
     LOADADDR = 320,
     MAX_K = 321,
     MIN_K = 322,
     STARTUP = 323,
     HLL = 324,
     SYSLIB = 325,
     FLOAT = 326,
     NOFLOAT = 327,
     NOCROSSREFS = 328,
     ORIGIN = 329,
     FILL = 330,
     LENGTH = 331,
     CREATE_OBJECT_SYMBOLS = 332,
     INPUT = 333,
     GROUP = 334,
     OUTPUT = 335,
     CONSTRUCTORS = 336,
     ALIGNMOD = 337,
     AT = 338,
     SUBALIGN = 339,
     PROVIDE = 340,
     PROVIDE_HIDDEN = 341,
     AS_NEEDED = 342,
     CHIP = 343,
     LIST = 344,
     SECT = 345,
     ABSOLUTE = 346,
     LOAD = 347,
     NEWLINE = 348,
     ENDWORD = 349,
     ORDER = 350,
     NAMEWORD = 351,
     ASSERT_K = 352,
     FORMAT = 353,
     PUBLIC = 354,
     DEFSYMEND = 355,
     BASE = 356,
     ALIAS = 357,
     TRUNCATE = 358,
     REL = 359,
     INPUT_SCRIPT = 360,
     INPUT_MRI_SCRIPT = 361,
     INPUT_DEFSYM = 362,
     CASE = 363,
     EXTERN = 364,
     START = 365,
     VERS_TAG = 366,
     VERS_IDENTIFIER = 367,
     GLOBAL = 368,
     LOCAL = 369,
     VERSIONK = 370,
     INPUT_VERSION_SCRIPT = 371,
     KEEP = 372,
     ONLY_IF_RO = 373,
     ONLY_IF_RW = 374,
     SPECIAL = 375,
     EXCLUDE_FILE = 376,
     CONSTANT = 377,
     INPUT_DYNAMIC_LIST = 378
   };
#endif
/* Tokens.  */
#define INT 258
#define NAME 259
#define LNAME 260
#define OREQ 261
#define ANDEQ 262
#define RSHIFTEQ 263
#define LSHIFTEQ 264
#define DIVEQ 265
#define MULTEQ 266
#define MINUSEQ 267
#define PLUSEQ 268
#define OROR 269
#define ANDAND 270
#define NE 271
#define EQ 272
#define GE 273
#define LE 274
#define RSHIFT 275
#define LSHIFT 276
#define UNARY 277
#define END 278
#define ALIGN_K 279
#define BLOCK 280
#define BIND 281
#define QUAD 282
#define SQUAD 283
#define LONG 284
#define SHORT 285
#define BYTE 286
#define SECTIONS 287
#define PHDRS 288
#define INSERT_K 289
#define AFTER 290
#define BEFORE 291
#define DATA_SEGMENT_ALIGN 292
#define DATA_SEGMENT_RELRO_END 293
#define DATA_SEGMENT_END 294
#define SORT_BY_NAME 295
#define SORT_BY_ALIGNMENT 296
#define SIZEOF_HEADERS 297
#define OUTPUT_FORMAT 298
#define FORCE_COMMON_ALLOCATION 299
#define OUTPUT_ARCH 300
#define INHIBIT_COMMON_ALLOCATION 301
#define SEGMENT_START 302
#define INCLUDE 303
#define MEMORY 304
#define REGION_ALIAS 305
#define NOLOAD 306
#define DSECT 307
#define COPY 308
#define INFO 309
#define OVERLAY 310
#define DEFINED 311
#define TARGET_K 312
#define SEARCH_DIR 313
#define MAP 314
#define ENTRY 315
#define NEXT 316
#define SIZEOF 317
#define ALIGNOF 318
#define ADDR 319
#define LOADADDR 320
#define MAX_K 321
#define MIN_K 322
#define STARTUP 323
#define HLL 324
#define SYSLIB 325
#define FLOAT 326
#define NOFLOAT 327
#define NOCROSSREFS 328
#define ORIGIN 329
#define FILL 330
#define LENGTH 331
#define CREATE_OBJECT_SYMBOLS 332
#define INPUT 333
#define GROUP 334
#define OUTPUT 335
#define CONSTRUCTORS 336
#define ALIGNMOD 337
#define AT 338
#define SUBALIGN 339
#define PROVIDE 340
#define PROVIDE_HIDDEN 341
#define AS_NEEDED 342
#define CHIP 343
#define LIST 344
#define SECT 345
#define ABSOLUTE 346
#define LOAD 347
#define NEWLINE 348
#define ENDWORD 349
#define ORDER 350
#define NAMEWORD 351
#define ASSERT_K 352
#define FORMAT 353
#define PUBLIC 354
#define DEFSYMEND 355
#define BASE 356
#define ALIAS 357
#define TRUNCATE 358
#define REL 359
#define INPUT_SCRIPT 360
#define INPUT_MRI_SCRIPT 361
#define INPUT_DEFSYM 362
#define CASE 363
#define EXTERN 364
#define START 365
#define VERS_TAG 366
#define VERS_IDENTIFIER 367
#define GLOBAL 368
#define LOCAL 369
#define VERSIONK 370
#define INPUT_VERSION_SCRIPT 371
#define KEEP 372
#define ONLY_IF_RO 373
#define ONLY_IF_RW 374
#define SPECIAL 375
#define EXCLUDE_FILE 376
#define CONSTANT 377
#define INPUT_DYNAMIC_LIST 378




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 62 "ldgram.y"
{
  bfd_vma integer;
  struct big_int
    {
      bfd_vma integer;
      char *str;
    } bigint;
  fill_type *fill;
  char *name;
  const char *cname;
  struct wildcard_spec wildcard;
  struct wildcard_list *wildcard_list;
  struct name_list *name_list;
  int token;
  union etree_union *etree;
  struct phdr_info
    {
      bfd_boolean filehdr;
      bfd_boolean phdrs;
      union etree_union *at;
      union etree_union *flags;
    } phdr;
  struct lang_nocrossref *nocrossref;
  struct lang_output_section_phdr_list *section_phdr;
  struct bfd_elf_version_deps *deflist;
  struct bfd_elf_version_expr *versyms;
  struct bfd_elf_version_tree *versnode;
}
/* Line 1529 of yacc.c.  */
#line 324 "ldgram.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;


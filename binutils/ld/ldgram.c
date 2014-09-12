/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 0



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
     SORT_NONE = 297,
     SORT_BY_INIT_PRIORITY = 298,
     SIZEOF_HEADERS = 299,
     OUTPUT_FORMAT = 300,
     FORCE_COMMON_ALLOCATION = 301,
     OUTPUT_ARCH = 302,
     INHIBIT_COMMON_ALLOCATION = 303,
     SEGMENT_START = 304,
     INCLUDE = 305,
     MEMORY = 306,
     REGION_ALIAS = 307,
     LD_FEATURE = 308,
     NOLOAD = 309,
     DSECT = 310,
     COPY = 311,
     INFO = 312,
     OVERLAY = 313,
     DEFINED = 314,
     TARGET_K = 315,
     SEARCH_DIR = 316,
     MAP = 317,
     ENTRY = 318,
     NEXT = 319,
     SIZEOF = 320,
     ALIGNOF = 321,
     ADDR = 322,
     LOADADDR = 323,
     MAX_K = 324,
     MIN_K = 325,
     STARTUP = 326,
     HLL = 327,
     SYSLIB = 328,
     FLOAT = 329,
     NOFLOAT = 330,
     NOCROSSREFS = 331,
     ORIGIN = 332,
     FILL = 333,
     LENGTH = 334,
     CREATE_OBJECT_SYMBOLS = 335,
     INPUT = 336,
     GROUP = 337,
     OUTPUT = 338,
     CONSTRUCTORS = 339,
     ALIGNMOD = 340,
     AT = 341,
     SUBALIGN = 342,
     HIDDEN = 343,
     PROVIDE = 344,
     PROVIDE_HIDDEN = 345,
     AS_NEEDED = 346,
     CHIP = 347,
     LIST = 348,
     SECT = 349,
     ABSOLUTE = 350,
     LOAD = 351,
     NEWLINE = 352,
     ENDWORD = 353,
     ORDER = 354,
     NAMEWORD = 355,
     ASSERT_K = 356,
     LOG2CEIL = 357,
     FORMAT = 358,
     PUBLIC = 359,
     DEFSYMEND = 360,
     BASE = 361,
     ALIAS = 362,
     TRUNCATE = 363,
     REL = 364,
     INPUT_SCRIPT = 365,
     INPUT_MRI_SCRIPT = 366,
     INPUT_DEFSYM = 367,
     CASE = 368,
     EXTERN = 369,
     START = 370,
     VERS_TAG = 371,
     VERS_IDENTIFIER = 372,
     GLOBAL = 373,
     LOCAL = 374,
     VERSIONK = 375,
     INPUT_VERSION_SCRIPT = 376,
     KEEP = 377,
     ONLY_IF_RO = 378,
     ONLY_IF_RW = 379,
     SPECIAL = 380,
     INPUT_SECTION_FLAGS = 381,
     ALIGN_WITH_INPUT = 382,
     EXCLUDE_FILE = 383,
     CONSTANT = 384,
     INPUT_DYNAMIC_LIST = 385
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
#define SORT_NONE 297
#define SORT_BY_INIT_PRIORITY 298
#define SIZEOF_HEADERS 299
#define OUTPUT_FORMAT 300
#define FORCE_COMMON_ALLOCATION 301
#define OUTPUT_ARCH 302
#define INHIBIT_COMMON_ALLOCATION 303
#define SEGMENT_START 304
#define INCLUDE 305
#define MEMORY 306
#define REGION_ALIAS 307
#define LD_FEATURE 308
#define NOLOAD 309
#define DSECT 310
#define COPY 311
#define INFO 312
#define OVERLAY 313
#define DEFINED 314
#define TARGET_K 315
#define SEARCH_DIR 316
#define MAP 317
#define ENTRY 318
#define NEXT 319
#define SIZEOF 320
#define ALIGNOF 321
#define ADDR 322
#define LOADADDR 323
#define MAX_K 324
#define MIN_K 325
#define STARTUP 326
#define HLL 327
#define SYSLIB 328
#define FLOAT 329
#define NOFLOAT 330
#define NOCROSSREFS 331
#define ORIGIN 332
#define FILL 333
#define LENGTH 334
#define CREATE_OBJECT_SYMBOLS 335
#define INPUT 336
#define GROUP 337
#define OUTPUT 338
#define CONSTRUCTORS 339
#define ALIGNMOD 340
#define AT 341
#define SUBALIGN 342
#define HIDDEN 343
#define PROVIDE 344
#define PROVIDE_HIDDEN 345
#define AS_NEEDED 346
#define CHIP 347
#define LIST 348
#define SECT 349
#define ABSOLUTE 350
#define LOAD 351
#define NEWLINE 352
#define ENDWORD 353
#define ORDER 354
#define NAMEWORD 355
#define ASSERT_K 356
#define LOG2CEIL 357
#define FORMAT 358
#define PUBLIC 359
#define DEFSYMEND 360
#define BASE 361
#define ALIAS 362
#define TRUNCATE 363
#define REL 364
#define INPUT_SCRIPT 365
#define INPUT_MRI_SCRIPT 366
#define INPUT_DEFSYM 367
#define CASE 368
#define EXTERN 369
#define START 370
#define VERS_TAG 371
#define VERS_IDENTIFIER 372
#define GLOBAL 373
#define LOCAL 374
#define VERSIONK 375
#define INPUT_VERSION_SCRIPT 376
#define KEEP 377
#define ONLY_IF_RO 378
#define ONLY_IF_RW 379
#define SPECIAL 380
#define INPUT_SECTION_FLAGS 381
#define ALIGN_WITH_INPUT 382
#define EXCLUDE_FILE 383
#define CONSTANT 384
#define INPUT_DYNAMIC_LIST 385




/* Copy the first part of user declarations.  */
#line 22 "ldgram.y"

/*

 */

#define DONTDECLARE_MALLOC

#include "sysdep.h"
#include "bfd.h"
#include "bfdlink.h"
#include "ld.h"
#include "ldexp.h"
#include "ldver.h"
#include "ldlang.h"
#include "ldfile.h"
#include "ldemul.h"
#include "ldmisc.h"
#include "ldmain.h"
#include "mri.h"
#include "ldctor.h"
#include "ldlex.h"

#ifndef YYDEBUG
#define YYDEBUG 1
#endif

static enum section_type sectype;
static lang_memory_region_type *region;

bfd_boolean ldgram_had_keep = FALSE;
char *ldgram_vers_current_lang = NULL;

#define ERROR_NAME_MAX 20
static char *error_names[ERROR_NAME_MAX];
static int error_index;
#define PUSH_ERROR(x) if (error_index < ERROR_NAME_MAX) error_names[error_index] = x; error_index++;
#define POP_ERROR()   error_index--;


/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 60 "ldgram.y"
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
  struct flag_info_list *flag_info_list;
  struct flag_info *flag_info;
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
/* Line 193 of yacc.c.  */
#line 426 "ldgram.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 439 "ldgram.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  17
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   1999

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  154
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  129
/* YYNRULES -- Number of rules.  */
#define YYNRULES  369
/* YYNRULES -- Number of states.  */
#define YYNSTATES  803

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   385

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   152,     2,     2,     2,    34,    21,     2,
      37,   149,    32,    30,   147,    31,     2,    33,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    16,   148,
      24,     6,    25,    15,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   150,     2,   151,    20,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    58,    19,    59,   153,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     7,     8,     9,    10,    11,    12,    13,    14,    17,
      18,    22,    23,    26,    27,    28,    29,    35,    36,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96,    97,    98,    99,   100,
     101,   102,   103,   104,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   126,   127,   128,   129,   130,
     131,   132,   133,   134,   135,   136,   137,   138,   139,   140,
     141,   142,   143,   144,   145,   146
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     6,     9,    12,    15,    18,    20,    21,
      26,    27,    30,    34,    35,    38,    43,    45,    47,    50,
      52,    57,    62,    66,    69,    74,    78,    83,    88,    93,
      98,   103,   106,   109,   112,   117,   122,   125,   128,   131,
     134,   135,   141,   144,   145,   149,   152,   153,   155,   159,
     161,   165,   166,   168,   172,   173,   176,   178,   181,   185,
     186,   189,   192,   193,   195,   197,   199,   201,   203,   205,
     207,   209,   211,   213,   218,   223,   228,   233,   242,   247,
     249,   251,   256,   257,   263,   268,   269,   275,   280,   285,
     289,   293,   300,   305,   307,   311,   314,   316,   320,   323,
     324,   330,   331,   339,   340,   347,   352,   355,   358,   359,
     364,   367,   368,   376,   378,   380,   382,   384,   390,   395,
     400,   405,   413,   421,   429,   437,   446,   451,   453,   457,
     462,   465,   467,   471,   473,   475,   478,   482,   487,   492,
     498,   500,   501,   507,   510,   512,   514,   516,   521,   523,
     528,   533,   534,   543,   544,   550,   553,   555,   556,   558,
     560,   562,   564,   566,   568,   570,   573,   574,   576,   578,
     580,   582,   584,   586,   588,   590,   592,   594,   598,   602,
     609,   616,   623,   625,   626,   631,   633,   634,   638,   640,
     641,   649,   650,   656,   660,   664,   665,   669,   671,   674,
     676,   679,   684,   689,   693,   697,   699,   704,   708,   709,
     711,   713,   714,   717,   721,   722,   725,   728,   732,   737,
     740,   743,   746,   750,   754,   758,   762,   766,   770,   774,
     778,   782,   786,   790,   794,   798,   802,   806,   810,   816,
     820,   824,   829,   831,   833,   838,   843,   848,   853,   858,
     863,   868,   875,   882,   889,   894,   901,   906,   908,   915,
     922,   929,   934,   939,   944,   948,   949,   954,   955,   960,
     961,   963,   964,   969,   970,   972,   974,   976,   977,   978,
     979,   980,   981,   982,  1003,  1004,  1005,  1006,  1007,  1008,
    1027,  1028,  1029,  1037,  1038,  1044,  1046,  1048,  1050,  1052,
    1054,  1058,  1059,  1062,  1066,  1069,  1076,  1087,  1090,  1092,
    1093,  1095,  1098,  1099,  1100,  1104,  1105,  1106,  1107,  1108,
    1120,  1125,  1126,  1129,  1130,  1131,  1138,  1140,  1141,  1145,
    1151,  1152,  1156,  1157,  1160,  1162,  1165,  1170,  1173,  1174,
    1177,  1178,  1184,  1186,  1189,  1194,  1200,  1207,  1209,  1212,
    1213,  1216,  1221,  1226,  1235,  1237,  1239,  1243,  1247,  1248,
    1258,  1259,  1267,  1269,  1273,  1275,  1279,  1281,  1285,  1286
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     155,     0,    -1,   126,   171,    -1,   127,   159,    -1,   137,
     271,    -1,   146,   266,    -1,   128,   157,    -1,     4,    -1,
      -1,   158,     4,     6,   226,    -1,    -1,   160,   161,    -1,
     161,   162,   113,    -1,    -1,   108,   226,    -1,   108,   226,
     147,   226,    -1,     4,    -1,   109,    -1,   115,   164,    -1,
     114,    -1,   120,     4,     6,   226,    -1,   120,     4,   147,
     226,    -1,   120,     4,   226,    -1,   119,     4,    -1,   110,
       4,   147,   226,    -1,   110,     4,   226,    -1,   110,     4,
       6,   226,    -1,    38,     4,     6,   226,    -1,    38,     4,
     147,   226,    -1,   101,     4,     6,   226,    -1,   101,     4,
     147,   226,    -1,   111,   166,    -1,   112,   165,    -1,   116,
       4,    -1,   123,     4,   147,     4,    -1,   123,     4,   147,
       3,    -1,   122,   226,    -1,   124,     3,    -1,   129,   167,
      -1,   130,   168,    -1,    -1,    66,   156,   163,   161,    36,
      -1,   131,     4,    -1,    -1,   164,   147,     4,    -1,   164,
       4,    -1,    -1,     4,    -1,   165,   147,     4,    -1,     4,
      -1,   166,   147,     4,    -1,    -1,     4,    -1,   167,   147,
       4,    -1,    -1,   169,   170,    -1,     4,    -1,   170,     4,
      -1,   170,   147,     4,    -1,    -1,   172,   173,    -1,   173,
     174,    -1,    -1,   206,    -1,   181,    -1,   258,    -1,   217,
      -1,   218,    -1,   220,    -1,   222,    -1,   183,    -1,   273,
      -1,   148,    -1,    76,    37,     4,   149,    -1,    77,    37,
     156,   149,    -1,    99,    37,   156,   149,    -1,    61,    37,
       4,   149,    -1,    61,    37,     4,   147,     4,   147,     4,
     149,    -1,    63,    37,     4,   149,    -1,    62,    -1,    64,
      -1,    97,    37,   177,   149,    -1,    -1,    98,   175,    37,
     177,   149,    -1,    78,    37,   156,   149,    -1,    -1,    66,
     156,   176,   173,    36,    -1,    92,    37,   223,   149,    -1,
     130,    37,   168,   149,    -1,    48,    49,     4,    -1,    48,
      50,     4,    -1,    68,    37,     4,   147,     4,   149,    -1,
      69,    37,     4,   149,    -1,     4,    -1,   177,   147,     4,
      -1,   177,     4,    -1,     5,    -1,   177,   147,     5,    -1,
     177,     5,    -1,    -1,   107,    37,   178,   177,   149,    -1,
      -1,   177,   147,   107,    37,   179,   177,   149,    -1,    -1,
     177,   107,    37,   180,   177,   149,    -1,    46,    58,   182,
      59,    -1,   182,   233,    -1,   182,   183,    -1,    -1,    79,
      37,     4,   149,    -1,   204,   203,    -1,    -1,   117,   184,
      37,   226,   147,     4,   149,    -1,     4,    -1,    32,    -1,
      15,    -1,   185,    -1,   144,    37,   189,   149,   185,    -1,
      54,    37,   185,   149,    -1,    55,    37,   185,   149,    -1,
      56,    37,   185,   149,    -1,    54,    37,    55,    37,   185,
     149,   149,    -1,    54,    37,    54,    37,   185,   149,   149,
      -1,    55,    37,    54,    37,   185,   149,   149,    -1,    55,
      37,    55,    37,   185,   149,   149,    -1,    54,    37,   144,
      37,   189,   149,   185,   149,    -1,    57,    37,   185,   149,
      -1,     4,    -1,   187,    21,     4,    -1,   142,    37,   187,
     149,    -1,   189,   185,    -1,   185,    -1,   190,   205,   186,
      -1,   186,    -1,     4,    -1,   188,     4,    -1,   150,   190,
     151,    -1,   188,   150,   190,   151,    -1,   186,    37,   190,
     149,    -1,   188,   186,    37,   190,   149,    -1,   191,    -1,
      -1,   138,    37,   193,   191,   149,    -1,   204,   203,    -1,
      96,    -1,   148,    -1,   100,    -1,    54,    37,   100,   149,
      -1,   192,    -1,   199,    37,   224,   149,    -1,    94,    37,
     200,   149,    -1,    -1,   117,   195,    37,   226,   147,     4,
     149,   203,    -1,    -1,    66,   156,   196,   198,    36,    -1,
     197,   194,    -1,   194,    -1,    -1,   197,    -1,    41,    -1,
      42,    -1,    43,    -1,    44,    -1,    45,    -1,   224,    -1,
       6,   200,    -1,    -1,    14,    -1,    13,    -1,    12,    -1,
      11,    -1,    10,    -1,     9,    -1,     8,    -1,     7,    -1,
     148,    -1,   147,    -1,     4,     6,   224,    -1,     4,   202,
     224,    -1,   104,    37,     4,     6,   224,   149,    -1,   105,
      37,     4,     6,   224,   149,    -1,   106,    37,     4,     6,
     224,   149,    -1,   147,    -1,    -1,    67,    58,   207,    59,
      -1,   208,    -1,    -1,   208,   205,   209,    -1,   209,    -1,
      -1,     4,   210,   214,    16,   212,   205,   213,    -1,    -1,
      66,   156,   211,   207,    36,    -1,    93,     6,   224,    -1,
      95,     6,   224,    -1,    -1,    37,   215,   149,    -1,   216,
      -1,   215,   216,    -1,     4,    -1,   152,     4,    -1,    87,
      37,   156,   149,    -1,    88,    37,   219,   149,    -1,    88,
      37,   149,    -1,   219,   205,   156,    -1,   156,    -1,    89,
      37,   221,   149,    -1,   221,   205,   156,    -1,    -1,    90,
      -1,    91,    -1,    -1,     4,   223,    -1,     4,   147,   223,
      -1,    -1,   225,   226,    -1,    31,   226,    -1,    37,   226,
     149,    -1,    80,    37,   226,   149,    -1,   152,   226,    -1,
      30,   226,    -1,   153,   226,    -1,   226,    32,   226,    -1,
     226,    33,   226,    -1,   226,    34,   226,    -1,   226,    30,
     226,    -1,   226,    31,   226,    -1,   226,    29,   226,    -1,
     226,    28,   226,    -1,   226,    23,   226,    -1,   226,    22,
     226,    -1,   226,    27,   226,    -1,   226,    26,   226,    -1,
     226,    24,   226,    -1,   226,    25,   226,    -1,   226,    21,
     226,    -1,   226,    20,   226,    -1,   226,    19,   226,    -1,
     226,    15,   226,    16,   226,    -1,   226,    18,   226,    -1,
     226,    17,   226,    -1,    75,    37,     4,   149,    -1,     3,
      -1,    60,    -1,    82,    37,     4,   149,    -1,    81,    37,
       4,   149,    -1,    83,    37,     4,   149,    -1,    84,    37,
       4,   149,    -1,   145,    37,     4,   149,    -1,   111,    37,
     226,   149,    -1,    38,    37,   226,   149,    -1,    38,    37,
     226,   147,   226,   149,    -1,    51,    37,   226,   147,   226,
     149,    -1,    52,    37,   226,   147,   226,   149,    -1,    53,
      37,   226,   149,    -1,    65,    37,     4,   147,   226,   149,
      -1,    39,    37,   226,   149,    -1,     4,    -1,    85,    37,
     226,   147,   226,   149,    -1,    86,    37,   226,   147,   226,
     149,    -1,   117,    37,   226,   147,     4,   149,    -1,    93,
      37,     4,   149,    -1,    95,    37,     4,   149,    -1,   118,
      37,   226,   149,    -1,   102,    25,     4,    -1,    -1,   102,
      37,   226,   149,    -1,    -1,    38,    37,   226,   149,    -1,
      -1,   143,    -1,    -1,   103,    37,   226,   149,    -1,    -1,
     139,    -1,   140,    -1,   141,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     4,   234,   249,   228,   229,   230,   231,   235,
     232,    58,   236,   198,    59,   237,   252,   227,   253,   201,
     238,   205,    -1,    -1,    -1,    -1,    -1,    -1,    74,   239,
     250,   251,   228,   231,   240,    58,   241,   254,    59,   242,
     252,   227,   253,   201,   243,   205,    -1,    -1,    -1,    98,
     244,   249,   245,    58,   182,    59,    -1,    -1,    66,   156,
     246,   182,    36,    -1,    70,    -1,    71,    -1,    72,    -1,
      73,    -1,    74,    -1,    37,   247,   149,    -1,    -1,    37,
     149,    -1,   226,   248,    16,    -1,   248,    16,    -1,    40,
      37,   226,   149,   248,    16,    -1,    40,    37,   226,   149,
      39,    37,   226,   149,   248,    16,    -1,   226,    16,    -1,
      16,    -1,    -1,    92,    -1,    25,     4,    -1,    -1,    -1,
     253,    16,     4,    -1,    -1,    -1,    -1,    -1,   254,     4,
     255,    58,   198,    59,   256,   253,   201,   257,   205,    -1,
      47,    58,   259,    59,    -1,    -1,   259,   260,    -1,    -1,
      -1,     4,   261,   263,   264,   262,   148,    -1,   226,    -1,
      -1,     4,   265,   264,    -1,   102,    37,   226,   149,   264,
      -1,    -1,    37,   226,   149,    -1,    -1,   267,   268,    -1,
     269,    -1,   268,   269,    -1,    58,   270,    59,   148,    -1,
     279,   148,    -1,    -1,   272,   275,    -1,    -1,   274,   136,
      58,   275,    59,    -1,   276,    -1,   275,   276,    -1,    58,
     278,    59,   148,    -1,   132,    58,   278,    59,   148,    -1,
     132,    58,   278,    59,   277,   148,    -1,   132,    -1,   277,
     132,    -1,    -1,   279,   148,    -1,   134,    16,   279,   148,
      -1,   135,    16,   279,   148,    -1,   134,    16,   279,   148,
     135,    16,   279,   148,    -1,   133,    -1,     4,    -1,   279,
     148,   133,    -1,   279,   148,     4,    -1,    -1,   279,   148,
     130,     4,    58,   280,   279,   282,    59,    -1,    -1,   130,
       4,    58,   281,   279,   282,    59,    -1,   134,    -1,   279,
     148,   134,    -1,   135,    -1,   279,   148,   135,    -1,   130,
      -1,   279,   148,   130,    -1,    -1,   148,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   166,   166,   167,   168,   169,   170,   174,   178,   178,
     188,   188,   201,   202,   206,   207,   208,   211,   214,   215,
     216,   218,   220,   222,   224,   226,   228,   230,   232,   234,
     236,   238,   239,   240,   242,   244,   246,   248,   250,   251,
     253,   252,   256,   258,   262,   263,   264,   268,   270,   274,
     276,   281,   282,   283,   288,   288,   293,   295,   297,   302,
     302,   308,   309,   314,   315,   316,   317,   318,   319,   320,
     321,   322,   323,   324,   326,   328,   330,   333,   335,   337,
     339,   341,   343,   342,   346,   349,   348,   352,   356,   357,
     359,   361,   363,   368,   371,   374,   377,   380,   383,   387,
     386,   392,   391,   397,   396,   404,   408,   409,   410,   414,
     416,   417,   417,   425,   429,   433,   440,   447,   454,   461,
     468,   475,   482,   489,   496,   503,   510,   519,   537,   558,
     571,   580,   591,   600,   611,   620,   629,   633,   642,   646,
     654,   656,   655,   662,   663,   667,   668,   673,   678,   679,
     684,   688,   688,   692,   691,   698,   699,   702,   704,   708,
     710,   712,   714,   716,   721,   728,   730,   734,   736,   738,
     740,   742,   744,   746,   748,   753,   753,   758,   762,   770,
     774,   778,   786,   786,   790,   793,   793,   796,   797,   802,
     801,   807,   806,   813,   821,   829,   830,   834,   835,   839,
     841,   846,   851,   852,   857,   859,   865,   867,   869,   873,
     875,   881,   884,   893,   904,   904,   910,   912,   914,   916,
     918,   920,   923,   925,   927,   929,   931,   933,   935,   937,
     939,   941,   943,   945,   947,   949,   951,   953,   955,   957,
     959,   961,   963,   965,   968,   970,   972,   974,   976,   978,
     980,   982,   984,   986,   988,   990,   999,  1001,  1003,  1005,
    1007,  1009,  1011,  1013,  1019,  1020,  1024,  1025,  1029,  1030,
    1034,  1035,  1039,  1040,  1044,  1045,  1046,  1047,  1050,  1055,
    1058,  1064,  1066,  1050,  1073,  1075,  1077,  1082,  1084,  1072,
    1094,  1096,  1094,  1102,  1101,  1108,  1109,  1110,  1111,  1112,
    1116,  1117,  1118,  1122,  1123,  1128,  1129,  1134,  1135,  1140,
    1141,  1146,  1148,  1153,  1156,  1169,  1173,  1178,  1180,  1171,
    1188,  1191,  1193,  1197,  1198,  1197,  1207,  1252,  1255,  1268,
    1277,  1280,  1287,  1287,  1299,  1300,  1304,  1308,  1317,  1317,
    1331,  1331,  1341,  1342,  1346,  1350,  1354,  1361,  1365,  1373,
    1376,  1380,  1384,  1388,  1395,  1399,  1403,  1407,  1412,  1411,
    1425,  1424,  1434,  1438,  1442,  1446,  1450,  1454,  1460,  1462
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "INT", "NAME", "LNAME", "'='", "OREQ",
  "ANDEQ", "RSHIFTEQ", "LSHIFTEQ", "DIVEQ", "MULTEQ", "MINUSEQ", "PLUSEQ",
  "'?'", "':'", "OROR", "ANDAND", "'|'", "'^'", "'&'", "NE", "EQ", "'<'",
  "'>'", "GE", "LE", "RSHIFT", "LSHIFT", "'+'", "'-'", "'*'", "'/'", "'%'",
  "UNARY", "END", "'('", "ALIGN_K", "BLOCK", "BIND", "QUAD", "SQUAD",
  "LONG", "SHORT", "BYTE", "SECTIONS", "PHDRS", "INSERT_K", "AFTER",
  "BEFORE", "DATA_SEGMENT_ALIGN", "DATA_SEGMENT_RELRO_END",
  "DATA_SEGMENT_END", "SORT_BY_NAME", "SORT_BY_ALIGNMENT", "SORT_NONE",
  "SORT_BY_INIT_PRIORITY", "'{'", "'}'", "SIZEOF_HEADERS", "OUTPUT_FORMAT",
  "FORCE_COMMON_ALLOCATION", "OUTPUT_ARCH", "INHIBIT_COMMON_ALLOCATION",
  "SEGMENT_START", "INCLUDE", "MEMORY", "REGION_ALIAS", "LD_FEATURE",
  "NOLOAD", "DSECT", "COPY", "INFO", "OVERLAY", "DEFINED", "TARGET_K",
  "SEARCH_DIR", "MAP", "ENTRY", "NEXT", "SIZEOF", "ALIGNOF", "ADDR",
  "LOADADDR", "MAX_K", "MIN_K", "STARTUP", "HLL", "SYSLIB", "FLOAT",
  "NOFLOAT", "NOCROSSREFS", "ORIGIN", "FILL", "LENGTH",
  "CREATE_OBJECT_SYMBOLS", "INPUT", "GROUP", "OUTPUT", "CONSTRUCTORS",
  "ALIGNMOD", "AT", "SUBALIGN", "HIDDEN", "PROVIDE", "PROVIDE_HIDDEN",
  "AS_NEEDED", "CHIP", "LIST", "SECT", "ABSOLUTE", "LOAD", "NEWLINE",
  "ENDWORD", "ORDER", "NAMEWORD", "ASSERT_K", "LOG2CEIL", "FORMAT",
  "PUBLIC", "DEFSYMEND", "BASE", "ALIAS", "TRUNCATE", "REL",
  "INPUT_SCRIPT", "INPUT_MRI_SCRIPT", "INPUT_DEFSYM", "CASE", "EXTERN",
  "START", "VERS_TAG", "VERS_IDENTIFIER", "GLOBAL", "LOCAL", "VERSIONK",
  "INPUT_VERSION_SCRIPT", "KEEP", "ONLY_IF_RO", "ONLY_IF_RW", "SPECIAL",
  "INPUT_SECTION_FLAGS", "ALIGN_WITH_INPUT", "EXCLUDE_FILE", "CONSTANT",
  "INPUT_DYNAMIC_LIST", "','", "';'", "')'", "'['", "']'", "'!'", "'~'",
  "$accept", "file", "filename", "defsym_expr", "@1", "mri_script_file",
  "@2", "mri_script_lines", "mri_script_command", "@3", "ordernamelist",
  "mri_load_name_list", "mri_abs_name_list", "casesymlist",
  "extern_name_list", "@4", "extern_name_list_body", "script_file", "@5",
  "ifile_list", "ifile_p1", "@6", "@7", "input_list", "@8", "@9", "@10",
  "sections", "sec_or_group_p1", "statement_anywhere", "@11",
  "wildcard_name", "wildcard_spec", "sect_flag_list", "sect_flags",
  "exclude_name_list", "file_NAME_list", "input_section_spec_no_keep",
  "input_section_spec", "@12", "statement", "@13", "@14", "statement_list",
  "statement_list_opt", "length", "fill_exp", "fill_opt", "assign_op",
  "end", "assignment", "opt_comma", "memory", "memory_spec_list_opt",
  "memory_spec_list", "memory_spec", "@15", "@16", "origin_spec",
  "length_spec", "attributes_opt", "attributes_list", "attributes_string",
  "startup", "high_level_library", "high_level_library_NAME_list",
  "low_level_library", "low_level_library_NAME_list",
  "floating_point_support", "nocrossref_list", "mustbe_exp", "@17", "exp",
  "memspec_at_opt", "opt_at", "opt_align", "opt_align_with_input",
  "opt_subalign", "sect_constraint", "section", "@18", "@19", "@20", "@21",
  "@22", "@23", "@24", "@25", "@26", "@27", "@28", "@29", "@30", "type",
  "atype", "opt_exp_with_type", "opt_exp_without_type", "opt_nocrossrefs",
  "memspec_opt", "phdr_opt", "overlay_section", "@31", "@32", "@33",
  "phdrs", "phdr_list", "phdr", "@34", "@35", "phdr_type",
  "phdr_qualifiers", "phdr_val", "dynamic_list_file", "@36",
  "dynamic_list_nodes", "dynamic_list_node", "dynamic_list_tag",
  "version_script_file", "@37", "version", "@38", "vers_nodes",
  "vers_node", "verdep", "vers_tag", "vers_defns", "@39", "@40",
  "opt_semicolon", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,    61,   261,   262,   263,
     264,   265,   266,   267,   268,    63,    58,   269,   270,   124,
      94,    38,   271,   272,    60,    62,   273,   274,   275,   276,
      43,    45,    42,    47,    37,   277,   278,    40,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   297,   298,   123,   125,
     299,   300,   301,   302,   303,   304,   305,   306,   307,   308,
     309,   310,   311,   312,   313,   314,   315,   316,   317,   318,
     319,   320,   321,   322,   323,   324,   325,   326,   327,   328,
     329,   330,   331,   332,   333,   334,   335,   336,   337,   338,
     339,   340,   341,   342,   343,   344,   345,   346,   347,   348,
     349,   350,   351,   352,   353,   354,   355,   356,   357,   358,
     359,   360,   361,   362,   363,   364,   365,   366,   367,   368,
     369,   370,   371,   372,   373,   374,   375,   376,   377,   378,
     379,   380,   381,   382,   383,   384,   385,    44,    59,    41,
      91,    93,    33,   126
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   154,   155,   155,   155,   155,   155,   156,   158,   157,
     160,   159,   161,   161,   162,   162,   162,   162,   162,   162,
     162,   162,   162,   162,   162,   162,   162,   162,   162,   162,
     162,   162,   162,   162,   162,   162,   162,   162,   162,   162,
     163,   162,   162,   162,   164,   164,   164,   165,   165,   166,
     166,   167,   167,   167,   169,   168,   170,   170,   170,   172,
     171,   173,   173,   174,   174,   174,   174,   174,   174,   174,
     174,   174,   174,   174,   174,   174,   174,   174,   174,   174,
     174,   174,   175,   174,   174,   176,   174,   174,   174,   174,
     174,   174,   174,   177,   177,   177,   177,   177,   177,   178,
     177,   179,   177,   180,   177,   181,   182,   182,   182,   183,
     183,   184,   183,   185,   185,   185,   186,   186,   186,   186,
     186,   186,   186,   186,   186,   186,   186,   187,   187,   188,
     189,   189,   190,   190,   191,   191,   191,   191,   191,   191,
     192,   193,   192,   194,   194,   194,   194,   194,   194,   194,
     194,   195,   194,   196,   194,   197,   197,   198,   198,   199,
     199,   199,   199,   199,   200,   201,   201,   202,   202,   202,
     202,   202,   202,   202,   202,   203,   203,   204,   204,   204,
     204,   204,   205,   205,   206,   207,   207,   208,   208,   210,
     209,   211,   209,   212,   213,   214,   214,   215,   215,   216,
     216,   217,   218,   218,   219,   219,   220,   221,   221,   222,
     222,   223,   223,   223,   225,   224,   226,   226,   226,   226,
     226,   226,   226,   226,   226,   226,   226,   226,   226,   226,
     226,   226,   226,   226,   226,   226,   226,   226,   226,   226,
     226,   226,   226,   226,   226,   226,   226,   226,   226,   226,
     226,   226,   226,   226,   226,   226,   226,   226,   226,   226,
     226,   226,   226,   226,   227,   227,   228,   228,   229,   229,
     230,   230,   231,   231,   232,   232,   232,   232,   234,   235,
     236,   237,   238,   233,   239,   240,   241,   242,   243,   233,
     244,   245,   233,   246,   233,   247,   247,   247,   247,   247,
     248,   248,   248,   249,   249,   249,   249,   250,   250,   251,
     251,   252,   252,   253,   253,   254,   255,   256,   257,   254,
     258,   259,   259,   261,   262,   260,   263,   264,   264,   264,
     265,   265,   267,   266,   268,   268,   269,   270,   272,   271,
     274,   273,   275,   275,   276,   276,   276,   277,   277,   278,
     278,   278,   278,   278,   279,   279,   279,   279,   280,   279,
     281,   279,   279,   279,   279,   279,   279,   279,   282,   282
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     2,     2,     2,     2,     1,     0,     4,
       0,     2,     3,     0,     2,     4,     1,     1,     2,     1,
       4,     4,     3,     2,     4,     3,     4,     4,     4,     4,
       4,     2,     2,     2,     4,     4,     2,     2,     2,     2,
       0,     5,     2,     0,     3,     2,     0,     1,     3,     1,
       3,     0,     1,     3,     0,     2,     1,     2,     3,     0,
       2,     2,     0,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     4,     4,     4,     4,     8,     4,     1,
       1,     4,     0,     5,     4,     0,     5,     4,     4,     3,
       3,     6,     4,     1,     3,     2,     1,     3,     2,     0,
       5,     0,     7,     0,     6,     4,     2,     2,     0,     4,
       2,     0,     7,     1,     1,     1,     1,     5,     4,     4,
       4,     7,     7,     7,     7,     8,     4,     1,     3,     4,
       2,     1,     3,     1,     1,     2,     3,     4,     4,     5,
       1,     0,     5,     2,     1,     1,     1,     4,     1,     4,
       4,     0,     8,     0,     5,     2,     1,     0,     1,     1,
       1,     1,     1,     1,     1,     2,     0,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     3,     3,     6,
       6,     6,     1,     0,     4,     1,     0,     3,     1,     0,
       7,     0,     5,     3,     3,     0,     3,     1,     2,     1,
       2,     4,     4,     3,     3,     1,     4,     3,     0,     1,
       1,     0,     2,     3,     0,     2,     2,     3,     4,     2,
       2,     2,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     5,     3,
       3,     4,     1,     1,     4,     4,     4,     4,     4,     4,
       4,     6,     6,     6,     4,     6,     4,     1,     6,     6,
       6,     4,     4,     4,     3,     0,     4,     0,     4,     0,
       1,     0,     4,     0,     1,     1,     1,     0,     0,     0,
       0,     0,     0,    20,     0,     0,     0,     0,     0,    18,
       0,     0,     7,     0,     5,     1,     1,     1,     1,     1,
       3,     0,     2,     3,     2,     6,    10,     2,     1,     0,
       1,     2,     0,     0,     3,     0,     0,     0,     0,    11,
       4,     0,     2,     0,     0,     6,     1,     0,     3,     5,
       0,     3,     0,     2,     1,     2,     4,     2,     0,     2,
       0,     5,     1,     2,     4,     5,     6,     1,     2,     0,
       2,     4,     4,     8,     1,     1,     3,     3,     0,     9,
       0,     7,     1,     3,     1,     3,     1,     3,     0,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    59,    10,     8,   338,   332,     0,     2,    62,     3,
      13,     6,     0,     4,     0,     5,     0,     1,    60,    11,
       0,   349,     0,   339,   342,     0,   333,   334,     0,     0,
       0,     0,     0,    79,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   209,   210,     0,
       0,    82,     0,     0,     0,     0,   111,     0,    72,    61,
      64,    70,     0,    63,    66,    67,    68,    69,    65,    71,
       0,    16,     0,     0,     0,     0,    17,     0,     0,     0,
      19,    46,     0,     0,     0,     0,     0,     0,    51,    54,
       0,     0,     0,   355,   366,   354,   362,   364,     0,     0,
     349,   343,   362,   364,     0,     0,   335,   214,   174,   173,
     172,   171,   170,   169,   168,   167,   214,   108,   321,     0,
       0,     0,     0,     7,    85,   186,     0,     0,     0,     0,
       0,     0,     0,     0,   208,   211,     0,     0,     0,     0,
       0,     0,     0,    54,   176,   175,   110,     0,     0,    40,
       0,   242,   257,     0,     0,     0,     0,     0,     0,     0,
       0,   243,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    14,
       0,    49,    31,    47,    32,    18,    33,    23,     0,    36,
       0,    37,    52,    38,    39,     0,    42,    12,     9,     0,
       0,     0,     0,   350,     0,     0,   337,   177,     0,   178,
       0,     0,    89,    90,     0,     0,    62,   189,     0,     0,
     183,   188,     0,     0,     0,     0,     0,     0,     0,   203,
     205,   183,   183,   211,     0,    93,    96,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    13,
       0,     0,   220,   216,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   219,   221,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    25,
       0,     0,    45,     0,     0,     0,    22,     0,     0,    56,
      55,   360,     0,     0,   344,   357,   367,   356,   363,   365,
       0,   336,   215,   278,   105,     0,   284,   290,   107,   106,
     323,   320,   322,     0,    76,    78,   340,   195,   191,   184,
     182,     0,     0,    92,    73,    74,    84,   109,   201,   202,
       0,   206,     0,   211,   212,    87,    99,    95,    98,     0,
       0,    81,     0,    75,   214,   214,   214,     0,    88,     0,
      27,    28,    43,    29,    30,   217,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   240,   239,   237,
     236,   235,   230,   229,   233,   234,   232,   231,   228,   227,
     225,   226,   222,   223,   224,    15,    26,    24,    50,    48,
      44,    20,    21,    35,    34,    53,    57,     0,     0,   351,
     352,     0,   347,   345,     0,   301,   293,     0,   301,     0,
       0,    86,     0,     0,   186,   187,     0,   204,   207,   213,
       0,   103,    94,    97,     0,    83,     0,     0,     0,     0,
     341,    41,     0,   250,   256,     0,     0,   254,     0,   241,
     218,   245,   244,   246,   247,     0,     0,   261,   262,   249,
       0,   263,   248,     0,    58,   368,   365,   358,   348,   346,
       0,     0,   301,     0,   267,   108,   308,     0,   309,   291,
     326,   327,     0,   199,     0,     0,   197,     0,     0,    91,
       0,     0,   101,   179,   180,   181,     0,     0,     0,     0,
       0,     0,     0,     0,   238,   369,     0,     0,     0,   295,
     296,   297,   298,   299,   302,     0,     0,     0,     0,   304,
       0,   269,     0,   307,   310,   267,     0,   330,     0,   324,
       0,   200,   196,   198,     0,   183,   192,   100,     0,     0,
     112,   251,   252,   253,   255,   258,   259,   260,   361,     0,
     368,   300,     0,   303,     0,     0,   271,   294,   273,   108,
       0,   327,     0,     0,    77,   214,     0,   104,     0,   353,
       0,   301,     0,     0,   270,   273,     0,   285,     0,     0,
     328,     0,   325,   193,     0,   190,   102,   359,     0,     0,
     266,     0,   279,     0,     0,   292,   331,   327,   214,     0,
     305,   268,   277,     0,   286,   329,   194,     0,   274,   275,
     276,     0,   272,   315,   301,   280,     0,     0,   157,   316,
     287,   306,   134,   115,   114,   159,   160,   161,   162,   163,
       0,     0,     0,     0,     0,     0,   144,   146,   151,     0,
       0,     0,   145,     0,   116,     0,     0,   140,   148,   156,
     158,     0,     0,     0,     0,   312,     0,     0,     0,     0,
     153,   214,     0,   141,     0,     0,   113,     0,   133,   183,
       0,   135,     0,     0,   155,   281,   214,   143,   157,     0,
     265,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   157,     0,   164,     0,     0,   127,     0,   131,     0,
       0,   136,     0,   183,   183,     0,   312,     0,     0,   311,
       0,   313,     0,     0,   147,     0,   118,     0,     0,   119,
     120,   126,     0,   150,     0,   113,     0,     0,   129,     0,
     130,   132,   138,   137,   183,   265,   149,   317,     0,   166,
       0,     0,     0,     0,     0,   154,     0,   142,   128,   117,
     139,   313,   313,   264,   214,     0,   288,     0,     0,     0,
       0,     0,     0,   166,   166,   165,   314,   183,   122,   121,
       0,   123,   124,     0,   282,   318,   289,   125,   152,   183,
     183,   283,   319
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     6,   124,    11,    12,     9,    10,    19,    91,   249,
     185,   184,   182,   193,   194,   195,   310,     7,     8,    18,
      59,   137,   216,   238,   450,   559,   511,    60,   210,   328,
     142,   664,   665,   717,   666,   719,   689,   667,   668,   715,
     669,   682,   711,   670,   671,   672,   712,   776,   116,   146,
      62,   722,    63,   219,   220,   221,   337,   444,   555,   605,
     443,   505,   506,    64,    65,   231,    66,   232,    67,   234,
     713,   208,   254,   731,   541,   576,   595,   597,   631,   329,
     435,   622,   638,   726,   799,   437,   614,   633,   675,   787,
     438,   546,   495,   535,   493,   494,   498,   545,   700,   759,
     636,   674,   772,   800,    68,   211,   332,   439,   583,   501,
     549,   581,    15,    16,    26,    27,   104,    13,    14,    69,
      70,    23,    24,   434,    98,    99,   528,   428,   526
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -647
static const yytype_int16 yypact[] =
{
     -46,  -647,  -647,  -647,  -647,  -647,    74,  -647,  -647,  -647,
    -647,  -647,    64,  -647,    -3,  -647,    65,  -647,   957,  1755,
     124,     5,   166,    -3,  -647,   114,    65,  -647,   682,   169,
     179,   192,   105,  -647,   213,  -647,   259,   221,   246,   248,
     256,   258,   262,   263,   265,   266,   267,  -647,  -647,   268,
     276,  -647,   291,   293,   295,   296,  -647,   298,  -647,  -647,
    -647,  -647,   110,  -647,  -647,  -647,  -647,  -647,  -647,  -647,
     178,  -647,   332,   259,   334,   781,  -647,   336,   337,   338,
    -647,  -647,   341,   342,   344,   781,   346,   348,   351,  -647,
     352,   245,   781,  -647,   355,  -647,   345,   353,   313,   226,
       5,  -647,  -647,  -647,   318,   230,  -647,  -647,  -647,  -647,
    -647,  -647,  -647,  -647,  -647,  -647,  -647,  -647,  -647,   375,
     376,   388,   390,  -647,  -647,    49,   395,   398,   405,   259,
     259,   409,   259,     4,  -647,   410,    34,   378,   259,   413,
     417,   418,   386,  -647,  -647,  -647,  -647,   366,    31,  -647,
      38,  -647,  -647,   781,   781,   781,   393,   394,   404,   407,
     408,  -647,   419,   420,   422,   426,   427,   428,   430,   431,
     432,   433,   440,   444,   445,   446,   449,   781,   781,  1564,
     367,  -647,   282,  -647,   299,    20,  -647,  -647,   525,  1936,
     307,  -647,  -647,   340,  -647,   439,  -647,  -647,  1936,   421,
     114,   114,   343,   121,   434,   354,   121,  -647,   781,  -647,
     278,    55,  -647,  -647,   -53,   357,  -647,  -647,   259,   435,
      85,  -647,   363,   362,   368,   372,   373,   374,   377,  -647,
    -647,    -4,    96,    24,   381,  -647,  -647,   452,    17,    34,
     383,   486,   494,   495,   781,   387,    -3,   781,   781,  -647,
     781,   781,  -647,  -647,   965,   781,   781,   781,   781,   781,
     500,   520,   781,   521,   533,   535,   536,   781,   781,   537,
     538,   781,   781,   781,   539,  -647,  -647,   781,   781,   781,
     781,   781,   781,   781,   781,   781,   781,   781,   781,   781,
     781,   781,   781,   781,   781,   781,   781,   781,   781,  1936,
     541,   543,  -647,   544,   781,   781,  1936,   273,   545,  -647,
      27,  -647,   402,   403,  -647,  -647,   548,  -647,  -647,  -647,
     -47,  -647,  1936,   682,  -647,   259,  -647,  -647,  -647,  -647,
    -647,  -647,  -647,   549,  -647,  -647,  1033,   517,  -647,  -647,
    -647,    49,   553,  -647,  -647,  -647,  -647,  -647,  -647,  -647,
     259,  -647,   259,   410,  -647,  -647,  -647,  -647,  -647,   522,
      88,  -647,    21,  -647,  -647,  -647,  -647,  1584,  -647,   -16,
    1936,  1936,  1779,  1936,  1936,  -647,   921,  1165,  1604,  1624,
    1185,   411,   412,  1205,   416,   423,   424,   425,  1644,  1664,
     437,   438,  1225,  1695,  1245,   443,  1896,  1776,  1145,  1951,
    1965,  1278,   856,   856,   406,   406,   406,   406,   442,   442,
     167,   167,  -647,  -647,  -647,  1936,  1936,  1936,  -647,  -647,
    -647,  1936,  1936,  -647,  -647,  -647,  -647,   556,   114,   277,
     121,   508,  -647,  -647,   -37,   622,  -647,   697,   622,   781,
     441,  -647,     3,   551,    49,  -647,   447,  -647,  -647,  -647,
      34,  -647,  -647,  -647,   531,  -647,   448,   450,   453,   565,
    -647,  -647,   781,  -647,  -647,   781,   781,  -647,   781,  -647,
    -647,  -647,  -647,  -647,  -647,   781,   781,  -647,  -647,  -647,
     566,  -647,  -647,   781,  -647,   455,   559,  -647,  -647,  -647,
     236,   542,  1807,   564,   479,  -647,  -647,  1916,   497,  -647,
    1936,    29,   589,  -647,   590,     2,  -647,   502,   562,  -647,
      30,    34,  -647,  -647,  -647,  -647,   463,  1265,  1298,  1318,
    1338,  1358,  1378,   464,  1936,   121,   555,   114,   114,  -647,
    -647,  -647,  -647,  -647,  -647,   466,   781,   -22,   585,  -647,
     567,   578,   392,  -647,  -647,   479,   561,   580,   584,  -647,
     473,  -647,  -647,  -647,   617,   477,  -647,  -647,    79,    34,
    -647,  -647,  -647,  -647,  -647,  -647,  -647,  -647,  -647,   489,
     455,  -647,  1398,  -647,   781,   601,   498,  -647,   546,  -647,
     781,    29,   781,   492,  -647,  -647,   550,  -647,    84,   121,
     587,   225,  1431,   781,  -647,   546,   607,  -647,   429,  1451,
    -647,  1471,  -647,  -647,   641,  -647,  -647,  -647,   611,   634,
    -647,  1491,  -647,   781,   593,  -647,  -647,    29,  -647,   781,
    -647,  -647,    95,  1511,  -647,  -647,  -647,  1531,  -647,  -647,
    -647,   596,  -647,  -647,   618,  -647,    63,   640,   864,  -647,
    -647,  -647,   621,  -647,  -647,  -647,  -647,  -647,  -647,  -647,
     620,   626,   627,   628,   259,   629,  -647,  -647,  -647,   630,
     631,   632,  -647,   311,  -647,   639,    15,  -647,  -647,  -647,
     864,   612,   642,   110,   623,   655,    94,   371,    72,    72,
    -647,  -647,   646,  -647,   680,    72,  -647,   648,  -647,   -39,
     311,   649,   311,   661,  -647,  -647,  -647,  -647,   864,   695,
     608,   672,   674,   563,   677,   569,   679,   683,   570,   572,
     573,   864,   574,  -647,   781,     8,  -647,    11,  -647,    14,
     102,  -647,   311,   122,   -15,   311,   655,   575,   666,  -647,
     701,  -647,    72,    72,  -647,    72,  -647,    72,    72,  -647,
    -647,  -647,   693,  -647,  1715,   581,   582,   728,  -647,    72,
    -647,  -647,  -647,  -647,   123,   608,  -647,  -647,   733,    91,
     592,   594,    41,   602,   603,  -647,   734,  -647,  -647,  -647,
    -647,  -647,  -647,  -647,  -647,   738,  -647,   605,   606,    72,
     609,   610,   614,    91,    91,  -647,  -647,   477,  -647,  -647,
     615,  -647,  -647,   110,  -647,  -647,  -647,  -647,  -647,   477,
     477,  -647,  -647
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -647,  -647,   -72,  -647,  -647,  -647,  -647,   507,  -647,  -647,
    -647,  -647,  -647,  -647,   625,  -647,  -647,  -647,  -647,   554,
    -647,  -647,  -647,  -225,  -647,  -647,  -647,  -647,  -459,   -13,
    -647,    68,  -398,  -647,  -647,    25,  -615,    46,  -647,  -647,
      99,  -647,  -647,  -647,  -612,  -647,    -9,  -493,  -647,  -646,
    -386,  -216,  -647,   322,  -647,   454,  -647,  -647,  -647,  -647,
    -647,  -647,   271,  -647,  -647,  -647,  -647,  -647,  -647,  -192,
    -105,  -647,   -75,    16,   228,  -647,  -647,   191,  -647,  -647,
    -647,  -647,  -647,  -647,  -647,  -647,  -647,  -647,  -647,  -647,
    -647,  -647,  -647,  -647,  -472,   356,  -647,  -647,    67,  -474,
    -647,  -647,  -647,  -647,  -647,  -647,  -647,  -647,  -647,  -647,
    -527,  -647,  -647,  -647,  -647,   763,  -647,  -647,  -647,  -647,
    -647,   552,   -20,  -647,   691,   -12,  -647,  -647,   227
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -341
static const yytype_int16 yytable[] =
{
     179,   149,   207,   101,   341,    61,   503,   503,   123,    93,
     189,   209,   745,   105,   362,   350,   352,   198,   686,   691,
     538,   357,   358,   643,   302,   357,   358,   697,   233,   643,
     643,   426,   747,   547,   357,   358,   542,   247,   235,   236,
     644,   354,    21,   460,   250,   686,   644,   644,   529,   530,
     531,   532,   533,   217,   600,    21,   643,   225,   226,   330,
     228,   230,   687,   651,   652,   653,   240,   639,    20,   687,
     651,   652,   653,   644,    17,   723,   686,   724,   252,   253,
       1,     2,     3,   357,   358,   432,   728,   643,   357,   358,
     625,     4,   452,   453,   333,   488,   334,   774,   686,   742,
       5,   433,   275,   276,   644,   299,   686,   775,   340,   643,
     754,   489,   721,   306,   331,   218,    22,   643,    93,   609,
     598,  -185,   640,    25,   359,   315,   644,   534,   359,    22,
      92,   548,   340,   322,   644,    94,   753,   359,    95,    96,
      97,   237,   121,   340,  -185,   349,   338,   798,   701,   702,
     660,   552,   661,   229,   504,   504,   701,   702,   663,   661,
     748,   449,   637,   749,   360,   692,   361,   303,   360,   367,
     455,   353,   370,   371,   427,   373,   374,   360,   248,   557,
     376,   377,   378,   379,   380,   251,   359,   383,   312,   313,
     779,   359,   388,   389,   703,   454,   392,   393,   394,   293,
     294,   295,   396,   397,   398,   399,   400,   401,   402,   403,
     404,   405,   406,   407,   408,   409,   410,   411,   412,   413,
     414,   415,   416,   417,   100,   510,   360,   117,   587,   421,
     422,   360,   340,   606,   628,   629,   630,   118,   704,   151,
     152,   119,   120,   340,    94,   351,   704,    95,   102,   103,
     122,   316,   673,   436,   317,   318,   319,   144,   145,   456,
     457,   458,   537,   123,   608,   688,   153,   154,   693,   340,
     340,   752,   770,   155,   156,   157,   423,   424,   447,   125,
     448,   315,   323,   126,   673,   127,   558,   158,   159,   160,
     794,   795,   688,   128,   688,   129,   161,   783,   784,   130,
     131,   162,   132,   133,   134,   135,   529,   530,   531,   532,
     533,   163,   673,   136,   147,   686,   164,   165,   166,   167,
     168,   169,   170,    61,   751,   673,   643,   688,   138,   171,
     139,   172,   140,   141,   588,   143,   148,   324,   150,   586,
     180,   181,   183,   644,   325,   186,   187,   173,   188,   101,
     190,   191,   326,   174,   175,   192,   196,    43,   197,   199,
     492,   200,   497,   492,   500,   687,   651,   652,   653,   201,
     151,   152,   202,   297,   203,   686,   327,   205,   206,   212,
     213,   176,    53,    54,    55,   534,   643,   517,   177,   178,
     518,   519,   214,   520,   215,    56,   323,   153,   154,   222,
     521,   522,   223,   644,   155,   156,   157,   316,   524,   224,
     317,   318,   486,   227,   233,   239,   485,   241,   158,   159,
     160,   242,   243,   244,   246,   706,   707,   161,   577,   300,
     255,   256,   162,   323,   289,   290,   291,   292,   293,   294,
     295,   257,   163,   309,   258,   259,   301,   164,   165,   166,
     167,   168,   169,   170,   307,   661,   260,   261,   325,   262,
     171,   572,   172,   263,   264,   265,   326,   266,   267,   268,
     269,    43,   291,   292,   293,   294,   295,   270,   173,   311,
     603,   271,   272,   273,   174,   175,   274,   308,   615,   356,
     327,   314,   364,   320,   339,   325,    53,    54,    55,   592,
     365,   366,   321,   326,   381,   599,   335,   601,    43,    56,
     342,   343,   176,   626,   298,   569,   570,   344,   611,   177,
     178,   345,   346,   347,   382,   384,   348,   327,   151,   152,
     355,   304,   363,    53,    54,    55,   368,   385,   623,   386,
     387,   390,   391,   395,   627,   418,    56,   419,   420,   425,
     429,   430,   431,   440,   442,   153,   154,   446,   468,   451,
     484,   469,   155,   156,   157,   471,   487,   507,   512,   516,
     523,   796,   472,   473,   474,   527,   158,   159,   160,   536,
     539,   540,   680,   801,   802,   161,   477,   478,   502,   544,
     162,   727,   482,   550,   551,   554,   509,   513,   556,   514,
     163,   573,   515,   525,   574,   164,   165,   166,   167,   168,
     169,   170,   560,   567,   568,   571,   575,   580,   171,   579,
     172,   582,   584,   585,   340,   151,   152,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   173,   589,   593,   744,
     602,   594,   174,   175,   613,   604,   607,   618,   619,   596,
     620,   624,   153,   154,   635,   537,   641,   676,  -113,   490,
     156,   157,   491,   677,   678,   679,   681,   683,   684,   685,
     176,   695,   305,   158,   159,   160,   690,   177,   178,   696,
     699,   698,   161,   714,   716,   720,  -113,   162,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   163,   725,   729,
     151,   152,   164,   165,   166,   167,   168,   169,   170,   732,
     730,   733,   734,   496,   735,   171,   737,   172,   736,   739,
     738,   740,   741,   743,   756,   757,   758,   153,   154,   765,
    -134,   767,   768,   173,   155,   156,   157,   773,   782,   174,
     175,   777,   786,   778,   705,   708,   709,   710,   158,   159,
     160,   780,   781,   718,   788,   789,   372,   161,   791,   792,
     762,   746,   162,   793,   797,   785,   508,   176,   245,   694,
     336,   771,   163,   578,   177,   178,   553,   164,   165,   166,
     167,   168,   169,   170,   151,   152,   612,   750,   705,   106,
     171,   204,   172,   755,   499,   445,     0,   590,   369,     0,
     760,   761,     0,   718,     0,   763,   764,     0,   173,     0,
       0,   153,   154,     0,   174,   175,     0,   769,   155,   156,
     157,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     750,     0,   158,   159,   160,     0,     0,     0,     0,     0,
       0,   161,   176,     0,     0,     0,   162,   790,     0,   177,
     178,     0,     0,     0,     0,     0,   163,     0,     0,     0,
       0,   164,   165,   166,   167,   168,   169,   170,   642,     0,
       0,     0,     0,     0,   171,     0,   172,     0,     0,   643,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,     0,   173,     0,     0,     0,   644,     0,   174,   175,
       0,     0,     0,     0,     0,   645,   646,   647,   648,   649,
       0,     0,     0,     0,     0,     0,     0,     0,   650,   651,
     652,   653,     0,     0,     0,     0,   176,     0,     0,     0,
     654,     0,     0,   177,   178,     0,   277,     0,   278,   279,
     280,   281,   282,   283,   284,   285,   286,   287,   288,   289,
     290,   291,   292,   293,   294,   295,     0,     0,   655,     0,
     656,    28,     0,     0,   657,     0,     0,     0,    53,    54,
      55,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     277,   658,   278,   279,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
       0,     0,   659,    29,    30,    31,   660,     0,   661,     0,
       0,     0,   662,     0,   663,     0,     0,     0,    32,    33,
      34,    35,     0,    36,    37,    38,    39,     0,     0,     0,
       0,     0,     0,    40,    41,    42,    43,    28,     0,     0,
       0,     0,     0,     0,    44,    45,    46,    47,    48,    49,
       0,     0,     0,     0,    50,    51,    52,     0,     0,     0,
       0,    53,    54,    55,     0,     0,     0,     0,   462,   441,
     463,     0,     0,     0,    56,     0,     0,     0,     0,    29,
      30,    31,     0,     0,     0,     0,     0,    57,     0,     0,
       0,     0,     0,  -340,    32,    33,    34,    35,     0,    36,
      37,    38,    39,     0,     0,    58,     0,     0,     0,    40,
      41,    42,    43,     0,   375,     0,     0,     0,     0,     0,
      44,    45,    46,    47,    48,    49,     0,     0,     0,     0,
      50,    51,    52,     0,     0,     0,     0,    53,    54,    55,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      56,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    57,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     277,    58,   278,   279,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     277,     0,   278,   279,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     277,     0,   278,   279,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     277,     0,   278,   279,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     277,     0,   278,   279,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     277,     0,   278,   279,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   294,   295,   277,   464,   278,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   294,   295,   277,   467,   278,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   294,   295,   277,   470,   278,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   294,   295,   277,   479,   278,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   294,   295,   277,   481,   278,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   294,   295,   277,   561,   278,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   277,   562,   278,   279,
     280,   281,   282,   283,   284,   285,   286,   287,   288,   289,
     290,   291,   292,   293,   294,   295,   277,   563,   278,   279,
     280,   281,   282,   283,   284,   285,   286,   287,   288,   289,
     290,   291,   292,   293,   294,   295,   277,   564,   278,   279,
     280,   281,   282,   283,   284,   285,   286,   287,   288,   289,
     290,   291,   292,   293,   294,   295,   277,   565,   278,   279,
     280,   281,   282,   283,   284,   285,   286,   287,   288,   289,
     290,   291,   292,   293,   294,   295,   277,   566,   278,   279,
     280,   281,   282,   283,   284,   285,   286,   287,   288,   289,
     290,   291,   292,   293,   294,   295,   277,   591,   278,   279,
     280,   281,   282,   283,   284,   285,   286,   287,   288,   289,
     290,   291,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   277,
     610,   278,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   277,
     616,   278,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   277,
     617,   278,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   277,
     621,   278,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   277,
     632,   278,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   277,
     634,   278,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     277,   296,   278,   279,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     277,   459,   278,   279,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
       0,   465,     0,     0,     0,     0,     0,     0,     0,    71,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   466,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    71,     0,     0,     0,     0,     0,     0,
       0,   475,     0,    72,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   476,     0,     0,     0,   461,     0,    72,     0,     0,
       0,    73,   277,     0,   278,   279,   280,   281,   282,   283,
     284,   285,   286,   287,   288,   289,   290,   291,   292,   293,
     294,   295,   480,     0,   537,    73,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    74,     0,     0,     0,
       0,     0,   766,    75,    76,    77,    78,    79,   -43,    80,
      81,    82,     0,     0,    83,    84,     0,    85,    86,    87,
      74,     0,     0,     0,    88,    89,    90,    75,    76,    77,
      78,    79,     0,    80,    81,    82,     0,     0,    83,    84,
       0,    85,    86,    87,     0,     0,     0,     0,    88,    89,
      90,   277,   483,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   277,   543,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   277,     0,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   281,   282,   283,   284,   285,   286,   287,   288,   289,
     290,   291,   292,   293,   294,   295,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295
};

static const yytype_int16 yycheck[] =
{
      75,    73,   107,    23,   220,    18,     4,     4,     4,     4,
      85,   116,     4,    25,   239,   231,   232,    92,     4,     4,
     492,     4,     5,    15,     4,     4,     5,   673,     4,    15,
      15,     4,    21,     4,     4,     5,   495,     6,     4,     5,
      32,   233,    58,    59,     6,     4,    32,    32,    70,    71,
      72,    73,    74,     4,   581,    58,    15,   129,   130,     4,
     132,   133,    54,    55,    56,    57,   138,     4,     4,    54,
      55,    56,    57,    32,     0,   690,     4,   692,   153,   154,
     126,   127,   128,     4,     5,   132,   698,    15,     4,     5,
     617,   137,     4,     5,   147,   132,   149,     6,     4,   711,
     146,   148,   177,   178,    32,   180,     4,    16,   147,    15,
     725,   148,   151,   188,    59,    66,   132,    15,     4,   591,
     579,    36,    59,    58,   107,     4,    32,   149,   107,   132,
       6,   102,   147,   208,    32,   130,   151,   107,   133,   134,
     135,   107,    37,   147,    59,   149,   218,   793,    54,    55,
     142,   149,   144,   149,   152,   152,    54,    55,   150,   144,
     149,   353,   634,   149,   147,   150,   149,   147,   147,   244,
     149,   147,   247,   248,   147,   250,   251,   147,   147,   149,
     255,   256,   257,   258,   259,   147,   107,   262,   200,   201,
     149,   107,   267,   268,   100,   107,   271,   272,   273,    32,
      33,    34,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,    58,   450,   147,    58,   149,   304,
     305,   147,   147,   149,   139,   140,   141,    58,   144,     3,
       4,    49,    50,   147,   130,   149,   144,   133,   134,   135,
      37,   130,   638,   325,   133,   134,   135,   147,   148,   364,
     365,   366,    37,     4,    39,   663,    30,    31,   666,   147,
     147,   149,   149,    37,    38,    39,     3,     4,   350,    58,
     352,     4,     4,    37,   670,    37,   511,    51,    52,    53,
     783,   784,   690,    37,   692,    37,    60,   771,   772,    37,
      37,    65,    37,    37,    37,    37,    70,    71,    72,    73,
      74,    75,   698,    37,   136,     4,    80,    81,    82,    83,
      84,    85,    86,   336,   722,   711,    15,   725,    37,    93,
      37,    95,    37,    37,   559,    37,     4,    59,     4,   555,
       4,     4,     4,    32,    66,     4,     4,   111,     4,   369,
       4,     3,    74,   117,   118,     4,     4,    79,   113,     4,
     435,    16,   437,   438,   439,    54,    55,    56,    57,    16,
       3,     4,    59,     6,   148,     4,    98,    59,   148,     4,
       4,   145,   104,   105,   106,   149,    15,   462,   152,   153,
     465,   466,     4,   468,     4,   117,     4,    30,    31,     4,
     475,   476,     4,    32,    37,    38,    39,   130,   483,     4,
     133,   134,   135,     4,     4,    37,   428,     4,    51,    52,
      53,     4,     4,    37,    58,    54,    55,    60,    36,   147,
      37,    37,    65,     4,    28,    29,    30,    31,    32,    33,
      34,    37,    75,     4,    37,    37,   147,    80,    81,    82,
      83,    84,    85,    86,   147,   144,    37,    37,    66,    37,
      93,   536,    95,    37,    37,    37,    74,    37,    37,    37,
      37,    79,    30,    31,    32,    33,    34,    37,   111,    58,
     585,    37,    37,    37,   117,   118,    37,   147,    59,    37,
      98,   148,     6,    59,    59,    66,   104,   105,   106,   574,
       6,     6,   148,    74,     4,   580,   149,   582,    79,   117,
     147,   149,   145,   618,   147,   527,   528,   149,   593,   152,
     153,   149,   149,   149,     4,     4,   149,    98,     3,     4,
     149,     6,   149,   104,   105,   106,   149,     4,   613,     4,
       4,     4,     4,     4,   619,     4,   117,     4,     4,     4,
     148,   148,     4,     4,    37,    30,    31,     4,   147,    37,
       4,   149,    37,    38,    39,   149,    58,    16,    37,     4,
       4,   787,   149,   149,   149,    16,    51,    52,    53,    37,
      16,   102,   654,   799,   800,    60,   149,   149,   147,    92,
      65,   696,   149,     4,     4,    93,   149,   149,    36,   149,
      75,    16,   149,   148,    37,    80,    81,    82,    83,    84,
      85,    86,   149,   149,    59,   149,    38,    37,    93,    58,
      95,    37,   149,     6,   147,     3,     4,     6,     7,     8,
       9,    10,    11,    12,    13,    14,   111,   148,    37,   714,
     148,   143,   117,   118,    37,    95,    59,     6,    37,   103,
      16,    58,    30,    31,    58,    37,    16,    37,    37,    37,
      38,    39,    40,    37,    37,    37,    37,    37,    37,    37,
     145,    59,   147,    51,    52,    53,    37,   152,   153,    37,
      25,    58,    60,    37,     4,    37,    37,    65,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    75,    37,     4,
       3,     4,    80,    81,    82,    83,    84,    85,    86,    37,
     102,    37,   149,    16,    37,    93,    37,    95,   149,   149,
      37,   149,   149,   149,   149,    59,    25,    30,    31,    36,
     149,   149,     4,   111,    37,    38,    39,     4,     4,   117,
     118,   149,     4,   149,   676,   677,   678,   679,    51,    52,
      53,   149,   149,   685,   149,   149,   249,    60,   149,   149,
     735,   715,    65,   149,   149,   774,   444,   145,   143,   670,
     216,   755,    75,   545,   152,   153,   505,    80,    81,    82,
      83,    84,    85,    86,     3,     4,   595,   719,   720,    26,
      93,   100,    95,   726,   438,   341,    -1,   570,   246,    -1,
     732,   733,    -1,   735,    -1,   737,   738,    -1,   111,    -1,
      -1,    30,    31,    -1,   117,   118,    -1,   749,    37,    38,
      39,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     762,    -1,    51,    52,    53,    -1,    -1,    -1,    -1,    -1,
      -1,    60,   145,    -1,    -1,    -1,    65,   779,    -1,   152,
     153,    -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,
      -1,    80,    81,    82,    83,    84,    85,    86,     4,    -1,
      -1,    -1,    -1,    -1,    93,    -1,    95,    -1,    -1,    15,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    -1,   111,    -1,    -1,    -1,    32,    -1,   117,   118,
      -1,    -1,    -1,    -1,    -1,    41,    42,    43,    44,    45,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    54,    55,
      56,    57,    -1,    -1,    -1,    -1,   145,    -1,    -1,    -1,
      66,    -1,    -1,   152,   153,    -1,    15,    -1,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    -1,    -1,    94,    -1,
      96,     4,    -1,    -1,   100,    -1,    -1,    -1,   104,   105,
     106,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      15,   117,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      -1,    -1,   138,    46,    47,    48,   142,    -1,   144,    -1,
      -1,    -1,   148,    -1,   150,    -1,    -1,    -1,    61,    62,
      63,    64,    -1,    66,    67,    68,    69,    -1,    -1,    -1,
      -1,    -1,    -1,    76,    77,    78,    79,     4,    -1,    -1,
      -1,    -1,    -1,    -1,    87,    88,    89,    90,    91,    92,
      -1,    -1,    -1,    -1,    97,    98,    99,    -1,    -1,    -1,
      -1,   104,   105,   106,    -1,    -1,    -1,    -1,   147,    36,
     149,    -1,    -1,    -1,   117,    -1,    -1,    -1,    -1,    46,
      47,    48,    -1,    -1,    -1,    -1,    -1,   130,    -1,    -1,
      -1,    -1,    -1,   136,    61,    62,    63,    64,    -1,    66,
      67,    68,    69,    -1,    -1,   148,    -1,    -1,    -1,    76,
      77,    78,    79,    -1,   149,    -1,    -1,    -1,    -1,    -1,
      87,    88,    89,    90,    91,    92,    -1,    -1,    -1,    -1,
      97,    98,    99,    -1,    -1,    -1,    -1,   104,   105,   106,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     117,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   130,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      15,   148,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      15,    -1,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      15,    -1,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      15,    -1,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      15,    -1,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      15,    -1,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    15,   149,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    15,   149,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    15,   149,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    15,   149,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    15,   149,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    15,   149,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    15,   149,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    15,   149,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    15,   149,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    15,   149,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    15,   149,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    15,   149,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    15,
     149,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    15,
     149,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    15,
     149,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    15,
     149,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    15,
     149,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    15,
     149,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      15,   147,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      15,   147,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      -1,   147,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     4,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   147,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     4,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   147,    -1,    38,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,   147,    -1,    -1,    -1,    36,    -1,    38,    -1,    -1,
      -1,    66,    15,    -1,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,   147,    -1,    37,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,
      -1,    -1,   147,   108,   109,   110,   111,   112,   113,   114,
     115,   116,    -1,    -1,   119,   120,    -1,   122,   123,   124,
     101,    -1,    -1,    -1,   129,   130,   131,   108,   109,   110,
     111,   112,    -1,   114,   115,   116,    -1,    -1,   119,   120,
      -1,   122,   123,   124,    -1,    -1,    -1,    -1,   129,   130,
     131,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    15,    -1,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,   126,   127,   128,   137,   146,   155,   171,   172,   159,
     160,   157,   158,   271,   272,   266,   267,     0,   173,   161,
       4,    58,   132,   275,   276,    58,   268,   269,     4,    46,
      47,    48,    61,    62,    63,    64,    66,    67,    68,    69,
      76,    77,    78,    79,    87,    88,    89,    90,    91,    92,
      97,    98,    99,   104,   105,   106,   117,   130,   148,   174,
     181,   183,   204,   206,   217,   218,   220,   222,   258,   273,
     274,     4,    38,    66,   101,   108,   109,   110,   111,   112,
     114,   115,   116,   119,   120,   122,   123,   124,   129,   130,
     131,   162,     6,     4,   130,   133,   134,   135,   278,   279,
      58,   276,   134,   135,   270,   279,   269,     6,     7,     8,
       9,    10,    11,    12,    13,    14,   202,    58,    58,    49,
      50,    37,    37,     4,   156,    58,    37,    37,    37,    37,
      37,    37,    37,    37,    37,    37,    37,   175,    37,    37,
      37,    37,   184,    37,   147,   148,   203,   136,     4,   156,
       4,     3,     4,    30,    31,    37,    38,    39,    51,    52,
      53,    60,    65,    75,    80,    81,    82,    83,    84,    85,
      86,    93,    95,   111,   117,   118,   145,   152,   153,   226,
       4,     4,   166,     4,   165,   164,     4,     4,     4,   226,
       4,     3,     4,   167,   168,   169,     4,   113,   226,     4,
      16,    16,    59,   148,   278,    59,   148,   224,   225,   224,
     182,   259,     4,     4,     4,     4,   176,     4,    66,   207,
     208,   209,     4,     4,     4,   156,   156,     4,   156,   149,
     156,   219,   221,     4,   223,     4,     5,   107,   177,    37,
     156,     4,     4,     4,    37,   168,    58,     6,   147,   163,
       6,   147,   226,   226,   226,    37,    37,    37,    37,    37,
      37,    37,    37,    37,    37,    37,    37,    37,    37,    37,
      37,    37,    37,    37,    37,   226,   226,    15,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,   147,     6,   147,   226,
     147,   147,     4,   147,     6,   147,   226,   147,   147,     4,
     170,    58,   279,   279,   148,     4,   130,   133,   134,   135,
      59,   148,   226,     4,    59,    66,    74,    98,   183,   233,
       4,    59,   260,   147,   149,   149,   173,   210,   156,    59,
     147,   205,   147,   149,   149,   149,   149,   149,   149,   149,
     205,   149,   205,   147,   223,   149,    37,     4,     5,   107,
     147,   149,   177,   149,     6,     6,     6,   226,   149,   275,
     226,   226,   161,   226,   226,   149,   226,   226,   226,   226,
     226,     4,     4,   226,     4,     4,     4,     4,   226,   226,
       4,     4,   226,   226,   226,     4,   226,   226,   226,   226,
     226,   226,   226,   226,   226,   226,   226,   226,   226,   226,
     226,   226,   226,   226,   226,   226,   226,   226,     4,     4,
       4,   226,   226,     3,     4,     4,     4,   147,   281,   148,
     148,     4,   132,   148,   277,   234,   156,   239,   244,   261,
       4,    36,    37,   214,   211,   209,     4,   156,   156,   223,
     178,    37,     4,     5,   107,   149,   224,   224,   224,   147,
      59,    36,   147,   149,   149,   147,   147,   149,   147,   149,
     149,   149,   149,   149,   149,   147,   147,   149,   149,   149,
     147,   149,   149,    16,     4,   279,   135,    58,   132,   148,
      37,    40,   226,   248,   249,   246,    16,   226,   250,   249,
     226,   263,   147,     4,   152,   215,   216,    16,   207,   149,
     177,   180,    37,   149,   149,   149,     4,   226,   226,   226,
     226,   226,   226,     4,   226,   148,   282,    16,   280,    70,
      71,    72,    73,    74,   149,   247,    37,    37,   248,    16,
     102,   228,   182,    16,    92,   251,   245,     4,   102,   264,
       4,     4,   149,   216,    93,   212,    36,   149,   177,   179,
     149,   149,   149,   149,   149,   149,   149,   149,    59,   279,
     279,   149,   226,    16,    37,    38,   229,    36,   228,    58,
      37,   265,    37,   262,   149,     6,   205,   149,   177,   148,
     282,   149,   226,    37,   143,   230,   103,   231,   182,   226,
     264,   226,   148,   224,    95,   213,   149,    59,    39,   248,
     149,   226,   231,    37,   240,    59,   149,   149,     6,    37,
      16,   149,   235,   226,    58,   264,   224,   226,   139,   140,
     141,   232,   149,   241,   149,    58,   254,   248,   236,     4,
      59,    16,     4,    15,    32,    41,    42,    43,    44,    45,
      54,    55,    56,    57,    66,    94,    96,   100,   117,   138,
     142,   144,   148,   150,   185,   186,   188,   191,   192,   194,
     197,   198,   199,   204,   255,   242,    37,    37,    37,    37,
     156,    37,   195,    37,    37,    37,     4,    54,   186,   190,
      37,     4,   150,   186,   194,    59,    37,   203,    58,    25,
     252,    54,    55,   100,   144,   185,    54,    55,   185,   185,
     185,   196,   200,   224,    37,   193,     4,   187,   185,   189,
      37,   151,   205,   190,   190,    37,   237,   224,   198,     4,
     102,   227,    37,    37,   149,    37,   149,    37,    37,   149,
     149,   149,   198,   149,   226,     4,   191,    21,   149,   149,
     185,   186,   149,   151,   190,   252,   149,    59,    25,   253,
     185,   185,   189,   185,   185,    36,   147,   149,     4,   185,
     149,   227,   256,     4,     6,    16,   201,   149,   149,   149,
     149,   149,     4,   253,   253,   200,     4,   243,   149,   149,
     185,   149,   149,   149,   201,   201,   205,   149,   203,   238,
     257,   205,   205
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  
  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 8:
#line 178 "ldgram.y"
    { ldlex_defsym(); }
    break;

  case 9:
#line 180 "ldgram.y"
    {
		  ldlex_popstate();
		  lang_add_assignment (exp_defsym ((yyvsp[(2) - (4)].name), (yyvsp[(4) - (4)].etree)));
		}
    break;

  case 10:
#line 188 "ldgram.y"
    {
		  ldlex_mri_script ();
		  PUSH_ERROR (_("MRI style script"));
		}
    break;

  case 11:
#line 193 "ldgram.y"
    {
		  ldlex_popstate ();
		  mri_draw_tree ();
		  POP_ERROR ();
		}
    break;

  case 16:
#line 208 "ldgram.y"
    {
			einfo(_("%P%F: unrecognised keyword in MRI style script '%s'\n"),(yyvsp[(1) - (1)].name));
			}
    break;

  case 17:
#line 211 "ldgram.y"
    {
			config.map_filename = "-";
			}
    break;

  case 20:
#line 217 "ldgram.y"
    { mri_public((yyvsp[(2) - (4)].name), (yyvsp[(4) - (4)].etree)); }
    break;

  case 21:
#line 219 "ldgram.y"
    { mri_public((yyvsp[(2) - (4)].name), (yyvsp[(4) - (4)].etree)); }
    break;

  case 22:
#line 221 "ldgram.y"
    { mri_public((yyvsp[(2) - (3)].name), (yyvsp[(3) - (3)].etree)); }
    break;

  case 23:
#line 223 "ldgram.y"
    { mri_format((yyvsp[(2) - (2)].name)); }
    break;

  case 24:
#line 225 "ldgram.y"
    { mri_output_section((yyvsp[(2) - (4)].name), (yyvsp[(4) - (4)].etree));}
    break;

  case 25:
#line 227 "ldgram.y"
    { mri_output_section((yyvsp[(2) - (3)].name), (yyvsp[(3) - (3)].etree));}
    break;

  case 26:
#line 229 "ldgram.y"
    { mri_output_section((yyvsp[(2) - (4)].name), (yyvsp[(4) - (4)].etree));}
    break;

  case 27:
#line 231 "ldgram.y"
    { mri_align((yyvsp[(2) - (4)].name),(yyvsp[(4) - (4)].etree)); }
    break;

  case 28:
#line 233 "ldgram.y"
    { mri_align((yyvsp[(2) - (4)].name),(yyvsp[(4) - (4)].etree)); }
    break;

  case 29:
#line 235 "ldgram.y"
    { mri_alignmod((yyvsp[(2) - (4)].name),(yyvsp[(4) - (4)].etree)); }
    break;

  case 30:
#line 237 "ldgram.y"
    { mri_alignmod((yyvsp[(2) - (4)].name),(yyvsp[(4) - (4)].etree)); }
    break;

  case 33:
#line 241 "ldgram.y"
    { mri_name((yyvsp[(2) - (2)].name)); }
    break;

  case 34:
#line 243 "ldgram.y"
    { mri_alias((yyvsp[(2) - (4)].name),(yyvsp[(4) - (4)].name),0);}
    break;

  case 35:
#line 245 "ldgram.y"
    { mri_alias ((yyvsp[(2) - (4)].name), 0, (int) (yyvsp[(4) - (4)].bigint).integer); }
    break;

  case 36:
#line 247 "ldgram.y"
    { mri_base((yyvsp[(2) - (2)].etree)); }
    break;

  case 37:
#line 249 "ldgram.y"
    { mri_truncate ((unsigned int) (yyvsp[(2) - (2)].bigint).integer); }
    break;

  case 40:
#line 253 "ldgram.y"
    { ldlex_script (); ldfile_open_command_file((yyvsp[(2) - (2)].name)); }
    break;

  case 41:
#line 255 "ldgram.y"
    { ldlex_popstate (); }
    break;

  case 42:
#line 257 "ldgram.y"
    { lang_add_entry ((yyvsp[(2) - (2)].name), FALSE); }
    break;

  case 44:
#line 262 "ldgram.y"
    { mri_order((yyvsp[(3) - (3)].name)); }
    break;

  case 45:
#line 263 "ldgram.y"
    { mri_order((yyvsp[(2) - (2)].name)); }
    break;

  case 47:
#line 269 "ldgram.y"
    { mri_load((yyvsp[(1) - (1)].name)); }
    break;

  case 48:
#line 270 "ldgram.y"
    { mri_load((yyvsp[(3) - (3)].name)); }
    break;

  case 49:
#line 275 "ldgram.y"
    { mri_only_load((yyvsp[(1) - (1)].name)); }
    break;

  case 50:
#line 277 "ldgram.y"
    { mri_only_load((yyvsp[(3) - (3)].name)); }
    break;

  case 51:
#line 281 "ldgram.y"
    { (yyval.name) = NULL; }
    break;

  case 54:
#line 288 "ldgram.y"
    { ldlex_expression (); }
    break;

  case 55:
#line 290 "ldgram.y"
    { ldlex_popstate (); }
    break;

  case 56:
#line 294 "ldgram.y"
    { ldlang_add_undef ((yyvsp[(1) - (1)].name), FALSE); }
    break;

  case 57:
#line 296 "ldgram.y"
    { ldlang_add_undef ((yyvsp[(2) - (2)].name), FALSE); }
    break;

  case 58:
#line 298 "ldgram.y"
    { ldlang_add_undef ((yyvsp[(3) - (3)].name), FALSE); }
    break;

  case 59:
#line 302 "ldgram.y"
    { ldlex_both(); }
    break;

  case 60:
#line 304 "ldgram.y"
    { ldlex_popstate(); }
    break;

  case 73:
#line 325 "ldgram.y"
    { lang_add_target((yyvsp[(3) - (4)].name)); }
    break;

  case 74:
#line 327 "ldgram.y"
    { ldfile_add_library_path ((yyvsp[(3) - (4)].name), FALSE); }
    break;

  case 75:
#line 329 "ldgram.y"
    { lang_add_output((yyvsp[(3) - (4)].name), 1); }
    break;

  case 76:
#line 331 "ldgram.y"
    { lang_add_output_format ((yyvsp[(3) - (4)].name), (char *) NULL,
					    (char *) NULL, 1); }
    break;

  case 77:
#line 334 "ldgram.y"
    { lang_add_output_format ((yyvsp[(3) - (8)].name), (yyvsp[(5) - (8)].name), (yyvsp[(7) - (8)].name), 1); }
    break;

  case 78:
#line 336 "ldgram.y"
    { ldfile_set_output_arch ((yyvsp[(3) - (4)].name), bfd_arch_unknown); }
    break;

  case 79:
#line 338 "ldgram.y"
    { command_line.force_common_definition = TRUE ; }
    break;

  case 80:
#line 340 "ldgram.y"
    { command_line.inhibit_common_definition = TRUE ; }
    break;

  case 82:
#line 343 "ldgram.y"
    { lang_enter_group (); }
    break;

  case 83:
#line 345 "ldgram.y"
    { lang_leave_group (); }
    break;

  case 84:
#line 347 "ldgram.y"
    { lang_add_map((yyvsp[(3) - (4)].name)); }
    break;

  case 85:
#line 349 "ldgram.y"
    { ldlex_script (); ldfile_open_command_file((yyvsp[(2) - (2)].name)); }
    break;

  case 86:
#line 351 "ldgram.y"
    { ldlex_popstate (); }
    break;

  case 87:
#line 353 "ldgram.y"
    {
		  lang_add_nocrossref ((yyvsp[(3) - (4)].nocrossref));
		}
    break;

  case 89:
#line 358 "ldgram.y"
    { lang_add_insert ((yyvsp[(3) - (3)].name), 0); }
    break;

  case 90:
#line 360 "ldgram.y"
    { lang_add_insert ((yyvsp[(3) - (3)].name), 1); }
    break;

  case 91:
#line 362 "ldgram.y"
    { lang_memory_region_alias ((yyvsp[(3) - (6)].name), (yyvsp[(5) - (6)].name)); }
    break;

  case 92:
#line 364 "ldgram.y"
    { lang_ld_feature ((yyvsp[(3) - (4)].name)); }
    break;

  case 93:
#line 369 "ldgram.y"
    { lang_add_input_file((yyvsp[(1) - (1)].name),lang_input_file_is_search_file_enum,
				 (char *)NULL); }
    break;

  case 94:
#line 372 "ldgram.y"
    { lang_add_input_file((yyvsp[(3) - (3)].name),lang_input_file_is_search_file_enum,
				 (char *)NULL); }
    break;

  case 95:
#line 375 "ldgram.y"
    { lang_add_input_file((yyvsp[(2) - (2)].name),lang_input_file_is_search_file_enum,
				 (char *)NULL); }
    break;

  case 96:
#line 378 "ldgram.y"
    { lang_add_input_file((yyvsp[(1) - (1)].name),lang_input_file_is_l_enum,
				 (char *)NULL); }
    break;

  case 97:
#line 381 "ldgram.y"
    { lang_add_input_file((yyvsp[(3) - (3)].name),lang_input_file_is_l_enum,
				 (char *)NULL); }
    break;

  case 98:
#line 384 "ldgram.y"
    { lang_add_input_file((yyvsp[(2) - (2)].name),lang_input_file_is_l_enum,
				 (char *)NULL); }
    break;

  case 99:
#line 387 "ldgram.y"
    { (yyval.integer) = input_flags.add_DT_NEEDED_for_regular;
		    input_flags.add_DT_NEEDED_for_regular = TRUE; }
    break;

  case 100:
#line 390 "ldgram.y"
    { input_flags.add_DT_NEEDED_for_regular = (yyvsp[(3) - (5)].integer); }
    break;

  case 101:
#line 392 "ldgram.y"
    { (yyval.integer) = input_flags.add_DT_NEEDED_for_regular;
		    input_flags.add_DT_NEEDED_for_regular = TRUE; }
    break;

  case 102:
#line 395 "ldgram.y"
    { input_flags.add_DT_NEEDED_for_regular = (yyvsp[(5) - (7)].integer); }
    break;

  case 103:
#line 397 "ldgram.y"
    { (yyval.integer) = input_flags.add_DT_NEEDED_for_regular;
		    input_flags.add_DT_NEEDED_for_regular = TRUE; }
    break;

  case 104:
#line 400 "ldgram.y"
    { input_flags.add_DT_NEEDED_for_regular = (yyvsp[(4) - (6)].integer); }
    break;

  case 109:
#line 415 "ldgram.y"
    { lang_add_entry ((yyvsp[(3) - (4)].name), FALSE); }
    break;

  case 111:
#line 417 "ldgram.y"
    {ldlex_expression ();}
    break;

  case 112:
#line 418 "ldgram.y"
    { ldlex_popstate ();
		  lang_add_assignment (exp_assert ((yyvsp[(4) - (7)].etree), (yyvsp[(6) - (7)].name))); }
    break;

  case 113:
#line 426 "ldgram.y"
    {
			  (yyval.cname) = (yyvsp[(1) - (1)].name);
			}
    break;

  case 114:
#line 430 "ldgram.y"
    {
			  (yyval.cname) = "*";
			}
    break;

  case 115:
#line 434 "ldgram.y"
    {
			  (yyval.cname) = "?";
			}
    break;

  case 116:
#line 441 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(1) - (1)].cname);
			  (yyval.wildcard).sorted = none;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 117:
#line 448 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(5) - (5)].cname);
			  (yyval.wildcard).sorted = none;
			  (yyval.wildcard).exclude_name_list = (yyvsp[(3) - (5)].name_list);
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 118:
#line 455 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(3) - (4)].cname);
			  (yyval.wildcard).sorted = by_name;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 119:
#line 462 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(3) - (4)].cname);
			  (yyval.wildcard).sorted = by_alignment;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 120:
#line 469 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(3) - (4)].cname);
			  (yyval.wildcard).sorted = by_none;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 121:
#line 476 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(5) - (7)].cname);
			  (yyval.wildcard).sorted = by_name_alignment;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 122:
#line 483 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(5) - (7)].cname);
			  (yyval.wildcard).sorted = by_name;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 123:
#line 490 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(5) - (7)].cname);
			  (yyval.wildcard).sorted = by_alignment_name;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 124:
#line 497 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(5) - (7)].cname);
			  (yyval.wildcard).sorted = by_alignment;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 125:
#line 504 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(7) - (8)].cname);
			  (yyval.wildcard).sorted = by_name;
			  (yyval.wildcard).exclude_name_list = (yyvsp[(5) - (8)].name_list);
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 126:
#line 511 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(3) - (4)].cname);
			  (yyval.wildcard).sorted = by_init_priority;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 127:
#line 520 "ldgram.y"
    {
			  struct flag_info_list *n;
			  n = ((struct flag_info_list *) xmalloc (sizeof *n));
			  if ((yyvsp[(1) - (1)].name)[0] == '!')
			    {
			      n->with = without_flags;
			      n->name = &(yyvsp[(1) - (1)].name)[1];
			    }
			  else
			    {
			      n->with = with_flags;
			      n->name = (yyvsp[(1) - (1)].name);
			    }
			  n->valid = FALSE;
			  n->next = NULL;
			  (yyval.flag_info_list) = n;
			}
    break;

  case 128:
#line 538 "ldgram.y"
    {
			  struct flag_info_list *n;
			  n = ((struct flag_info_list *) xmalloc (sizeof *n));
			  if ((yyvsp[(3) - (3)].name)[0] == '!')
			    {
			      n->with = without_flags;
			      n->name = &(yyvsp[(3) - (3)].name)[1];
			    }
			  else
			    {
			      n->with = with_flags;
			      n->name = (yyvsp[(3) - (3)].name);
			    }
			  n->valid = FALSE;
			  n->next = (yyvsp[(1) - (3)].flag_info_list);
			  (yyval.flag_info_list) = n;
			}
    break;

  case 129:
#line 559 "ldgram.y"
    {
			  struct flag_info *n;
			  n = ((struct flag_info *) xmalloc (sizeof *n));
			  n->flag_list = (yyvsp[(3) - (4)].flag_info_list);
			  n->flags_initialized = FALSE;
			  n->not_with_flags = 0;
			  n->only_with_flags = 0;
			  (yyval.flag_info) = n;
			}
    break;

  case 130:
#line 572 "ldgram.y"
    {
			  struct name_list *tmp;
			  tmp = (struct name_list *) xmalloc (sizeof *tmp);
			  tmp->name = (yyvsp[(2) - (2)].cname);
			  tmp->next = (yyvsp[(1) - (2)].name_list);
			  (yyval.name_list) = tmp;
			}
    break;

  case 131:
#line 581 "ldgram.y"
    {
			  struct name_list *tmp;
			  tmp = (struct name_list *) xmalloc (sizeof *tmp);
			  tmp->name = (yyvsp[(1) - (1)].cname);
			  tmp->next = NULL;
			  (yyval.name_list) = tmp;
			}
    break;

  case 132:
#line 592 "ldgram.y"
    {
			  struct wildcard_list *tmp;
			  tmp = (struct wildcard_list *) xmalloc (sizeof *tmp);
			  tmp->next = (yyvsp[(1) - (3)].wildcard_list);
			  tmp->spec = (yyvsp[(3) - (3)].wildcard);
			  (yyval.wildcard_list) = tmp;
			}
    break;

  case 133:
#line 601 "ldgram.y"
    {
			  struct wildcard_list *tmp;
			  tmp = (struct wildcard_list *) xmalloc (sizeof *tmp);
			  tmp->next = NULL;
			  tmp->spec = (yyvsp[(1) - (1)].wildcard);
			  (yyval.wildcard_list) = tmp;
			}
    break;

  case 134:
#line 612 "ldgram.y"
    {
			  struct wildcard_spec tmp;
			  tmp.name = (yyvsp[(1) - (1)].name);
			  tmp.exclude_name_list = NULL;
			  tmp.sorted = none;
			  tmp.section_flag_list = NULL;
			  lang_add_wild (&tmp, NULL, ldgram_had_keep);
			}
    break;

  case 135:
#line 621 "ldgram.y"
    {
			  struct wildcard_spec tmp;
			  tmp.name = (yyvsp[(2) - (2)].name);
			  tmp.exclude_name_list = NULL;
			  tmp.sorted = none;
			  tmp.section_flag_list = (yyvsp[(1) - (2)].flag_info);
			  lang_add_wild (&tmp, NULL, ldgram_had_keep);
			}
    break;

  case 136:
#line 630 "ldgram.y"
    {
			  lang_add_wild (NULL, (yyvsp[(2) - (3)].wildcard_list), ldgram_had_keep);
			}
    break;

  case 137:
#line 634 "ldgram.y"
    {
			  struct wildcard_spec tmp;
			  tmp.name = NULL;
			  tmp.exclude_name_list = NULL;
			  tmp.sorted = none;
			  tmp.section_flag_list = (yyvsp[(1) - (4)].flag_info);
			  lang_add_wild (&tmp, (yyvsp[(3) - (4)].wildcard_list), ldgram_had_keep);
			}
    break;

  case 138:
#line 643 "ldgram.y"
    {
			  lang_add_wild (&(yyvsp[(1) - (4)].wildcard), (yyvsp[(3) - (4)].wildcard_list), ldgram_had_keep);
			}
    break;

  case 139:
#line 647 "ldgram.y"
    {
			  (yyvsp[(2) - (5)].wildcard).section_flag_list = (yyvsp[(1) - (5)].flag_info);
			  lang_add_wild (&(yyvsp[(2) - (5)].wildcard), (yyvsp[(4) - (5)].wildcard_list), ldgram_had_keep);
			}
    break;

  case 141:
#line 656 "ldgram.y"
    { ldgram_had_keep = TRUE; }
    break;

  case 142:
#line 658 "ldgram.y"
    { ldgram_had_keep = FALSE; }
    break;

  case 144:
#line 664 "ldgram.y"
    {
 		lang_add_attribute(lang_object_symbols_statement_enum);
	      	}
    break;

  case 146:
#line 669 "ldgram.y"
    {

		  lang_add_attribute(lang_constructors_statement_enum);
		}
    break;

  case 147:
#line 674 "ldgram.y"
    {
		  constructors_sorted = TRUE;
		  lang_add_attribute (lang_constructors_statement_enum);
		}
    break;

  case 149:
#line 680 "ldgram.y"
    {
			  lang_add_data ((int) (yyvsp[(1) - (4)].integer), (yyvsp[(3) - (4)].etree));
			}
    break;

  case 150:
#line 685 "ldgram.y"
    {
			  lang_add_fill ((yyvsp[(3) - (4)].fill));
			}
    break;

  case 151:
#line 688 "ldgram.y"
    {ldlex_expression ();}
    break;

  case 152:
#line 689 "ldgram.y"
    { ldlex_popstate ();
			  lang_add_assignment (exp_assert ((yyvsp[(4) - (8)].etree), (yyvsp[(6) - (8)].name))); }
    break;

  case 153:
#line 692 "ldgram.y"
    { ldlex_script (); ldfile_open_command_file((yyvsp[(2) - (2)].name)); }
    break;

  case 154:
#line 694 "ldgram.y"
    { ldlex_popstate (); }
    break;

  case 159:
#line 709 "ldgram.y"
    { (yyval.integer) = (yyvsp[(1) - (1)].token); }
    break;

  case 160:
#line 711 "ldgram.y"
    { (yyval.integer) = (yyvsp[(1) - (1)].token); }
    break;

  case 161:
#line 713 "ldgram.y"
    { (yyval.integer) = (yyvsp[(1) - (1)].token); }
    break;

  case 162:
#line 715 "ldgram.y"
    { (yyval.integer) = (yyvsp[(1) - (1)].token); }
    break;

  case 163:
#line 717 "ldgram.y"
    { (yyval.integer) = (yyvsp[(1) - (1)].token); }
    break;

  case 164:
#line 722 "ldgram.y"
    {
		  (yyval.fill) = exp_get_fill ((yyvsp[(1) - (1)].etree), 0, "fill value");
		}
    break;

  case 165:
#line 729 "ldgram.y"
    { (yyval.fill) = (yyvsp[(2) - (2)].fill); }
    break;

  case 166:
#line 730 "ldgram.y"
    { (yyval.fill) = (fill_type *) 0; }
    break;

  case 167:
#line 735 "ldgram.y"
    { (yyval.token) = '+'; }
    break;

  case 168:
#line 737 "ldgram.y"
    { (yyval.token) = '-'; }
    break;

  case 169:
#line 739 "ldgram.y"
    { (yyval.token) = '*'; }
    break;

  case 170:
#line 741 "ldgram.y"
    { (yyval.token) = '/'; }
    break;

  case 171:
#line 743 "ldgram.y"
    { (yyval.token) = LSHIFT; }
    break;

  case 172:
#line 745 "ldgram.y"
    { (yyval.token) = RSHIFT; }
    break;

  case 173:
#line 747 "ldgram.y"
    { (yyval.token) = '&'; }
    break;

  case 174:
#line 749 "ldgram.y"
    { (yyval.token) = '|'; }
    break;

  case 177:
#line 759 "ldgram.y"
    {
		  lang_add_assignment (exp_assign ((yyvsp[(1) - (3)].name), (yyvsp[(3) - (3)].etree), FALSE));
		}
    break;

  case 178:
#line 763 "ldgram.y"
    {
		  lang_add_assignment (exp_assign ((yyvsp[(1) - (3)].name),
						   exp_binop ((yyvsp[(2) - (3)].token),
							      exp_nameop (NAME,
									  (yyvsp[(1) - (3)].name)),
							      (yyvsp[(3) - (3)].etree)), FALSE));
		}
    break;

  case 179:
#line 771 "ldgram.y"
    {
		  lang_add_assignment (exp_assign ((yyvsp[(3) - (6)].name), (yyvsp[(5) - (6)].etree), TRUE));
		}
    break;

  case 180:
#line 775 "ldgram.y"
    {
		  lang_add_assignment (exp_provide ((yyvsp[(3) - (6)].name), (yyvsp[(5) - (6)].etree), FALSE));
		}
    break;

  case 181:
#line 779 "ldgram.y"
    {
		  lang_add_assignment (exp_provide ((yyvsp[(3) - (6)].name), (yyvsp[(5) - (6)].etree), TRUE));
		}
    break;

  case 189:
#line 802 "ldgram.y"
    { region = lang_memory_region_lookup ((yyvsp[(1) - (1)].name), TRUE); }
    break;

  case 190:
#line 805 "ldgram.y"
    {}
    break;

  case 191:
#line 807 "ldgram.y"
    { ldlex_script (); ldfile_open_command_file((yyvsp[(2) - (2)].name)); }
    break;

  case 192:
#line 809 "ldgram.y"
    { ldlex_popstate (); }
    break;

  case 193:
#line 814 "ldgram.y"
    {
		  region->origin = exp_get_vma ((yyvsp[(3) - (3)].etree), 0, "origin");
		  region->current = region->origin;
		}
    break;

  case 194:
#line 822 "ldgram.y"
    {
		  region->length = exp_get_vma ((yyvsp[(3) - (3)].etree), -1, "length");
		}
    break;

  case 195:
#line 829 "ldgram.y"
    { /* dummy action to avoid bison 1.25 error message */ }
    break;

  case 199:
#line 840 "ldgram.y"
    { lang_set_flags (region, (yyvsp[(1) - (1)].name), 0); }
    break;

  case 200:
#line 842 "ldgram.y"
    { lang_set_flags (region, (yyvsp[(2) - (2)].name), 1); }
    break;

  case 201:
#line 847 "ldgram.y"
    { lang_startup((yyvsp[(3) - (4)].name)); }
    break;

  case 203:
#line 853 "ldgram.y"
    { ldemul_hll((char *)NULL); }
    break;

  case 204:
#line 858 "ldgram.y"
    { ldemul_hll((yyvsp[(3) - (3)].name)); }
    break;

  case 205:
#line 860 "ldgram.y"
    { ldemul_hll((yyvsp[(1) - (1)].name)); }
    break;

  case 207:
#line 868 "ldgram.y"
    { ldemul_syslib((yyvsp[(3) - (3)].name)); }
    break;

  case 209:
#line 874 "ldgram.y"
    { lang_float(TRUE); }
    break;

  case 210:
#line 876 "ldgram.y"
    { lang_float(FALSE); }
    break;

  case 211:
#line 881 "ldgram.y"
    {
		  (yyval.nocrossref) = NULL;
		}
    break;

  case 212:
#line 885 "ldgram.y"
    {
		  struct lang_nocrossref *n;

		  n = (struct lang_nocrossref *) xmalloc (sizeof *n);
		  n->name = (yyvsp[(1) - (2)].name);
		  n->next = (yyvsp[(2) - (2)].nocrossref);
		  (yyval.nocrossref) = n;
		}
    break;

  case 213:
#line 894 "ldgram.y"
    {
		  struct lang_nocrossref *n;

		  n = (struct lang_nocrossref *) xmalloc (sizeof *n);
		  n->name = (yyvsp[(1) - (3)].name);
		  n->next = (yyvsp[(3) - (3)].nocrossref);
		  (yyval.nocrossref) = n;
		}
    break;

  case 214:
#line 904 "ldgram.y"
    { ldlex_expression (); }
    break;

  case 215:
#line 906 "ldgram.y"
    { ldlex_popstate (); (yyval.etree)=(yyvsp[(2) - (2)].etree);}
    break;

  case 216:
#line 911 "ldgram.y"
    { (yyval.etree) = exp_unop ('-', (yyvsp[(2) - (2)].etree)); }
    break;

  case 217:
#line 913 "ldgram.y"
    { (yyval.etree) = (yyvsp[(2) - (3)].etree); }
    break;

  case 218:
#line 915 "ldgram.y"
    { (yyval.etree) = exp_unop ((int) (yyvsp[(1) - (4)].integer),(yyvsp[(3) - (4)].etree)); }
    break;

  case 219:
#line 917 "ldgram.y"
    { (yyval.etree) = exp_unop ('!', (yyvsp[(2) - (2)].etree)); }
    break;

  case 220:
#line 919 "ldgram.y"
    { (yyval.etree) = (yyvsp[(2) - (2)].etree); }
    break;

  case 221:
#line 921 "ldgram.y"
    { (yyval.etree) = exp_unop ('~', (yyvsp[(2) - (2)].etree));}
    break;

  case 222:
#line 924 "ldgram.y"
    { (yyval.etree) = exp_binop ('*', (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 223:
#line 926 "ldgram.y"
    { (yyval.etree) = exp_binop ('/', (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 224:
#line 928 "ldgram.y"
    { (yyval.etree) = exp_binop ('%', (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 225:
#line 930 "ldgram.y"
    { (yyval.etree) = exp_binop ('+', (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 226:
#line 932 "ldgram.y"
    { (yyval.etree) = exp_binop ('-' , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 227:
#line 934 "ldgram.y"
    { (yyval.etree) = exp_binop (LSHIFT , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 228:
#line 936 "ldgram.y"
    { (yyval.etree) = exp_binop (RSHIFT , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 229:
#line 938 "ldgram.y"
    { (yyval.etree) = exp_binop (EQ , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 230:
#line 940 "ldgram.y"
    { (yyval.etree) = exp_binop (NE , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 231:
#line 942 "ldgram.y"
    { (yyval.etree) = exp_binop (LE , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 232:
#line 944 "ldgram.y"
    { (yyval.etree) = exp_binop (GE , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 233:
#line 946 "ldgram.y"
    { (yyval.etree) = exp_binop ('<' , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 234:
#line 948 "ldgram.y"
    { (yyval.etree) = exp_binop ('>' , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 235:
#line 950 "ldgram.y"
    { (yyval.etree) = exp_binop ('&' , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 236:
#line 952 "ldgram.y"
    { (yyval.etree) = exp_binop ('^' , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 237:
#line 954 "ldgram.y"
    { (yyval.etree) = exp_binop ('|' , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 238:
#line 956 "ldgram.y"
    { (yyval.etree) = exp_trinop ('?' , (yyvsp[(1) - (5)].etree), (yyvsp[(3) - (5)].etree), (yyvsp[(5) - (5)].etree)); }
    break;

  case 239:
#line 958 "ldgram.y"
    { (yyval.etree) = exp_binop (ANDAND , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 240:
#line 960 "ldgram.y"
    { (yyval.etree) = exp_binop (OROR , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 241:
#line 962 "ldgram.y"
    { (yyval.etree) = exp_nameop (DEFINED, (yyvsp[(3) - (4)].name)); }
    break;

  case 242:
#line 964 "ldgram.y"
    { (yyval.etree) = exp_bigintop ((yyvsp[(1) - (1)].bigint).integer, (yyvsp[(1) - (1)].bigint).str); }
    break;

  case 243:
#line 966 "ldgram.y"
    { (yyval.etree) = exp_nameop (SIZEOF_HEADERS,0); }
    break;

  case 244:
#line 969 "ldgram.y"
    { (yyval.etree) = exp_nameop (ALIGNOF,(yyvsp[(3) - (4)].name)); }
    break;

  case 245:
#line 971 "ldgram.y"
    { (yyval.etree) = exp_nameop (SIZEOF,(yyvsp[(3) - (4)].name)); }
    break;

  case 246:
#line 973 "ldgram.y"
    { (yyval.etree) = exp_nameop (ADDR,(yyvsp[(3) - (4)].name)); }
    break;

  case 247:
#line 975 "ldgram.y"
    { (yyval.etree) = exp_nameop (LOADADDR,(yyvsp[(3) - (4)].name)); }
    break;

  case 248:
#line 977 "ldgram.y"
    { (yyval.etree) = exp_nameop (CONSTANT,(yyvsp[(3) - (4)].name)); }
    break;

  case 249:
#line 979 "ldgram.y"
    { (yyval.etree) = exp_unop (ABSOLUTE, (yyvsp[(3) - (4)].etree)); }
    break;

  case 250:
#line 981 "ldgram.y"
    { (yyval.etree) = exp_unop (ALIGN_K,(yyvsp[(3) - (4)].etree)); }
    break;

  case 251:
#line 983 "ldgram.y"
    { (yyval.etree) = exp_binop (ALIGN_K,(yyvsp[(3) - (6)].etree),(yyvsp[(5) - (6)].etree)); }
    break;

  case 252:
#line 985 "ldgram.y"
    { (yyval.etree) = exp_binop (DATA_SEGMENT_ALIGN, (yyvsp[(3) - (6)].etree), (yyvsp[(5) - (6)].etree)); }
    break;

  case 253:
#line 987 "ldgram.y"
    { (yyval.etree) = exp_binop (DATA_SEGMENT_RELRO_END, (yyvsp[(5) - (6)].etree), (yyvsp[(3) - (6)].etree)); }
    break;

  case 254:
#line 989 "ldgram.y"
    { (yyval.etree) = exp_unop (DATA_SEGMENT_END, (yyvsp[(3) - (4)].etree)); }
    break;

  case 255:
#line 991 "ldgram.y"
    { /* The operands to the expression node are
			     placed in the opposite order from the way
			     in which they appear in the script as
			     that allows us to reuse more code in
			     fold_binary.  */
			  (yyval.etree) = exp_binop (SEGMENT_START,
					  (yyvsp[(5) - (6)].etree),
					  exp_nameop (NAME, (yyvsp[(3) - (6)].name))); }
    break;

  case 256:
#line 1000 "ldgram.y"
    { (yyval.etree) = exp_unop (ALIGN_K,(yyvsp[(3) - (4)].etree)); }
    break;

  case 257:
#line 1002 "ldgram.y"
    { (yyval.etree) = exp_nameop (NAME,(yyvsp[(1) - (1)].name)); }
    break;

  case 258:
#line 1004 "ldgram.y"
    { (yyval.etree) = exp_binop (MAX_K, (yyvsp[(3) - (6)].etree), (yyvsp[(5) - (6)].etree) ); }
    break;

  case 259:
#line 1006 "ldgram.y"
    { (yyval.etree) = exp_binop (MIN_K, (yyvsp[(3) - (6)].etree), (yyvsp[(5) - (6)].etree) ); }
    break;

  case 260:
#line 1008 "ldgram.y"
    { (yyval.etree) = exp_assert ((yyvsp[(3) - (6)].etree), (yyvsp[(5) - (6)].name)); }
    break;

  case 261:
#line 1010 "ldgram.y"
    { (yyval.etree) = exp_nameop (ORIGIN, (yyvsp[(3) - (4)].name)); }
    break;

  case 262:
#line 1012 "ldgram.y"
    { (yyval.etree) = exp_nameop (LENGTH, (yyvsp[(3) - (4)].name)); }
    break;

  case 263:
#line 1014 "ldgram.y"
    { (yyval.etree) = exp_unop (LOG2CEIL, (yyvsp[(3) - (4)].etree)); }
    break;

  case 264:
#line 1019 "ldgram.y"
    { (yyval.name) = (yyvsp[(3) - (3)].name); }
    break;

  case 265:
#line 1020 "ldgram.y"
    { (yyval.name) = 0; }
    break;

  case 266:
#line 1024 "ldgram.y"
    { (yyval.etree) = (yyvsp[(3) - (4)].etree); }
    break;

  case 267:
#line 1025 "ldgram.y"
    { (yyval.etree) = 0; }
    break;

  case 268:
#line 1029 "ldgram.y"
    { (yyval.etree) = (yyvsp[(3) - (4)].etree); }
    break;

  case 269:
#line 1030 "ldgram.y"
    { (yyval.etree) = 0; }
    break;

  case 270:
#line 1034 "ldgram.y"
    { (yyval.token) = ALIGN_WITH_INPUT; }
    break;

  case 271:
#line 1035 "ldgram.y"
    { (yyval.token) = 0; }
    break;

  case 272:
#line 1039 "ldgram.y"
    { (yyval.etree) = (yyvsp[(3) - (4)].etree); }
    break;

  case 273:
#line 1040 "ldgram.y"
    { (yyval.etree) = 0; }
    break;

  case 274:
#line 1044 "ldgram.y"
    { (yyval.token) = ONLY_IF_RO; }
    break;

  case 275:
#line 1045 "ldgram.y"
    { (yyval.token) = ONLY_IF_RW; }
    break;

  case 276:
#line 1046 "ldgram.y"
    { (yyval.token) = SPECIAL; }
    break;

  case 277:
#line 1047 "ldgram.y"
    { (yyval.token) = 0; }
    break;

  case 278:
#line 1050 "ldgram.y"
    { ldlex_expression(); }
    break;

  case 279:
#line 1055 "ldgram.y"
    { ldlex_popstate (); ldlex_script (); }
    break;

  case 280:
#line 1058 "ldgram.y"
    {
			  lang_enter_output_section_statement((yyvsp[(1) - (10)].name), (yyvsp[(3) - (10)].etree),
							      sectype,
							      (yyvsp[(5) - (10)].etree), (yyvsp[(7) - (10)].etree), (yyvsp[(4) - (10)].etree), (yyvsp[(9) - (10)].token), (yyvsp[(6) - (10)].token));
			}
    break;

  case 281:
#line 1064 "ldgram.y"
    { ldlex_popstate (); ldlex_expression (); }
    break;

  case 282:
#line 1066 "ldgram.y"
    {
		  ldlex_popstate ();
		  lang_leave_output_section_statement ((yyvsp[(18) - (18)].fill), (yyvsp[(15) - (18)].name), (yyvsp[(17) - (18)].section_phdr), (yyvsp[(16) - (18)].name));
		}
    break;

  case 283:
#line 1071 "ldgram.y"
    {}
    break;

  case 284:
#line 1073 "ldgram.y"
    { ldlex_expression (); }
    break;

  case 285:
#line 1075 "ldgram.y"
    { ldlex_popstate (); ldlex_script (); }
    break;

  case 286:
#line 1077 "ldgram.y"
    {
			  lang_enter_overlay ((yyvsp[(3) - (8)].etree), (yyvsp[(6) - (8)].etree));
			}
    break;

  case 287:
#line 1082 "ldgram.y"
    { ldlex_popstate (); ldlex_expression (); }
    break;

  case 288:
#line 1084 "ldgram.y"
    {
			  ldlex_popstate ();
			  lang_leave_overlay ((yyvsp[(5) - (16)].etree), (int) (yyvsp[(4) - (16)].integer),
					      (yyvsp[(16) - (16)].fill), (yyvsp[(13) - (16)].name), (yyvsp[(15) - (16)].section_phdr), (yyvsp[(14) - (16)].name));
			}
    break;

  case 290:
#line 1094 "ldgram.y"
    { ldlex_expression (); }
    break;

  case 291:
#line 1096 "ldgram.y"
    {
		  ldlex_popstate ();
		  lang_add_assignment (exp_assign (".", (yyvsp[(3) - (3)].etree), FALSE));
		}
    break;

  case 293:
#line 1102 "ldgram.y"
    { ldlex_script (); ldfile_open_command_file((yyvsp[(2) - (2)].name)); }
    break;

  case 294:
#line 1104 "ldgram.y"
    { ldlex_popstate (); }
    break;

  case 295:
#line 1108 "ldgram.y"
    { sectype = noload_section; }
    break;

  case 296:
#line 1109 "ldgram.y"
    { sectype = noalloc_section; }
    break;

  case 297:
#line 1110 "ldgram.y"
    { sectype = noalloc_section; }
    break;

  case 298:
#line 1111 "ldgram.y"
    { sectype = noalloc_section; }
    break;

  case 299:
#line 1112 "ldgram.y"
    { sectype = noalloc_section; }
    break;

  case 301:
#line 1117 "ldgram.y"
    { sectype = normal_section; }
    break;

  case 302:
#line 1118 "ldgram.y"
    { sectype = normal_section; }
    break;

  case 303:
#line 1122 "ldgram.y"
    { (yyval.etree) = (yyvsp[(1) - (3)].etree); }
    break;

  case 304:
#line 1123 "ldgram.y"
    { (yyval.etree) = (etree_type *)NULL;  }
    break;

  case 305:
#line 1128 "ldgram.y"
    { (yyval.etree) = (yyvsp[(3) - (6)].etree); }
    break;

  case 306:
#line 1130 "ldgram.y"
    { (yyval.etree) = (yyvsp[(3) - (10)].etree); }
    break;

  case 307:
#line 1134 "ldgram.y"
    { (yyval.etree) = (yyvsp[(1) - (2)].etree); }
    break;

  case 308:
#line 1135 "ldgram.y"
    { (yyval.etree) = (etree_type *) NULL;  }
    break;

  case 309:
#line 1140 "ldgram.y"
    { (yyval.integer) = 0; }
    break;

  case 310:
#line 1142 "ldgram.y"
    { (yyval.integer) = 1; }
    break;

  case 311:
#line 1147 "ldgram.y"
    { (yyval.name) = (yyvsp[(2) - (2)].name); }
    break;

  case 312:
#line 1148 "ldgram.y"
    { (yyval.name) = DEFAULT_MEMORY_REGION; }
    break;

  case 313:
#line 1153 "ldgram.y"
    {
		  (yyval.section_phdr) = NULL;
		}
    break;

  case 314:
#line 1157 "ldgram.y"
    {
		  struct lang_output_section_phdr_list *n;

		  n = ((struct lang_output_section_phdr_list *)
		       xmalloc (sizeof *n));
		  n->name = (yyvsp[(3) - (3)].name);
		  n->used = FALSE;
		  n->next = (yyvsp[(1) - (3)].section_phdr);
		  (yyval.section_phdr) = n;
		}
    break;

  case 316:
#line 1173 "ldgram.y"
    {
			  ldlex_script ();
			  lang_enter_overlay_section ((yyvsp[(2) - (2)].name));
			}
    break;

  case 317:
#line 1178 "ldgram.y"
    { ldlex_popstate (); ldlex_expression (); }
    break;

  case 318:
#line 1180 "ldgram.y"
    {
			  ldlex_popstate ();
			  lang_leave_overlay_section ((yyvsp[(9) - (9)].fill), (yyvsp[(8) - (9)].section_phdr));
			}
    break;

  case 323:
#line 1197 "ldgram.y"
    { ldlex_expression (); }
    break;

  case 324:
#line 1198 "ldgram.y"
    { ldlex_popstate (); }
    break;

  case 325:
#line 1200 "ldgram.y"
    {
		  lang_new_phdr ((yyvsp[(1) - (6)].name), (yyvsp[(3) - (6)].etree), (yyvsp[(4) - (6)].phdr).filehdr, (yyvsp[(4) - (6)].phdr).phdrs, (yyvsp[(4) - (6)].phdr).at,
				 (yyvsp[(4) - (6)].phdr).flags);
		}
    break;

  case 326:
#line 1208 "ldgram.y"
    {
		  (yyval.etree) = (yyvsp[(1) - (1)].etree);

		  if ((yyvsp[(1) - (1)].etree)->type.node_class == etree_name
		      && (yyvsp[(1) - (1)].etree)->type.node_code == NAME)
		    {
		      const char *s;
		      unsigned int i;
		      static const char * const phdr_types[] =
			{
			  "PT_NULL", "PT_LOAD", "PT_DYNAMIC",
			  "PT_INTERP", "PT_NOTE", "PT_SHLIB",
			  "PT_PHDR", "PT_TLS"
			};

		      s = (yyvsp[(1) - (1)].etree)->name.name;
		      for (i = 0;
			   i < sizeof phdr_types / sizeof phdr_types[0];
			   i++)
			if (strcmp (s, phdr_types[i]) == 0)
			  {
			    (yyval.etree) = exp_intop (i);
			    break;
			  }
		      if (i == sizeof phdr_types / sizeof phdr_types[0])
			{
			  if (strcmp (s, "PT_GNU_EH_FRAME") == 0)
			    (yyval.etree) = exp_intop (0x6474e550);
			  else if (strcmp (s, "PT_GNU_STACK") == 0)
			    (yyval.etree) = exp_intop (0x6474e551);
			  else
			    {
			      einfo (_("\
%X%P:%S: unknown phdr type `%s' (try integer literal)\n"),
				     NULL, s);
			      (yyval.etree) = exp_intop (0);
			    }
			}
		    }
		}
    break;

  case 327:
#line 1252 "ldgram.y"
    {
		  memset (&(yyval.phdr), 0, sizeof (struct phdr_info));
		}
    break;

  case 328:
#line 1256 "ldgram.y"
    {
		  (yyval.phdr) = (yyvsp[(3) - (3)].phdr);
		  if (strcmp ((yyvsp[(1) - (3)].name), "FILEHDR") == 0 && (yyvsp[(2) - (3)].etree) == NULL)
		    (yyval.phdr).filehdr = TRUE;
		  else if (strcmp ((yyvsp[(1) - (3)].name), "PHDRS") == 0 && (yyvsp[(2) - (3)].etree) == NULL)
		    (yyval.phdr).phdrs = TRUE;
		  else if (strcmp ((yyvsp[(1) - (3)].name), "FLAGS") == 0 && (yyvsp[(2) - (3)].etree) != NULL)
		    (yyval.phdr).flags = (yyvsp[(2) - (3)].etree);
		  else
		    einfo (_("%X%P:%S: PHDRS syntax error at `%s'\n"),
			   NULL, (yyvsp[(1) - (3)].name));
		}
    break;

  case 329:
#line 1269 "ldgram.y"
    {
		  (yyval.phdr) = (yyvsp[(5) - (5)].phdr);
		  (yyval.phdr).at = (yyvsp[(3) - (5)].etree);
		}
    break;

  case 330:
#line 1277 "ldgram.y"
    {
		  (yyval.etree) = NULL;
		}
    break;

  case 331:
#line 1281 "ldgram.y"
    {
		  (yyval.etree) = (yyvsp[(2) - (3)].etree);
		}
    break;

  case 332:
#line 1287 "ldgram.y"
    {
		  ldlex_version_file ();
		  PUSH_ERROR (_("dynamic list"));
		}
    break;

  case 333:
#line 1292 "ldgram.y"
    {
		  ldlex_popstate ();
		  POP_ERROR ();
		}
    break;

  case 337:
#line 1309 "ldgram.y"
    {
		  lang_append_dynamic_list ((yyvsp[(1) - (2)].versyms));
		}
    break;

  case 338:
#line 1317 "ldgram.y"
    {
		  ldlex_version_file ();
		  PUSH_ERROR (_("VERSION script"));
		}
    break;

  case 339:
#line 1322 "ldgram.y"
    {
		  ldlex_popstate ();
		  POP_ERROR ();
		}
    break;

  case 340:
#line 1331 "ldgram.y"
    {
		  ldlex_version_script ();
		}
    break;

  case 341:
#line 1335 "ldgram.y"
    {
		  ldlex_popstate ();
		}
    break;

  case 344:
#line 1347 "ldgram.y"
    {
		  lang_register_vers_node (NULL, (yyvsp[(2) - (4)].versnode), NULL);
		}
    break;

  case 345:
#line 1351 "ldgram.y"
    {
		  lang_register_vers_node ((yyvsp[(1) - (5)].name), (yyvsp[(3) - (5)].versnode), NULL);
		}
    break;

  case 346:
#line 1355 "ldgram.y"
    {
		  lang_register_vers_node ((yyvsp[(1) - (6)].name), (yyvsp[(3) - (6)].versnode), (yyvsp[(5) - (6)].deflist));
		}
    break;

  case 347:
#line 1362 "ldgram.y"
    {
		  (yyval.deflist) = lang_add_vers_depend (NULL, (yyvsp[(1) - (1)].name));
		}
    break;

  case 348:
#line 1366 "ldgram.y"
    {
		  (yyval.deflist) = lang_add_vers_depend ((yyvsp[(1) - (2)].deflist), (yyvsp[(2) - (2)].name));
		}
    break;

  case 349:
#line 1373 "ldgram.y"
    {
		  (yyval.versnode) = lang_new_vers_node (NULL, NULL);
		}
    break;

  case 350:
#line 1377 "ldgram.y"
    {
		  (yyval.versnode) = lang_new_vers_node ((yyvsp[(1) - (2)].versyms), NULL);
		}
    break;

  case 351:
#line 1381 "ldgram.y"
    {
		  (yyval.versnode) = lang_new_vers_node ((yyvsp[(3) - (4)].versyms), NULL);
		}
    break;

  case 352:
#line 1385 "ldgram.y"
    {
		  (yyval.versnode) = lang_new_vers_node (NULL, (yyvsp[(3) - (4)].versyms));
		}
    break;

  case 353:
#line 1389 "ldgram.y"
    {
		  (yyval.versnode) = lang_new_vers_node ((yyvsp[(3) - (8)].versyms), (yyvsp[(7) - (8)].versyms));
		}
    break;

  case 354:
#line 1396 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, (yyvsp[(1) - (1)].name), ldgram_vers_current_lang, FALSE);
		}
    break;

  case 355:
#line 1400 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, (yyvsp[(1) - (1)].name), ldgram_vers_current_lang, TRUE);
		}
    break;

  case 356:
#line 1404 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[(1) - (3)].versyms), (yyvsp[(3) - (3)].name), ldgram_vers_current_lang, FALSE);
		}
    break;

  case 357:
#line 1408 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[(1) - (3)].versyms), (yyvsp[(3) - (3)].name), ldgram_vers_current_lang, TRUE);
		}
    break;

  case 358:
#line 1412 "ldgram.y"
    {
			  (yyval.name) = ldgram_vers_current_lang;
			  ldgram_vers_current_lang = (yyvsp[(4) - (5)].name);
			}
    break;

  case 359:
#line 1417 "ldgram.y"
    {
			  struct bfd_elf_version_expr *pat;
			  for (pat = (yyvsp[(7) - (9)].versyms); pat->next != NULL; pat = pat->next);
			  pat->next = (yyvsp[(1) - (9)].versyms);
			  (yyval.versyms) = (yyvsp[(7) - (9)].versyms);
			  ldgram_vers_current_lang = (yyvsp[(6) - (9)].name);
			}
    break;

  case 360:
#line 1425 "ldgram.y"
    {
			  (yyval.name) = ldgram_vers_current_lang;
			  ldgram_vers_current_lang = (yyvsp[(2) - (3)].name);
			}
    break;

  case 361:
#line 1430 "ldgram.y"
    {
			  (yyval.versyms) = (yyvsp[(5) - (7)].versyms);
			  ldgram_vers_current_lang = (yyvsp[(4) - (7)].name);
			}
    break;

  case 362:
#line 1435 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, "global", ldgram_vers_current_lang, FALSE);
		}
    break;

  case 363:
#line 1439 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[(1) - (3)].versyms), "global", ldgram_vers_current_lang, FALSE);
		}
    break;

  case 364:
#line 1443 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, "local", ldgram_vers_current_lang, FALSE);
		}
    break;

  case 365:
#line 1447 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[(1) - (3)].versyms), "local", ldgram_vers_current_lang, FALSE);
		}
    break;

  case 366:
#line 1451 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, "extern", ldgram_vers_current_lang, FALSE);
		}
    break;

  case 367:
#line 1455 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[(1) - (3)].versyms), "extern", ldgram_vers_current_lang, FALSE);
		}
    break;


/* Line 1267 of yacc.c.  */
#line 4490 "ldgram.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


#line 1465 "ldgram.y"

void
yyerror(arg)
     const char *arg;
{
  if (ldfile_assumed_script)
    einfo (_("%P:%s: file format not recognized; treating as linker script\n"),
	   ldlex_filename ());
  if (error_index > 0 && error_index < ERROR_NAME_MAX)
    einfo ("%P%F:%S: %s in %s\n", NULL, arg, error_names[error_index - 1]);
  else
    einfo ("%P%F:%S: %s\n", NULL, arg);
}


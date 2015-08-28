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
#define YYLAST   1969

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  154
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  131
/* YYNRULES -- Number of rules.  */
#define YYNRULES  371
/* YYNRULES -- Number of states.  */
#define YYNSTATES  805

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
     289,   293,   300,   305,   306,   309,   311,   315,   318,   320,
     324,   327,   328,   334,   335,   343,   344,   351,   356,   359,
     362,   363,   368,   371,   372,   380,   382,   384,   386,   388,
     394,   399,   404,   409,   417,   425,   433,   441,   450,   455,
     457,   461,   466,   469,   471,   475,   477,   479,   482,   486,
     491,   496,   502,   504,   505,   511,   514,   516,   518,   520,
     525,   527,   532,   537,   538,   547,   548,   554,   557,   559,
     560,   562,   564,   566,   568,   570,   572,   574,   577,   578,
     580,   582,   584,   586,   588,   590,   592,   594,   596,   598,
     602,   606,   613,   620,   627,   629,   630,   635,   637,   638,
     642,   644,   645,   653,   654,   660,   664,   668,   669,   673,
     675,   678,   680,   683,   688,   693,   697,   701,   703,   708,
     712,   713,   715,   717,   718,   721,   725,   726,   729,   732,
     736,   741,   744,   747,   750,   754,   758,   762,   766,   770,
     774,   778,   782,   786,   790,   794,   798,   802,   806,   810,
     814,   820,   824,   828,   833,   835,   837,   842,   847,   852,
     857,   862,   867,   872,   879,   886,   893,   898,   905,   910,
     912,   919,   926,   933,   938,   943,   948,   952,   953,   958,
     959,   964,   965,   967,   968,   973,   974,   976,   978,   980,
     981,   982,   983,   984,   985,   986,  1007,  1008,  1009,  1010,
    1011,  1012,  1031,  1032,  1033,  1041,  1042,  1048,  1050,  1052,
    1054,  1056,  1058,  1062,  1063,  1066,  1070,  1073,  1080,  1091,
    1094,  1096,  1097,  1099,  1102,  1103,  1104,  1108,  1109,  1110,
    1111,  1112,  1124,  1129,  1130,  1133,  1134,  1135,  1142,  1144,
    1145,  1149,  1155,  1156,  1160,  1161,  1164,  1166,  1169,  1174,
    1177,  1178,  1181,  1182,  1188,  1190,  1193,  1198,  1204,  1211,
    1213,  1216,  1217,  1220,  1225,  1230,  1239,  1241,  1243,  1247,
    1251,  1252,  1262,  1263,  1271,  1273,  1277,  1279,  1283,  1285,
    1289,  1290
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     155,     0,    -1,   126,   171,    -1,   127,   159,    -1,   137,
     273,    -1,   146,   268,    -1,   128,   157,    -1,     4,    -1,
      -1,   158,     4,     6,   228,    -1,    -1,   160,   161,    -1,
     161,   162,   113,    -1,    -1,   108,   228,    -1,   108,   228,
     147,   228,    -1,     4,    -1,   109,    -1,   115,   164,    -1,
     114,    -1,   120,     4,     6,   228,    -1,   120,     4,   147,
     228,    -1,   120,     4,   228,    -1,   119,     4,    -1,   110,
       4,   147,   228,    -1,   110,     4,   228,    -1,   110,     4,
       6,   228,    -1,    38,     4,     6,   228,    -1,    38,     4,
     147,   228,    -1,   101,     4,     6,   228,    -1,   101,     4,
     147,   228,    -1,   111,   166,    -1,   112,   165,    -1,   116,
       4,    -1,   123,     4,   147,     4,    -1,   123,     4,   147,
       3,    -1,   122,   228,    -1,   124,     3,    -1,   129,   167,
      -1,   130,   168,    -1,    -1,    66,   156,   163,   161,    36,
      -1,   131,     4,    -1,    -1,   164,   147,     4,    -1,   164,
       4,    -1,    -1,     4,    -1,   165,   147,     4,    -1,     4,
      -1,   166,   147,     4,    -1,    -1,     4,    -1,   167,   147,
       4,    -1,    -1,   169,   170,    -1,     4,    -1,   170,     4,
      -1,   170,   147,     4,    -1,    -1,   172,   173,    -1,   173,
     174,    -1,    -1,   208,    -1,   183,    -1,   260,    -1,   219,
      -1,   220,    -1,   222,    -1,   224,    -1,   185,    -1,   275,
      -1,   148,    -1,    76,    37,     4,   149,    -1,    77,    37,
     156,   149,    -1,    99,    37,   156,   149,    -1,    61,    37,
       4,   149,    -1,    61,    37,     4,   147,     4,   147,     4,
     149,    -1,    63,    37,     4,   149,    -1,    62,    -1,    64,
      -1,    97,    37,   177,   149,    -1,    -1,    98,   175,    37,
     177,   149,    -1,    78,    37,   156,   149,    -1,    -1,    66,
     156,   176,   173,    36,    -1,    92,    37,   225,   149,    -1,
     130,    37,   168,   149,    -1,    48,    49,     4,    -1,    48,
      50,     4,    -1,    68,    37,     4,   147,     4,   149,    -1,
      69,    37,     4,   149,    -1,    -1,   178,   179,    -1,     4,
      -1,   179,   147,     4,    -1,   179,     4,    -1,     5,    -1,
     179,   147,     5,    -1,   179,     5,    -1,    -1,   107,    37,
     180,   179,   149,    -1,    -1,   179,   147,   107,    37,   181,
     179,   149,    -1,    -1,   179,   107,    37,   182,   179,   149,
      -1,    46,    58,   184,    59,    -1,   184,   235,    -1,   184,
     185,    -1,    -1,    79,    37,     4,   149,    -1,   206,   205,
      -1,    -1,   117,   186,    37,   228,   147,     4,   149,    -1,
       4,    -1,    32,    -1,    15,    -1,   187,    -1,   144,    37,
     191,   149,   187,    -1,    54,    37,   187,   149,    -1,    55,
      37,   187,   149,    -1,    56,    37,   187,   149,    -1,    54,
      37,    55,    37,   187,   149,   149,    -1,    54,    37,    54,
      37,   187,   149,   149,    -1,    55,    37,    54,    37,   187,
     149,   149,    -1,    55,    37,    55,    37,   187,   149,   149,
      -1,    54,    37,   144,    37,   191,   149,   187,   149,    -1,
      57,    37,   187,   149,    -1,     4,    -1,   189,    21,     4,
      -1,   142,    37,   189,   149,    -1,   191,   187,    -1,   187,
      -1,   192,   207,   188,    -1,   188,    -1,     4,    -1,   190,
       4,    -1,   150,   192,   151,    -1,   190,   150,   192,   151,
      -1,   188,    37,   192,   149,    -1,   190,   188,    37,   192,
     149,    -1,   193,    -1,    -1,   138,    37,   195,   193,   149,
      -1,   206,   205,    -1,    96,    -1,   148,    -1,   100,    -1,
      54,    37,   100,   149,    -1,   194,    -1,   201,    37,   226,
     149,    -1,    94,    37,   202,   149,    -1,    -1,   117,   197,
      37,   228,   147,     4,   149,   205,    -1,    -1,    66,   156,
     198,   200,    36,    -1,   199,   196,    -1,   196,    -1,    -1,
     199,    -1,    41,    -1,    42,    -1,    43,    -1,    44,    -1,
      45,    -1,   226,    -1,     6,   202,    -1,    -1,    14,    -1,
      13,    -1,    12,    -1,    11,    -1,    10,    -1,     9,    -1,
       8,    -1,     7,    -1,   148,    -1,   147,    -1,     4,     6,
     226,    -1,     4,   204,   226,    -1,   104,    37,     4,     6,
     226,   149,    -1,   105,    37,     4,     6,   226,   149,    -1,
     106,    37,     4,     6,   226,   149,    -1,   147,    -1,    -1,
      67,    58,   209,    59,    -1,   210,    -1,    -1,   210,   207,
     211,    -1,   211,    -1,    -1,     4,   212,   216,    16,   214,
     207,   215,    -1,    -1,    66,   156,   213,   209,    36,    -1,
      93,     6,   226,    -1,    95,     6,   226,    -1,    -1,    37,
     217,   149,    -1,   218,    -1,   217,   218,    -1,     4,    -1,
     152,     4,    -1,    87,    37,   156,   149,    -1,    88,    37,
     221,   149,    -1,    88,    37,   149,    -1,   221,   207,   156,
      -1,   156,    -1,    89,    37,   223,   149,    -1,   223,   207,
     156,    -1,    -1,    90,    -1,    91,    -1,    -1,     4,   225,
      -1,     4,   147,   225,    -1,    -1,   227,   228,    -1,    31,
     228,    -1,    37,   228,   149,    -1,    80,    37,   228,   149,
      -1,   152,   228,    -1,    30,   228,    -1,   153,   228,    -1,
     228,    32,   228,    -1,   228,    33,   228,    -1,   228,    34,
     228,    -1,   228,    30,   228,    -1,   228,    31,   228,    -1,
     228,    29,   228,    -1,   228,    28,   228,    -1,   228,    23,
     228,    -1,   228,    22,   228,    -1,   228,    27,   228,    -1,
     228,    26,   228,    -1,   228,    24,   228,    -1,   228,    25,
     228,    -1,   228,    21,   228,    -1,   228,    20,   228,    -1,
     228,    19,   228,    -1,   228,    15,   228,    16,   228,    -1,
     228,    18,   228,    -1,   228,    17,   228,    -1,    75,    37,
       4,   149,    -1,     3,    -1,    60,    -1,    82,    37,     4,
     149,    -1,    81,    37,     4,   149,    -1,    83,    37,     4,
     149,    -1,    84,    37,     4,   149,    -1,   145,    37,     4,
     149,    -1,   111,    37,   228,   149,    -1,    38,    37,   228,
     149,    -1,    38,    37,   228,   147,   228,   149,    -1,    51,
      37,   228,   147,   228,   149,    -1,    52,    37,   228,   147,
     228,   149,    -1,    53,    37,   228,   149,    -1,    65,    37,
       4,   147,   228,   149,    -1,    39,    37,   228,   149,    -1,
       4,    -1,    85,    37,   228,   147,   228,   149,    -1,    86,
      37,   228,   147,   228,   149,    -1,   117,    37,   228,   147,
       4,   149,    -1,    93,    37,     4,   149,    -1,    95,    37,
       4,   149,    -1,   118,    37,   228,   149,    -1,   102,    25,
       4,    -1,    -1,   102,    37,   228,   149,    -1,    -1,    38,
      37,   228,   149,    -1,    -1,   143,    -1,    -1,   103,    37,
     228,   149,    -1,    -1,   139,    -1,   140,    -1,   141,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     4,   236,   251,   230,
     231,   232,   233,   237,   234,    58,   238,   200,    59,   239,
     254,   229,   255,   203,   240,   207,    -1,    -1,    -1,    -1,
      -1,    -1,    74,   241,   252,   253,   230,   233,   242,    58,
     243,   256,    59,   244,   254,   229,   255,   203,   245,   207,
      -1,    -1,    -1,    98,   246,   251,   247,    58,   184,    59,
      -1,    -1,    66,   156,   248,   184,    36,    -1,    70,    -1,
      71,    -1,    72,    -1,    73,    -1,    74,    -1,    37,   249,
     149,    -1,    -1,    37,   149,    -1,   228,   250,    16,    -1,
     250,    16,    -1,    40,    37,   228,   149,   250,    16,    -1,
      40,    37,   228,   149,    39,    37,   228,   149,   250,    16,
      -1,   228,    16,    -1,    16,    -1,    -1,    92,    -1,    25,
       4,    -1,    -1,    -1,   255,    16,     4,    -1,    -1,    -1,
      -1,    -1,   256,     4,   257,    58,   200,    59,   258,   255,
     203,   259,   207,    -1,    47,    58,   261,    59,    -1,    -1,
     261,   262,    -1,    -1,    -1,     4,   263,   265,   266,   264,
     148,    -1,   228,    -1,    -1,     4,   267,   266,    -1,   102,
      37,   228,   149,   266,    -1,    -1,    37,   228,   149,    -1,
      -1,   269,   270,    -1,   271,    -1,   270,   271,    -1,    58,
     272,    59,   148,    -1,   281,   148,    -1,    -1,   274,   277,
      -1,    -1,   276,   136,    58,   277,    59,    -1,   278,    -1,
     277,   278,    -1,    58,   280,    59,   148,    -1,   132,    58,
     280,    59,   148,    -1,   132,    58,   280,    59,   279,   148,
      -1,   132,    -1,   279,   132,    -1,    -1,   281,   148,    -1,
     134,    16,   281,   148,    -1,   135,    16,   281,   148,    -1,
     134,    16,   281,   148,   135,    16,   281,   148,    -1,   133,
      -1,     4,    -1,   281,   148,   133,    -1,   281,   148,     4,
      -1,    -1,   281,   148,   130,     4,    58,   282,   281,   284,
      59,    -1,    -1,   130,     4,    58,   283,   281,   284,    59,
      -1,   134,    -1,   281,   148,   134,    -1,   135,    -1,   281,
     148,   135,    -1,   130,    -1,   281,   148,   130,    -1,    -1,
     148,    -1
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
     359,   361,   363,   368,   368,   373,   376,   379,   382,   385,
     388,   392,   391,   397,   396,   402,   401,   409,   413,   414,
     415,   419,   421,   422,   422,   430,   434,   438,   445,   452,
     459,   466,   473,   480,   487,   494,   501,   508,   515,   524,
     542,   563,   576,   585,   596,   605,   616,   625,   634,   638,
     647,   651,   659,   661,   660,   667,   668,   672,   673,   678,
     683,   684,   689,   693,   693,   697,   696,   703,   704,   707,
     709,   713,   715,   717,   719,   721,   726,   733,   735,   739,
     741,   743,   745,   747,   749,   751,   753,   758,   758,   763,
     767,   775,   779,   783,   791,   791,   795,   798,   798,   801,
     802,   807,   806,   812,   811,   818,   826,   834,   835,   839,
     840,   844,   846,   851,   856,   857,   862,   864,   870,   872,
     874,   878,   880,   886,   889,   898,   909,   909,   915,   917,
     919,   921,   923,   925,   928,   930,   932,   934,   936,   938,
     940,   942,   944,   946,   948,   950,   952,   954,   956,   958,
     960,   962,   964,   966,   968,   970,   973,   975,   977,   979,
     981,   983,   985,   987,   989,   991,   993,   995,  1004,  1006,
    1008,  1010,  1012,  1014,  1016,  1018,  1024,  1025,  1029,  1030,
    1034,  1035,  1039,  1040,  1044,  1045,  1049,  1050,  1051,  1052,
    1055,  1060,  1063,  1069,  1071,  1055,  1078,  1080,  1082,  1087,
    1089,  1077,  1099,  1101,  1099,  1107,  1106,  1113,  1114,  1115,
    1116,  1117,  1121,  1122,  1123,  1127,  1128,  1133,  1134,  1139,
    1140,  1145,  1146,  1151,  1153,  1158,  1161,  1174,  1178,  1183,
    1185,  1176,  1193,  1196,  1198,  1202,  1203,  1202,  1212,  1257,
    1260,  1273,  1282,  1285,  1292,  1292,  1304,  1305,  1309,  1313,
    1322,  1322,  1336,  1336,  1346,  1347,  1351,  1355,  1359,  1366,
    1370,  1378,  1381,  1385,  1389,  1393,  1400,  1404,  1408,  1412,
    1417,  1416,  1430,  1429,  1439,  1443,  1447,  1451,  1455,  1459,
    1465,  1467
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
  "ifile_list", "ifile_p1", "@6", "@7", "input_list", "@8", "input_list1",
  "@9", "@10", "@11", "sections", "sec_or_group_p1", "statement_anywhere",
  "@12", "wildcard_name", "wildcard_spec", "sect_flag_list", "sect_flags",
  "exclude_name_list", "file_NAME_list", "input_section_spec_no_keep",
  "input_section_spec", "@13", "statement", "@14", "@15", "statement_list",
  "statement_list_opt", "length", "fill_exp", "fill_opt", "assign_op",
  "end", "assignment", "opt_comma", "memory", "memory_spec_list_opt",
  "memory_spec_list", "memory_spec", "@16", "@17", "origin_spec",
  "length_spec", "attributes_opt", "attributes_list", "attributes_string",
  "startup", "high_level_library", "high_level_library_NAME_list",
  "low_level_library", "low_level_library_NAME_list",
  "floating_point_support", "nocrossref_list", "mustbe_exp", "@18", "exp",
  "memspec_at_opt", "opt_at", "opt_align", "opt_align_with_input",
  "opt_subalign", "sect_constraint", "section", "@19", "@20", "@21", "@22",
  "@23", "@24", "@25", "@26", "@27", "@28", "@29", "@30", "@31", "type",
  "atype", "opt_exp_with_type", "opt_exp_without_type", "opt_nocrossrefs",
  "memspec_opt", "phdr_opt", "overlay_section", "@32", "@33", "@34",
  "phdrs", "phdr_list", "phdr", "@35", "@36", "phdr_type",
  "phdr_qualifiers", "phdr_val", "dynamic_list_file", "@37",
  "dynamic_list_nodes", "dynamic_list_node", "dynamic_list_tag",
  "version_script_file", "@38", "version", "@39", "vers_nodes",
  "vers_node", "verdep", "vers_tag", "vers_defns", "@40", "@41",
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
     174,   174,   174,   178,   177,   179,   179,   179,   179,   179,
     179,   180,   179,   181,   179,   182,   179,   183,   184,   184,
     184,   185,   185,   186,   185,   187,   187,   187,   188,   188,
     188,   188,   188,   188,   188,   188,   188,   188,   188,   189,
     189,   190,   191,   191,   192,   192,   193,   193,   193,   193,
     193,   193,   194,   195,   194,   196,   196,   196,   196,   196,
     196,   196,   196,   197,   196,   198,   196,   199,   199,   200,
     200,   201,   201,   201,   201,   201,   202,   203,   203,   204,
     204,   204,   204,   204,   204,   204,   204,   205,   205,   206,
     206,   206,   206,   206,   207,   207,   208,   209,   209,   210,
     210,   212,   211,   213,   211,   214,   215,   216,   216,   217,
     217,   218,   218,   219,   220,   220,   221,   221,   222,   223,
     223,   224,   224,   225,   225,   225,   227,   226,   228,   228,
     228,   228,   228,   228,   228,   228,   228,   228,   228,   228,
     228,   228,   228,   228,   228,   228,   228,   228,   228,   228,
     228,   228,   228,   228,   228,   228,   228,   228,   228,   228,
     228,   228,   228,   228,   228,   228,   228,   228,   228,   228,
     228,   228,   228,   228,   228,   228,   229,   229,   230,   230,
     231,   231,   232,   232,   233,   233,   234,   234,   234,   234,
     236,   237,   238,   239,   240,   235,   241,   242,   243,   244,
     245,   235,   246,   247,   235,   248,   235,   249,   249,   249,
     249,   249,   250,   250,   250,   251,   251,   251,   251,   252,
     252,   253,   253,   254,   254,   255,   255,   256,   257,   258,
     259,   256,   260,   261,   261,   263,   264,   262,   265,   266,
     266,   266,   267,   267,   269,   268,   270,   270,   271,   272,
     274,   273,   276,   275,   277,   277,   278,   278,   278,   279,
     279,   280,   280,   280,   280,   280,   281,   281,   281,   281,
     282,   281,   283,   281,   281,   281,   281,   281,   281,   281,
     284,   284
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
       3,     6,     4,     0,     2,     1,     3,     2,     1,     3,
       2,     0,     5,     0,     7,     0,     6,     4,     2,     2,
       0,     4,     2,     0,     7,     1,     1,     1,     1,     5,
       4,     4,     4,     7,     7,     7,     7,     8,     4,     1,
       3,     4,     2,     1,     3,     1,     1,     2,     3,     4,
       4,     5,     1,     0,     5,     2,     1,     1,     1,     4,
       1,     4,     4,     0,     8,     0,     5,     2,     1,     0,
       1,     1,     1,     1,     1,     1,     1,     2,     0,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     3,
       3,     6,     6,     6,     1,     0,     4,     1,     0,     3,
       1,     0,     7,     0,     5,     3,     3,     0,     3,     1,
       2,     1,     2,     4,     4,     3,     3,     1,     4,     3,
       0,     1,     1,     0,     2,     3,     0,     2,     2,     3,
       4,     2,     2,     2,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       5,     3,     3,     4,     1,     1,     4,     4,     4,     4,
       4,     4,     4,     6,     6,     6,     4,     6,     4,     1,
       6,     6,     6,     4,     4,     4,     3,     0,     4,     0,
       4,     0,     1,     0,     4,     0,     1,     1,     1,     0,
       0,     0,     0,     0,     0,    20,     0,     0,     0,     0,
       0,    18,     0,     0,     7,     0,     5,     1,     1,     1,
       1,     1,     3,     0,     2,     3,     2,     6,    10,     2,
       1,     0,     1,     2,     0,     0,     3,     0,     0,     0,
       0,    11,     4,     0,     2,     0,     0,     6,     1,     0,
       3,     5,     0,     3,     0,     2,     1,     2,     4,     2,
       0,     2,     0,     5,     1,     2,     4,     5,     6,     1,
       2,     0,     2,     4,     4,     8,     1,     1,     3,     3,
       0,     9,     0,     7,     1,     3,     1,     3,     1,     3,
       0,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    59,    10,     8,   340,   334,     0,     2,    62,     3,
      13,     6,     0,     4,     0,     5,     0,     1,    60,    11,
       0,   351,     0,   341,   344,     0,   335,   336,     0,     0,
       0,     0,     0,    79,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   211,   212,     0,
       0,    82,     0,     0,     0,     0,   113,     0,    72,    61,
      64,    70,     0,    63,    66,    67,    68,    69,    65,    71,
       0,    16,     0,     0,     0,     0,    17,     0,     0,     0,
      19,    46,     0,     0,     0,     0,     0,     0,    51,    54,
       0,     0,     0,   357,   368,   356,   364,   366,     0,     0,
     351,   345,   364,   366,     0,     0,   337,   216,   176,   175,
     174,   173,   172,   171,   170,   169,   216,   110,   323,     0,
       0,     0,     0,     7,    85,   188,     0,     0,     0,     0,
       0,     0,     0,     0,   210,   213,    93,     0,     0,     0,
       0,     0,     0,    54,   178,   177,   112,     0,     0,    40,
       0,   244,   259,     0,     0,     0,     0,     0,     0,     0,
       0,   245,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    14,
       0,    49,    31,    47,    32,    18,    33,    23,     0,    36,
       0,    37,    52,    38,    39,     0,    42,    12,     9,     0,
       0,     0,     0,   352,     0,     0,   339,   179,     0,   180,
       0,     0,    89,    90,     0,     0,    62,   191,     0,     0,
     185,   190,     0,     0,     0,     0,     0,     0,     0,   205,
     207,   185,   185,   213,     0,     0,     0,    93,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    13,     0,     0,
     222,   218,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   221,   223,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    25,     0,     0,
      45,     0,     0,     0,    22,     0,     0,    56,    55,   362,
       0,     0,   346,   359,   369,   358,   365,   367,     0,   338,
     217,   280,   107,     0,   286,   292,   109,   108,   325,   322,
     324,     0,    76,    78,   342,   197,   193,   186,   184,     0,
       0,    92,    73,    74,    84,   111,   203,   204,     0,   208,
       0,   213,   214,    87,    81,    95,    98,     0,    94,     0,
      75,   216,   216,   216,     0,    88,     0,    27,    28,    43,
      29,    30,   219,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   242,   241,   239,   238,   237,   232,
     231,   235,   236,   234,   233,   230,   229,   227,   228,   224,
     225,   226,    15,    26,    24,    50,    48,    44,    20,    21,
      35,    34,    53,    57,     0,     0,   353,   354,     0,   349,
     347,     0,   303,   295,     0,   303,     0,     0,    86,     0,
       0,   188,   189,     0,   206,   209,   215,   101,    97,   100,
       0,     0,    83,     0,     0,     0,     0,   343,    41,     0,
     252,   258,     0,     0,   256,     0,   243,   220,   247,   246,
     248,   249,     0,     0,   263,   264,   251,     0,   265,   250,
       0,    58,   370,   367,   360,   350,   348,     0,     0,   303,
       0,   269,   110,   310,     0,   311,   293,   328,   329,     0,
     201,     0,     0,   199,     0,     0,    91,     0,   105,    96,
      99,     0,   181,   182,   183,     0,     0,     0,     0,     0,
       0,     0,     0,   240,   371,     0,     0,     0,   297,   298,
     299,   300,   301,   304,     0,     0,     0,     0,   306,     0,
     271,     0,   309,   312,   269,     0,   332,     0,   326,     0,
     202,   198,   200,     0,   185,   194,     0,     0,   103,   114,
     253,   254,   255,   257,   260,   261,   262,   363,     0,   370,
     302,     0,   305,     0,     0,   273,   296,   275,   110,     0,
     329,     0,     0,    77,   216,     0,   102,     0,     0,   355,
       0,   303,     0,     0,   272,   275,     0,   287,     0,     0,
     330,     0,   327,   195,     0,   192,   106,     0,   361,     0,
       0,   268,     0,   281,     0,     0,   294,   333,   329,   216,
     104,     0,   307,   270,   279,     0,   288,   331,   196,     0,
     276,   277,   278,     0,   274,   317,   303,   282,     0,     0,
     159,   318,   289,   308,   136,   117,   116,   161,   162,   163,
     164,   165,     0,     0,     0,     0,     0,     0,   146,   148,
     153,     0,     0,     0,   147,     0,   118,     0,     0,   142,
     150,   158,   160,     0,     0,     0,     0,   314,     0,     0,
       0,     0,   155,   216,     0,   143,     0,     0,   115,     0,
     135,   185,     0,   137,     0,     0,   157,   283,   216,   145,
     159,     0,   267,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   159,     0,   166,     0,     0,   129,     0,
     133,     0,     0,   138,     0,   185,   185,     0,   314,     0,
       0,   313,     0,   315,     0,     0,   149,     0,   120,     0,
       0,   121,   122,   128,     0,   152,     0,   115,     0,     0,
     131,     0,   132,   134,   140,   139,   185,   267,   151,   319,
       0,   168,     0,     0,     0,     0,     0,   156,     0,   144,
     130,   119,   141,   315,   315,   266,   216,     0,   290,     0,
       0,     0,     0,     0,     0,   168,   168,   167,   316,   185,
     124,   123,     0,   125,   126,     0,   284,   320,   291,   127,
     154,   185,   185,   285,   321
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     6,   124,    11,    12,     9,    10,    19,    91,   247,
     185,   184,   182,   193,   194,   195,   308,     7,     8,    18,
      59,   137,   216,   235,   236,   358,   507,   588,   557,    60,
     210,   326,   142,   666,   667,   719,   668,   721,   691,   669,
     670,   717,   671,   684,   713,   672,   673,   674,   714,   778,
     116,   146,    62,   724,    63,   219,   220,   221,   335,   441,
     554,   605,   440,   502,   503,    64,    65,   231,    66,   232,
      67,   234,   715,   208,   252,   733,   540,   575,   595,   597,
     633,   327,   432,   624,   640,   728,   801,   434,   615,   635,
     677,   789,   435,   545,   492,   534,   490,   491,   495,   544,
     702,   761,   638,   676,   774,   802,    68,   211,   330,   436,
     582,   498,   548,   580,    15,    16,    26,    27,   104,    13,
      14,    69,    70,    23,    24,   431,    98,    99,   527,   425,
     525
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -656
static const yytype_int16 yypact[] =
{
     236,  -656,  -656,  -656,  -656,  -656,   109,  -656,  -656,  -656,
    -656,  -656,   114,  -656,   -16,  -656,    84,  -656,   927,  1725,
     142,   102,   118,   -16,  -656,   110,    84,  -656,   552,   141,
     183,    87,   210,  -656,   228,  -656,   156,   219,   249,   261,
     263,   264,   272,   274,   276,   277,   279,  -656,  -656,   281,
     283,  -656,   288,   289,   291,   292,  -656,   294,  -656,  -656,
    -656,  -656,   107,  -656,  -656,  -656,  -656,  -656,  -656,  -656,
     196,  -656,   331,   156,   332,   751,  -656,   333,   337,   338,
    -656,  -656,   339,   341,   351,   751,   354,   363,   364,  -656,
     365,   257,   751,  -656,   373,  -656,   367,   375,   320,   233,
     102,  -656,  -656,  -656,   336,   259,  -656,  -656,  -656,  -656,
    -656,  -656,  -656,  -656,  -656,  -656,  -656,  -656,  -656,   405,
     409,   411,   412,  -656,  -656,    63,   413,   414,   418,   156,
     156,   420,   156,    23,  -656,   421,  -656,   389,   156,   426,
     427,   428,   396,  -656,  -656,  -656,  -656,   376,    50,  -656,
      75,  -656,  -656,   751,   751,   751,   398,   399,   400,   402,
     403,  -656,   415,   416,   419,   422,   424,   429,   431,   432,
     440,   441,   443,   444,   445,   447,   450,   751,   751,  1534,
     390,  -656,   301,  -656,   302,    10,  -656,  -656,   517,  1906,
     304,  -656,  -656,   311,  -656,   459,  -656,  -656,  1906,   406,
     110,   110,   342,   134,   430,   343,   134,  -656,   751,  -656,
     306,    35,  -656,  -656,   -52,   346,  -656,  -656,   156,   437,
      51,  -656,   350,   353,   362,   366,   368,   370,   387,  -656,
    -656,   -32,    82,    39,   391,   392,    32,  -656,   395,   482,
     493,   494,   751,   401,   -16,   751,   751,  -656,   751,   751,
    -656,  -656,   935,   751,   751,   751,   751,   751,   499,   508,
     751,   509,   512,   518,   521,   751,   751,   534,   541,   751,
     751,   751,   545,  -656,  -656,   751,   751,   751,   751,   751,
     751,   751,   751,   751,   751,   751,   751,   751,   751,   751,
     751,   751,   751,   751,   751,   751,   751,  1906,   547,   548,
    -656,   549,   751,   751,  1906,   220,   563,  -656,    45,  -656,
     423,   433,  -656,  -656,   568,  -656,  -656,  -656,   -59,  -656,
    1906,   552,  -656,   156,  -656,  -656,  -656,  -656,  -656,  -656,
    -656,   570,  -656,  -656,  1003,   487,  -656,  -656,  -656,    63,
     571,  -656,  -656,  -656,  -656,  -656,  -656,  -656,   156,  -656,
     156,   421,  -656,  -656,  -656,  -656,  -656,   539,    21,   434,
    -656,  -656,  -656,  -656,  1554,  -656,    -5,  1906,  1906,  1749,
    1906,  1906,  -656,   891,  1135,  1574,  1594,  1155,   442,   438,
    1175,   439,   455,   456,   457,  1614,  1634,   458,   460,  1195,
    1665,  1215,   462,  1866,  1746,  1115,  1921,  1935,  1248,   692,
     692,   319,   319,   319,   319,   369,   369,   247,   247,  -656,
    -656,  -656,  1906,  1906,  1906,  -656,  -656,  -656,  1906,  1906,
    -656,  -656,  -656,  -656,   574,   110,   189,   134,   522,  -656,
    -656,   -25,   592,  -656,   676,   592,   751,   461,  -656,     3,
     575,    63,  -656,   464,  -656,  -656,  -656,  -656,  -656,  -656,
     542,    46,  -656,   465,   466,   467,   586,  -656,  -656,   751,
    -656,  -656,   751,   751,  -656,   751,  -656,  -656,  -656,  -656,
    -656,  -656,   751,   751,  -656,  -656,  -656,   590,  -656,  -656,
     751,  -656,   469,   602,  -656,  -656,  -656,   222,   582,  1777,
     604,   519,  -656,  -656,  1886,   532,  -656,  1906,    24,   621,
    -656,   622,     2,  -656,   540,   591,  -656,    32,  -656,  -656,
    -656,   599,  -656,  -656,  -656,   488,  1235,  1268,  1288,  1308,
    1328,  1348,   489,  1906,   134,   580,   110,   110,  -656,  -656,
    -656,  -656,  -656,  -656,   491,   751,    12,   626,  -656,   609,
     610,   340,  -656,  -656,   519,   589,   612,   613,  -656,   502,
    -656,  -656,  -656,   647,   507,  -656,    17,    32,  -656,  -656,
    -656,  -656,  -656,  -656,  -656,  -656,  -656,  -656,   510,   469,
    -656,  1368,  -656,   751,   618,   513,  -656,   556,  -656,   751,
      24,   751,   515,  -656,  -656,   565,  -656,    28,    32,   134,
     606,    38,  1401,   751,  -656,   556,   624,  -656,   388,  1421,
    -656,  1441,  -656,  -656,   660,  -656,  -656,    40,  -656,   631,
     655,  -656,  1461,  -656,   751,   623,  -656,  -656,    24,  -656,
    -656,   751,  -656,  -656,   144,  1481,  -656,  -656,  -656,  1501,
    -656,  -656,  -656,   625,  -656,  -656,   645,  -656,    37,   668,
     834,  -656,  -656,  -656,   520,  -656,  -656,  -656,  -656,  -656,
    -656,  -656,   649,   651,   652,   653,   156,   654,  -656,  -656,
    -656,   656,   657,   658,  -656,    44,  -656,   659,    15,  -656,
    -656,  -656,   834,   638,   661,   107,   641,   675,   234,    76,
     130,   130,  -656,  -656,   664,  -656,   698,   130,  -656,   667,
    -656,    83,    44,   671,    44,   674,  -656,  -656,  -656,  -656,
     834,   701,   628,   694,   695,   584,   697,   593,   702,   703,
     594,   597,   598,   834,   600,  -656,   751,     8,  -656,    -8,
    -656,    14,    89,  -656,    44,   101,    95,    44,   675,   601,
     679,  -656,   687,  -656,   130,   130,  -656,   130,  -656,   130,
     130,  -656,  -656,  -656,   699,  -656,  1685,   603,   614,   744,
    -656,   130,  -656,  -656,  -656,  -656,   123,   628,  -656,  -656,
     749,   116,   615,   616,    20,   617,   619,  -656,   763,  -656,
    -656,  -656,  -656,  -656,  -656,  -656,  -656,   766,  -656,   627,
     629,   130,   630,   634,   635,   116,   116,  -656,  -656,   507,
    -656,  -656,   636,  -656,  -656,   107,  -656,  -656,  -656,  -656,
    -656,   507,   507,  -656,  -656
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -656,  -656,   -72,  -656,  -656,  -656,  -656,   525,  -656,  -656,
    -656,  -656,  -656,  -656,   632,  -656,  -656,  -656,  -656,   557,
    -656,  -656,  -656,   537,  -656,  -469,  -656,  -656,  -656,  -656,
    -458,   -13,  -656,   120,  -338,  -656,  -656,    43,  -602,    60,
    -656,  -656,   119,  -656,  -656,  -656,  -645,  -656,    16,  -523,
    -656,  -655,  -401,  -216,  -656,   345,  -656,   470,  -656,  -656,
    -656,  -656,  -656,  -656,   293,  -656,  -656,  -656,  -656,  -656,
    -656,  -202,  -105,  -656,   -75,    48,   252,  -656,  -656,   202,
    -656,  -656,  -656,  -656,  -656,  -656,  -656,  -656,  -656,  -656,
    -656,  -656,  -656,  -656,  -656,  -656,  -480,   371,  -656,  -656,
      80,  -483,  -656,  -656,  -656,  -656,  -656,  -656,  -656,  -656,
    -656,  -656,  -506,  -656,  -656,  -656,  -656,   784,  -656,  -656,
    -656,  -656,  -656,   569,   -20,  -656,   712,   -17,  -656,  -656,
     245
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -343
static const yytype_int16 yytable[] =
{
     179,   149,   207,   101,   339,    61,   500,   500,   105,   537,
     189,   209,   747,   749,   300,   348,   350,   198,   688,   693,
     699,   448,   449,   645,   688,   448,   449,   123,   546,   645,
     645,   352,   448,   449,   541,   645,   355,   356,   556,   328,
     646,   641,    21,   233,   448,   449,   646,   646,   688,   423,
     509,   510,   646,    21,   457,   730,   245,   225,   226,   645,
     228,   230,   689,   653,   654,   655,   238,   217,   744,   689,
     653,   654,   655,   429,   600,   536,   646,   609,   250,   251,
     688,   248,   528,   529,   530,   531,   532,  -187,   587,   430,
     725,   645,   726,   688,   329,   331,   642,   332,   689,   653,
     654,   655,   273,   274,   645,   297,    93,   485,   646,    17,
    -187,   610,   627,   304,    93,   338,    22,   347,    20,   607,
     598,   646,   776,   486,   450,   756,   547,    22,   450,   218,
     708,   709,   777,   320,   688,   450,   119,   120,   313,   357,
     800,   750,    25,   703,   704,   645,   336,   450,    92,   446,
     662,   551,   663,   511,   501,   501,   639,   301,   665,   663,
     123,   533,   646,   751,   451,   694,   586,   364,   451,   781,
     367,   368,   229,   370,   371,   451,   100,   606,   373,   374,
     375,   376,   377,   310,   311,   380,   351,   451,   663,   620,
     385,   386,   424,   313,   389,   390,   391,   246,   338,   117,
     393,   394,   395,   396,   397,   398,   399,   400,   401,   402,
     403,   404,   405,   406,   407,   408,   409,   410,   411,   412,
     413,   414,   249,   420,   421,   151,   152,   418,   419,   338,
     338,   349,    94,   706,   723,    95,    96,    97,   688,   675,
      94,   118,   338,    95,   102,   103,   755,   121,   338,   645,
     754,   433,   153,   154,   144,   145,   453,   454,   455,   155,
     156,   157,   796,   797,   314,   122,   646,   315,   316,   317,
     338,   675,   772,   158,   159,   160,   444,   125,   445,   291,
     292,   293,   161,   630,   631,   632,   126,   162,   703,   704,
     785,   786,   528,   529,   530,   531,   532,   163,   127,   675,
     128,   129,   164,   165,   166,   167,   168,   169,   170,   130,
     321,   131,   675,   132,   133,   171,   134,   172,   135,   314,
     136,    61,   315,   316,   483,   138,   139,   690,   140,   141,
     695,   143,   147,   173,   705,   148,   150,   180,   585,   174,
     175,   181,   183,   186,   321,   187,   101,   287,   288,   289,
     290,   291,   292,   293,   690,   188,   690,   489,   190,   494,
     489,   497,     1,     2,     3,   322,   191,   176,   192,   196,
     197,   533,   323,     4,   177,   178,   576,   199,   706,   202,
     324,   203,     5,   200,   516,    43,   753,   517,   518,   690,
     519,   201,   321,   151,   152,   205,   295,   520,   521,   289,
     290,   291,   292,   293,   325,   523,   323,   206,   482,   212,
      53,    54,    55,   213,   324,   214,   215,   222,   223,    43,
     153,   154,   224,    56,   227,   233,   237,   155,   156,   157,
     239,   240,   241,   242,   244,   253,   254,   255,   325,   256,
     257,   158,   159,   160,    53,    54,    55,   616,   298,   299,
     161,   305,   258,   259,   323,   162,   260,    56,   306,   261,
     571,   262,   324,   307,   309,   163,   263,    43,   264,   265,
     164,   165,   166,   167,   168,   169,   170,   266,   267,   603,
     268,   269,   270,   171,   271,   172,   325,   272,   361,   318,
     312,   319,    53,    54,    55,   333,   337,   340,   592,   362,
     363,   173,   341,   378,   599,    56,   601,   174,   175,   568,
     569,   342,   379,   381,   628,   343,   382,   344,   612,   345,
     151,   152,   383,   302,   439,   384,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   176,   346,   296,   387,   625,
     353,   354,   177,   178,   360,   388,   629,   153,   154,   392,
     365,   415,   416,   417,   155,   156,   157,  -115,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   422,   158,   159,
     160,   426,   428,   798,   437,   443,   447,   161,   481,   508,
     484,   427,   162,   452,   682,   803,   804,   466,   468,   465,
     515,   504,   163,   729,   522,   151,   152,   164,   165,   166,
     167,   168,   169,   170,   469,   470,   471,   474,   499,   475,
     171,   479,   172,   506,   512,   513,   514,   524,   526,   535,
     538,   539,   153,   154,   543,   549,   550,   555,   173,   487,
     156,   157,   488,   553,   174,   175,   558,   559,   566,   567,
     570,   746,   572,   158,   159,   160,   573,   578,   574,   579,
     581,   583,   161,   584,   338,   593,   594,   162,   589,   596,
     604,   614,   176,   602,   303,   608,   619,   163,   621,   177,
     178,   622,   164,   165,   166,   167,   168,   169,   170,   151,
     152,   626,   536,   637,   643,   171,   678,   172,   679,   680,
     681,   683,   493,   685,   686,   687,   692,   697,   698,   700,
     701,   716,   718,   173,   722,   731,   153,   154,  -115,   174,
     175,   727,   760,   155,   156,   157,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   158,   159,   160,
     732,   734,   735,   736,   737,   767,   161,   176,   759,   739,
     740,   162,   738,   741,   177,   178,   742,   743,   770,   745,
     758,   163,  -136,   775,   151,   152,   164,   165,   166,   167,
     168,   169,   170,   769,   779,   780,   782,   784,   783,   171,
     788,   172,   369,   334,   359,   243,   790,   748,   791,   793,
     764,   153,   154,   794,   795,   799,   505,   173,   155,   156,
     157,   696,   787,   174,   175,   552,   577,   613,   707,   710,
     711,   712,   158,   159,   160,   773,   496,   720,   757,   442,
     106,   161,   204,   366,   590,     0,   162,     0,     0,     0,
       0,   176,     0,     0,     0,     0,   163,     0,   177,   178,
       0,   164,   165,   166,   167,   168,   169,   170,   644,     0,
       0,   752,   707,     0,   171,     0,   172,     0,     0,   645,
       0,     0,     0,     0,   762,   763,     0,   720,     0,   765,
     766,     0,   173,     0,     0,     0,   646,     0,   174,   175,
       0,   771,     0,     0,     0,   647,   648,   649,   650,   651,
       0,     0,     0,     0,   752,     0,     0,     0,   652,   653,
     654,   655,     0,     0,     0,     0,   176,     0,     0,     0,
     656,   792,     0,   177,   178,     0,   275,     0,   276,   277,
     278,   279,   280,   281,   282,   283,   284,   285,   286,   287,
     288,   289,   290,   291,   292,   293,     0,     0,   657,     0,
     658,    28,     0,     0,   659,     0,     0,     0,    53,    54,
      55,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     275,   660,   276,   277,   278,   279,   280,   281,   282,   283,
     284,   285,   286,   287,   288,   289,   290,   291,   292,   293,
       0,     0,   661,    29,    30,    31,   662,     0,   663,     0,
       0,     0,   664,     0,   665,     0,     0,     0,    32,    33,
      34,    35,     0,    36,    37,    38,    39,     0,     0,     0,
       0,     0,     0,    40,    41,    42,    43,    28,     0,     0,
       0,     0,     0,     0,    44,    45,    46,    47,    48,    49,
       0,     0,     0,     0,    50,    51,    52,     0,     0,     0,
       0,    53,    54,    55,     0,     0,     0,     0,   459,   438,
     460,     0,     0,     0,    56,     0,     0,     0,     0,    29,
      30,    31,     0,     0,     0,     0,     0,    57,     0,     0,
       0,     0,     0,  -342,    32,    33,    34,    35,     0,    36,
      37,    38,    39,     0,     0,    58,     0,     0,     0,    40,
      41,    42,    43,     0,   372,     0,     0,     0,     0,     0,
      44,    45,    46,    47,    48,    49,     0,     0,     0,     0,
      50,    51,    52,     0,     0,     0,     0,    53,    54,    55,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      56,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    57,   278,   279,   280,   281,   282,   283,
     284,   285,   286,   287,   288,   289,   290,   291,   292,   293,
     275,    58,   276,   277,   278,   279,   280,   281,   282,   283,
     284,   285,   286,   287,   288,   289,   290,   291,   292,   293,
     275,     0,   276,   277,   278,   279,   280,   281,   282,   283,
     284,   285,   286,   287,   288,   289,   290,   291,   292,   293,
     275,     0,   276,   277,   278,   279,   280,   281,   282,   283,
     284,   285,   286,   287,   288,   289,   290,   291,   292,   293,
     275,     0,   276,   277,   278,   279,   280,   281,   282,   283,
     284,   285,   286,   287,   288,   289,   290,   291,   292,   293,
     275,     0,   276,   277,   278,   279,   280,   281,   282,   283,
     284,   285,   286,   287,   288,   289,   290,   291,   292,   293,
     275,     0,   276,   277,   278,   279,   280,   281,   282,   283,
     284,   285,   286,   287,   288,   289,   290,   291,   292,   293,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   275,   461,   276,   277,   278,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   275,   464,   276,   277,   278,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   275,   467,   276,   277,   278,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   275,   476,   276,   277,   278,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   275,   478,   276,   277,   278,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   275,   560,   276,   277,   278,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   275,   561,   276,   277,
     278,   279,   280,   281,   282,   283,   284,   285,   286,   287,
     288,   289,   290,   291,   292,   293,   275,   562,   276,   277,
     278,   279,   280,   281,   282,   283,   284,   285,   286,   287,
     288,   289,   290,   291,   292,   293,   275,   563,   276,   277,
     278,   279,   280,   281,   282,   283,   284,   285,   286,   287,
     288,   289,   290,   291,   292,   293,   275,   564,   276,   277,
     278,   279,   280,   281,   282,   283,   284,   285,   286,   287,
     288,   289,   290,   291,   292,   293,   275,   565,   276,   277,
     278,   279,   280,   281,   282,   283,   284,   285,   286,   287,
     288,   289,   290,   291,   292,   293,   275,   591,   276,   277,
     278,   279,   280,   281,   282,   283,   284,   285,   286,   287,
     288,   289,   290,   291,   292,   293,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   275,
     611,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   275,
     617,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   275,
     618,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   275,
     623,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   275,
     634,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   275,
     636,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     275,   294,   276,   277,   278,   279,   280,   281,   282,   283,
     284,   285,   286,   287,   288,   289,   290,   291,   292,   293,
     275,   456,   276,   277,   278,   279,   280,   281,   282,   283,
     284,   285,   286,   287,   288,   289,   290,   291,   292,   293,
       0,   462,     0,     0,     0,     0,     0,     0,     0,    71,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   463,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    71,     0,     0,     0,     0,     0,     0,
       0,   472,     0,    72,   277,   278,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   473,     0,     0,     0,   458,     0,    72,     0,     0,
       0,    73,   275,     0,   276,   277,   278,   279,   280,   281,
     282,   283,   284,   285,   286,   287,   288,   289,   290,   291,
     292,   293,   477,     0,   536,    73,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    74,     0,     0,     0,
       0,     0,   768,    75,    76,    77,    78,    79,   -43,    80,
      81,    82,     0,     0,    83,    84,     0,    85,    86,    87,
      74,     0,     0,     0,    88,    89,    90,    75,    76,    77,
      78,    79,     0,    80,    81,    82,     0,     0,    83,    84,
       0,    85,    86,    87,     0,     0,     0,     0,    88,    89,
      90,   275,   480,   276,   277,   278,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   275,   542,   276,   277,   278,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   275,     0,   276,   277,   278,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   279,   280,   281,   282,   283,   284,   285,   286,   287,
     288,   289,   290,   291,   292,   293,   280,   281,   282,   283,
     284,   285,   286,   287,   288,   289,   290,   291,   292,   293
};

static const yytype_int16 yycheck[] =
{
      75,    73,   107,    23,   220,    18,     4,     4,    25,   489,
      85,   116,     4,    21,     4,   231,   232,    92,     4,     4,
     675,     4,     5,    15,     4,     4,     5,     4,     4,    15,
      15,   233,     4,     5,   492,    15,     4,     5,   507,     4,
      32,     4,    58,     4,     4,     5,    32,    32,     4,     4,
       4,     5,    32,    58,    59,   700,     6,   129,   130,    15,
     132,   133,    54,    55,    56,    57,   138,     4,   713,    54,
      55,    56,    57,   132,   580,    37,    32,    39,   153,   154,
       4,     6,    70,    71,    72,    73,    74,    36,   557,   148,
     692,    15,   694,     4,    59,   147,    59,   149,    54,    55,
      56,    57,   177,   178,    15,   180,     4,   132,    32,     0,
      59,   591,   618,   188,     4,   147,   132,   149,     4,   588,
     578,    32,     6,   148,   107,   727,   102,   132,   107,    66,
      54,    55,    16,   208,     4,   107,    49,    50,     4,   107,
     795,   149,    58,    54,    55,    15,   218,   107,     6,   351,
     142,   149,   144,   107,   152,   152,   636,   147,   150,   144,
       4,   149,    32,   149,   147,   150,   149,   242,   147,   149,
     245,   246,   149,   248,   249,   147,    58,   149,   253,   254,
     255,   256,   257,   200,   201,   260,   147,   147,   144,   149,
     265,   266,   147,     4,   269,   270,   271,   147,   147,    58,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   147,     3,     4,     3,     4,   302,   303,   147,
     147,   149,   130,   144,   151,   133,   134,   135,     4,   640,
     130,    58,   147,   133,   134,   135,   151,    37,   147,    15,
     149,   323,    30,    31,   147,   148,   361,   362,   363,    37,
      38,    39,   785,   786,   130,    37,    32,   133,   134,   135,
     147,   672,   149,    51,    52,    53,   348,    58,   350,    32,
      33,    34,    60,   139,   140,   141,    37,    65,    54,    55,
     773,   774,    70,    71,    72,    73,    74,    75,    37,   700,
      37,    37,    80,    81,    82,    83,    84,    85,    86,    37,
       4,    37,   713,    37,    37,    93,    37,    95,    37,   130,
      37,   334,   133,   134,   135,    37,    37,   665,    37,    37,
     668,    37,   136,   111,   100,     4,     4,     4,   554,   117,
     118,     4,     4,     4,     4,     4,   366,    28,    29,    30,
      31,    32,    33,    34,   692,     4,   694,   432,     4,   434,
     435,   436,   126,   127,   128,    59,     3,   145,     4,     4,
     113,   149,    66,   137,   152,   153,    36,     4,   144,    59,
      74,   148,   146,    16,   459,    79,   724,   462,   463,   727,
     465,    16,     4,     3,     4,    59,     6,   472,   473,    30,
      31,    32,    33,    34,    98,   480,    66,   148,   425,     4,
     104,   105,   106,     4,    74,     4,     4,     4,     4,    79,
      30,    31,     4,   117,     4,     4,    37,    37,    38,    39,
       4,     4,     4,    37,    58,    37,    37,    37,    98,    37,
      37,    51,    52,    53,   104,   105,   106,    59,   147,   147,
      60,   147,    37,    37,    66,    65,    37,   117,   147,    37,
     535,    37,    74,     4,    58,    75,    37,    79,    37,    37,
      80,    81,    82,    83,    84,    85,    86,    37,    37,   584,
      37,    37,    37,    93,    37,    95,    98,    37,     6,    59,
     148,   148,   104,   105,   106,   149,    59,   147,   573,     6,
       6,   111,   149,     4,   579,   117,   581,   117,   118,   526,
     527,   149,     4,     4,   619,   149,     4,   149,   593,   149,
       3,     4,     4,     6,    37,     4,     6,     7,     8,     9,
      10,    11,    12,    13,    14,   145,   149,   147,     4,   614,
     149,   149,   152,   153,   149,     4,   621,    30,    31,     4,
     149,     4,     4,     4,    37,    38,    39,    37,     6,     7,
       8,     9,    10,    11,    12,    13,    14,     4,    51,    52,
      53,   148,     4,   789,     4,     4,    37,    60,     4,    37,
      58,   148,    65,   149,   656,   801,   802,   149,   149,   147,
       4,    16,    75,   698,     4,     3,     4,    80,    81,    82,
      83,    84,    85,    86,   149,   149,   149,   149,   147,   149,
      93,   149,    95,   149,   149,   149,   149,   148,    16,    37,
      16,   102,    30,    31,    92,     4,     4,    36,   111,    37,
      38,    39,    40,    93,   117,   118,    37,   149,   149,    59,
     149,   716,    16,    51,    52,    53,    37,    58,    38,    37,
      37,   149,    60,     6,   147,    37,   143,    65,   148,   103,
      95,    37,   145,   148,   147,    59,     6,    75,    37,   152,
     153,    16,    80,    81,    82,    83,    84,    85,    86,     3,
       4,    58,    37,    58,    16,    93,    37,    95,    37,    37,
      37,    37,    16,    37,    37,    37,    37,    59,    37,    58,
      25,    37,     4,   111,    37,     4,    30,    31,    37,   117,
     118,    37,    25,    37,    38,    39,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    51,    52,    53,
     102,    37,    37,   149,    37,    36,    60,   145,    59,    37,
      37,    65,   149,   149,   152,   153,   149,   149,     4,   149,
     149,    75,   149,     4,     3,     4,    80,    81,    82,    83,
      84,    85,    86,   149,   149,   149,   149,     4,   149,    93,
       4,    95,   247,   216,   237,   143,   149,   717,   149,   149,
     737,    30,    31,   149,   149,   149,   441,   111,    37,    38,
      39,   672,   776,   117,   118,   502,   544,   595,   678,   679,
     680,   681,    51,    52,    53,   757,   435,   687,   728,   339,
      26,    60,   100,   244,   569,    -1,    65,    -1,    -1,    -1,
      -1,   145,    -1,    -1,    -1,    -1,    75,    -1,   152,   153,
      -1,    80,    81,    82,    83,    84,    85,    86,     4,    -1,
      -1,   721,   722,    -1,    93,    -1,    95,    -1,    -1,    15,
      -1,    -1,    -1,    -1,   734,   735,    -1,   737,    -1,   739,
     740,    -1,   111,    -1,    -1,    -1,    32,    -1,   117,   118,
      -1,   751,    -1,    -1,    -1,    41,    42,    43,    44,    45,
      -1,    -1,    -1,    -1,   764,    -1,    -1,    -1,    54,    55,
      56,    57,    -1,    -1,    -1,    -1,   145,    -1,    -1,    -1,
      66,   781,    -1,   152,   153,    -1,    15,    -1,    17,    18,
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
     160,   157,   158,   273,   274,   268,   269,     0,   173,   161,
       4,    58,   132,   277,   278,    58,   270,   271,     4,    46,
      47,    48,    61,    62,    63,    64,    66,    67,    68,    69,
      76,    77,    78,    79,    87,    88,    89,    90,    91,    92,
      97,    98,    99,   104,   105,   106,   117,   130,   148,   174,
     183,   185,   206,   208,   219,   220,   222,   224,   260,   275,
     276,     4,    38,    66,   101,   108,   109,   110,   111,   112,
     114,   115,   116,   119,   120,   122,   123,   124,   129,   130,
     131,   162,     6,     4,   130,   133,   134,   135,   280,   281,
      58,   278,   134,   135,   272,   281,   271,     6,     7,     8,
       9,    10,    11,    12,    13,    14,   204,    58,    58,    49,
      50,    37,    37,     4,   156,    58,    37,    37,    37,    37,
      37,    37,    37,    37,    37,    37,    37,   175,    37,    37,
      37,    37,   186,    37,   147,   148,   205,   136,     4,   156,
       4,     3,     4,    30,    31,    37,    38,    39,    51,    52,
      53,    60,    65,    75,    80,    81,    82,    83,    84,    85,
      86,    93,    95,   111,   117,   118,   145,   152,   153,   228,
       4,     4,   166,     4,   165,   164,     4,     4,     4,   228,
       4,     3,     4,   167,   168,   169,     4,   113,   228,     4,
      16,    16,    59,   148,   280,    59,   148,   226,   227,   226,
     184,   261,     4,     4,     4,     4,   176,     4,    66,   209,
     210,   211,     4,     4,     4,   156,   156,     4,   156,   149,
     156,   221,   223,     4,   225,   177,   178,    37,   156,     4,
       4,     4,    37,   168,    58,     6,   147,   163,     6,   147,
     228,   228,   228,    37,    37,    37,    37,    37,    37,    37,
      37,    37,    37,    37,    37,    37,    37,    37,    37,    37,
      37,    37,    37,   228,   228,    15,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,   147,     6,   147,   228,   147,   147,
       4,   147,     6,   147,   228,   147,   147,     4,   170,    58,
     281,   281,   148,     4,   130,   133,   134,   135,    59,   148,
     228,     4,    59,    66,    74,    98,   185,   235,     4,    59,
     262,   147,   149,   149,   173,   212,   156,    59,   147,   207,
     147,   149,   149,   149,   149,   149,   149,   149,   207,   149,
     207,   147,   225,   149,   149,     4,     5,   107,   179,   177,
     149,     6,     6,     6,   228,   149,   277,   228,   228,   161,
     228,   228,   149,   228,   228,   228,   228,   228,     4,     4,
     228,     4,     4,     4,     4,   228,   228,     4,     4,   228,
     228,   228,     4,   228,   228,   228,   228,   228,   228,   228,
     228,   228,   228,   228,   228,   228,   228,   228,   228,   228,
     228,   228,   228,   228,   228,     4,     4,     4,   228,   228,
       3,     4,     4,     4,   147,   283,   148,   148,     4,   132,
     148,   279,   236,   156,   241,   246,   263,     4,    36,    37,
     216,   213,   211,     4,   156,   156,   225,    37,     4,     5,
     107,   147,   149,   226,   226,   226,   147,    59,    36,   147,
     149,   149,   147,   147,   149,   147,   149,   149,   149,   149,
     149,   149,   147,   147,   149,   149,   149,   147,   149,   149,
      16,     4,   281,   135,    58,   132,   148,    37,    40,   228,
     250,   251,   248,    16,   228,   252,   251,   228,   265,   147,
       4,   152,   217,   218,    16,   209,   149,   180,    37,     4,
       5,   107,   149,   149,   149,     4,   228,   228,   228,   228,
     228,   228,     4,   228,   148,   284,    16,   282,    70,    71,
      72,    73,    74,   149,   249,    37,    37,   250,    16,   102,
     230,   184,    16,    92,   253,   247,     4,   102,   266,     4,
       4,   149,   218,    93,   214,    36,   179,   182,    37,   149,
     149,   149,   149,   149,   149,   149,   149,    59,   281,   281,
     149,   228,    16,    37,    38,   231,    36,   230,    58,    37,
     267,    37,   264,   149,     6,   207,   149,   179,   181,   148,
     284,   149,   228,    37,   143,   232,   103,   233,   184,   228,
     266,   228,   148,   226,    95,   215,   149,   179,    59,    39,
     250,   149,   228,   233,    37,   242,    59,   149,   149,     6,
     149,    37,    16,   149,   237,   228,    58,   266,   226,   228,
     139,   140,   141,   234,   149,   243,   149,    58,   256,   250,
     238,     4,    59,    16,     4,    15,    32,    41,    42,    43,
      44,    45,    54,    55,    56,    57,    66,    94,    96,   100,
     117,   138,   142,   144,   148,   150,   187,   188,   190,   193,
     194,   196,   199,   200,   201,   206,   257,   244,    37,    37,
      37,    37,   156,    37,   197,    37,    37,    37,     4,    54,
     188,   192,    37,     4,   150,   188,   196,    59,    37,   205,
      58,    25,   254,    54,    55,   100,   144,   187,    54,    55,
     187,   187,   187,   198,   202,   226,    37,   195,     4,   189,
     187,   191,    37,   151,   207,   192,   192,    37,   239,   226,
     200,     4,   102,   229,    37,    37,   149,    37,   149,    37,
      37,   149,   149,   149,   200,   149,   228,     4,   193,    21,
     149,   149,   187,   188,   149,   151,   192,   254,   149,    59,
      25,   255,   187,   187,   191,   187,   187,    36,   147,   149,
       4,   187,   149,   229,   258,     4,     6,    16,   203,   149,
     149,   149,   149,   149,     4,   255,   255,   202,     4,   245,
     149,   149,   187,   149,   149,   149,   203,   203,   207,   149,
     205,   240,   259,   207,   207
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
#line 368 "ldgram.y"
    { ldlex_inputlist(); }
    break;

  case 94:
#line 370 "ldgram.y"
    { ldlex_popstate(); }
    break;

  case 95:
#line 374 "ldgram.y"
    { lang_add_input_file((yyvsp[(1) - (1)].name),lang_input_file_is_search_file_enum,
				 (char *)NULL); }
    break;

  case 96:
#line 377 "ldgram.y"
    { lang_add_input_file((yyvsp[(3) - (3)].name),lang_input_file_is_search_file_enum,
				 (char *)NULL); }
    break;

  case 97:
#line 380 "ldgram.y"
    { lang_add_input_file((yyvsp[(2) - (2)].name),lang_input_file_is_search_file_enum,
				 (char *)NULL); }
    break;

  case 98:
#line 383 "ldgram.y"
    { lang_add_input_file((yyvsp[(1) - (1)].name),lang_input_file_is_l_enum,
				 (char *)NULL); }
    break;

  case 99:
#line 386 "ldgram.y"
    { lang_add_input_file((yyvsp[(3) - (3)].name),lang_input_file_is_l_enum,
				 (char *)NULL); }
    break;

  case 100:
#line 389 "ldgram.y"
    { lang_add_input_file((yyvsp[(2) - (2)].name),lang_input_file_is_l_enum,
				 (char *)NULL); }
    break;

  case 101:
#line 392 "ldgram.y"
    { (yyval.integer) = input_flags.add_DT_NEEDED_for_regular;
		    input_flags.add_DT_NEEDED_for_regular = TRUE; }
    break;

  case 102:
#line 395 "ldgram.y"
    { input_flags.add_DT_NEEDED_for_regular = (yyvsp[(3) - (5)].integer); }
    break;

  case 103:
#line 397 "ldgram.y"
    { (yyval.integer) = input_flags.add_DT_NEEDED_for_regular;
		    input_flags.add_DT_NEEDED_for_regular = TRUE; }
    break;

  case 104:
#line 400 "ldgram.y"
    { input_flags.add_DT_NEEDED_for_regular = (yyvsp[(5) - (7)].integer); }
    break;

  case 105:
#line 402 "ldgram.y"
    { (yyval.integer) = input_flags.add_DT_NEEDED_for_regular;
		    input_flags.add_DT_NEEDED_for_regular = TRUE; }
    break;

  case 106:
#line 405 "ldgram.y"
    { input_flags.add_DT_NEEDED_for_regular = (yyvsp[(4) - (6)].integer); }
    break;

  case 111:
#line 420 "ldgram.y"
    { lang_add_entry ((yyvsp[(3) - (4)].name), FALSE); }
    break;

  case 113:
#line 422 "ldgram.y"
    {ldlex_expression ();}
    break;

  case 114:
#line 423 "ldgram.y"
    { ldlex_popstate ();
		  lang_add_assignment (exp_assert ((yyvsp[(4) - (7)].etree), (yyvsp[(6) - (7)].name))); }
    break;

  case 115:
#line 431 "ldgram.y"
    {
			  (yyval.cname) = (yyvsp[(1) - (1)].name);
			}
    break;

  case 116:
#line 435 "ldgram.y"
    {
			  (yyval.cname) = "*";
			}
    break;

  case 117:
#line 439 "ldgram.y"
    {
			  (yyval.cname) = "?";
			}
    break;

  case 118:
#line 446 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(1) - (1)].cname);
			  (yyval.wildcard).sorted = none;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 119:
#line 453 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(5) - (5)].cname);
			  (yyval.wildcard).sorted = none;
			  (yyval.wildcard).exclude_name_list = (yyvsp[(3) - (5)].name_list);
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 120:
#line 460 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(3) - (4)].cname);
			  (yyval.wildcard).sorted = by_name;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 121:
#line 467 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(3) - (4)].cname);
			  (yyval.wildcard).sorted = by_alignment;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 122:
#line 474 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(3) - (4)].cname);
			  (yyval.wildcard).sorted = by_none;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 123:
#line 481 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(5) - (7)].cname);
			  (yyval.wildcard).sorted = by_name_alignment;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 124:
#line 488 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(5) - (7)].cname);
			  (yyval.wildcard).sorted = by_name;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 125:
#line 495 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(5) - (7)].cname);
			  (yyval.wildcard).sorted = by_alignment_name;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 126:
#line 502 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(5) - (7)].cname);
			  (yyval.wildcard).sorted = by_alignment;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 127:
#line 509 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(7) - (8)].cname);
			  (yyval.wildcard).sorted = by_name;
			  (yyval.wildcard).exclude_name_list = (yyvsp[(5) - (8)].name_list);
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 128:
#line 516 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(3) - (4)].cname);
			  (yyval.wildcard).sorted = by_init_priority;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
    break;

  case 129:
#line 525 "ldgram.y"
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

  case 130:
#line 543 "ldgram.y"
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

  case 131:
#line 564 "ldgram.y"
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

  case 132:
#line 577 "ldgram.y"
    {
			  struct name_list *tmp;
			  tmp = (struct name_list *) xmalloc (sizeof *tmp);
			  tmp->name = (yyvsp[(2) - (2)].cname);
			  tmp->next = (yyvsp[(1) - (2)].name_list);
			  (yyval.name_list) = tmp;
			}
    break;

  case 133:
#line 586 "ldgram.y"
    {
			  struct name_list *tmp;
			  tmp = (struct name_list *) xmalloc (sizeof *tmp);
			  tmp->name = (yyvsp[(1) - (1)].cname);
			  tmp->next = NULL;
			  (yyval.name_list) = tmp;
			}
    break;

  case 134:
#line 597 "ldgram.y"
    {
			  struct wildcard_list *tmp;
			  tmp = (struct wildcard_list *) xmalloc (sizeof *tmp);
			  tmp->next = (yyvsp[(1) - (3)].wildcard_list);
			  tmp->spec = (yyvsp[(3) - (3)].wildcard);
			  (yyval.wildcard_list) = tmp;
			}
    break;

  case 135:
#line 606 "ldgram.y"
    {
			  struct wildcard_list *tmp;
			  tmp = (struct wildcard_list *) xmalloc (sizeof *tmp);
			  tmp->next = NULL;
			  tmp->spec = (yyvsp[(1) - (1)].wildcard);
			  (yyval.wildcard_list) = tmp;
			}
    break;

  case 136:
#line 617 "ldgram.y"
    {
			  struct wildcard_spec tmp;
			  tmp.name = (yyvsp[(1) - (1)].name);
			  tmp.exclude_name_list = NULL;
			  tmp.sorted = none;
			  tmp.section_flag_list = NULL;
			  lang_add_wild (&tmp, NULL, ldgram_had_keep);
			}
    break;

  case 137:
#line 626 "ldgram.y"
    {
			  struct wildcard_spec tmp;
			  tmp.name = (yyvsp[(2) - (2)].name);
			  tmp.exclude_name_list = NULL;
			  tmp.sorted = none;
			  tmp.section_flag_list = (yyvsp[(1) - (2)].flag_info);
			  lang_add_wild (&tmp, NULL, ldgram_had_keep);
			}
    break;

  case 138:
#line 635 "ldgram.y"
    {
			  lang_add_wild (NULL, (yyvsp[(2) - (3)].wildcard_list), ldgram_had_keep);
			}
    break;

  case 139:
#line 639 "ldgram.y"
    {
			  struct wildcard_spec tmp;
			  tmp.name = NULL;
			  tmp.exclude_name_list = NULL;
			  tmp.sorted = none;
			  tmp.section_flag_list = (yyvsp[(1) - (4)].flag_info);
			  lang_add_wild (&tmp, (yyvsp[(3) - (4)].wildcard_list), ldgram_had_keep);
			}
    break;

  case 140:
#line 648 "ldgram.y"
    {
			  lang_add_wild (&(yyvsp[(1) - (4)].wildcard), (yyvsp[(3) - (4)].wildcard_list), ldgram_had_keep);
			}
    break;

  case 141:
#line 652 "ldgram.y"
    {
			  (yyvsp[(2) - (5)].wildcard).section_flag_list = (yyvsp[(1) - (5)].flag_info);
			  lang_add_wild (&(yyvsp[(2) - (5)].wildcard), (yyvsp[(4) - (5)].wildcard_list), ldgram_had_keep);
			}
    break;

  case 143:
#line 661 "ldgram.y"
    { ldgram_had_keep = TRUE; }
    break;

  case 144:
#line 663 "ldgram.y"
    { ldgram_had_keep = FALSE; }
    break;

  case 146:
#line 669 "ldgram.y"
    {
 		lang_add_attribute(lang_object_symbols_statement_enum);
	      	}
    break;

  case 148:
#line 674 "ldgram.y"
    {

		  lang_add_attribute(lang_constructors_statement_enum);
		}
    break;

  case 149:
#line 679 "ldgram.y"
    {
		  constructors_sorted = TRUE;
		  lang_add_attribute (lang_constructors_statement_enum);
		}
    break;

  case 151:
#line 685 "ldgram.y"
    {
			  lang_add_data ((int) (yyvsp[(1) - (4)].integer), (yyvsp[(3) - (4)].etree));
			}
    break;

  case 152:
#line 690 "ldgram.y"
    {
			  lang_add_fill ((yyvsp[(3) - (4)].fill));
			}
    break;

  case 153:
#line 693 "ldgram.y"
    {ldlex_expression ();}
    break;

  case 154:
#line 694 "ldgram.y"
    { ldlex_popstate ();
			  lang_add_assignment (exp_assert ((yyvsp[(4) - (8)].etree), (yyvsp[(6) - (8)].name))); }
    break;

  case 155:
#line 697 "ldgram.y"
    { ldlex_script (); ldfile_open_command_file((yyvsp[(2) - (2)].name)); }
    break;

  case 156:
#line 699 "ldgram.y"
    { ldlex_popstate (); }
    break;

  case 161:
#line 714 "ldgram.y"
    { (yyval.integer) = (yyvsp[(1) - (1)].token); }
    break;

  case 162:
#line 716 "ldgram.y"
    { (yyval.integer) = (yyvsp[(1) - (1)].token); }
    break;

  case 163:
#line 718 "ldgram.y"
    { (yyval.integer) = (yyvsp[(1) - (1)].token); }
    break;

  case 164:
#line 720 "ldgram.y"
    { (yyval.integer) = (yyvsp[(1) - (1)].token); }
    break;

  case 165:
#line 722 "ldgram.y"
    { (yyval.integer) = (yyvsp[(1) - (1)].token); }
    break;

  case 166:
#line 727 "ldgram.y"
    {
		  (yyval.fill) = exp_get_fill ((yyvsp[(1) - (1)].etree), 0, "fill value");
		}
    break;

  case 167:
#line 734 "ldgram.y"
    { (yyval.fill) = (yyvsp[(2) - (2)].fill); }
    break;

  case 168:
#line 735 "ldgram.y"
    { (yyval.fill) = (fill_type *) 0; }
    break;

  case 169:
#line 740 "ldgram.y"
    { (yyval.token) = '+'; }
    break;

  case 170:
#line 742 "ldgram.y"
    { (yyval.token) = '-'; }
    break;

  case 171:
#line 744 "ldgram.y"
    { (yyval.token) = '*'; }
    break;

  case 172:
#line 746 "ldgram.y"
    { (yyval.token) = '/'; }
    break;

  case 173:
#line 748 "ldgram.y"
    { (yyval.token) = LSHIFT; }
    break;

  case 174:
#line 750 "ldgram.y"
    { (yyval.token) = RSHIFT; }
    break;

  case 175:
#line 752 "ldgram.y"
    { (yyval.token) = '&'; }
    break;

  case 176:
#line 754 "ldgram.y"
    { (yyval.token) = '|'; }
    break;

  case 179:
#line 764 "ldgram.y"
    {
		  lang_add_assignment (exp_assign ((yyvsp[(1) - (3)].name), (yyvsp[(3) - (3)].etree), FALSE));
		}
    break;

  case 180:
#line 768 "ldgram.y"
    {
		  lang_add_assignment (exp_assign ((yyvsp[(1) - (3)].name),
						   exp_binop ((yyvsp[(2) - (3)].token),
							      exp_nameop (NAME,
									  (yyvsp[(1) - (3)].name)),
							      (yyvsp[(3) - (3)].etree)), FALSE));
		}
    break;

  case 181:
#line 776 "ldgram.y"
    {
		  lang_add_assignment (exp_assign ((yyvsp[(3) - (6)].name), (yyvsp[(5) - (6)].etree), TRUE));
		}
    break;

  case 182:
#line 780 "ldgram.y"
    {
		  lang_add_assignment (exp_provide ((yyvsp[(3) - (6)].name), (yyvsp[(5) - (6)].etree), FALSE));
		}
    break;

  case 183:
#line 784 "ldgram.y"
    {
		  lang_add_assignment (exp_provide ((yyvsp[(3) - (6)].name), (yyvsp[(5) - (6)].etree), TRUE));
		}
    break;

  case 191:
#line 807 "ldgram.y"
    { region = lang_memory_region_lookup ((yyvsp[(1) - (1)].name), TRUE); }
    break;

  case 192:
#line 810 "ldgram.y"
    {}
    break;

  case 193:
#line 812 "ldgram.y"
    { ldlex_script (); ldfile_open_command_file((yyvsp[(2) - (2)].name)); }
    break;

  case 194:
#line 814 "ldgram.y"
    { ldlex_popstate (); }
    break;

  case 195:
#line 819 "ldgram.y"
    {
		  region->origin = exp_get_vma ((yyvsp[(3) - (3)].etree), 0, "origin");
		  region->current = region->origin;
		}
    break;

  case 196:
#line 827 "ldgram.y"
    {
		  region->length = exp_get_vma ((yyvsp[(3) - (3)].etree), -1, "length");
		}
    break;

  case 197:
#line 834 "ldgram.y"
    { /* dummy action to avoid bison 1.25 error message */ }
    break;

  case 201:
#line 845 "ldgram.y"
    { lang_set_flags (region, (yyvsp[(1) - (1)].name), 0); }
    break;

  case 202:
#line 847 "ldgram.y"
    { lang_set_flags (region, (yyvsp[(2) - (2)].name), 1); }
    break;

  case 203:
#line 852 "ldgram.y"
    { lang_startup((yyvsp[(3) - (4)].name)); }
    break;

  case 205:
#line 858 "ldgram.y"
    { ldemul_hll((char *)NULL); }
    break;

  case 206:
#line 863 "ldgram.y"
    { ldemul_hll((yyvsp[(3) - (3)].name)); }
    break;

  case 207:
#line 865 "ldgram.y"
    { ldemul_hll((yyvsp[(1) - (1)].name)); }
    break;

  case 209:
#line 873 "ldgram.y"
    { ldemul_syslib((yyvsp[(3) - (3)].name)); }
    break;

  case 211:
#line 879 "ldgram.y"
    { lang_float(TRUE); }
    break;

  case 212:
#line 881 "ldgram.y"
    { lang_float(FALSE); }
    break;

  case 213:
#line 886 "ldgram.y"
    {
		  (yyval.nocrossref) = NULL;
		}
    break;

  case 214:
#line 890 "ldgram.y"
    {
		  struct lang_nocrossref *n;

		  n = (struct lang_nocrossref *) xmalloc (sizeof *n);
		  n->name = (yyvsp[(1) - (2)].name);
		  n->next = (yyvsp[(2) - (2)].nocrossref);
		  (yyval.nocrossref) = n;
		}
    break;

  case 215:
#line 899 "ldgram.y"
    {
		  struct lang_nocrossref *n;

		  n = (struct lang_nocrossref *) xmalloc (sizeof *n);
		  n->name = (yyvsp[(1) - (3)].name);
		  n->next = (yyvsp[(3) - (3)].nocrossref);
		  (yyval.nocrossref) = n;
		}
    break;

  case 216:
#line 909 "ldgram.y"
    { ldlex_expression (); }
    break;

  case 217:
#line 911 "ldgram.y"
    { ldlex_popstate (); (yyval.etree)=(yyvsp[(2) - (2)].etree);}
    break;

  case 218:
#line 916 "ldgram.y"
    { (yyval.etree) = exp_unop ('-', (yyvsp[(2) - (2)].etree)); }
    break;

  case 219:
#line 918 "ldgram.y"
    { (yyval.etree) = (yyvsp[(2) - (3)].etree); }
    break;

  case 220:
#line 920 "ldgram.y"
    { (yyval.etree) = exp_unop ((int) (yyvsp[(1) - (4)].integer),(yyvsp[(3) - (4)].etree)); }
    break;

  case 221:
#line 922 "ldgram.y"
    { (yyval.etree) = exp_unop ('!', (yyvsp[(2) - (2)].etree)); }
    break;

  case 222:
#line 924 "ldgram.y"
    { (yyval.etree) = (yyvsp[(2) - (2)].etree); }
    break;

  case 223:
#line 926 "ldgram.y"
    { (yyval.etree) = exp_unop ('~', (yyvsp[(2) - (2)].etree));}
    break;

  case 224:
#line 929 "ldgram.y"
    { (yyval.etree) = exp_binop ('*', (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 225:
#line 931 "ldgram.y"
    { (yyval.etree) = exp_binop ('/', (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 226:
#line 933 "ldgram.y"
    { (yyval.etree) = exp_binop ('%', (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 227:
#line 935 "ldgram.y"
    { (yyval.etree) = exp_binop ('+', (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 228:
#line 937 "ldgram.y"
    { (yyval.etree) = exp_binop ('-' , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 229:
#line 939 "ldgram.y"
    { (yyval.etree) = exp_binop (LSHIFT , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 230:
#line 941 "ldgram.y"
    { (yyval.etree) = exp_binop (RSHIFT , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 231:
#line 943 "ldgram.y"
    { (yyval.etree) = exp_binop (EQ , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 232:
#line 945 "ldgram.y"
    { (yyval.etree) = exp_binop (NE , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 233:
#line 947 "ldgram.y"
    { (yyval.etree) = exp_binop (LE , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 234:
#line 949 "ldgram.y"
    { (yyval.etree) = exp_binop (GE , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 235:
#line 951 "ldgram.y"
    { (yyval.etree) = exp_binop ('<' , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 236:
#line 953 "ldgram.y"
    { (yyval.etree) = exp_binop ('>' , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 237:
#line 955 "ldgram.y"
    { (yyval.etree) = exp_binop ('&' , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 238:
#line 957 "ldgram.y"
    { (yyval.etree) = exp_binop ('^' , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 239:
#line 959 "ldgram.y"
    { (yyval.etree) = exp_binop ('|' , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 240:
#line 961 "ldgram.y"
    { (yyval.etree) = exp_trinop ('?' , (yyvsp[(1) - (5)].etree), (yyvsp[(3) - (5)].etree), (yyvsp[(5) - (5)].etree)); }
    break;

  case 241:
#line 963 "ldgram.y"
    { (yyval.etree) = exp_binop (ANDAND , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 242:
#line 965 "ldgram.y"
    { (yyval.etree) = exp_binop (OROR , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 243:
#line 967 "ldgram.y"
    { (yyval.etree) = exp_nameop (DEFINED, (yyvsp[(3) - (4)].name)); }
    break;

  case 244:
#line 969 "ldgram.y"
    { (yyval.etree) = exp_bigintop ((yyvsp[(1) - (1)].bigint).integer, (yyvsp[(1) - (1)].bigint).str); }
    break;

  case 245:
#line 971 "ldgram.y"
    { (yyval.etree) = exp_nameop (SIZEOF_HEADERS,0); }
    break;

  case 246:
#line 974 "ldgram.y"
    { (yyval.etree) = exp_nameop (ALIGNOF,(yyvsp[(3) - (4)].name)); }
    break;

  case 247:
#line 976 "ldgram.y"
    { (yyval.etree) = exp_nameop (SIZEOF,(yyvsp[(3) - (4)].name)); }
    break;

  case 248:
#line 978 "ldgram.y"
    { (yyval.etree) = exp_nameop (ADDR,(yyvsp[(3) - (4)].name)); }
    break;

  case 249:
#line 980 "ldgram.y"
    { (yyval.etree) = exp_nameop (LOADADDR,(yyvsp[(3) - (4)].name)); }
    break;

  case 250:
#line 982 "ldgram.y"
    { (yyval.etree) = exp_nameop (CONSTANT,(yyvsp[(3) - (4)].name)); }
    break;

  case 251:
#line 984 "ldgram.y"
    { (yyval.etree) = exp_unop (ABSOLUTE, (yyvsp[(3) - (4)].etree)); }
    break;

  case 252:
#line 986 "ldgram.y"
    { (yyval.etree) = exp_unop (ALIGN_K,(yyvsp[(3) - (4)].etree)); }
    break;

  case 253:
#line 988 "ldgram.y"
    { (yyval.etree) = exp_binop (ALIGN_K,(yyvsp[(3) - (6)].etree),(yyvsp[(5) - (6)].etree)); }
    break;

  case 254:
#line 990 "ldgram.y"
    { (yyval.etree) = exp_binop (DATA_SEGMENT_ALIGN, (yyvsp[(3) - (6)].etree), (yyvsp[(5) - (6)].etree)); }
    break;

  case 255:
#line 992 "ldgram.y"
    { (yyval.etree) = exp_binop (DATA_SEGMENT_RELRO_END, (yyvsp[(5) - (6)].etree), (yyvsp[(3) - (6)].etree)); }
    break;

  case 256:
#line 994 "ldgram.y"
    { (yyval.etree) = exp_unop (DATA_SEGMENT_END, (yyvsp[(3) - (4)].etree)); }
    break;

  case 257:
#line 996 "ldgram.y"
    { /* The operands to the expression node are
			     placed in the opposite order from the way
			     in which they appear in the script as
			     that allows us to reuse more code in
			     fold_binary.  */
			  (yyval.etree) = exp_binop (SEGMENT_START,
					  (yyvsp[(5) - (6)].etree),
					  exp_nameop (NAME, (yyvsp[(3) - (6)].name))); }
    break;

  case 258:
#line 1005 "ldgram.y"
    { (yyval.etree) = exp_unop (ALIGN_K,(yyvsp[(3) - (4)].etree)); }
    break;

  case 259:
#line 1007 "ldgram.y"
    { (yyval.etree) = exp_nameop (NAME,(yyvsp[(1) - (1)].name)); }
    break;

  case 260:
#line 1009 "ldgram.y"
    { (yyval.etree) = exp_binop (MAX_K, (yyvsp[(3) - (6)].etree), (yyvsp[(5) - (6)].etree) ); }
    break;

  case 261:
#line 1011 "ldgram.y"
    { (yyval.etree) = exp_binop (MIN_K, (yyvsp[(3) - (6)].etree), (yyvsp[(5) - (6)].etree) ); }
    break;

  case 262:
#line 1013 "ldgram.y"
    { (yyval.etree) = exp_assert ((yyvsp[(3) - (6)].etree), (yyvsp[(5) - (6)].name)); }
    break;

  case 263:
#line 1015 "ldgram.y"
    { (yyval.etree) = exp_nameop (ORIGIN, (yyvsp[(3) - (4)].name)); }
    break;

  case 264:
#line 1017 "ldgram.y"
    { (yyval.etree) = exp_nameop (LENGTH, (yyvsp[(3) - (4)].name)); }
    break;

  case 265:
#line 1019 "ldgram.y"
    { (yyval.etree) = exp_unop (LOG2CEIL, (yyvsp[(3) - (4)].etree)); }
    break;

  case 266:
#line 1024 "ldgram.y"
    { (yyval.name) = (yyvsp[(3) - (3)].name); }
    break;

  case 267:
#line 1025 "ldgram.y"
    { (yyval.name) = 0; }
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
    { (yyval.etree) = (yyvsp[(3) - (4)].etree); }
    break;

  case 271:
#line 1035 "ldgram.y"
    { (yyval.etree) = 0; }
    break;

  case 272:
#line 1039 "ldgram.y"
    { (yyval.token) = ALIGN_WITH_INPUT; }
    break;

  case 273:
#line 1040 "ldgram.y"
    { (yyval.token) = 0; }
    break;

  case 274:
#line 1044 "ldgram.y"
    { (yyval.etree) = (yyvsp[(3) - (4)].etree); }
    break;

  case 275:
#line 1045 "ldgram.y"
    { (yyval.etree) = 0; }
    break;

  case 276:
#line 1049 "ldgram.y"
    { (yyval.token) = ONLY_IF_RO; }
    break;

  case 277:
#line 1050 "ldgram.y"
    { (yyval.token) = ONLY_IF_RW; }
    break;

  case 278:
#line 1051 "ldgram.y"
    { (yyval.token) = SPECIAL; }
    break;

  case 279:
#line 1052 "ldgram.y"
    { (yyval.token) = 0; }
    break;

  case 280:
#line 1055 "ldgram.y"
    { ldlex_expression(); }
    break;

  case 281:
#line 1060 "ldgram.y"
    { ldlex_popstate (); ldlex_script (); }
    break;

  case 282:
#line 1063 "ldgram.y"
    {
			  lang_enter_output_section_statement((yyvsp[(1) - (10)].name), (yyvsp[(3) - (10)].etree),
							      sectype,
							      (yyvsp[(5) - (10)].etree), (yyvsp[(7) - (10)].etree), (yyvsp[(4) - (10)].etree), (yyvsp[(9) - (10)].token), (yyvsp[(6) - (10)].token));
			}
    break;

  case 283:
#line 1069 "ldgram.y"
    { ldlex_popstate (); ldlex_expression (); }
    break;

  case 284:
#line 1071 "ldgram.y"
    {
		  ldlex_popstate ();
		  lang_leave_output_section_statement ((yyvsp[(18) - (18)].fill), (yyvsp[(15) - (18)].name), (yyvsp[(17) - (18)].section_phdr), (yyvsp[(16) - (18)].name));
		}
    break;

  case 285:
#line 1076 "ldgram.y"
    {}
    break;

  case 286:
#line 1078 "ldgram.y"
    { ldlex_expression (); }
    break;

  case 287:
#line 1080 "ldgram.y"
    { ldlex_popstate (); ldlex_script (); }
    break;

  case 288:
#line 1082 "ldgram.y"
    {
			  lang_enter_overlay ((yyvsp[(3) - (8)].etree), (yyvsp[(6) - (8)].etree));
			}
    break;

  case 289:
#line 1087 "ldgram.y"
    { ldlex_popstate (); ldlex_expression (); }
    break;

  case 290:
#line 1089 "ldgram.y"
    {
			  ldlex_popstate ();
			  lang_leave_overlay ((yyvsp[(5) - (16)].etree), (int) (yyvsp[(4) - (16)].integer),
					      (yyvsp[(16) - (16)].fill), (yyvsp[(13) - (16)].name), (yyvsp[(15) - (16)].section_phdr), (yyvsp[(14) - (16)].name));
			}
    break;

  case 292:
#line 1099 "ldgram.y"
    { ldlex_expression (); }
    break;

  case 293:
#line 1101 "ldgram.y"
    {
		  ldlex_popstate ();
		  lang_add_assignment (exp_assign (".", (yyvsp[(3) - (3)].etree), FALSE));
		}
    break;

  case 295:
#line 1107 "ldgram.y"
    { ldlex_script (); ldfile_open_command_file((yyvsp[(2) - (2)].name)); }
    break;

  case 296:
#line 1109 "ldgram.y"
    { ldlex_popstate (); }
    break;

  case 297:
#line 1113 "ldgram.y"
    { sectype = noload_section; }
    break;

  case 298:
#line 1114 "ldgram.y"
    { sectype = noalloc_section; }
    break;

  case 299:
#line 1115 "ldgram.y"
    { sectype = noalloc_section; }
    break;

  case 300:
#line 1116 "ldgram.y"
    { sectype = noalloc_section; }
    break;

  case 301:
#line 1117 "ldgram.y"
    { sectype = noalloc_section; }
    break;

  case 303:
#line 1122 "ldgram.y"
    { sectype = normal_section; }
    break;

  case 304:
#line 1123 "ldgram.y"
    { sectype = normal_section; }
    break;

  case 305:
#line 1127 "ldgram.y"
    { (yyval.etree) = (yyvsp[(1) - (3)].etree); }
    break;

  case 306:
#line 1128 "ldgram.y"
    { (yyval.etree) = (etree_type *)NULL;  }
    break;

  case 307:
#line 1133 "ldgram.y"
    { (yyval.etree) = (yyvsp[(3) - (6)].etree); }
    break;

  case 308:
#line 1135 "ldgram.y"
    { (yyval.etree) = (yyvsp[(3) - (10)].etree); }
    break;

  case 309:
#line 1139 "ldgram.y"
    { (yyval.etree) = (yyvsp[(1) - (2)].etree); }
    break;

  case 310:
#line 1140 "ldgram.y"
    { (yyval.etree) = (etree_type *) NULL;  }
    break;

  case 311:
#line 1145 "ldgram.y"
    { (yyval.integer) = 0; }
    break;

  case 312:
#line 1147 "ldgram.y"
    { (yyval.integer) = 1; }
    break;

  case 313:
#line 1152 "ldgram.y"
    { (yyval.name) = (yyvsp[(2) - (2)].name); }
    break;

  case 314:
#line 1153 "ldgram.y"
    { (yyval.name) = DEFAULT_MEMORY_REGION; }
    break;

  case 315:
#line 1158 "ldgram.y"
    {
		  (yyval.section_phdr) = NULL;
		}
    break;

  case 316:
#line 1162 "ldgram.y"
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

  case 318:
#line 1178 "ldgram.y"
    {
			  ldlex_script ();
			  lang_enter_overlay_section ((yyvsp[(2) - (2)].name));
			}
    break;

  case 319:
#line 1183 "ldgram.y"
    { ldlex_popstate (); ldlex_expression (); }
    break;

  case 320:
#line 1185 "ldgram.y"
    {
			  ldlex_popstate ();
			  lang_leave_overlay_section ((yyvsp[(9) - (9)].fill), (yyvsp[(8) - (9)].section_phdr));
			}
    break;

  case 325:
#line 1202 "ldgram.y"
    { ldlex_expression (); }
    break;

  case 326:
#line 1203 "ldgram.y"
    { ldlex_popstate (); }
    break;

  case 327:
#line 1205 "ldgram.y"
    {
		  lang_new_phdr ((yyvsp[(1) - (6)].name), (yyvsp[(3) - (6)].etree), (yyvsp[(4) - (6)].phdr).filehdr, (yyvsp[(4) - (6)].phdr).phdrs, (yyvsp[(4) - (6)].phdr).at,
				 (yyvsp[(4) - (6)].phdr).flags);
		}
    break;

  case 328:
#line 1213 "ldgram.y"
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

  case 329:
#line 1257 "ldgram.y"
    {
		  memset (&(yyval.phdr), 0, sizeof (struct phdr_info));
		}
    break;

  case 330:
#line 1261 "ldgram.y"
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

  case 331:
#line 1274 "ldgram.y"
    {
		  (yyval.phdr) = (yyvsp[(5) - (5)].phdr);
		  (yyval.phdr).at = (yyvsp[(3) - (5)].etree);
		}
    break;

  case 332:
#line 1282 "ldgram.y"
    {
		  (yyval.etree) = NULL;
		}
    break;

  case 333:
#line 1286 "ldgram.y"
    {
		  (yyval.etree) = (yyvsp[(2) - (3)].etree);
		}
    break;

  case 334:
#line 1292 "ldgram.y"
    {
		  ldlex_version_file ();
		  PUSH_ERROR (_("dynamic list"));
		}
    break;

  case 335:
#line 1297 "ldgram.y"
    {
		  ldlex_popstate ();
		  POP_ERROR ();
		}
    break;

  case 339:
#line 1314 "ldgram.y"
    {
		  lang_append_dynamic_list ((yyvsp[(1) - (2)].versyms));
		}
    break;

  case 340:
#line 1322 "ldgram.y"
    {
		  ldlex_version_file ();
		  PUSH_ERROR (_("VERSION script"));
		}
    break;

  case 341:
#line 1327 "ldgram.y"
    {
		  ldlex_popstate ();
		  POP_ERROR ();
		}
    break;

  case 342:
#line 1336 "ldgram.y"
    {
		  ldlex_version_script ();
		}
    break;

  case 343:
#line 1340 "ldgram.y"
    {
		  ldlex_popstate ();
		}
    break;

  case 346:
#line 1352 "ldgram.y"
    {
		  lang_register_vers_node (NULL, (yyvsp[(2) - (4)].versnode), NULL);
		}
    break;

  case 347:
#line 1356 "ldgram.y"
    {
		  lang_register_vers_node ((yyvsp[(1) - (5)].name), (yyvsp[(3) - (5)].versnode), NULL);
		}
    break;

  case 348:
#line 1360 "ldgram.y"
    {
		  lang_register_vers_node ((yyvsp[(1) - (6)].name), (yyvsp[(3) - (6)].versnode), (yyvsp[(5) - (6)].deflist));
		}
    break;

  case 349:
#line 1367 "ldgram.y"
    {
		  (yyval.deflist) = lang_add_vers_depend (NULL, (yyvsp[(1) - (1)].name));
		}
    break;

  case 350:
#line 1371 "ldgram.y"
    {
		  (yyval.deflist) = lang_add_vers_depend ((yyvsp[(1) - (2)].deflist), (yyvsp[(2) - (2)].name));
		}
    break;

  case 351:
#line 1378 "ldgram.y"
    {
		  (yyval.versnode) = lang_new_vers_node (NULL, NULL);
		}
    break;

  case 352:
#line 1382 "ldgram.y"
    {
		  (yyval.versnode) = lang_new_vers_node ((yyvsp[(1) - (2)].versyms), NULL);
		}
    break;

  case 353:
#line 1386 "ldgram.y"
    {
		  (yyval.versnode) = lang_new_vers_node ((yyvsp[(3) - (4)].versyms), NULL);
		}
    break;

  case 354:
#line 1390 "ldgram.y"
    {
		  (yyval.versnode) = lang_new_vers_node (NULL, (yyvsp[(3) - (4)].versyms));
		}
    break;

  case 355:
#line 1394 "ldgram.y"
    {
		  (yyval.versnode) = lang_new_vers_node ((yyvsp[(3) - (8)].versyms), (yyvsp[(7) - (8)].versyms));
		}
    break;

  case 356:
#line 1401 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, (yyvsp[(1) - (1)].name), ldgram_vers_current_lang, FALSE);
		}
    break;

  case 357:
#line 1405 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, (yyvsp[(1) - (1)].name), ldgram_vers_current_lang, TRUE);
		}
    break;

  case 358:
#line 1409 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[(1) - (3)].versyms), (yyvsp[(3) - (3)].name), ldgram_vers_current_lang, FALSE);
		}
    break;

  case 359:
#line 1413 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[(1) - (3)].versyms), (yyvsp[(3) - (3)].name), ldgram_vers_current_lang, TRUE);
		}
    break;

  case 360:
#line 1417 "ldgram.y"
    {
			  (yyval.name) = ldgram_vers_current_lang;
			  ldgram_vers_current_lang = (yyvsp[(4) - (5)].name);
			}
    break;

  case 361:
#line 1422 "ldgram.y"
    {
			  struct bfd_elf_version_expr *pat;
			  for (pat = (yyvsp[(7) - (9)].versyms); pat->next != NULL; pat = pat->next);
			  pat->next = (yyvsp[(1) - (9)].versyms);
			  (yyval.versyms) = (yyvsp[(7) - (9)].versyms);
			  ldgram_vers_current_lang = (yyvsp[(6) - (9)].name);
			}
    break;

  case 362:
#line 1430 "ldgram.y"
    {
			  (yyval.name) = ldgram_vers_current_lang;
			  ldgram_vers_current_lang = (yyvsp[(2) - (3)].name);
			}
    break;

  case 363:
#line 1435 "ldgram.y"
    {
			  (yyval.versyms) = (yyvsp[(5) - (7)].versyms);
			  ldgram_vers_current_lang = (yyvsp[(4) - (7)].name);
			}
    break;

  case 364:
#line 1440 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, "global", ldgram_vers_current_lang, FALSE);
		}
    break;

  case 365:
#line 1444 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[(1) - (3)].versyms), "global", ldgram_vers_current_lang, FALSE);
		}
    break;

  case 366:
#line 1448 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, "local", ldgram_vers_current_lang, FALSE);
		}
    break;

  case 367:
#line 1452 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[(1) - (3)].versyms), "local", ldgram_vers_current_lang, FALSE);
		}
    break;

  case 368:
#line 1456 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, "extern", ldgram_vers_current_lang, FALSE);
		}
    break;

  case 369:
#line 1460 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[(1) - (3)].versyms), "extern", ldgram_vers_current_lang, FALSE);
		}
    break;


/* Line 1267 of yacc.c.  */
#line 4501 "ldgram.c"
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


#line 1470 "ldgram.y"

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


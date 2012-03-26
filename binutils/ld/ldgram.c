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




/* Copy the first part of user declarations.  */
#line 24 "ldgram.y"

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
/* Line 193 of yacc.c.  */
#line 410 "ldgram.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 423 "ldgram.c"

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
#define YYLAST   1838

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  147
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  126
/* YYNRULES -- Number of rules.  */
#define YYNRULES  356
/* YYNRULES -- Number of states.  */
#define YYNSTATES  763

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   378

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   145,     2,     2,     2,    34,    21,     2,
      37,   142,    32,    30,   140,    31,     2,    33,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    16,   141,
      24,     6,    25,    15,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   143,     2,   144,    20,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    56,    19,    57,   146,     2,     2,     2,
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
      49,    50,    51,    52,    53,    54,    55,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96,    97,    98,    99,   100,
     101,   102,   103,   104,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   126,   127,   128,   129,   130,
     131,   132,   133,   134,   135,   136,   137,   138,   139
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
     289,   293,   300,   302,   306,   309,   311,   315,   318,   319,
     325,   326,   334,   335,   342,   347,   350,   353,   354,   359,
     362,   363,   371,   373,   375,   377,   379,   385,   390,   395,
     403,   411,   419,   427,   436,   439,   441,   445,   447,   449,
     453,   458,   460,   461,   467,   470,   472,   474,   476,   481,
     483,   488,   493,   494,   503,   504,   510,   513,   515,   516,
     518,   520,   522,   524,   526,   528,   530,   533,   534,   536,
     538,   540,   542,   544,   546,   548,   550,   552,   554,   558,
     562,   569,   576,   578,   579,   584,   586,   587,   591,   593,
     594,   602,   603,   609,   613,   617,   618,   622,   624,   627,
     629,   632,   637,   642,   646,   650,   652,   657,   661,   662,
     664,   666,   667,   670,   674,   675,   678,   681,   685,   690,
     693,   696,   699,   703,   707,   711,   715,   719,   723,   727,
     731,   735,   739,   743,   747,   751,   755,   759,   763,   769,
     773,   777,   782,   784,   786,   791,   796,   801,   806,   811,
     816,   821,   828,   835,   842,   847,   854,   859,   861,   868,
     875,   882,   887,   892,   896,   897,   902,   903,   908,   909,
     914,   915,   917,   919,   921,   922,   923,   924,   925,   926,
     927,   947,   948,   949,   950,   951,   952,   971,   972,   973,
     981,   982,   988,   990,   992,   994,   996,   998,  1002,  1003,
    1006,  1010,  1013,  1020,  1031,  1034,  1036,  1037,  1039,  1042,
    1043,  1044,  1048,  1049,  1050,  1051,  1052,  1064,  1069,  1070,
    1073,  1074,  1075,  1082,  1084,  1085,  1089,  1095,  1096,  1100,
    1101,  1104,  1106,  1109,  1114,  1117,  1118,  1121,  1122,  1128,
    1130,  1133,  1138,  1144,  1151,  1153,  1156,  1157,  1160,  1165,
    1170,  1179,  1181,  1183,  1187,  1191,  1192,  1202,  1203,  1211,
    1213,  1217,  1219,  1223,  1225,  1229,  1230
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     148,     0,    -1,   121,   164,    -1,   122,   152,    -1,   132,
     261,    -1,   139,   256,    -1,   123,   150,    -1,     4,    -1,
      -1,   151,     4,     6,   217,    -1,    -1,   153,   154,    -1,
     154,   155,   109,    -1,    -1,   104,   217,    -1,   104,   217,
     140,   217,    -1,     4,    -1,   105,    -1,   111,   157,    -1,
     110,    -1,   115,     4,     6,   217,    -1,   115,     4,   140,
     217,    -1,   115,     4,   217,    -1,   114,     4,    -1,   106,
       4,   140,   217,    -1,   106,     4,   217,    -1,   106,     4,
       6,   217,    -1,    38,     4,     6,   217,    -1,    38,     4,
     140,   217,    -1,    98,     4,     6,   217,    -1,    98,     4,
     140,   217,    -1,   107,   159,    -1,   108,   158,    -1,   112,
       4,    -1,   118,     4,   140,     4,    -1,   118,     4,   140,
       3,    -1,   117,   217,    -1,   119,     3,    -1,   124,   160,
      -1,   125,   161,    -1,    -1,    64,   149,   156,   154,    36,
      -1,   126,     4,    -1,    -1,   157,   140,     4,    -1,   157,
       4,    -1,    -1,     4,    -1,   158,   140,     4,    -1,     4,
      -1,   159,   140,     4,    -1,    -1,     4,    -1,   160,   140,
       4,    -1,    -1,   162,   163,    -1,     4,    -1,   163,     4,
      -1,   163,   140,     4,    -1,    -1,   165,   166,    -1,   166,
     167,    -1,    -1,   197,    -1,   174,    -1,   248,    -1,   208,
      -1,   209,    -1,   211,    -1,   213,    -1,   176,    -1,   263,
      -1,   141,    -1,    73,    37,     4,   142,    -1,    74,    37,
     149,   142,    -1,    96,    37,   149,   142,    -1,    59,    37,
       4,   142,    -1,    59,    37,     4,   140,     4,   140,     4,
     142,    -1,    61,    37,     4,   142,    -1,    60,    -1,    62,
      -1,    94,    37,   170,   142,    -1,    -1,    95,   168,    37,
     170,   142,    -1,    75,    37,   149,   142,    -1,    -1,    64,
     149,   169,   166,    36,    -1,    89,    37,   214,   142,    -1,
     125,    37,   161,   142,    -1,    48,    49,     4,    -1,    48,
      50,     4,    -1,    66,    37,     4,   140,     4,   142,    -1,
       4,    -1,   170,   140,     4,    -1,   170,     4,    -1,     5,
      -1,   170,   140,     5,    -1,   170,     5,    -1,    -1,   103,
      37,   171,   170,   142,    -1,    -1,   170,   140,   103,    37,
     172,   170,   142,    -1,    -1,   170,   103,    37,   173,   170,
     142,    -1,    46,    56,   175,    57,    -1,   175,   223,    -1,
     175,   176,    -1,    -1,    76,    37,     4,   142,    -1,   195,
     194,    -1,    -1,   113,   177,    37,   217,   140,     4,   142,
      -1,     4,    -1,    32,    -1,    15,    -1,   178,    -1,   137,
      37,   180,   142,   178,    -1,    54,    37,   178,   142,    -1,
      55,    37,   178,   142,    -1,    54,    37,    55,    37,   178,
     142,   142,    -1,    54,    37,    54,    37,   178,   142,   142,
      -1,    55,    37,    54,    37,   178,   142,   142,    -1,    55,
      37,    55,    37,   178,   142,   142,    -1,    54,    37,   137,
      37,   180,   142,   178,   142,    -1,   180,   178,    -1,   178,
      -1,   181,   196,   179,    -1,   179,    -1,     4,    -1,   143,
     181,   144,    -1,   179,    37,   181,   142,    -1,   182,    -1,
      -1,   133,    37,   184,   182,   142,    -1,   195,   194,    -1,
      93,    -1,   141,    -1,    97,    -1,    54,    37,    97,   142,
      -1,   183,    -1,   190,    37,   215,   142,    -1,    91,    37,
     191,   142,    -1,    -1,   113,   186,    37,   217,   140,     4,
     142,   194,    -1,    -1,    64,   149,   187,   189,    36,    -1,
     188,   185,    -1,   185,    -1,    -1,   188,    -1,    41,    -1,
      42,    -1,    43,    -1,    44,    -1,    45,    -1,   215,    -1,
       6,   191,    -1,    -1,    14,    -1,    13,    -1,    12,    -1,
      11,    -1,    10,    -1,     9,    -1,     8,    -1,     7,    -1,
     141,    -1,   140,    -1,     4,     6,   215,    -1,     4,   193,
     215,    -1,   101,    37,     4,     6,   215,   142,    -1,   102,
      37,     4,     6,   215,   142,    -1,   140,    -1,    -1,    65,
      56,   198,    57,    -1,   199,    -1,    -1,   199,   196,   200,
      -1,   200,    -1,    -1,     4,   201,   205,    16,   203,   196,
     204,    -1,    -1,    64,   149,   202,   198,    36,    -1,    90,
       6,   215,    -1,    92,     6,   215,    -1,    -1,    37,   206,
     142,    -1,   207,    -1,   206,   207,    -1,     4,    -1,   145,
       4,    -1,    84,    37,   149,   142,    -1,    85,    37,   210,
     142,    -1,    85,    37,   142,    -1,   210,   196,   149,    -1,
     149,    -1,    86,    37,   212,   142,    -1,   212,   196,   149,
      -1,    -1,    87,    -1,    88,    -1,    -1,     4,   214,    -1,
       4,   140,   214,    -1,    -1,   216,   217,    -1,    31,   217,
      -1,    37,   217,   142,    -1,    77,    37,   217,   142,    -1,
     145,   217,    -1,    30,   217,    -1,   146,   217,    -1,   217,
      32,   217,    -1,   217,    33,   217,    -1,   217,    34,   217,
      -1,   217,    30,   217,    -1,   217,    31,   217,    -1,   217,
      29,   217,    -1,   217,    28,   217,    -1,   217,    23,   217,
      -1,   217,    22,   217,    -1,   217,    27,   217,    -1,   217,
      26,   217,    -1,   217,    24,   217,    -1,   217,    25,   217,
      -1,   217,    21,   217,    -1,   217,    20,   217,    -1,   217,
      19,   217,    -1,   217,    15,   217,    16,   217,    -1,   217,
      18,   217,    -1,   217,    17,   217,    -1,    72,    37,     4,
     142,    -1,     3,    -1,    58,    -1,    79,    37,     4,   142,
      -1,    78,    37,     4,   142,    -1,    80,    37,     4,   142,
      -1,    81,    37,     4,   142,    -1,   138,    37,     4,   142,
      -1,   107,    37,   217,   142,    -1,    38,    37,   217,   142,
      -1,    38,    37,   217,   140,   217,   142,    -1,    51,    37,
     217,   140,   217,   142,    -1,    52,    37,   217,   140,   217,
     142,    -1,    53,    37,   217,   142,    -1,    63,    37,     4,
     140,   217,   142,    -1,    39,    37,   217,   142,    -1,     4,
      -1,    82,    37,   217,   140,   217,   142,    -1,    83,    37,
     217,   140,   217,   142,    -1,   113,    37,   217,   140,     4,
     142,    -1,    90,    37,     4,   142,    -1,    92,    37,     4,
     142,    -1,    99,    25,     4,    -1,    -1,    99,    37,   217,
     142,    -1,    -1,    38,    37,   217,   142,    -1,    -1,   100,
      37,   217,   142,    -1,    -1,   134,    -1,   135,    -1,   136,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     4,   224,   239,
     219,   220,   221,   225,   222,    56,   226,   189,    57,   227,
     242,   218,   243,   192,   228,   196,    -1,    -1,    -1,    -1,
      -1,    -1,    71,   229,   240,   241,   219,   221,   230,    56,
     231,   244,    57,   232,   242,   218,   243,   192,   233,   196,
      -1,    -1,    -1,    95,   234,   239,   235,    56,   175,    57,
      -1,    -1,    64,   149,   236,   175,    36,    -1,    67,    -1,
      68,    -1,    69,    -1,    70,    -1,    71,    -1,    37,   237,
     142,    -1,    -1,    37,   142,    -1,   217,   238,    16,    -1,
     238,    16,    -1,    40,    37,   217,   142,   238,    16,    -1,
      40,    37,   217,   142,    39,    37,   217,   142,   238,    16,
      -1,   217,    16,    -1,    16,    -1,    -1,    89,    -1,    25,
       4,    -1,    -1,    -1,   243,    16,     4,    -1,    -1,    -1,
      -1,    -1,   244,     4,   245,    56,   189,    57,   246,   243,
     192,   247,   196,    -1,    47,    56,   249,    57,    -1,    -1,
     249,   250,    -1,    -1,    -1,     4,   251,   253,   254,   252,
     141,    -1,   217,    -1,    -1,     4,   255,   254,    -1,    99,
      37,   217,   142,   254,    -1,    -1,    37,   217,   142,    -1,
      -1,   257,   258,    -1,   259,    -1,   258,   259,    -1,    56,
     260,    57,   141,    -1,   269,   141,    -1,    -1,   262,   265,
      -1,    -1,   264,   131,    56,   265,    57,    -1,   266,    -1,
     265,   266,    -1,    56,   268,    57,   141,    -1,   127,    56,
     268,    57,   141,    -1,   127,    56,   268,    57,   267,   141,
      -1,   127,    -1,   267,   127,    -1,    -1,   269,   141,    -1,
     129,    16,   269,   141,    -1,   130,    16,   269,   141,    -1,
     129,    16,   269,   141,   130,    16,   269,   141,    -1,   128,
      -1,     4,    -1,   269,   141,   128,    -1,   269,   141,     4,
      -1,    -1,   269,   141,   125,     4,    56,   270,   269,   272,
      57,    -1,    -1,   125,     4,    56,   271,   269,   272,    57,
      -1,   129,    -1,   269,   141,   129,    -1,   130,    -1,   269,
     141,   130,    -1,   125,    -1,   269,   141,   125,    -1,    -1,
     141,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   162,   162,   163,   164,   165,   166,   170,   174,   174,
     184,   184,   197,   198,   202,   203,   204,   207,   210,   211,
     212,   214,   216,   218,   220,   222,   224,   226,   228,   230,
     232,   234,   235,   236,   238,   240,   242,   244,   246,   247,
     249,   248,   252,   254,   258,   259,   260,   264,   266,   270,
     272,   277,   278,   279,   284,   284,   289,   291,   293,   298,
     298,   304,   305,   310,   311,   312,   313,   314,   315,   316,
     317,   318,   319,   320,   322,   324,   326,   329,   331,   333,
     335,   337,   339,   338,   342,   345,   344,   348,   352,   353,
     355,   357,   362,   365,   368,   371,   374,   377,   381,   380,
     385,   384,   389,   388,   395,   399,   400,   401,   405,   407,
     408,   408,   416,   420,   424,   431,   437,   443,   449,   455,
     461,   467,   473,   479,   488,   497,   508,   517,   528,   536,
     540,   547,   549,   548,   555,   556,   560,   561,   566,   571,
     572,   577,   581,   581,   585,   584,   591,   592,   595,   597,
     601,   603,   605,   607,   609,   614,   621,   623,   627,   629,
     631,   633,   635,   637,   639,   641,   646,   646,   651,   655,
     663,   667,   675,   675,   679,   682,   682,   685,   686,   691,
     690,   696,   695,   702,   710,   718,   719,   723,   724,   728,
     730,   735,   740,   741,   746,   748,   754,   756,   758,   762,
     764,   770,   773,   782,   793,   793,   799,   801,   803,   805,
     807,   809,   812,   814,   816,   818,   820,   822,   824,   826,
     828,   830,   832,   834,   836,   838,   840,   842,   844,   846,
     848,   850,   852,   854,   857,   859,   861,   863,   865,   867,
     869,   871,   873,   875,   877,   879,   888,   890,   892,   894,
     896,   898,   900,   906,   907,   911,   912,   916,   917,   921,
     922,   926,   927,   928,   929,   932,   936,   939,   945,   947,
     932,   954,   956,   958,   963,   965,   953,   975,   977,   975,
     983,   982,   989,   990,   991,   992,   993,   997,   998,   999,
    1003,  1004,  1009,  1010,  1015,  1016,  1021,  1022,  1027,  1029,
    1034,  1037,  1050,  1054,  1059,  1061,  1052,  1069,  1072,  1074,
    1078,  1079,  1078,  1088,  1133,  1136,  1148,  1157,  1160,  1167,
    1167,  1179,  1180,  1184,  1188,  1197,  1197,  1211,  1211,  1221,
    1222,  1226,  1230,  1234,  1241,  1245,  1253,  1256,  1260,  1264,
    1268,  1275,  1279,  1283,  1287,  1292,  1291,  1305,  1304,  1314,
    1318,  1322,  1326,  1330,  1334,  1340,  1342
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
  "DATA_SEGMENT_END", "SORT_BY_NAME", "SORT_BY_ALIGNMENT", "'{'", "'}'",
  "SIZEOF_HEADERS", "OUTPUT_FORMAT", "FORCE_COMMON_ALLOCATION",
  "OUTPUT_ARCH", "INHIBIT_COMMON_ALLOCATION", "SEGMENT_START", "INCLUDE",
  "MEMORY", "REGION_ALIAS", "NOLOAD", "DSECT", "COPY", "INFO", "OVERLAY",
  "DEFINED", "TARGET_K", "SEARCH_DIR", "MAP", "ENTRY", "NEXT", "SIZEOF",
  "ALIGNOF", "ADDR", "LOADADDR", "MAX_K", "MIN_K", "STARTUP", "HLL",
  "SYSLIB", "FLOAT", "NOFLOAT", "NOCROSSREFS", "ORIGIN", "FILL", "LENGTH",
  "CREATE_OBJECT_SYMBOLS", "INPUT", "GROUP", "OUTPUT", "CONSTRUCTORS",
  "ALIGNMOD", "AT", "SUBALIGN", "PROVIDE", "PROVIDE_HIDDEN", "AS_NEEDED",
  "CHIP", "LIST", "SECT", "ABSOLUTE", "LOAD", "NEWLINE", "ENDWORD",
  "ORDER", "NAMEWORD", "ASSERT_K", "FORMAT", "PUBLIC", "DEFSYMEND", "BASE",
  "ALIAS", "TRUNCATE", "REL", "INPUT_SCRIPT", "INPUT_MRI_SCRIPT",
  "INPUT_DEFSYM", "CASE", "EXTERN", "START", "VERS_TAG", "VERS_IDENTIFIER",
  "GLOBAL", "LOCAL", "VERSIONK", "INPUT_VERSION_SCRIPT", "KEEP",
  "ONLY_IF_RO", "ONLY_IF_RW", "SPECIAL", "EXCLUDE_FILE", "CONSTANT",
  "INPUT_DYNAMIC_LIST", "','", "';'", "')'", "'['", "']'", "'!'", "'~'",
  "$accept", "file", "filename", "defsym_expr", "@1", "mri_script_file",
  "@2", "mri_script_lines", "mri_script_command", "@3", "ordernamelist",
  "mri_load_name_list", "mri_abs_name_list", "casesymlist",
  "extern_name_list", "@4", "extern_name_list_body", "script_file", "@5",
  "ifile_list", "ifile_p1", "@6", "@7", "input_list", "@8", "@9", "@10",
  "sections", "sec_or_group_p1", "statement_anywhere", "@11",
  "wildcard_name", "wildcard_spec", "exclude_name_list", "file_NAME_list",
  "input_section_spec_no_keep", "input_section_spec", "@12", "statement",
  "@13", "@14", "statement_list", "statement_list_opt", "length",
  "fill_exp", "fill_opt", "assign_op", "end", "assignment", "opt_comma",
  "memory", "memory_spec_list_opt", "memory_spec_list", "memory_spec",
  "@15", "@16", "origin_spec", "length_spec", "attributes_opt",
  "attributes_list", "attributes_string", "startup", "high_level_library",
  "high_level_library_NAME_list", "low_level_library",
  "low_level_library_NAME_list", "floating_point_support",
  "nocrossref_list", "mustbe_exp", "@17", "exp", "memspec_at_opt",
  "opt_at", "opt_align", "opt_subalign", "sect_constraint", "section",
  "@18", "@19", "@20", "@21", "@22", "@23", "@24", "@25", "@26", "@27",
  "@28", "@29", "@30", "type", "atype", "opt_exp_with_type",
  "opt_exp_without_type", "opt_nocrossrefs", "memspec_opt", "phdr_opt",
  "overlay_section", "@31", "@32", "@33", "phdrs", "phdr_list", "phdr",
  "@34", "@35", "phdr_type", "phdr_qualifiers", "phdr_val",
  "dynamic_list_file", "@36", "dynamic_list_nodes", "dynamic_list_node",
  "dynamic_list_tag", "version_script_file", "@37", "version", "@38",
  "vers_nodes", "vers_node", "verdep", "vers_tag", "vers_defns", "@39",
  "@40", "opt_semicolon", 0
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
     291,   292,   293,   294,   295,   296,   123,   125,   297,   298,
     299,   300,   301,   302,   303,   304,   305,   306,   307,   308,
     309,   310,   311,   312,   313,   314,   315,   316,   317,   318,
     319,   320,   321,   322,   323,   324,   325,   326,   327,   328,
     329,   330,   331,   332,   333,   334,   335,   336,   337,   338,
     339,   340,   341,   342,   343,   344,   345,   346,   347,   348,
     349,   350,   351,   352,   353,   354,   355,   356,   357,   358,
     359,   360,   361,   362,   363,   364,   365,   366,   367,   368,
     369,   370,   371,   372,   373,   374,   375,   376,   377,   378,
      44,    59,    41,    91,    93,    33,   126
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   147,   148,   148,   148,   148,   148,   149,   151,   150,
     153,   152,   154,   154,   155,   155,   155,   155,   155,   155,
     155,   155,   155,   155,   155,   155,   155,   155,   155,   155,
     155,   155,   155,   155,   155,   155,   155,   155,   155,   155,
     156,   155,   155,   155,   157,   157,   157,   158,   158,   159,
     159,   160,   160,   160,   162,   161,   163,   163,   163,   165,
     164,   166,   166,   167,   167,   167,   167,   167,   167,   167,
     167,   167,   167,   167,   167,   167,   167,   167,   167,   167,
     167,   167,   168,   167,   167,   169,   167,   167,   167,   167,
     167,   167,   170,   170,   170,   170,   170,   170,   171,   170,
     172,   170,   173,   170,   174,   175,   175,   175,   176,   176,
     177,   176,   178,   178,   178,   179,   179,   179,   179,   179,
     179,   179,   179,   179,   180,   180,   181,   181,   182,   182,
     182,   183,   184,   183,   185,   185,   185,   185,   185,   185,
     185,   185,   186,   185,   187,   185,   188,   188,   189,   189,
     190,   190,   190,   190,   190,   191,   192,   192,   193,   193,
     193,   193,   193,   193,   193,   193,   194,   194,   195,   195,
     195,   195,   196,   196,   197,   198,   198,   199,   199,   201,
     200,   202,   200,   203,   204,   205,   205,   206,   206,   207,
     207,   208,   209,   209,   210,   210,   211,   212,   212,   213,
     213,   214,   214,   214,   216,   215,   217,   217,   217,   217,
     217,   217,   217,   217,   217,   217,   217,   217,   217,   217,
     217,   217,   217,   217,   217,   217,   217,   217,   217,   217,
     217,   217,   217,   217,   217,   217,   217,   217,   217,   217,
     217,   217,   217,   217,   217,   217,   217,   217,   217,   217,
     217,   217,   217,   218,   218,   219,   219,   220,   220,   221,
     221,   222,   222,   222,   222,   224,   225,   226,   227,   228,
     223,   229,   230,   231,   232,   233,   223,   234,   235,   223,
     236,   223,   237,   237,   237,   237,   237,   238,   238,   238,
     239,   239,   239,   239,   240,   240,   241,   241,   242,   242,
     243,   243,   244,   245,   246,   247,   244,   248,   249,   249,
     251,   252,   250,   253,   254,   254,   254,   255,   255,   257,
     256,   258,   258,   259,   260,   262,   261,   264,   263,   265,
     265,   266,   266,   266,   267,   267,   268,   268,   268,   268,
     268,   269,   269,   269,   269,   270,   269,   271,   269,   269,
     269,   269,   269,   269,   269,   272,   272
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
       3,     6,     1,     3,     2,     1,     3,     2,     0,     5,
       0,     7,     0,     6,     4,     2,     2,     0,     4,     2,
       0,     7,     1,     1,     1,     1,     5,     4,     4,     7,
       7,     7,     7,     8,     2,     1,     3,     1,     1,     3,
       4,     1,     0,     5,     2,     1,     1,     1,     4,     1,
       4,     4,     0,     8,     0,     5,     2,     1,     0,     1,
       1,     1,     1,     1,     1,     1,     2,     0,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     3,     3,
       6,     6,     1,     0,     4,     1,     0,     3,     1,     0,
       7,     0,     5,     3,     3,     0,     3,     1,     2,     1,
       2,     4,     4,     3,     3,     1,     4,     3,     0,     1,
       1,     0,     2,     3,     0,     2,     2,     3,     4,     2,
       2,     2,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     5,     3,
       3,     4,     1,     1,     4,     4,     4,     4,     4,     4,
       4,     6,     6,     6,     4,     6,     4,     1,     6,     6,
       6,     4,     4,     3,     0,     4,     0,     4,     0,     4,
       0,     1,     1,     1,     0,     0,     0,     0,     0,     0,
      19,     0,     0,     0,     0,     0,    18,     0,     0,     7,
       0,     5,     1,     1,     1,     1,     1,     3,     0,     2,
       3,     2,     6,    10,     2,     1,     0,     1,     2,     0,
       0,     3,     0,     0,     0,     0,    11,     4,     0,     2,
       0,     0,     6,     1,     0,     3,     5,     0,     3,     0,
       2,     1,     2,     4,     2,     0,     2,     0,     5,     1,
       2,     4,     5,     6,     1,     2,     0,     2,     4,     4,
       8,     1,     1,     3,     3,     0,     9,     0,     7,     1,
       3,     1,     3,     1,     3,     0,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    59,    10,     8,   325,   319,     0,     2,    62,     3,
      13,     6,     0,     4,     0,     5,     0,     1,    60,    11,
       0,   336,     0,   326,   329,     0,   320,   321,     0,     0,
       0,     0,     0,    79,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   199,   200,     0,     0,
      82,     0,     0,     0,   110,     0,    72,    61,    64,    70,
       0,    63,    66,    67,    68,    69,    65,    71,     0,    16,
       0,     0,     0,     0,    17,     0,     0,     0,    19,    46,
       0,     0,     0,     0,     0,     0,    51,    54,     0,     0,
       0,   342,   353,   341,   349,   351,     0,     0,   336,   330,
     349,   351,     0,     0,   322,   204,   165,   164,   163,   162,
     161,   160,   159,   158,   204,   107,   308,     0,     0,     0,
       0,     7,    85,   176,     0,     0,     0,     0,     0,     0,
       0,   198,   201,     0,     0,     0,     0,     0,     0,    54,
     167,   166,   109,     0,     0,    40,     0,   232,   247,     0,
       0,     0,     0,     0,     0,     0,     0,   233,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    14,     0,    49,    31,    47,    32,
      18,    33,    23,     0,    36,     0,    37,    52,    38,    39,
       0,    42,    12,     9,     0,     0,     0,     0,   337,     0,
       0,   324,   168,     0,   169,     0,     0,    89,    90,     0,
       0,    62,   179,     0,     0,   173,   178,     0,     0,     0,
       0,     0,     0,   193,   195,   173,   173,   201,     0,    92,
      95,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    13,     0,     0,   210,   206,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   209,   211,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    25,     0,     0,    45,     0,     0,     0,    22,     0,
       0,    56,    55,   347,     0,     0,   331,   344,   354,   343,
     350,   352,     0,   323,   205,   265,   104,     0,   271,   277,
     106,   105,   310,   307,   309,     0,    76,    78,   327,   185,
     181,   174,   172,     0,     0,    73,    74,    84,   108,   191,
     192,     0,   196,     0,   201,   202,    87,    98,    94,    97,
       0,     0,    81,     0,    75,   204,   204,     0,    88,     0,
      27,    28,    43,    29,    30,   207,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   230,   229,   227,   226,
     225,   220,   219,   223,   224,   222,   221,   218,   217,   215,
     216,   212,   213,   214,    15,    26,    24,    50,    48,    44,
      20,    21,    35,    34,    53,    57,     0,     0,   338,   339,
       0,   334,   332,     0,   288,   280,     0,   288,     0,     0,
      86,     0,     0,   176,   177,     0,   194,   197,   203,     0,
     102,    93,    96,     0,    83,     0,     0,     0,   328,    41,
       0,   240,   246,     0,     0,   244,     0,   231,   208,   235,
     234,   236,   237,     0,     0,   251,   252,   239,     0,   238,
       0,    58,   355,   352,   345,   335,   333,     0,     0,   288,
       0,   256,   107,   295,     0,   296,   278,   313,   314,     0,
     189,     0,     0,   187,     0,     0,    91,     0,     0,   100,
     170,   171,     0,     0,     0,     0,     0,     0,     0,     0,
     228,   356,     0,     0,     0,   282,   283,   284,   285,   286,
     289,     0,     0,     0,     0,   291,     0,   258,     0,   294,
     297,   256,     0,   317,     0,   311,     0,   190,   186,   188,
       0,   173,   182,    99,     0,     0,   111,   241,   242,   243,
     245,   248,   249,   250,   348,     0,   355,   287,     0,   290,
       0,     0,   260,   281,   260,   107,     0,   314,     0,     0,
      77,   204,     0,   103,     0,   340,     0,   288,     0,     0,
       0,   266,   272,     0,     0,   315,     0,   312,   183,     0,
     180,   101,   346,     0,     0,   255,     0,     0,   264,     0,
     279,   318,   314,   204,     0,   292,   257,     0,   261,   262,
     263,     0,   273,   316,   184,     0,   259,   267,   302,   288,
     148,     0,     0,   128,   114,   113,   150,   151,   152,   153,
     154,     0,     0,     0,     0,   135,   137,   142,     0,     0,
     136,     0,   115,     0,   131,   139,   147,   149,     0,     0,
       0,   303,   274,   293,     0,     0,   144,   204,     0,   132,
       0,   112,     0,   127,   173,     0,   146,   268,   204,   134,
       0,   299,     0,     0,     0,     0,     0,     0,     0,     0,
     148,     0,   155,     0,     0,   125,     0,     0,   129,     0,
     173,   299,     0,   148,     0,   254,     0,     0,   138,     0,
     117,     0,     0,   118,     0,   141,     0,   112,     0,     0,
     124,   126,   130,   254,   140,     0,   298,     0,   300,     0,
       0,     0,     0,     0,   145,     0,   133,   116,   300,   304,
       0,   157,     0,     0,     0,     0,     0,     0,   157,   300,
     253,   204,     0,   275,   120,   119,     0,   121,   122,     0,
     269,   157,   156,   301,   173,   123,   143,   173,   305,   276,
     270,   173,   306
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     6,   122,    11,    12,     9,    10,    19,    89,   242,
     180,   179,   177,   188,   189,   190,   302,     7,     8,    18,
      57,   134,   211,   232,   439,   545,   498,    58,   205,   320,
     138,   642,   643,   686,   664,   644,   645,   684,   646,   658,
     680,   647,   648,   649,   681,   743,   114,   142,    60,   689,
      61,   214,   215,   216,   329,   433,   541,   590,   432,   492,
     493,    62,    63,   225,    64,   226,    65,   228,   682,   203,
     247,   718,   527,   562,   581,   611,   321,   424,   598,   620,
     691,   757,   426,   599,   618,   671,   754,   427,   532,   482,
     521,   480,   481,   485,   531,   695,   731,   621,   670,   739,
     761,    66,   206,   324,   428,   569,   488,   535,   567,    15,
      16,    26,    27,   102,    13,    14,    67,    68,    23,    24,
     423,    96,    97,   514,   417,   512
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -621
static const yytype_int16 yypact[] =
{
     180,  -621,  -621,  -621,  -621,  -621,    27,  -621,  -621,  -621,
    -621,  -621,    38,  -621,   -21,  -621,    23,  -621,   824,  1581,
     111,   112,    75,   -21,  -621,   120,    23,  -621,   623,    95,
     128,   170,   153,  -621,   201,  -621,   242,   195,   220,   223,
     226,   238,   245,   252,   280,   285,  -621,  -621,   286,   288,
    -621,   290,   291,   299,  -621,   315,  -621,  -621,  -621,  -621,
     129,  -621,  -621,  -621,  -621,  -621,  -621,  -621,   206,  -621,
     352,   242,   354,   680,  -621,   355,   359,   360,  -621,  -621,
     361,   363,   366,   680,   367,   369,   372,  -621,   374,   266,
     680,  -621,   378,  -621,   373,   376,   331,   253,   112,  -621,
    -621,  -621,   338,   255,  -621,  -621,  -621,  -621,  -621,  -621,
    -621,  -621,  -621,  -621,  -621,  -621,  -621,   402,   404,   405,
     406,  -621,  -621,    24,   409,   411,   242,   242,   412,   242,
       4,  -621,   418,    20,   388,   242,   423,   424,   392,  -621,
    -621,  -621,  -621,   375,    33,  -621,    41,  -621,  -621,   680,
     680,   680,   393,   399,   400,   401,   403,  -621,   408,   413,
     414,   415,   417,   419,   420,   428,   429,   430,   432,   433,
     435,   438,   680,   680,  1400,   228,  -621,   301,  -621,   302,
       5,  -621,  -621,   381,  1756,   303,  -621,  -621,   307,  -621,
     444,  -621,  -621,  1756,   421,   120,   120,   314,   217,   422,
     335,   217,  -621,   680,  -621,   322,    46,  -621,  -621,    10,
     336,  -621,  -621,   242,   425,    -2,  -621,   340,   341,   342,
     343,   347,   348,  -621,  -621,    87,   114,    22,   349,  -621,
    -621,   455,    32,    20,   356,   490,   491,   680,   357,   -21,
     680,   680,  -621,   680,   680,  -621,  -621,   833,   680,   680,
     680,   680,   680,   497,   498,   680,   503,   504,   505,   506,
     680,   680,   509,   510,   680,   680,   511,  -621,  -621,   680,
     680,   680,   680,   680,   680,   680,   680,   680,   680,   680,
     680,   680,   680,   680,   680,   680,   680,   680,   680,   680,
     680,  1756,   512,   513,  -621,   514,   680,   680,  1756,   310,
     516,  -621,    25,  -621,   384,   387,  -621,  -621,   518,  -621,
    -621,  -621,   -12,  -621,  1756,   623,  -621,   242,  -621,  -621,
    -621,  -621,  -621,  -621,  -621,   525,  -621,  -621,   897,   493,
    -621,  -621,  -621,    24,   528,  -621,  -621,  -621,  -621,  -621,
    -621,   242,  -621,   242,   418,  -621,  -621,  -621,  -621,  -621,
     496,    39,  -621,    86,  -621,  -621,  -621,  1420,  -621,     6,
    1756,  1756,   691,  1756,  1756,  -621,  1022,  1042,  1440,  1460,
    1062,   394,   395,  1082,   396,   426,   427,   436,  1480,  1500,
     437,   440,  1102,  1524,   441,  1716,  1773,  1789,  1804,  1002,
    1643,   987,   987,   371,   371,   371,   371,   300,   300,    37,
      37,  -621,  -621,  -621,  1756,  1756,  1756,  -621,  -621,  -621,
    1756,  1756,  -621,  -621,  -621,  -621,   531,   120,   232,   217,
     480,  -621,  -621,    -7,   536,  -621,   608,   536,   680,   407,
    -621,     3,   527,    24,  -621,   442,  -621,  -621,  -621,    20,
    -621,  -621,  -621,   507,  -621,   443,   448,   537,  -621,  -621,
     680,  -621,  -621,   680,   680,  -621,   680,  -621,  -621,  -621,
    -621,  -621,  -621,   680,   680,  -621,  -621,  -621,   542,  -621,
     680,  -621,   431,   532,  -621,  -621,  -621,    15,   522,  1693,
     545,   461,  -621,  -621,  1736,   473,  -621,  1756,    19,   560,
    -621,   566,     2,  -621,   481,   541,  -621,   122,    20,  -621,
    -621,  -621,   449,  1122,  1148,  1168,  1188,  1208,  1228,   450,
    1756,   217,   523,   120,   120,  -621,  -621,  -621,  -621,  -621,
    -621,   451,   680,   227,   570,  -621,   558,   559,   410,  -621,
    -621,   461,   540,   561,   563,  -621,   459,  -621,  -621,  -621,
     596,   463,  -621,  -621,   132,    20,  -621,  -621,  -621,  -621,
    -621,  -621,  -621,  -621,  -621,   465,   431,  -621,  1248,  -621,
     680,   567,   520,  -621,   520,  -621,   680,    19,   680,   466,
    -621,  -621,   517,  -621,   136,   217,   564,   248,  1274,   680,
     585,  -621,  -621,   601,  1294,  -621,  1314,  -621,  -621,   617,
    -621,  -621,  -621,   588,   611,  -621,  1334,   680,   214,   584,
    -621,  -621,    19,  -621,   680,  -621,  -621,  1354,  -621,  -621,
    -621,   586,  -621,  -621,  -621,  1374,  -621,  -621,  -621,   604,
     736,    47,   628,   544,  -621,  -621,  -621,  -621,  -621,  -621,
    -621,   613,   614,   242,   615,  -621,  -621,  -621,   616,   618,
    -621,   284,  -621,   619,  -621,  -621,  -621,   736,   591,   620,
     129,  -621,  -621,  -621,    57,   229,  -621,  -621,   625,  -621,
     151,  -621,   626,  -621,   -31,   284,  -621,  -621,  -621,  -621,
     598,   639,   630,   631,   533,   632,   534,   633,   636,   550,
     736,   551,  -621,   680,    26,  -621,    16,   289,  -621,   284,
     150,   639,   552,   736,   674,   580,   151,   151,  -621,   151,
    -621,   151,   151,  -621,   661,  -621,  1544,   557,   562,   151,
    -621,  -621,  -621,   580,  -621,   644,  -621,   681,  -621,   565,
     571,    17,   574,   578,  -621,   701,  -621,  -621,  -621,  -621,
     704,    58,   581,   582,   151,   583,   592,   593,    58,  -621,
    -621,  -621,   705,  -621,  -621,  -621,   594,  -621,  -621,   129,
    -621,    58,  -621,  -621,   463,  -621,  -621,   463,  -621,  -621,
    -621,   463,  -621
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -621,  -621,   -70,  -621,  -621,  -621,  -621,   470,  -621,  -621,
    -621,  -621,  -621,  -621,   587,  -621,  -621,  -621,  -621,   519,
    -621,  -621,  -621,  -221,  -621,  -621,  -621,  -621,  -444,   -13,
    -621,   927,  -540,    29,    72,    55,  -621,  -621,    94,  -621,
    -621,  -621,  -500,  -621,     1,  -508,  -621,  -617,  -425,  -212,
    -621,   311,  -621,   389,  -621,  -621,  -621,  -621,  -621,  -621,
     256,  -621,  -621,  -621,  -621,  -621,  -621,  -205,  -103,  -621,
     -73,    34,   218,  -621,   181,  -621,  -621,  -621,  -621,  -621,
    -621,  -621,  -621,  -621,  -621,  -621,  -621,  -621,  -621,  -621,
    -621,  -463,   323,  -621,  -621,    65,  -620,  -621,  -621,  -621,
    -621,  -621,  -621,  -621,  -621,  -621,  -621,  -527,  -621,  -621,
    -621,  -621,   738,  -621,  -621,  -621,  -621,  -621,   526,   -19,
    -621,   668,   -10,  -621,  -621,   211
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -328
static const yytype_int16 yytable[] =
{
     174,   145,   202,   333,    99,    59,   490,   490,   121,   294,
     184,   204,   353,   341,   343,   103,   524,   193,   147,   148,
     661,   661,   345,   533,   229,   230,   227,    17,   212,   415,
     707,   624,   624,   669,  -175,    21,   348,   349,   528,   240,
     585,   624,    20,   441,   442,   149,   150,   243,   625,   625,
     322,   651,   151,   152,   153,  -175,   219,   220,   625,   222,
     224,   661,    21,   448,   741,   234,   154,   155,   156,   285,
     286,   287,   624,   157,   742,   613,   245,   246,   158,    25,
     662,   632,   515,   516,   517,   518,   519,   159,   213,   625,
     348,   349,   160,   161,   162,   163,   164,   165,   166,   267,
     268,   663,   291,   323,   652,   167,    22,   168,   738,   332,
     298,   672,   673,   688,   594,   421,    91,    90,   534,   751,
     475,   583,   169,   231,    91,   663,   348,   349,   170,   422,
     314,    98,   756,    22,   476,   350,   348,   349,   332,   438,
     348,   349,   443,   330,   538,   295,   223,   491,   491,   711,
     325,   115,   326,   171,   674,   661,   622,   520,   709,   734,
     172,   173,   344,   639,   357,   416,   624,   360,   361,   641,
     363,   364,   351,   241,   352,   366,   367,   368,   369,   370,
     704,   244,   373,   625,   116,   304,   305,   378,   379,   350,
     119,   382,   383,   715,   675,   650,   385,   386,   387,   388,
     389,   390,   391,   392,   393,   394,   395,   396,   397,   398,
     399,   400,   401,   402,   403,   404,   405,   406,   497,   117,
     118,   307,   650,   410,   411,   350,   351,   332,   444,   340,
     750,   147,   148,   661,   289,   350,   307,    92,   120,   350,
      93,    94,    95,   758,   624,    92,   121,   425,    93,   100,
     101,   123,   445,   446,   332,   650,   342,   124,   149,   150,
     125,   625,   351,   126,   543,   151,   152,   153,   650,   140,
     141,   436,   351,   437,   573,   127,   351,   544,   591,   154,
     155,   156,   128,   677,   678,   523,   157,   593,   661,   129,
     332,   158,   712,   661,   515,   516,   517,   518,   519,   624,
     159,     1,     2,     3,   624,   160,   161,   162,   163,   164,
     165,   166,     4,   412,   413,    59,   625,   130,   167,     5,
     168,   625,   131,   132,   574,   133,   315,   135,   136,   572,
     283,   284,   285,   286,   287,   169,   137,   143,   662,   632,
      99,   170,   308,   672,   673,   309,   310,   311,   608,   609,
     610,   479,   139,   484,   479,   487,   144,   308,   146,   175,
     309,   310,   473,   176,   178,   181,   171,   182,   290,   520,
     183,   185,   186,   172,   173,   192,   187,   503,   191,   316,
     504,   505,   194,   506,   147,   148,   317,   296,   197,   195,
     507,   508,   196,   318,   198,   200,   201,   510,    42,   281,
     282,   283,   284,   285,   286,   287,   207,   472,   208,   209,
     210,   149,   150,   217,   315,   218,   221,   319,   151,   152,
     153,   639,   227,    52,    53,   233,   675,   235,   236,   237,
     248,   239,   154,   155,   156,    54,   249,   250,   251,   157,
     252,   292,   293,   299,   158,   253,   563,   300,   301,   558,
     254,   255,   256,   159,   257,   306,   258,   259,   160,   161,
     162,   163,   164,   165,   166,   260,   261,   262,   588,   263,
     264,   167,   265,   168,   317,   266,   313,   303,   327,   312,
     334,   318,   331,   335,   336,   337,    42,   578,   169,   338,
     339,   346,   347,   584,   170,   586,   355,   356,   354,   358,
     614,   371,   372,   555,   556,   319,   596,   374,   375,   376,
     377,    52,    53,   380,   381,   384,   407,   408,   409,   171,
     414,   297,   420,    54,   607,   418,   172,   173,   419,   429,
     431,   615,   435,   440,   456,   471,   474,   457,   459,   147,
     148,   502,   759,   494,   499,   760,   509,   489,   513,   762,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   522,
     526,   525,   530,   656,   536,   692,   149,   150,   460,   461,
     537,   540,   511,   477,   152,   153,   478,   542,   462,   465,
     554,  -112,   466,   469,   496,   500,   559,   154,   155,   156,
     501,   546,   553,   557,   157,   560,   565,   561,   566,   158,
     568,   570,   571,   332,   579,   315,   575,   587,   159,   589,
     706,   147,   148,   160,   161,   162,   163,   164,   165,   166,
     580,   592,   597,   603,   483,   604,   167,   605,   168,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   149,   150,
     612,   523,   617,   169,   653,   151,   152,   153,   667,   170,
     654,   655,   657,   659,   693,   660,   665,   668,   600,   154,
     155,   156,   683,   687,   694,   317,   157,   696,   697,   699,
     701,   158,   318,   702,   171,   698,   700,    42,   716,   717,
     159,   172,   173,   147,   148,   160,   161,   162,   163,   164,
     165,   166,   703,   705,   714,    69,   319,   724,   167,  -128,
     168,   729,    52,    53,   726,   737,   730,   732,   740,   753,
     149,   150,   362,   733,    54,   169,   735,   151,   152,   153,
     736,   170,   434,   744,   745,   747,   238,   449,   721,    70,
     328,   154,   155,   156,   748,   749,   755,   690,   157,   708,
     623,   666,   752,   158,   495,   582,   171,   728,   539,   564,
     486,   624,   159,   172,   173,    71,   713,   160,   161,   162,
     163,   164,   165,   166,   104,   359,   199,   576,   625,     0,
     167,     0,   168,     0,     0,     0,     0,   626,   627,   628,
     629,   630,     0,     0,     0,     0,     0,   169,     0,    72,
     631,   632,     0,   170,     0,    73,    74,    75,    76,    77,
     633,    78,    79,    80,     0,    81,    82,     0,    83,    84,
      85,     0,     0,     0,     0,    86,    87,    88,   171,     0,
       0,     0,     0,     0,     0,   172,   173,   634,    28,   635,
       0,     0,     0,   636,     0,     0,     0,    52,    53,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   269,   637,
     270,   271,   272,   273,   274,   275,   276,   277,   278,   279,
     280,   281,   282,   283,   284,   285,   286,   287,     0,   638,
      29,    30,    31,   639,     0,     0,     0,   640,     0,   641,
       0,     0,     0,    32,    33,    34,    35,     0,    36,    37,
      38,     0,     0,     0,     0,     0,     0,    39,    40,    41,
      42,    28,     0,     0,     0,     0,     0,     0,    43,    44,
      45,    46,    47,    48,     0,     0,     0,     0,    49,    50,
      51,     0,     0,     0,     0,    52,    53,     0,     0,     0,
       0,     0,     0,   430,     0,     0,     0,    54,     0,     0,
       0,     0,     0,    29,    30,    31,     0,     0,     0,    55,
       0,     0,     0,     0,     0,  -327,    32,    33,    34,    35,
       0,    36,    37,    38,     0,    56,     0,     0,     0,     0,
      39,    40,    41,    42,     0,   365,     0,     0,     0,     0,
       0,    43,    44,    45,    46,    47,    48,     0,     0,     0,
       0,    49,    50,    51,     0,     0,     0,     0,    52,    53,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      54,   277,   278,   279,   280,   281,   282,   283,   284,   285,
     286,   287,    55,   274,   275,   276,   277,   278,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   269,    56,   270,
     271,   272,   273,   274,   275,   276,   277,   278,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   269,     0,   270,
     271,   272,   273,   274,   275,   276,   277,   278,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   269,     0,   270,
     271,   272,   273,   274,   275,   276,   277,   278,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   269,     0,   270,
     271,   272,   273,   274,   275,   276,   277,   278,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   269,     0,   270,
     271,   272,   273,   274,   275,   276,   277,   278,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   269,     0,   270,
     271,   272,   273,   274,   275,   276,   277,   278,   279,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,     0,
       0,     0,   450,   269,   451,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   269,   452,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   269,   455,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   269,   458,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   269,   467,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   269,   547,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,     0,     0,     0,     0,   269,
     548,   270,   271,   272,   273,   274,   275,   276,   277,   278,
     279,   280,   281,   282,   283,   284,   285,   286,   287,   269,
     549,   270,   271,   272,   273,   274,   275,   276,   277,   278,
     279,   280,   281,   282,   283,   284,   285,   286,   287,   269,
     550,   270,   271,   272,   273,   274,   275,   276,   277,   278,
     279,   280,   281,   282,   283,   284,   285,   286,   287,   269,
     551,   270,   271,   272,   273,   274,   275,   276,   277,   278,
     279,   280,   281,   282,   283,   284,   285,   286,   287,   269,
     552,   270,   271,   272,   273,   274,   275,   276,   277,   278,
     279,   280,   281,   282,   283,   284,   285,   286,   287,   269,
     577,   270,   271,   272,   273,   274,   275,   276,   277,   278,
     279,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,     0,     0,     0,     0,   269,   595,   270,   271,   272,
     273,   274,   275,   276,   277,   278,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   269,   601,   270,   271,   272,
     273,   274,   275,   276,   277,   278,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   269,   602,   270,   271,   272,
     273,   274,   275,   276,   277,   278,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   269,   606,   270,   271,   272,
     273,   274,   275,   276,   277,   278,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   269,   616,   270,   271,   272,
     273,   274,   275,   276,   277,   278,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   269,   619,   270,   271,   272,
     273,   274,   275,   276,   277,   278,   279,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,     0,     0,   269,
     288,   270,   271,   272,   273,   274,   275,   276,   277,   278,
     279,   280,   281,   282,   283,   284,   285,   286,   287,   269,
     447,   270,   271,   272,   273,   274,   275,   276,   277,   278,
     279,   280,   281,   282,   283,   284,   285,   286,   287,     0,
     453,   676,   679,     0,     0,    69,     0,   685,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     454,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   710,   676,     0,     0,     0,     0,    70,
     463,     0,     0,   719,   720,     0,   685,     0,   722,   723,
       0,     0,     0,     0,     0,     0,   727,     0,     0,     0,
     464,     0,     0,     0,     0,    71,     0,     0,   710,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   746,     0,     0,   468,   275,   276,   277,   278,   279,
     280,   281,   282,   283,   284,   285,   286,   287,     0,    72,
       0,     0,     0,     0,   725,    73,    74,    75,    76,    77,
     -43,    78,    79,    80,     0,    81,    82,     0,    83,    84,
      85,     0,     0,     0,     0,    86,    87,    88,   269,     0,
     270,   271,   272,   273,   274,   275,   276,   277,   278,   279,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     523,   269,   470,   270,   271,   272,   273,   274,   275,   276,
     277,   278,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   269,   529,   270,   271,   272,   273,   274,   275,   276,
     277,   278,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   269,     0,   270,   271,   272,   273,   274,   275,   276,
     277,   278,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   271,   272,   273,   274,   275,   276,   277,   278,   279,
     280,   281,   282,   283,   284,   285,   286,   287,   272,   273,
     274,   275,   276,   277,   278,   279,   280,   281,   282,   283,
     284,   285,   286,   287,   273,   274,   275,   276,   277,   278,
     279,   280,   281,   282,   283,   284,   285,   286,   287
};

static const yytype_int16 yycheck[] =
{
      73,    71,   105,   215,    23,    18,     4,     4,     4,     4,
      83,   114,   233,   225,   226,    25,   479,    90,     3,     4,
       4,     4,   227,     4,     4,     5,     4,     0,     4,     4,
       4,    15,    15,   650,    36,    56,     4,     5,   482,     6,
     567,    15,     4,     4,     5,    30,    31,     6,    32,    32,
       4,     4,    37,    38,    39,    57,   126,   127,    32,   129,
     130,     4,    56,    57,     6,   135,    51,    52,    53,    32,
      33,    34,    15,    58,    16,   602,   149,   150,    63,    56,
      54,    55,    67,    68,    69,    70,    71,    72,    64,    32,
       4,     5,    77,    78,    79,    80,    81,    82,    83,   172,
     173,   641,   175,    57,    57,    90,   127,    92,   728,   140,
     183,    54,    55,   144,   577,   127,     4,     6,    99,   739,
     127,   565,   107,   103,     4,   665,     4,     5,   113,   141,
     203,    56,   749,   127,   141,   103,     4,     5,   140,   344,
       4,     5,   103,   213,   142,   140,   142,   145,   145,   689,
     140,    56,   142,   138,    97,     4,   619,   142,   142,   142,
     145,   146,   140,   137,   237,   140,    15,   240,   241,   143,
     243,   244,   140,   140,   142,   248,   249,   250,   251,   252,
     680,   140,   255,    32,    56,   195,   196,   260,   261,   103,
      37,   264,   265,   693,   137,   620,   269,   270,   271,   272,
     273,   274,   275,   276,   277,   278,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   439,    49,
      50,     4,   647,   296,   297,   103,   140,   140,   142,   142,
     738,     3,     4,     4,     6,   103,     4,   125,    37,   103,
     128,   129,   130,   751,    15,   125,     4,   317,   128,   129,
     130,    56,   355,   356,   140,   680,   142,    37,    30,    31,
      37,    32,   140,    37,   142,    37,    38,    39,   693,   140,
     141,   341,   140,   343,   142,    37,   140,   498,   142,    51,
      52,    53,    37,    54,    55,    37,    58,    39,     4,    37,
     140,    63,   142,     4,    67,    68,    69,    70,    71,    15,
      72,   121,   122,   123,    15,    77,    78,    79,    80,    81,
      82,    83,   132,     3,     4,   328,    32,    37,    90,   139,
      92,    32,    37,    37,   545,    37,     4,    37,    37,   541,
      30,    31,    32,    33,    34,   107,    37,   131,    54,    55,
     359,   113,   125,    54,    55,   128,   129,   130,   134,   135,
     136,   424,    37,   426,   427,   428,     4,   125,     4,     4,
     128,   129,   130,     4,     4,     4,   138,     4,   140,   142,
       4,     4,     3,   145,   146,   109,     4,   450,     4,    57,
     453,   454,     4,   456,     3,     4,    64,     6,    57,    16,
     463,   464,    16,    71,   141,    57,   141,   470,    76,    28,
      29,    30,    31,    32,    33,    34,     4,   417,     4,     4,
       4,    30,    31,     4,     4,     4,     4,    95,    37,    38,
      39,   137,     4,   101,   102,    37,   137,     4,     4,    37,
      37,    56,    51,    52,    53,   113,    37,    37,    37,    58,
      37,   140,   140,   140,    63,    37,    36,   140,     4,   522,
      37,    37,    37,    72,    37,   141,    37,    37,    77,    78,
      79,    80,    81,    82,    83,    37,    37,    37,   571,    37,
      37,    90,    37,    92,    64,    37,   141,    56,   142,    57,
     140,    71,    57,   142,   142,   142,    76,   560,   107,   142,
     142,   142,    37,   566,   113,   568,     6,     6,   142,   142,
     603,     4,     4,   513,   514,    95,   579,     4,     4,     4,
       4,   101,   102,     4,     4,     4,     4,     4,     4,   138,
       4,   140,     4,   113,   597,   141,   145,   146,   141,     4,
      37,   604,     4,    37,   140,     4,    56,   142,   142,     3,
       4,     4,   754,    16,    37,   757,     4,   140,    16,   761,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    37,
      99,    16,    89,   633,     4,   668,    30,    31,   142,   142,
       4,    90,   141,    37,    38,    39,    40,    36,   142,   142,
      57,    37,   142,   142,   142,   142,    16,    51,    52,    53,
     142,   142,   142,   142,    58,    37,    56,    38,    37,    63,
      37,   142,     6,   140,    37,     4,   141,   141,    72,    92,
     683,     3,     4,    77,    78,    79,    80,    81,    82,    83,
     100,    57,    37,     6,    16,    37,    90,    16,    92,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    30,    31,
      56,    37,    56,   107,    16,    37,    38,    39,    57,   113,
      37,    37,    37,    37,    56,    37,    37,    37,    57,    51,
      52,    53,    37,    37,    25,    64,    58,    37,    37,    37,
      37,    63,    71,    37,   138,   142,   142,    76,     4,    99,
      72,   145,   146,     3,     4,    77,    78,    79,    80,    81,
      82,    83,   142,   142,   142,     4,    95,    36,    90,   142,
      92,    57,   101,   102,   142,     4,    25,   142,     4,     4,
      30,    31,   242,   142,   113,   107,   142,    37,    38,    39,
     142,   113,   333,   142,   142,   142,   139,    36,   699,    38,
     211,    51,    52,    53,   142,   142,   142,   665,    58,   684,
       4,   647,   741,    63,   433,   564,   138,   713,   492,   531,
     427,    15,    72,   145,   146,    64,   691,    77,    78,    79,
      80,    81,    82,    83,    26,   239,    98,   556,    32,    -1,
      90,    -1,    92,    -1,    -1,    -1,    -1,    41,    42,    43,
      44,    45,    -1,    -1,    -1,    -1,    -1,   107,    -1,    98,
      54,    55,    -1,   113,    -1,   104,   105,   106,   107,   108,
      64,   110,   111,   112,    -1,   114,   115,    -1,   117,   118,
     119,    -1,    -1,    -1,    -1,   124,   125,   126,   138,    -1,
      -1,    -1,    -1,    -1,    -1,   145,   146,    91,     4,    93,
      -1,    -1,    -1,    97,    -1,    -1,    -1,   101,   102,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    15,   113,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    -1,   133,
      46,    47,    48,   137,    -1,    -1,    -1,   141,    -1,   143,
      -1,    -1,    -1,    59,    60,    61,    62,    -1,    64,    65,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    73,    74,    75,
      76,     4,    -1,    -1,    -1,    -1,    -1,    -1,    84,    85,
      86,    87,    88,    89,    -1,    -1,    -1,    -1,    94,    95,
      96,    -1,    -1,    -1,    -1,   101,   102,    -1,    -1,    -1,
      -1,    -1,    -1,    36,    -1,    -1,    -1,   113,    -1,    -1,
      -1,    -1,    -1,    46,    47,    48,    -1,    -1,    -1,   125,
      -1,    -1,    -1,    -1,    -1,   131,    59,    60,    61,    62,
      -1,    64,    65,    66,    -1,   141,    -1,    -1,    -1,    -1,
      73,    74,    75,    76,    -1,   142,    -1,    -1,    -1,    -1,
      -1,    84,    85,    86,    87,    88,    89,    -1,    -1,    -1,
      -1,    94,    95,    96,    -1,    -1,    -1,    -1,   101,   102,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     113,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,   125,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    15,   141,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    15,    -1,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    15,    -1,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    15,    -1,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    15,    -1,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    15,    -1,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    -1,    -1,    -1,
      -1,    -1,   140,    15,   142,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    15,   142,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    15,   142,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    15,   142,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    15,   142,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    15,   142,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    -1,    -1,    -1,    -1,    -1,    -1,    15,
     142,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    15,
     142,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    15,
     142,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    15,
     142,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    15,
     142,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    15,
     142,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    -1,
      -1,    -1,    -1,    -1,    -1,    15,   142,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    15,   142,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    15,   142,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    15,   142,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    15,   142,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    15,   142,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    -1,    -1,    -1,    -1,    15,
     140,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    15,
     140,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    -1,
     140,   654,   655,    -1,    -1,     4,    -1,   660,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     140,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   686,   687,    -1,    -1,    -1,    -1,    38,
     140,    -1,    -1,   696,   697,    -1,   699,    -1,   701,   702,
      -1,    -1,    -1,    -1,    -1,    -1,   709,    -1,    -1,    -1,
     140,    -1,    -1,    -1,    -1,    64,    -1,    -1,   721,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   734,    -1,    -1,   140,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    -1,    98,
      -1,    -1,    -1,    -1,   140,   104,   105,   106,   107,   108,
     109,   110,   111,   112,    -1,   114,   115,    -1,   117,   118,
     119,    -1,    -1,    -1,    -1,   124,   125,   126,    15,    -1,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    -1,    -1,
      37,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    15,    -1,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,   121,   122,   123,   132,   139,   148,   164,   165,   152,
     153,   150,   151,   261,   262,   256,   257,     0,   166,   154,
       4,    56,   127,   265,   266,    56,   258,   259,     4,    46,
      47,    48,    59,    60,    61,    62,    64,    65,    66,    73,
      74,    75,    76,    84,    85,    86,    87,    88,    89,    94,
      95,    96,   101,   102,   113,   125,   141,   167,   174,   176,
     195,   197,   208,   209,   211,   213,   248,   263,   264,     4,
      38,    64,    98,   104,   105,   106,   107,   108,   110,   111,
     112,   114,   115,   117,   118,   119,   124,   125,   126,   155,
       6,     4,   125,   128,   129,   130,   268,   269,    56,   266,
     129,   130,   260,   269,   259,     6,     7,     8,     9,    10,
      11,    12,    13,    14,   193,    56,    56,    49,    50,    37,
      37,     4,   149,    56,    37,    37,    37,    37,    37,    37,
      37,    37,    37,    37,   168,    37,    37,    37,   177,    37,
     140,   141,   194,   131,     4,   149,     4,     3,     4,    30,
      31,    37,    38,    39,    51,    52,    53,    58,    63,    72,
      77,    78,    79,    80,    81,    82,    83,    90,    92,   107,
     113,   138,   145,   146,   217,     4,     4,   159,     4,   158,
     157,     4,     4,     4,   217,     4,     3,     4,   160,   161,
     162,     4,   109,   217,     4,    16,    16,    57,   141,   268,
      57,   141,   215,   216,   215,   175,   249,     4,     4,     4,
       4,   169,     4,    64,   198,   199,   200,     4,     4,   149,
     149,     4,   149,   142,   149,   210,   212,     4,   214,     4,
       5,   103,   170,    37,   149,     4,     4,    37,   161,    56,
       6,   140,   156,     6,   140,   217,   217,   217,    37,    37,
      37,    37,    37,    37,    37,    37,    37,    37,    37,    37,
      37,    37,    37,    37,    37,    37,    37,   217,   217,    15,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,   140,     6,
     140,   217,   140,   140,     4,   140,     6,   140,   217,   140,
     140,     4,   163,    56,   269,   269,   141,     4,   125,   128,
     129,   130,    57,   141,   217,     4,    57,    64,    71,    95,
     176,   223,     4,    57,   250,   140,   142,   142,   166,   201,
     149,    57,   140,   196,   140,   142,   142,   142,   142,   142,
     142,   196,   142,   196,   140,   214,   142,    37,     4,     5,
     103,   140,   142,   170,   142,     6,     6,   217,   142,   265,
     217,   217,   154,   217,   217,   142,   217,   217,   217,   217,
     217,     4,     4,   217,     4,     4,     4,     4,   217,   217,
       4,     4,   217,   217,     4,   217,   217,   217,   217,   217,
     217,   217,   217,   217,   217,   217,   217,   217,   217,   217,
     217,   217,   217,   217,   217,   217,   217,     4,     4,     4,
     217,   217,     3,     4,     4,     4,   140,   271,   141,   141,
       4,   127,   141,   267,   224,   149,   229,   234,   251,     4,
      36,    37,   205,   202,   200,     4,   149,   149,   214,   171,
      37,     4,     5,   103,   142,   215,   215,   140,    57,    36,
     140,   142,   142,   140,   140,   142,   140,   142,   142,   142,
     142,   142,   142,   140,   140,   142,   142,   142,   140,   142,
      16,     4,   269,   130,    56,   127,   141,    37,    40,   217,
     238,   239,   236,    16,   217,   240,   239,   217,   253,   140,
       4,   145,   206,   207,    16,   198,   142,   170,   173,    37,
     142,   142,     4,   217,   217,   217,   217,   217,   217,     4,
     217,   141,   272,    16,   270,    67,    68,    69,    70,    71,
     142,   237,    37,    37,   238,    16,    99,   219,   175,    16,
      89,   241,   235,     4,    99,   254,     4,     4,   142,   207,
      90,   203,    36,   142,   170,   172,   142,   142,   142,   142,
     142,   142,   142,   142,    57,   269,   269,   142,   217,    16,
      37,    38,   220,    36,   219,    56,    37,   255,    37,   252,
     142,     6,   196,   142,   170,   141,   272,   142,   217,    37,
     100,   221,   221,   175,   217,   254,   217,   141,   215,    92,
     204,   142,    57,    39,   238,   142,   217,    37,   225,   230,
      57,   142,   142,     6,    37,    16,   142,   217,   134,   135,
     136,   222,    56,   254,   215,   217,   142,    56,   231,   142,
     226,   244,   238,     4,    15,    32,    41,    42,    43,    44,
      45,    54,    55,    64,    91,    93,    97,   113,   133,   137,
     141,   143,   178,   179,   182,   183,   185,   188,   189,   190,
     195,     4,    57,    16,    37,    37,   149,    37,   186,    37,
      37,     4,    54,   179,   181,    37,   185,    57,    37,   194,
     245,   232,    54,    55,    97,   137,   178,    54,    55,   178,
     187,   191,   215,    37,   184,   178,   180,    37,   144,   196,
     181,   227,   215,    56,    25,   242,    37,    37,   142,    37,
     142,    37,    37,   142,   189,   142,   217,     4,   182,   142,
     178,   179,   142,   242,   142,   189,     4,    99,   218,   178,
     178,   180,   178,   178,    36,   140,   142,   178,   218,    57,
      25,   243,   142,   142,   142,   142,   142,     4,   243,   246,
       4,     6,    16,   192,   142,   142,   178,   142,   142,   142,
     192,   243,   191,     4,   233,   142,   194,   228,   192,   196,
     196,   247,   196
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
#line 174 "ldgram.y"
    { ldlex_defsym(); }
    break;

  case 9:
#line 176 "ldgram.y"
    {
		  ldlex_popstate();
		  lang_add_assignment(exp_assop((yyvsp[(3) - (4)].token),(yyvsp[(2) - (4)].name),(yyvsp[(4) - (4)].etree)));
		}
    break;

  case 10:
#line 184 "ldgram.y"
    {
		  ldlex_mri_script ();
		  PUSH_ERROR (_("MRI style script"));
		}
    break;

  case 11:
#line 189 "ldgram.y"
    {
		  ldlex_popstate ();
		  mri_draw_tree ();
		  POP_ERROR ();
		}
    break;

  case 16:
#line 204 "ldgram.y"
    {
			einfo(_("%P%F: unrecognised keyword in MRI style script '%s'\n"),(yyvsp[(1) - (1)].name));
			}
    break;

  case 17:
#line 207 "ldgram.y"
    {
			config.map_filename = "-";
			}
    break;

  case 20:
#line 213 "ldgram.y"
    { mri_public((yyvsp[(2) - (4)].name), (yyvsp[(4) - (4)].etree)); }
    break;

  case 21:
#line 215 "ldgram.y"
    { mri_public((yyvsp[(2) - (4)].name), (yyvsp[(4) - (4)].etree)); }
    break;

  case 22:
#line 217 "ldgram.y"
    { mri_public((yyvsp[(2) - (3)].name), (yyvsp[(3) - (3)].etree)); }
    break;

  case 23:
#line 219 "ldgram.y"
    { mri_format((yyvsp[(2) - (2)].name)); }
    break;

  case 24:
#line 221 "ldgram.y"
    { mri_output_section((yyvsp[(2) - (4)].name), (yyvsp[(4) - (4)].etree));}
    break;

  case 25:
#line 223 "ldgram.y"
    { mri_output_section((yyvsp[(2) - (3)].name), (yyvsp[(3) - (3)].etree));}
    break;

  case 26:
#line 225 "ldgram.y"
    { mri_output_section((yyvsp[(2) - (4)].name), (yyvsp[(4) - (4)].etree));}
    break;

  case 27:
#line 227 "ldgram.y"
    { mri_align((yyvsp[(2) - (4)].name),(yyvsp[(4) - (4)].etree)); }
    break;

  case 28:
#line 229 "ldgram.y"
    { mri_align((yyvsp[(2) - (4)].name),(yyvsp[(4) - (4)].etree)); }
    break;

  case 29:
#line 231 "ldgram.y"
    { mri_alignmod((yyvsp[(2) - (4)].name),(yyvsp[(4) - (4)].etree)); }
    break;

  case 30:
#line 233 "ldgram.y"
    { mri_alignmod((yyvsp[(2) - (4)].name),(yyvsp[(4) - (4)].etree)); }
    break;

  case 33:
#line 237 "ldgram.y"
    { mri_name((yyvsp[(2) - (2)].name)); }
    break;

  case 34:
#line 239 "ldgram.y"
    { mri_alias((yyvsp[(2) - (4)].name),(yyvsp[(4) - (4)].name),0);}
    break;

  case 35:
#line 241 "ldgram.y"
    { mri_alias ((yyvsp[(2) - (4)].name), 0, (int) (yyvsp[(4) - (4)].bigint).integer); }
    break;

  case 36:
#line 243 "ldgram.y"
    { mri_base((yyvsp[(2) - (2)].etree)); }
    break;

  case 37:
#line 245 "ldgram.y"
    { mri_truncate ((unsigned int) (yyvsp[(2) - (2)].bigint).integer); }
    break;

  case 40:
#line 249 "ldgram.y"
    { ldlex_script (); ldfile_open_command_file((yyvsp[(2) - (2)].name)); }
    break;

  case 41:
#line 251 "ldgram.y"
    { ldlex_popstate (); }
    break;

  case 42:
#line 253 "ldgram.y"
    { lang_add_entry ((yyvsp[(2) - (2)].name), FALSE); }
    break;

  case 44:
#line 258 "ldgram.y"
    { mri_order((yyvsp[(3) - (3)].name)); }
    break;

  case 45:
#line 259 "ldgram.y"
    { mri_order((yyvsp[(2) - (2)].name)); }
    break;

  case 47:
#line 265 "ldgram.y"
    { mri_load((yyvsp[(1) - (1)].name)); }
    break;

  case 48:
#line 266 "ldgram.y"
    { mri_load((yyvsp[(3) - (3)].name)); }
    break;

  case 49:
#line 271 "ldgram.y"
    { mri_only_load((yyvsp[(1) - (1)].name)); }
    break;

  case 50:
#line 273 "ldgram.y"
    { mri_only_load((yyvsp[(3) - (3)].name)); }
    break;

  case 51:
#line 277 "ldgram.y"
    { (yyval.name) = NULL; }
    break;

  case 54:
#line 284 "ldgram.y"
    { ldlex_expression (); }
    break;

  case 55:
#line 286 "ldgram.y"
    { ldlex_popstate (); }
    break;

  case 56:
#line 290 "ldgram.y"
    { ldlang_add_undef ((yyvsp[(1) - (1)].name)); }
    break;

  case 57:
#line 292 "ldgram.y"
    { ldlang_add_undef ((yyvsp[(2) - (2)].name)); }
    break;

  case 58:
#line 294 "ldgram.y"
    { ldlang_add_undef ((yyvsp[(3) - (3)].name)); }
    break;

  case 59:
#line 298 "ldgram.y"
    { ldlex_both(); }
    break;

  case 60:
#line 300 "ldgram.y"
    { ldlex_popstate(); }
    break;

  case 73:
#line 321 "ldgram.y"
    { lang_add_target((yyvsp[(3) - (4)].name)); }
    break;

  case 74:
#line 323 "ldgram.y"
    { ldfile_add_library_path ((yyvsp[(3) - (4)].name), FALSE); }
    break;

  case 75:
#line 325 "ldgram.y"
    { lang_add_output((yyvsp[(3) - (4)].name), 1); }
    break;

  case 76:
#line 327 "ldgram.y"
    { lang_add_output_format ((yyvsp[(3) - (4)].name), (char *) NULL,
					    (char *) NULL, 1); }
    break;

  case 77:
#line 330 "ldgram.y"
    { lang_add_output_format ((yyvsp[(3) - (8)].name), (yyvsp[(5) - (8)].name), (yyvsp[(7) - (8)].name), 1); }
    break;

  case 78:
#line 332 "ldgram.y"
    { ldfile_set_output_arch ((yyvsp[(3) - (4)].name), bfd_arch_unknown); }
    break;

  case 79:
#line 334 "ldgram.y"
    { command_line.force_common_definition = TRUE ; }
    break;

  case 80:
#line 336 "ldgram.y"
    { command_line.inhibit_common_definition = TRUE ; }
    break;

  case 82:
#line 339 "ldgram.y"
    { lang_enter_group (); }
    break;

  case 83:
#line 341 "ldgram.y"
    { lang_leave_group (); }
    break;

  case 84:
#line 343 "ldgram.y"
    { lang_add_map((yyvsp[(3) - (4)].name)); }
    break;

  case 85:
#line 345 "ldgram.y"
    { ldlex_script (); ldfile_open_command_file((yyvsp[(2) - (2)].name)); }
    break;

  case 86:
#line 347 "ldgram.y"
    { ldlex_popstate (); }
    break;

  case 87:
#line 349 "ldgram.y"
    {
		  lang_add_nocrossref ((yyvsp[(3) - (4)].nocrossref));
		}
    break;

  case 89:
#line 354 "ldgram.y"
    { lang_add_insert ((yyvsp[(3) - (3)].name), 0); }
    break;

  case 90:
#line 356 "ldgram.y"
    { lang_add_insert ((yyvsp[(3) - (3)].name), 1); }
    break;

  case 91:
#line 358 "ldgram.y"
    { lang_memory_region_alias ((yyvsp[(3) - (6)].name), (yyvsp[(5) - (6)].name)); }
    break;

  case 92:
#line 363 "ldgram.y"
    { lang_add_input_file((yyvsp[(1) - (1)].name),lang_input_file_is_search_file_enum,
				 (char *)NULL); }
    break;

  case 93:
#line 366 "ldgram.y"
    { lang_add_input_file((yyvsp[(3) - (3)].name),lang_input_file_is_search_file_enum,
				 (char *)NULL); }
    break;

  case 94:
#line 369 "ldgram.y"
    { lang_add_input_file((yyvsp[(2) - (2)].name),lang_input_file_is_search_file_enum,
				 (char *)NULL); }
    break;

  case 95:
#line 372 "ldgram.y"
    { lang_add_input_file((yyvsp[(1) - (1)].name),lang_input_file_is_l_enum,
				 (char *)NULL); }
    break;

  case 96:
#line 375 "ldgram.y"
    { lang_add_input_file((yyvsp[(3) - (3)].name),lang_input_file_is_l_enum,
				 (char *)NULL); }
    break;

  case 97:
#line 378 "ldgram.y"
    { lang_add_input_file((yyvsp[(2) - (2)].name),lang_input_file_is_l_enum,
				 (char *)NULL); }
    break;

  case 98:
#line 381 "ldgram.y"
    { (yyval.integer) = as_needed; as_needed = TRUE; }
    break;

  case 99:
#line 383 "ldgram.y"
    { as_needed = (yyvsp[(3) - (5)].integer); }
    break;

  case 100:
#line 385 "ldgram.y"
    { (yyval.integer) = as_needed; as_needed = TRUE; }
    break;

  case 101:
#line 387 "ldgram.y"
    { as_needed = (yyvsp[(5) - (7)].integer); }
    break;

  case 102:
#line 389 "ldgram.y"
    { (yyval.integer) = as_needed; as_needed = TRUE; }
    break;

  case 103:
#line 391 "ldgram.y"
    { as_needed = (yyvsp[(4) - (6)].integer); }
    break;

  case 108:
#line 406 "ldgram.y"
    { lang_add_entry ((yyvsp[(3) - (4)].name), FALSE); }
    break;

  case 110:
#line 408 "ldgram.y"
    {ldlex_expression ();}
    break;

  case 111:
#line 409 "ldgram.y"
    { ldlex_popstate ();
		  lang_add_assignment (exp_assert ((yyvsp[(4) - (7)].etree), (yyvsp[(6) - (7)].name))); }
    break;

  case 112:
#line 417 "ldgram.y"
    {
			  (yyval.cname) = (yyvsp[(1) - (1)].name);
			}
    break;

  case 113:
#line 421 "ldgram.y"
    {
			  (yyval.cname) = "*";
			}
    break;

  case 114:
#line 425 "ldgram.y"
    {
			  (yyval.cname) = "?";
			}
    break;

  case 115:
#line 432 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(1) - (1)].cname);
			  (yyval.wildcard).sorted = none;
			  (yyval.wildcard).exclude_name_list = NULL;
			}
    break;

  case 116:
#line 438 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(5) - (5)].cname);
			  (yyval.wildcard).sorted = none;
			  (yyval.wildcard).exclude_name_list = (yyvsp[(3) - (5)].name_list);
			}
    break;

  case 117:
#line 444 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(3) - (4)].cname);
			  (yyval.wildcard).sorted = by_name;
			  (yyval.wildcard).exclude_name_list = NULL;
			}
    break;

  case 118:
#line 450 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(3) - (4)].cname);
			  (yyval.wildcard).sorted = by_alignment;
			  (yyval.wildcard).exclude_name_list = NULL;
			}
    break;

  case 119:
#line 456 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(5) - (7)].cname);
			  (yyval.wildcard).sorted = by_name_alignment;
			  (yyval.wildcard).exclude_name_list = NULL;
			}
    break;

  case 120:
#line 462 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(5) - (7)].cname);
			  (yyval.wildcard).sorted = by_name;
			  (yyval.wildcard).exclude_name_list = NULL;
			}
    break;

  case 121:
#line 468 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(5) - (7)].cname);
			  (yyval.wildcard).sorted = by_alignment_name;
			  (yyval.wildcard).exclude_name_list = NULL;
			}
    break;

  case 122:
#line 474 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(5) - (7)].cname);
			  (yyval.wildcard).sorted = by_alignment;
			  (yyval.wildcard).exclude_name_list = NULL;
			}
    break;

  case 123:
#line 480 "ldgram.y"
    {
			  (yyval.wildcard).name = (yyvsp[(7) - (8)].cname);
			  (yyval.wildcard).sorted = by_name;
			  (yyval.wildcard).exclude_name_list = (yyvsp[(5) - (8)].name_list);
			}
    break;

  case 124:
#line 489 "ldgram.y"
    {
			  struct name_list *tmp;
			  tmp = (struct name_list *) xmalloc (sizeof *tmp);
			  tmp->name = (yyvsp[(2) - (2)].cname);
			  tmp->next = (yyvsp[(1) - (2)].name_list);
			  (yyval.name_list) = tmp;
			}
    break;

  case 125:
#line 498 "ldgram.y"
    {
			  struct name_list *tmp;
			  tmp = (struct name_list *) xmalloc (sizeof *tmp);
			  tmp->name = (yyvsp[(1) - (1)].cname);
			  tmp->next = NULL;
			  (yyval.name_list) = tmp;
			}
    break;

  case 126:
#line 509 "ldgram.y"
    {
			  struct wildcard_list *tmp;
			  tmp = (struct wildcard_list *) xmalloc (sizeof *tmp);
			  tmp->next = (yyvsp[(1) - (3)].wildcard_list);
			  tmp->spec = (yyvsp[(3) - (3)].wildcard);
			  (yyval.wildcard_list) = tmp;
			}
    break;

  case 127:
#line 518 "ldgram.y"
    {
			  struct wildcard_list *tmp;
			  tmp = (struct wildcard_list *) xmalloc (sizeof *tmp);
			  tmp->next = NULL;
			  tmp->spec = (yyvsp[(1) - (1)].wildcard);
			  (yyval.wildcard_list) = tmp;
			}
    break;

  case 128:
#line 529 "ldgram.y"
    {
			  struct wildcard_spec tmp;
			  tmp.name = (yyvsp[(1) - (1)].name);
			  tmp.exclude_name_list = NULL;
			  tmp.sorted = none;
			  lang_add_wild (&tmp, NULL, ldgram_had_keep);
			}
    break;

  case 129:
#line 537 "ldgram.y"
    {
			  lang_add_wild (NULL, (yyvsp[(2) - (3)].wildcard_list), ldgram_had_keep);
			}
    break;

  case 130:
#line 541 "ldgram.y"
    {
			  lang_add_wild (&(yyvsp[(1) - (4)].wildcard), (yyvsp[(3) - (4)].wildcard_list), ldgram_had_keep);
			}
    break;

  case 132:
#line 549 "ldgram.y"
    { ldgram_had_keep = TRUE; }
    break;

  case 133:
#line 551 "ldgram.y"
    { ldgram_had_keep = FALSE; }
    break;

  case 135:
#line 557 "ldgram.y"
    {
 		lang_add_attribute(lang_object_symbols_statement_enum);
	      	}
    break;

  case 137:
#line 562 "ldgram.y"
    {

		  lang_add_attribute(lang_constructors_statement_enum);
		}
    break;

  case 138:
#line 567 "ldgram.y"
    {
		  constructors_sorted = TRUE;
		  lang_add_attribute (lang_constructors_statement_enum);
		}
    break;

  case 140:
#line 573 "ldgram.y"
    {
			  lang_add_data ((int) (yyvsp[(1) - (4)].integer), (yyvsp[(3) - (4)].etree));
			}
    break;

  case 141:
#line 578 "ldgram.y"
    {
			  lang_add_fill ((yyvsp[(3) - (4)].fill));
			}
    break;

  case 142:
#line 581 "ldgram.y"
    {ldlex_expression ();}
    break;

  case 143:
#line 582 "ldgram.y"
    { ldlex_popstate ();
			  lang_add_assignment (exp_assert ((yyvsp[(4) - (8)].etree), (yyvsp[(6) - (8)].name))); }
    break;

  case 144:
#line 585 "ldgram.y"
    { ldlex_script (); ldfile_open_command_file((yyvsp[(2) - (2)].name)); }
    break;

  case 145:
#line 587 "ldgram.y"
    { ldlex_popstate (); }
    break;

  case 150:
#line 602 "ldgram.y"
    { (yyval.integer) = (yyvsp[(1) - (1)].token); }
    break;

  case 151:
#line 604 "ldgram.y"
    { (yyval.integer) = (yyvsp[(1) - (1)].token); }
    break;

  case 152:
#line 606 "ldgram.y"
    { (yyval.integer) = (yyvsp[(1) - (1)].token); }
    break;

  case 153:
#line 608 "ldgram.y"
    { (yyval.integer) = (yyvsp[(1) - (1)].token); }
    break;

  case 154:
#line 610 "ldgram.y"
    { (yyval.integer) = (yyvsp[(1) - (1)].token); }
    break;

  case 155:
#line 615 "ldgram.y"
    {
		  (yyval.fill) = exp_get_fill ((yyvsp[(1) - (1)].etree), 0, "fill value");
		}
    break;

  case 156:
#line 622 "ldgram.y"
    { (yyval.fill) = (yyvsp[(2) - (2)].fill); }
    break;

  case 157:
#line 623 "ldgram.y"
    { (yyval.fill) = (fill_type *) 0; }
    break;

  case 158:
#line 628 "ldgram.y"
    { (yyval.token) = '+'; }
    break;

  case 159:
#line 630 "ldgram.y"
    { (yyval.token) = '-'; }
    break;

  case 160:
#line 632 "ldgram.y"
    { (yyval.token) = '*'; }
    break;

  case 161:
#line 634 "ldgram.y"
    { (yyval.token) = '/'; }
    break;

  case 162:
#line 636 "ldgram.y"
    { (yyval.token) = LSHIFT; }
    break;

  case 163:
#line 638 "ldgram.y"
    { (yyval.token) = RSHIFT; }
    break;

  case 164:
#line 640 "ldgram.y"
    { (yyval.token) = '&'; }
    break;

  case 165:
#line 642 "ldgram.y"
    { (yyval.token) = '|'; }
    break;

  case 168:
#line 652 "ldgram.y"
    {
		  lang_add_assignment (exp_assop ((yyvsp[(2) - (3)].token), (yyvsp[(1) - (3)].name), (yyvsp[(3) - (3)].etree)));
		}
    break;

  case 169:
#line 656 "ldgram.y"
    {
		  lang_add_assignment (exp_assop ('=', (yyvsp[(1) - (3)].name),
						  exp_binop ((yyvsp[(2) - (3)].token),
							     exp_nameop (NAME,
									 (yyvsp[(1) - (3)].name)),
							     (yyvsp[(3) - (3)].etree))));
		}
    break;

  case 170:
#line 664 "ldgram.y"
    {
		  lang_add_assignment (exp_provide ((yyvsp[(3) - (6)].name), (yyvsp[(5) - (6)].etree), FALSE));
		}
    break;

  case 171:
#line 668 "ldgram.y"
    {
		  lang_add_assignment (exp_provide ((yyvsp[(3) - (6)].name), (yyvsp[(5) - (6)].etree), TRUE));
		}
    break;

  case 179:
#line 691 "ldgram.y"
    { region = lang_memory_region_lookup ((yyvsp[(1) - (1)].name), TRUE); }
    break;

  case 180:
#line 694 "ldgram.y"
    {}
    break;

  case 181:
#line 696 "ldgram.y"
    { ldlex_script (); ldfile_open_command_file((yyvsp[(2) - (2)].name)); }
    break;

  case 182:
#line 698 "ldgram.y"
    { ldlex_popstate (); }
    break;

  case 183:
#line 703 "ldgram.y"
    {
		  region->origin = exp_get_vma ((yyvsp[(3) - (3)].etree), 0, "origin");
		  region->current = region->origin;
		}
    break;

  case 184:
#line 711 "ldgram.y"
    {
		  region->length = exp_get_vma ((yyvsp[(3) - (3)].etree), -1, "length");
		}
    break;

  case 185:
#line 718 "ldgram.y"
    { /* dummy action to avoid bison 1.25 error message */ }
    break;

  case 189:
#line 729 "ldgram.y"
    { lang_set_flags (region, (yyvsp[(1) - (1)].name), 0); }
    break;

  case 190:
#line 731 "ldgram.y"
    { lang_set_flags (region, (yyvsp[(2) - (2)].name), 1); }
    break;

  case 191:
#line 736 "ldgram.y"
    { lang_startup((yyvsp[(3) - (4)].name)); }
    break;

  case 193:
#line 742 "ldgram.y"
    { ldemul_hll((char *)NULL); }
    break;

  case 194:
#line 747 "ldgram.y"
    { ldemul_hll((yyvsp[(3) - (3)].name)); }
    break;

  case 195:
#line 749 "ldgram.y"
    { ldemul_hll((yyvsp[(1) - (1)].name)); }
    break;

  case 197:
#line 757 "ldgram.y"
    { ldemul_syslib((yyvsp[(3) - (3)].name)); }
    break;

  case 199:
#line 763 "ldgram.y"
    { lang_float(TRUE); }
    break;

  case 200:
#line 765 "ldgram.y"
    { lang_float(FALSE); }
    break;

  case 201:
#line 770 "ldgram.y"
    {
		  (yyval.nocrossref) = NULL;
		}
    break;

  case 202:
#line 774 "ldgram.y"
    {
		  struct lang_nocrossref *n;

		  n = (struct lang_nocrossref *) xmalloc (sizeof *n);
		  n->name = (yyvsp[(1) - (2)].name);
		  n->next = (yyvsp[(2) - (2)].nocrossref);
		  (yyval.nocrossref) = n;
		}
    break;

  case 203:
#line 783 "ldgram.y"
    {
		  struct lang_nocrossref *n;

		  n = (struct lang_nocrossref *) xmalloc (sizeof *n);
		  n->name = (yyvsp[(1) - (3)].name);
		  n->next = (yyvsp[(3) - (3)].nocrossref);
		  (yyval.nocrossref) = n;
		}
    break;

  case 204:
#line 793 "ldgram.y"
    { ldlex_expression (); }
    break;

  case 205:
#line 795 "ldgram.y"
    { ldlex_popstate (); (yyval.etree)=(yyvsp[(2) - (2)].etree);}
    break;

  case 206:
#line 800 "ldgram.y"
    { (yyval.etree) = exp_unop ('-', (yyvsp[(2) - (2)].etree)); }
    break;

  case 207:
#line 802 "ldgram.y"
    { (yyval.etree) = (yyvsp[(2) - (3)].etree); }
    break;

  case 208:
#line 804 "ldgram.y"
    { (yyval.etree) = exp_unop ((int) (yyvsp[(1) - (4)].integer),(yyvsp[(3) - (4)].etree)); }
    break;

  case 209:
#line 806 "ldgram.y"
    { (yyval.etree) = exp_unop ('!', (yyvsp[(2) - (2)].etree)); }
    break;

  case 210:
#line 808 "ldgram.y"
    { (yyval.etree) = (yyvsp[(2) - (2)].etree); }
    break;

  case 211:
#line 810 "ldgram.y"
    { (yyval.etree) = exp_unop ('~', (yyvsp[(2) - (2)].etree));}
    break;

  case 212:
#line 813 "ldgram.y"
    { (yyval.etree) = exp_binop ('*', (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 213:
#line 815 "ldgram.y"
    { (yyval.etree) = exp_binop ('/', (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 214:
#line 817 "ldgram.y"
    { (yyval.etree) = exp_binop ('%', (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 215:
#line 819 "ldgram.y"
    { (yyval.etree) = exp_binop ('+', (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 216:
#line 821 "ldgram.y"
    { (yyval.etree) = exp_binop ('-' , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 217:
#line 823 "ldgram.y"
    { (yyval.etree) = exp_binop (LSHIFT , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 218:
#line 825 "ldgram.y"
    { (yyval.etree) = exp_binop (RSHIFT , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 219:
#line 827 "ldgram.y"
    { (yyval.etree) = exp_binop (EQ , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 220:
#line 829 "ldgram.y"
    { (yyval.etree) = exp_binop (NE , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 221:
#line 831 "ldgram.y"
    { (yyval.etree) = exp_binop (LE , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 222:
#line 833 "ldgram.y"
    { (yyval.etree) = exp_binop (GE , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 223:
#line 835 "ldgram.y"
    { (yyval.etree) = exp_binop ('<' , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 224:
#line 837 "ldgram.y"
    { (yyval.etree) = exp_binop ('>' , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 225:
#line 839 "ldgram.y"
    { (yyval.etree) = exp_binop ('&' , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 226:
#line 841 "ldgram.y"
    { (yyval.etree) = exp_binop ('^' , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 227:
#line 843 "ldgram.y"
    { (yyval.etree) = exp_binop ('|' , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 228:
#line 845 "ldgram.y"
    { (yyval.etree) = exp_trinop ('?' , (yyvsp[(1) - (5)].etree), (yyvsp[(3) - (5)].etree), (yyvsp[(5) - (5)].etree)); }
    break;

  case 229:
#line 847 "ldgram.y"
    { (yyval.etree) = exp_binop (ANDAND , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 230:
#line 849 "ldgram.y"
    { (yyval.etree) = exp_binop (OROR , (yyvsp[(1) - (3)].etree), (yyvsp[(3) - (3)].etree)); }
    break;

  case 231:
#line 851 "ldgram.y"
    { (yyval.etree) = exp_nameop (DEFINED, (yyvsp[(3) - (4)].name)); }
    break;

  case 232:
#line 853 "ldgram.y"
    { (yyval.etree) = exp_bigintop ((yyvsp[(1) - (1)].bigint).integer, (yyvsp[(1) - (1)].bigint).str); }
    break;

  case 233:
#line 855 "ldgram.y"
    { (yyval.etree) = exp_nameop (SIZEOF_HEADERS,0); }
    break;

  case 234:
#line 858 "ldgram.y"
    { (yyval.etree) = exp_nameop (ALIGNOF,(yyvsp[(3) - (4)].name)); }
    break;

  case 235:
#line 860 "ldgram.y"
    { (yyval.etree) = exp_nameop (SIZEOF,(yyvsp[(3) - (4)].name)); }
    break;

  case 236:
#line 862 "ldgram.y"
    { (yyval.etree) = exp_nameop (ADDR,(yyvsp[(3) - (4)].name)); }
    break;

  case 237:
#line 864 "ldgram.y"
    { (yyval.etree) = exp_nameop (LOADADDR,(yyvsp[(3) - (4)].name)); }
    break;

  case 238:
#line 866 "ldgram.y"
    { (yyval.etree) = exp_nameop (CONSTANT,(yyvsp[(3) - (4)].name)); }
    break;

  case 239:
#line 868 "ldgram.y"
    { (yyval.etree) = exp_unop (ABSOLUTE, (yyvsp[(3) - (4)].etree)); }
    break;

  case 240:
#line 870 "ldgram.y"
    { (yyval.etree) = exp_unop (ALIGN_K,(yyvsp[(3) - (4)].etree)); }
    break;

  case 241:
#line 872 "ldgram.y"
    { (yyval.etree) = exp_binop (ALIGN_K,(yyvsp[(3) - (6)].etree),(yyvsp[(5) - (6)].etree)); }
    break;

  case 242:
#line 874 "ldgram.y"
    { (yyval.etree) = exp_binop (DATA_SEGMENT_ALIGN, (yyvsp[(3) - (6)].etree), (yyvsp[(5) - (6)].etree)); }
    break;

  case 243:
#line 876 "ldgram.y"
    { (yyval.etree) = exp_binop (DATA_SEGMENT_RELRO_END, (yyvsp[(5) - (6)].etree), (yyvsp[(3) - (6)].etree)); }
    break;

  case 244:
#line 878 "ldgram.y"
    { (yyval.etree) = exp_unop (DATA_SEGMENT_END, (yyvsp[(3) - (4)].etree)); }
    break;

  case 245:
#line 880 "ldgram.y"
    { /* The operands to the expression node are
			     placed in the opposite order from the way
			     in which they appear in the script as
			     that allows us to reuse more code in
			     fold_binary.  */
			  (yyval.etree) = exp_binop (SEGMENT_START,
					  (yyvsp[(5) - (6)].etree),
					  exp_nameop (NAME, (yyvsp[(3) - (6)].name))); }
    break;

  case 246:
#line 889 "ldgram.y"
    { (yyval.etree) = exp_unop (ALIGN_K,(yyvsp[(3) - (4)].etree)); }
    break;

  case 247:
#line 891 "ldgram.y"
    { (yyval.etree) = exp_nameop (NAME,(yyvsp[(1) - (1)].name)); }
    break;

  case 248:
#line 893 "ldgram.y"
    { (yyval.etree) = exp_binop (MAX_K, (yyvsp[(3) - (6)].etree), (yyvsp[(5) - (6)].etree) ); }
    break;

  case 249:
#line 895 "ldgram.y"
    { (yyval.etree) = exp_binop (MIN_K, (yyvsp[(3) - (6)].etree), (yyvsp[(5) - (6)].etree) ); }
    break;

  case 250:
#line 897 "ldgram.y"
    { (yyval.etree) = exp_assert ((yyvsp[(3) - (6)].etree), (yyvsp[(5) - (6)].name)); }
    break;

  case 251:
#line 899 "ldgram.y"
    { (yyval.etree) = exp_nameop (ORIGIN, (yyvsp[(3) - (4)].name)); }
    break;

  case 252:
#line 901 "ldgram.y"
    { (yyval.etree) = exp_nameop (LENGTH, (yyvsp[(3) - (4)].name)); }
    break;

  case 253:
#line 906 "ldgram.y"
    { (yyval.name) = (yyvsp[(3) - (3)].name); }
    break;

  case 254:
#line 907 "ldgram.y"
    { (yyval.name) = 0; }
    break;

  case 255:
#line 911 "ldgram.y"
    { (yyval.etree) = (yyvsp[(3) - (4)].etree); }
    break;

  case 256:
#line 912 "ldgram.y"
    { (yyval.etree) = 0; }
    break;

  case 257:
#line 916 "ldgram.y"
    { (yyval.etree) = (yyvsp[(3) - (4)].etree); }
    break;

  case 258:
#line 917 "ldgram.y"
    { (yyval.etree) = 0; }
    break;

  case 259:
#line 921 "ldgram.y"
    { (yyval.etree) = (yyvsp[(3) - (4)].etree); }
    break;

  case 260:
#line 922 "ldgram.y"
    { (yyval.etree) = 0; }
    break;

  case 261:
#line 926 "ldgram.y"
    { (yyval.token) = ONLY_IF_RO; }
    break;

  case 262:
#line 927 "ldgram.y"
    { (yyval.token) = ONLY_IF_RW; }
    break;

  case 263:
#line 928 "ldgram.y"
    { (yyval.token) = SPECIAL; }
    break;

  case 264:
#line 929 "ldgram.y"
    { (yyval.token) = 0; }
    break;

  case 265:
#line 932 "ldgram.y"
    { ldlex_expression(); }
    break;

  case 266:
#line 936 "ldgram.y"
    { ldlex_popstate (); ldlex_script (); }
    break;

  case 267:
#line 939 "ldgram.y"
    {
			  lang_enter_output_section_statement((yyvsp[(1) - (9)].name), (yyvsp[(3) - (9)].etree),
							      sectype,
							      (yyvsp[(5) - (9)].etree), (yyvsp[(6) - (9)].etree), (yyvsp[(4) - (9)].etree), (yyvsp[(8) - (9)].token));
			}
    break;

  case 268:
#line 945 "ldgram.y"
    { ldlex_popstate (); ldlex_expression (); }
    break;

  case 269:
#line 947 "ldgram.y"
    {
		  ldlex_popstate ();
		  lang_leave_output_section_statement ((yyvsp[(17) - (17)].fill), (yyvsp[(14) - (17)].name), (yyvsp[(16) - (17)].section_phdr), (yyvsp[(15) - (17)].name));
		}
    break;

  case 270:
#line 952 "ldgram.y"
    {}
    break;

  case 271:
#line 954 "ldgram.y"
    { ldlex_expression (); }
    break;

  case 272:
#line 956 "ldgram.y"
    { ldlex_popstate (); ldlex_script (); }
    break;

  case 273:
#line 958 "ldgram.y"
    {
			  lang_enter_overlay ((yyvsp[(3) - (8)].etree), (yyvsp[(6) - (8)].etree));
			}
    break;

  case 274:
#line 963 "ldgram.y"
    { ldlex_popstate (); ldlex_expression (); }
    break;

  case 275:
#line 965 "ldgram.y"
    {
			  ldlex_popstate ();
			  lang_leave_overlay ((yyvsp[(5) - (16)].etree), (int) (yyvsp[(4) - (16)].integer),
					      (yyvsp[(16) - (16)].fill), (yyvsp[(13) - (16)].name), (yyvsp[(15) - (16)].section_phdr), (yyvsp[(14) - (16)].name));
			}
    break;

  case 277:
#line 975 "ldgram.y"
    { ldlex_expression (); }
    break;

  case 278:
#line 977 "ldgram.y"
    {
		  ldlex_popstate ();
		  lang_add_assignment (exp_assop ('=', ".", (yyvsp[(3) - (3)].etree)));
		}
    break;

  case 280:
#line 983 "ldgram.y"
    { ldlex_script (); ldfile_open_command_file((yyvsp[(2) - (2)].name)); }
    break;

  case 281:
#line 985 "ldgram.y"
    { ldlex_popstate (); }
    break;

  case 282:
#line 989 "ldgram.y"
    { sectype = noload_section; }
    break;

  case 283:
#line 990 "ldgram.y"
    { sectype = noalloc_section; }
    break;

  case 284:
#line 991 "ldgram.y"
    { sectype = noalloc_section; }
    break;

  case 285:
#line 992 "ldgram.y"
    { sectype = noalloc_section; }
    break;

  case 286:
#line 993 "ldgram.y"
    { sectype = noalloc_section; }
    break;

  case 288:
#line 998 "ldgram.y"
    { sectype = normal_section; }
    break;

  case 289:
#line 999 "ldgram.y"
    { sectype = normal_section; }
    break;

  case 290:
#line 1003 "ldgram.y"
    { (yyval.etree) = (yyvsp[(1) - (3)].etree); }
    break;

  case 291:
#line 1004 "ldgram.y"
    { (yyval.etree) = (etree_type *)NULL;  }
    break;

  case 292:
#line 1009 "ldgram.y"
    { (yyval.etree) = (yyvsp[(3) - (6)].etree); }
    break;

  case 293:
#line 1011 "ldgram.y"
    { (yyval.etree) = (yyvsp[(3) - (10)].etree); }
    break;

  case 294:
#line 1015 "ldgram.y"
    { (yyval.etree) = (yyvsp[(1) - (2)].etree); }
    break;

  case 295:
#line 1016 "ldgram.y"
    { (yyval.etree) = (etree_type *) NULL;  }
    break;

  case 296:
#line 1021 "ldgram.y"
    { (yyval.integer) = 0; }
    break;

  case 297:
#line 1023 "ldgram.y"
    { (yyval.integer) = 1; }
    break;

  case 298:
#line 1028 "ldgram.y"
    { (yyval.name) = (yyvsp[(2) - (2)].name); }
    break;

  case 299:
#line 1029 "ldgram.y"
    { (yyval.name) = DEFAULT_MEMORY_REGION; }
    break;

  case 300:
#line 1034 "ldgram.y"
    {
		  (yyval.section_phdr) = NULL;
		}
    break;

  case 301:
#line 1038 "ldgram.y"
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

  case 303:
#line 1054 "ldgram.y"
    {
			  ldlex_script ();
			  lang_enter_overlay_section ((yyvsp[(2) - (2)].name));
			}
    break;

  case 304:
#line 1059 "ldgram.y"
    { ldlex_popstate (); ldlex_expression (); }
    break;

  case 305:
#line 1061 "ldgram.y"
    {
			  ldlex_popstate ();
			  lang_leave_overlay_section ((yyvsp[(9) - (9)].fill), (yyvsp[(8) - (9)].section_phdr));
			}
    break;

  case 310:
#line 1078 "ldgram.y"
    { ldlex_expression (); }
    break;

  case 311:
#line 1079 "ldgram.y"
    { ldlex_popstate (); }
    break;

  case 312:
#line 1081 "ldgram.y"
    {
		  lang_new_phdr ((yyvsp[(1) - (6)].name), (yyvsp[(3) - (6)].etree), (yyvsp[(4) - (6)].phdr).filehdr, (yyvsp[(4) - (6)].phdr).phdrs, (yyvsp[(4) - (6)].phdr).at,
				 (yyvsp[(4) - (6)].phdr).flags);
		}
    break;

  case 313:
#line 1089 "ldgram.y"
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
				     s);
			      (yyval.etree) = exp_intop (0);
			    }
			}
		    }
		}
    break;

  case 314:
#line 1133 "ldgram.y"
    {
		  memset (&(yyval.phdr), 0, sizeof (struct phdr_info));
		}
    break;

  case 315:
#line 1137 "ldgram.y"
    {
		  (yyval.phdr) = (yyvsp[(3) - (3)].phdr);
		  if (strcmp ((yyvsp[(1) - (3)].name), "FILEHDR") == 0 && (yyvsp[(2) - (3)].etree) == NULL)
		    (yyval.phdr).filehdr = TRUE;
		  else if (strcmp ((yyvsp[(1) - (3)].name), "PHDRS") == 0 && (yyvsp[(2) - (3)].etree) == NULL)
		    (yyval.phdr).phdrs = TRUE;
		  else if (strcmp ((yyvsp[(1) - (3)].name), "FLAGS") == 0 && (yyvsp[(2) - (3)].etree) != NULL)
		    (yyval.phdr).flags = (yyvsp[(2) - (3)].etree);
		  else
		    einfo (_("%X%P:%S: PHDRS syntax error at `%s'\n"), (yyvsp[(1) - (3)].name));
		}
    break;

  case 316:
#line 1149 "ldgram.y"
    {
		  (yyval.phdr) = (yyvsp[(5) - (5)].phdr);
		  (yyval.phdr).at = (yyvsp[(3) - (5)].etree);
		}
    break;

  case 317:
#line 1157 "ldgram.y"
    {
		  (yyval.etree) = NULL;
		}
    break;

  case 318:
#line 1161 "ldgram.y"
    {
		  (yyval.etree) = (yyvsp[(2) - (3)].etree);
		}
    break;

  case 319:
#line 1167 "ldgram.y"
    {
		  ldlex_version_file ();
		  PUSH_ERROR (_("dynamic list"));
		}
    break;

  case 320:
#line 1172 "ldgram.y"
    {
		  ldlex_popstate ();
		  POP_ERROR ();
		}
    break;

  case 324:
#line 1189 "ldgram.y"
    {
		  lang_append_dynamic_list ((yyvsp[(1) - (2)].versyms));
		}
    break;

  case 325:
#line 1197 "ldgram.y"
    {
		  ldlex_version_file ();
		  PUSH_ERROR (_("VERSION script"));
		}
    break;

  case 326:
#line 1202 "ldgram.y"
    {
		  ldlex_popstate ();
		  POP_ERROR ();
		}
    break;

  case 327:
#line 1211 "ldgram.y"
    {
		  ldlex_version_script ();
		}
    break;

  case 328:
#line 1215 "ldgram.y"
    {
		  ldlex_popstate ();
		}
    break;

  case 331:
#line 1227 "ldgram.y"
    {
		  lang_register_vers_node (NULL, (yyvsp[(2) - (4)].versnode), NULL);
		}
    break;

  case 332:
#line 1231 "ldgram.y"
    {
		  lang_register_vers_node ((yyvsp[(1) - (5)].name), (yyvsp[(3) - (5)].versnode), NULL);
		}
    break;

  case 333:
#line 1235 "ldgram.y"
    {
		  lang_register_vers_node ((yyvsp[(1) - (6)].name), (yyvsp[(3) - (6)].versnode), (yyvsp[(5) - (6)].deflist));
		}
    break;

  case 334:
#line 1242 "ldgram.y"
    {
		  (yyval.deflist) = lang_add_vers_depend (NULL, (yyvsp[(1) - (1)].name));
		}
    break;

  case 335:
#line 1246 "ldgram.y"
    {
		  (yyval.deflist) = lang_add_vers_depend ((yyvsp[(1) - (2)].deflist), (yyvsp[(2) - (2)].name));
		}
    break;

  case 336:
#line 1253 "ldgram.y"
    {
		  (yyval.versnode) = lang_new_vers_node (NULL, NULL);
		}
    break;

  case 337:
#line 1257 "ldgram.y"
    {
		  (yyval.versnode) = lang_new_vers_node ((yyvsp[(1) - (2)].versyms), NULL);
		}
    break;

  case 338:
#line 1261 "ldgram.y"
    {
		  (yyval.versnode) = lang_new_vers_node ((yyvsp[(3) - (4)].versyms), NULL);
		}
    break;

  case 339:
#line 1265 "ldgram.y"
    {
		  (yyval.versnode) = lang_new_vers_node (NULL, (yyvsp[(3) - (4)].versyms));
		}
    break;

  case 340:
#line 1269 "ldgram.y"
    {
		  (yyval.versnode) = lang_new_vers_node ((yyvsp[(3) - (8)].versyms), (yyvsp[(7) - (8)].versyms));
		}
    break;

  case 341:
#line 1276 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, (yyvsp[(1) - (1)].name), ldgram_vers_current_lang, FALSE);
		}
    break;

  case 342:
#line 1280 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, (yyvsp[(1) - (1)].name), ldgram_vers_current_lang, TRUE);
		}
    break;

  case 343:
#line 1284 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[(1) - (3)].versyms), (yyvsp[(3) - (3)].name), ldgram_vers_current_lang, FALSE);
		}
    break;

  case 344:
#line 1288 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[(1) - (3)].versyms), (yyvsp[(3) - (3)].name), ldgram_vers_current_lang, TRUE);
		}
    break;

  case 345:
#line 1292 "ldgram.y"
    {
			  (yyval.name) = ldgram_vers_current_lang;
			  ldgram_vers_current_lang = (yyvsp[(4) - (5)].name);
			}
    break;

  case 346:
#line 1297 "ldgram.y"
    {
			  struct bfd_elf_version_expr *pat;
			  for (pat = (yyvsp[(7) - (9)].versyms); pat->next != NULL; pat = pat->next);
			  pat->next = (yyvsp[(1) - (9)].versyms);
			  (yyval.versyms) = (yyvsp[(7) - (9)].versyms);
			  ldgram_vers_current_lang = (yyvsp[(6) - (9)].name);
			}
    break;

  case 347:
#line 1305 "ldgram.y"
    {
			  (yyval.name) = ldgram_vers_current_lang;
			  ldgram_vers_current_lang = (yyvsp[(2) - (3)].name);
			}
    break;

  case 348:
#line 1310 "ldgram.y"
    {
			  (yyval.versyms) = (yyvsp[(5) - (7)].versyms);
			  ldgram_vers_current_lang = (yyvsp[(4) - (7)].name);
			}
    break;

  case 349:
#line 1315 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, "global", ldgram_vers_current_lang, FALSE);
		}
    break;

  case 350:
#line 1319 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[(1) - (3)].versyms), "global", ldgram_vers_current_lang, FALSE);
		}
    break;

  case 351:
#line 1323 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, "local", ldgram_vers_current_lang, FALSE);
		}
    break;

  case 352:
#line 1327 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[(1) - (3)].versyms), "local", ldgram_vers_current_lang, FALSE);
		}
    break;

  case 353:
#line 1331 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, "extern", ldgram_vers_current_lang, FALSE);
		}
    break;

  case 354:
#line 1335 "ldgram.y"
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[(1) - (3)].versyms), "extern", ldgram_vers_current_lang, FALSE);
		}
    break;


/* Line 1267 of yacc.c.  */
#line 4268 "ldgram.c"
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


#line 1345 "ldgram.y"

void
yyerror(arg)
     const char *arg;
{
  if (ldfile_assumed_script)
    einfo (_("%P:%s: file format not recognized; treating as linker script\n"),
	   ldfile_input_filename);
  if (error_index > 0 && error_index < ERROR_NAME_MAX)
     einfo ("%P%F:%S: %s in %s\n", arg, error_names[error_index-1]);
  else
     einfo ("%P%F:%S: %s\n", arg);
}


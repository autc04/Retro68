/* A Bison parser, made by GNU Bison 3.0.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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
#define YYBISON_VERSION "3.0"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 22 "ldgram.y" /* yacc.c:339  */

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

#line 105 "ldgram.c" /* yacc.c:339  */

# ifndef YY_NULL
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULL nullptr
#  else
#   define YY_NULL 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "y.tab.h".  */
#ifndef YY_YY_LDGRAM_H_INCLUDED
# define YY_YY_LDGRAM_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INT = 258,
    NAME = 259,
    LNAME = 260,
    PLUSEQ = 261,
    MINUSEQ = 262,
    MULTEQ = 263,
    DIVEQ = 264,
    LSHIFTEQ = 265,
    RSHIFTEQ = 266,
    ANDEQ = 267,
    OREQ = 268,
    OROR = 269,
    ANDAND = 270,
    EQ = 271,
    NE = 272,
    LE = 273,
    GE = 274,
    LSHIFT = 275,
    RSHIFT = 276,
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
    NOCROSSREFS_TO = 332,
    ORIGIN = 333,
    FILL = 334,
    LENGTH = 335,
    CREATE_OBJECT_SYMBOLS = 336,
    INPUT = 337,
    GROUP = 338,
    OUTPUT = 339,
    CONSTRUCTORS = 340,
    ALIGNMOD = 341,
    AT = 342,
    SUBALIGN = 343,
    HIDDEN = 344,
    PROVIDE = 345,
    PROVIDE_HIDDEN = 346,
    AS_NEEDED = 347,
    CHIP = 348,
    LIST = 349,
    SECT = 350,
    ABSOLUTE = 351,
    LOAD = 352,
    NEWLINE = 353,
    ENDWORD = 354,
    ORDER = 355,
    NAMEWORD = 356,
    ASSERT_K = 357,
    LOG2CEIL = 358,
    FORMAT = 359,
    PUBLIC = 360,
    DEFSYMEND = 361,
    BASE = 362,
    ALIAS = 363,
    TRUNCATE = 364,
    REL = 365,
    INPUT_SCRIPT = 366,
    INPUT_MRI_SCRIPT = 367,
    INPUT_DEFSYM = 368,
    CASE = 369,
    EXTERN = 370,
    START = 371,
    VERS_TAG = 372,
    VERS_IDENTIFIER = 373,
    GLOBAL = 374,
    LOCAL = 375,
    VERSIONK = 376,
    INPUT_VERSION_SCRIPT = 377,
    KEEP = 378,
    ONLY_IF_RO = 379,
    ONLY_IF_RW = 380,
    SPECIAL = 381,
    INPUT_SECTION_FLAGS = 382,
    ALIGN_WITH_INPUT = 383,
    EXCLUDE_FILE = 384,
    CONSTANT = 385,
    INPUT_DYNAMIC_LIST = 386
  };
#endif
/* Tokens.  */
#define INT 258
#define NAME 259
#define LNAME 260
#define PLUSEQ 261
#define MINUSEQ 262
#define MULTEQ 263
#define DIVEQ 264
#define LSHIFTEQ 265
#define RSHIFTEQ 266
#define ANDEQ 267
#define OREQ 268
#define OROR 269
#define ANDAND 270
#define EQ 271
#define NE 272
#define LE 273
#define GE 274
#define LSHIFT 275
#define RSHIFT 276
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
#define NOCROSSREFS_TO 332
#define ORIGIN 333
#define FILL 334
#define LENGTH 335
#define CREATE_OBJECT_SYMBOLS 336
#define INPUT 337
#define GROUP 338
#define OUTPUT 339
#define CONSTRUCTORS 340
#define ALIGNMOD 341
#define AT 342
#define SUBALIGN 343
#define HIDDEN 344
#define PROVIDE 345
#define PROVIDE_HIDDEN 346
#define AS_NEEDED 347
#define CHIP 348
#define LIST 349
#define SECT 350
#define ABSOLUTE 351
#define LOAD 352
#define NEWLINE 353
#define ENDWORD 354
#define ORDER 355
#define NAMEWORD 356
#define ASSERT_K 357
#define LOG2CEIL 358
#define FORMAT 359
#define PUBLIC 360
#define DEFSYMEND 361
#define BASE 362
#define ALIAS 363
#define TRUNCATE 364
#define REL 365
#define INPUT_SCRIPT 366
#define INPUT_MRI_SCRIPT 367
#define INPUT_DEFSYM 368
#define CASE 369
#define EXTERN 370
#define START 371
#define VERS_TAG 372
#define VERS_IDENTIFIER 373
#define GLOBAL 374
#define LOCAL 375
#define VERSIONK 376
#define INPUT_VERSION_SCRIPT 377
#define KEEP 378
#define ONLY_IF_RO 379
#define ONLY_IF_RW 380
#define SPECIAL 381
#define INPUT_SECTION_FLAGS 382
#define ALIGN_WITH_INPUT 383
#define EXCLUDE_FILE 384
#define CONSTANT 385
#define INPUT_DYNAMIC_LIST 386

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 60 "ldgram.y" /* yacc.c:355  */

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

#line 438 "ldgram.c" /* yacc.c:355  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_LDGRAM_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 453 "ldgram.c" /* yacc.c:358  */

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
#else
typedef signed char yytype_int8;
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
# elif ! defined YYSIZE_T
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
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef __attribute__
/* This feature is available in gcc versions 2.5 and later.  */
# if (! defined __GNUC__ || __GNUC__ < 2 \
      || (__GNUC__ == 2 && __GNUC_MINOR__ < 5))
#  define __attribute__(Spec) /* empty */
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
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
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
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
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
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
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  17
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   2031

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  155
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  131
/* YYNRULES -- Number of rules.  */
#define YYNRULES  372
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  809

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   386

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   153,     2,     2,     2,    34,    21,     2,
      37,   150,    32,    30,   148,    31,     2,    33,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    16,   149,
      24,    10,    25,    15,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   151,     2,   152,    20,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    58,    19,    59,   154,     2,     2,     2,
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
       5,     6,     7,     8,     9,    11,    12,    13,    14,    17,
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
     141,   142,   143,   144,   145,   146,   147
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
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
     339,   341,   343,   342,   346,   349,   348,   352,   356,   360,
     361,   363,   365,   367,   372,   372,   377,   380,   383,   386,
     389,   392,   396,   395,   401,   400,   406,   405,   413,   417,
     418,   419,   423,   425,   426,   426,   434,   438,   442,   449,
     456,   463,   470,   477,   484,   491,   498,   505,   512,   519,
     528,   546,   567,   580,   589,   600,   609,   620,   629,   638,
     642,   651,   655,   663,   665,   664,   671,   672,   676,   677,
     682,   687,   688,   693,   697,   697,   701,   700,   707,   708,
     711,   713,   717,   719,   721,   723,   725,   730,   737,   739,
     743,   745,   747,   749,   751,   753,   755,   757,   762,   762,
     767,   771,   779,   783,   787,   795,   795,   799,   802,   802,
     805,   806,   811,   810,   816,   815,   822,   830,   838,   839,
     843,   844,   848,   850,   855,   860,   861,   866,   868,   874,
     876,   878,   882,   884,   890,   893,   902,   913,   913,   919,
     921,   923,   925,   927,   929,   932,   934,   936,   938,   940,
     942,   944,   946,   948,   950,   952,   954,   956,   958,   960,
     962,   964,   966,   968,   970,   972,   974,   977,   979,   981,
     983,   985,   987,   989,   991,   993,   995,   997,   999,  1008,
    1010,  1012,  1014,  1016,  1018,  1020,  1022,  1028,  1029,  1033,
    1034,  1038,  1039,  1043,  1044,  1048,  1049,  1053,  1054,  1055,
    1056,  1059,  1064,  1067,  1073,  1075,  1059,  1082,  1084,  1086,
    1091,  1093,  1081,  1103,  1105,  1103,  1111,  1110,  1117,  1118,
    1119,  1120,  1121,  1125,  1126,  1127,  1131,  1132,  1137,  1138,
    1143,  1144,  1149,  1150,  1155,  1157,  1162,  1165,  1178,  1182,
    1187,  1189,  1180,  1197,  1200,  1202,  1206,  1207,  1206,  1216,
    1261,  1264,  1277,  1286,  1289,  1296,  1296,  1308,  1309,  1313,
    1317,  1326,  1326,  1340,  1340,  1350,  1351,  1355,  1359,  1363,
    1370,  1374,  1382,  1385,  1389,  1393,  1397,  1404,  1408,  1412,
    1416,  1421,  1420,  1434,  1433,  1443,  1447,  1451,  1455,  1459,
    1463,  1469,  1471
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "INT", "NAME", "LNAME", "PLUSEQ",
  "MINUSEQ", "MULTEQ", "DIVEQ", "'='", "LSHIFTEQ", "RSHIFTEQ", "ANDEQ",
  "OREQ", "'?'", "':'", "OROR", "ANDAND", "'|'", "'^'", "'&'", "EQ", "NE",
  "'<'", "'>'", "LE", "GE", "LSHIFT", "RSHIFT", "'+'", "'-'", "'*'", "'/'",
  "'%'", "UNARY", "END", "'('", "ALIGN_K", "BLOCK", "BIND", "QUAD",
  "SQUAD", "LONG", "SHORT", "BYTE", "SECTIONS", "PHDRS", "INSERT_K",
  "AFTER", "BEFORE", "DATA_SEGMENT_ALIGN", "DATA_SEGMENT_RELRO_END",
  "DATA_SEGMENT_END", "SORT_BY_NAME", "SORT_BY_ALIGNMENT", "SORT_NONE",
  "SORT_BY_INIT_PRIORITY", "'{'", "'}'", "SIZEOF_HEADERS", "OUTPUT_FORMAT",
  "FORCE_COMMON_ALLOCATION", "OUTPUT_ARCH", "INHIBIT_COMMON_ALLOCATION",
  "SEGMENT_START", "INCLUDE", "MEMORY", "REGION_ALIAS", "LD_FEATURE",
  "NOLOAD", "DSECT", "COPY", "INFO", "OVERLAY", "DEFINED", "TARGET_K",
  "SEARCH_DIR", "MAP", "ENTRY", "NEXT", "SIZEOF", "ALIGNOF", "ADDR",
  "LOADADDR", "MAX_K", "MIN_K", "STARTUP", "HLL", "SYSLIB", "FLOAT",
  "NOFLOAT", "NOCROSSREFS", "NOCROSSREFS_TO", "ORIGIN", "FILL", "LENGTH",
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
  "$accept", "file", "filename", "defsym_expr", "$@1", "mri_script_file",
  "$@2", "mri_script_lines", "mri_script_command", "$@3", "ordernamelist",
  "mri_load_name_list", "mri_abs_name_list", "casesymlist",
  "extern_name_list", "$@4", "extern_name_list_body", "script_file", "$@5",
  "ifile_list", "ifile_p1", "$@6", "$@7", "input_list", "$@8",
  "input_list1", "@9", "@10", "@11", "sections", "sec_or_group_p1",
  "statement_anywhere", "$@12", "wildcard_name", "wildcard_spec",
  "sect_flag_list", "sect_flags", "exclude_name_list", "section_NAME_list",
  "input_section_spec_no_keep", "input_section_spec", "$@13", "statement",
  "$@14", "$@15", "statement_list", "statement_list_opt", "length",
  "fill_exp", "fill_opt", "assign_op", "end", "assignment", "opt_comma",
  "memory", "memory_spec_list_opt", "memory_spec_list", "memory_spec",
  "$@16", "$@17", "origin_spec", "length_spec", "attributes_opt",
  "attributes_list", "attributes_string", "startup", "high_level_library",
  "high_level_library_NAME_list", "low_level_library",
  "low_level_library_NAME_list", "floating_point_support",
  "nocrossref_list", "mustbe_exp", "$@18", "exp", "memspec_at_opt",
  "opt_at", "opt_align", "opt_align_with_input", "opt_subalign",
  "sect_constraint", "section", "$@19", "$@20", "$@21", "$@22", "$@23",
  "$@24", "$@25", "$@26", "$@27", "$@28", "$@29", "$@30", "$@31", "type",
  "atype", "opt_exp_with_type", "opt_exp_without_type", "opt_nocrossrefs",
  "memspec_opt", "phdr_opt", "overlay_section", "$@32", "$@33", "$@34",
  "phdrs", "phdr_list", "phdr", "$@35", "$@36", "phdr_type",
  "phdr_qualifiers", "phdr_val", "dynamic_list_file", "$@37",
  "dynamic_list_nodes", "dynamic_list_node", "dynamic_list_tag",
  "version_script_file", "$@38", "version", "$@39", "vers_nodes",
  "vers_node", "verdep", "vers_tag", "vers_defns", "@40", "@41",
  "opt_semicolon", YY_NULL
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
      61,   265,   266,   267,   268,    63,    58,   269,   270,   124,
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
     379,   380,   381,   382,   383,   384,   385,   386,    44,    59,
      41,    91,    93,    33,   126
};
# endif

#define YYPACT_NINF -664

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-664)))

#define YYTABLE_NINF -344

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     282,  -664,  -664,  -664,  -664,  -664,    65,  -664,  -664,  -664,
    -664,  -664,    49,  -664,   -23,  -664,    58,  -664,   932,  1765,
     125,   105,    67,   -23,  -664,   111,    58,  -664,   479,   103,
     167,    89,   119,  -664,   195,  -664,    80,   179,   213,   242,
     243,   259,   261,   262,   270,   271,   285,  -664,  -664,   288,
     295,   299,  -664,   300,   302,   303,   304,  -664,   306,  -664,
    -664,  -664,  -664,    42,  -664,  -664,  -664,  -664,  -664,  -664,
    -664,   197,  -664,   340,    80,   342,   766,  -664,   343,   357,
     362,  -664,  -664,   363,   373,   374,   766,   375,   382,   388,
    -664,   390,   231,   766,  -664,   392,  -664,   370,   383,   339,
     253,   105,  -664,  -664,  -664,   344,   255,  -664,  -664,  -664,
    -664,  -664,  -664,  -664,  -664,  -664,  -664,  -664,  -664,  -664,
     401,   402,   403,   410,  -664,  -664,    53,   413,   414,   415,
      80,    80,   417,    80,    28,  -664,   421,   421,  -664,   389,
      80,   423,   424,   426,   394,  -664,  -664,  -664,  -664,   376,
      51,  -664,    52,  -664,  -664,   766,   766,   766,   395,   396,
     398,   404,   405,  -664,   407,   409,   411,   412,   416,   418,
     420,   422,   425,   427,   435,   436,   437,   438,   441,   766,
     766,  1553,   385,  -664,   291,  -664,   292,    15,  -664,  -664,
     514,  1817,   310,  -664,  -664,   313,  -664,   443,  -664,  -664,
    1817,   440,   111,   111,   305,   117,   393,   331,   117,  -664,
     766,  -664,  1852,    34,  -664,  -664,   -59,   346,  -664,  -664,
      80,   446,     0,  -664,   351,   350,   352,   356,   358,   360,
     361,  -664,  -664,   -37,   115,    23,   365,   366,   369,    39,
    -664,   372,   484,   510,   513,   766,   378,   -23,   766,   766,
    -664,   766,   766,  -664,  -664,   942,   766,   766,   766,   766,
     766,   521,   522,   766,   523,   525,   526,   528,   766,   766,
     530,   531,   766,   766,   766,   532,  -664,  -664,   766,   766,
     766,   766,   766,   766,   766,   766,   766,   766,   766,   766,
     766,   766,   766,   766,   766,   766,   766,   766,   766,   766,
    1817,   533,   536,  -664,   537,   766,   766,  1817,   146,   539,
    -664,    41,  -664,   397,   399,  -664,  -664,   543,  -664,  -664,
    -664,    94,  -664,  1817,   479,  -664,    80,  -664,  -664,  -664,
    -664,  -664,  -664,  -664,   546,  -664,  -664,   998,   517,  -664,
    -664,  -664,    53,   551,  -664,  -664,  -664,  -664,  -664,  -664,
    -664,    80,  -664,    80,   421,  -664,  -664,  -664,  -664,  -664,
    -664,   519,    47,   408,  -664,  -664,  -664,  -664,  1573,  -664,
      68,  1817,  1817,  1789,  1817,  1817,  -664,  1131,  1151,  1593,
    1613,  1171,   428,   419,  1191,   430,   431,   432,   433,  1633,
    1685,   434,   442,  1211,  1705,  1231,   453,  1960,  1997,  1111,
     759,  1379,  1244,   675,   675,   341,   341,   341,   341,   297,
     297,    98,    98,  -664,  -664,  -664,  1817,  1817,  1817,  -664,
    -664,  -664,  1817,  1817,  -664,  -664,  -664,  -664,   553,   111,
     142,   117,   501,  -664,  -664,    95,   598,  -664,   682,   598,
     766,   429,  -664,     7,   544,    53,  -664,   456,  -664,  -664,
    -664,  -664,  -664,  -664,   534,    44,  -664,   457,   459,   461,
     564,  -664,  -664,   766,  -664,  -664,   766,   766,  -664,   766,
    -664,  -664,  -664,  -664,  -664,  -664,   766,   766,  -664,  -664,
    -664,   568,  -664,  -664,   766,  -664,   439,   559,  -664,  -664,
    -664,   230,   541,  1787,   571,   487,  -664,  -664,  1980,   520,
    -664,  1817,    26,   609,  -664,   610,     1,  -664,   527,   579,
    -664,    39,  -664,  -664,  -664,   582,  -664,  -664,  -664,   466,
    1265,  1285,  1305,  1325,  1345,  1365,   474,  1817,   117,   566,
     111,   111,  -664,  -664,  -664,  -664,  -664,  -664,   477,   766,
     247,   614,  -664,   594,   601,   377,  -664,  -664,   487,   583,
     603,   605,  -664,   493,  -664,  -664,  -664,   635,   498,  -664,
      16,    39,  -664,  -664,  -664,  -664,  -664,  -664,  -664,  -664,
    -664,  -664,   499,   439,  -664,  1399,  -664,   766,   615,   509,
    -664,   550,  -664,   766,    26,   766,   506,  -664,  -664,   560,
    -664,    20,    39,   117,   600,   248,  1419,   766,  -664,   550,
     620,  -664,  1856,  1439,  -664,  1459,  -664,  -664,   651,  -664,
    -664,    29,  -664,   628,   650,  -664,  1479,  -664,   766,   611,
    -664,  -664,    26,  -664,  -664,   766,  -664,  -664,   130,  1499,
    -664,  -664,  -664,  1533,  -664,  -664,  -664,   612,  -664,  -664,
     634,  -664,    37,   656,   838,  -664,  -664,  -664,   345,  -664,
    -664,  -664,  -664,  -664,  -664,  -664,   637,   638,   639,   640,
      80,   652,  -664,  -664,  -664,   653,   654,   658,  -664,    86,
    -664,   659,    43,  -664,  -664,  -664,   838,   629,   660,    42,
     657,   662,    22,   234,    70,    70,  -664,  -664,   674,  -664,
     689,    70,  -664,   677,  -664,   -66,    86,   681,    86,   685,
    -664,  -664,  -664,  -664,   838,   719,   621,   688,   690,   576,
     691,   580,   692,   694,   586,   587,   588,   838,   589,  -664,
     766,    14,  -664,    74,  -664,     8,    90,  -664,    86,   143,
     -65,    86,   662,   590,   673,  -664,   716,  -664,    70,    70,
    -664,    70,  -664,    70,    70,  -664,  -664,  -664,   707,  -664,
    1725,   595,   596,   744,  -664,    70,  -664,  -664,  -664,  -664,
     144,   621,  -664,  -664,   745,    62,   604,   606,    24,   608,
     622,  -664,   746,  -664,  -664,  -664,  -664,  -664,  -664,  -664,
    -664,   749,  -664,   623,   624,    70,   625,   627,   645,    62,
      62,  -664,  -664,   498,  -664,  -664,   648,  -664,  -664,    42,
    -664,  -664,  -664,  -664,  -664,   498,   498,  -664,  -664
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    59,    10,     8,   341,   335,     0,     2,    62,     3,
      13,     6,     0,     4,     0,     5,     0,     1,    60,    11,
       0,   352,     0,   342,   345,     0,   336,   337,     0,     0,
       0,     0,     0,    79,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   212,   213,     0,
       0,     0,    82,     0,     0,     0,     0,   114,     0,    72,
      61,    64,    70,     0,    63,    66,    67,    68,    69,    65,
      71,     0,    16,     0,     0,     0,     0,    17,     0,     0,
       0,    19,    46,     0,     0,     0,     0,     0,     0,    51,
      54,     0,     0,     0,   358,   369,   357,   365,   367,     0,
       0,   352,   346,   365,   367,     0,     0,   338,   170,   171,
     172,   173,   217,   174,   175,   176,   177,   217,   111,   324,
       0,     0,     0,     0,     7,    85,   189,     0,     0,     0,
       0,     0,     0,     0,     0,   211,   214,   214,    94,     0,
       0,     0,     0,     0,     0,    54,   179,   178,   113,     0,
       0,    40,     0,   245,   260,     0,     0,     0,     0,     0,
       0,     0,     0,   246,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    14,     0,    49,    31,    47,    32,    18,    33,    23,
       0,    36,     0,    37,    52,    38,    39,     0,    42,    12,
       9,     0,     0,     0,     0,   353,     0,     0,   340,   180,
       0,   181,     0,     0,    90,    91,     0,     0,    62,   192,
       0,     0,   186,   191,     0,     0,     0,     0,     0,     0,
       0,   206,   208,   186,   186,   214,     0,     0,     0,     0,
      94,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      13,     0,     0,   223,   219,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   222,   224,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      25,     0,     0,    45,     0,     0,     0,    22,     0,     0,
      56,    55,   363,     0,     0,   347,   360,   370,   359,   366,
     368,     0,   339,   218,   281,   108,     0,   287,   293,   110,
     109,   326,   323,   325,     0,    76,    78,   343,   198,   194,
     187,   185,     0,     0,    93,    73,    74,    84,   112,   204,
     205,     0,   209,     0,   214,   215,    87,    88,    81,    96,
      99,     0,    95,     0,    75,   217,   217,   217,     0,    89,
       0,    27,    28,    43,    29,    30,   220,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   243,   242,
     240,   239,   238,   232,   233,   236,   237,   234,   235,   230,
     231,   228,   229,   225,   226,   227,    15,    26,    24,    50,
      48,    44,    20,    21,    35,    34,    53,    57,     0,     0,
     354,   355,     0,   350,   348,     0,   304,   296,     0,   304,
       0,     0,    86,     0,     0,   189,   190,     0,   207,   210,
     216,   102,    98,   101,     0,     0,    83,     0,     0,     0,
       0,   344,    41,     0,   253,   259,     0,     0,   257,     0,
     244,   221,   248,   247,   249,   250,     0,     0,   264,   265,
     252,     0,   266,   251,     0,    58,   371,   368,   361,   351,
     349,     0,     0,   304,     0,   270,   111,   311,     0,   312,
     294,   329,   330,     0,   202,     0,     0,   200,     0,     0,
      92,     0,   106,    97,   100,     0,   182,   183,   184,     0,
       0,     0,     0,     0,     0,     0,     0,   241,   372,     0,
       0,     0,   298,   299,   300,   301,   302,   305,     0,     0,
       0,     0,   307,     0,   272,     0,   310,   313,   270,     0,
     333,     0,   327,     0,   203,   199,   201,     0,   186,   195,
       0,     0,   104,   115,   254,   255,   256,   258,   261,   262,
     263,   364,     0,   371,   303,     0,   306,     0,     0,   274,
     297,   276,   111,     0,   330,     0,     0,    77,   217,     0,
     103,     0,     0,   356,     0,   304,     0,     0,   273,   276,
       0,   288,     0,     0,   331,     0,   328,   196,     0,   193,
     107,     0,   362,     0,     0,   269,     0,   282,     0,     0,
     295,   334,   330,   217,   105,     0,   308,   271,   280,     0,
     289,   332,   197,     0,   277,   278,   279,     0,   275,   318,
     304,   283,     0,     0,   160,   319,   290,   309,   137,   118,
     117,   162,   163,   164,   165,   166,     0,     0,     0,     0,
       0,     0,   147,   149,   154,     0,     0,     0,   148,     0,
     119,     0,     0,   143,   151,   159,   161,     0,     0,     0,
       0,   315,     0,     0,     0,     0,   156,   217,     0,   144,
       0,     0,   116,     0,   136,   186,     0,   138,     0,     0,
     158,   284,   217,   146,   160,     0,   268,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   160,     0,   167,
       0,     0,   130,     0,   134,     0,     0,   139,     0,   186,
     186,     0,   315,     0,     0,   314,     0,   316,     0,     0,
     150,     0,   121,     0,     0,   122,   123,   129,     0,   153,
       0,   116,     0,     0,   132,     0,   133,   135,   141,   140,
     186,   268,   152,   320,     0,   169,     0,     0,     0,     0,
       0,   157,     0,   145,   131,   120,   142,   316,   316,   267,
     217,     0,   291,     0,     0,     0,     0,     0,     0,   169,
     169,   168,   317,   186,   125,   124,     0,   126,   127,     0,
     285,   321,   292,   128,   155,   186,   186,   286,   322
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -664,  -664,   -67,  -664,  -664,  -664,  -664,   505,  -664,  -664,
    -664,  -664,  -664,  -664,   616,  -664,  -664,  -664,  -664,   542,
    -664,  -664,  -664,   562,  -664,  -480,  -664,  -664,  -664,  -664,
    -474,   -14,  -664,  -121,  -363,  -664,  -664,    18,  -434,    50,
    -664,  -664,   123,  -664,  -664,  -664,  -662,  -664,    27,  -532,
    -664,  -663,  -584,  -220,  -664,   364,  -664,   464,  -664,  -664,
    -664,  -664,  -664,  -664,   307,  -664,  -664,  -664,  -664,  -664,
    -664,  -128,  -111,  -664,   -76,    54,   260,  -664,  -664,   211,
    -664,  -664,  -664,  -664,  -664,  -664,  -664,  -664,  -664,  -664,
    -664,  -664,  -664,  -664,  -664,  -664,  -478,   381,  -664,  -664,
      79,  -503,  -664,  -664,  -664,  -664,  -664,  -664,  -664,  -664,
    -664,  -664,  -534,  -664,  -664,  -664,  -664,   786,  -664,  -664,
    -664,  -664,  -664,   567,   -20,  -664,   715,   -17,  -664,  -664,
     249
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     6,   125,    11,    12,     9,    10,    19,    92,   250,
     187,   186,   184,   195,   196,   197,   311,     7,     8,    18,
      60,   139,   218,   238,   239,   362,   511,   592,   561,    61,
     212,   329,   144,   670,   671,   723,   672,   725,   695,   673,
     674,   721,   675,   688,   717,   676,   677,   678,   718,   782,
     117,   148,    63,   728,    64,   221,   222,   223,   338,   445,
     558,   609,   444,   506,   507,    65,    66,   233,    67,   234,
      68,   236,   719,   210,   255,   737,   544,   579,   599,   601,
     637,   330,   436,   628,   644,   732,   805,   438,   619,   639,
     681,   793,   439,   549,   496,   538,   494,   495,   499,   548,
     706,   765,   642,   680,   778,   806,    69,   213,   333,   440,
     586,   502,   552,   584,    15,    16,    26,    27,   105,    13,
      14,    70,    71,    23,    24,   435,    99,   100,   531,   429,
     529
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
     181,   209,   342,   102,    62,   504,   211,   151,   106,   237,
     191,   504,   692,   351,   353,   541,   703,   200,   751,   303,
     452,   453,   545,   649,   452,   453,   692,   235,   692,   649,
     550,   560,   124,   452,   453,    21,  -188,   649,   331,   649,
     650,   645,   734,   359,   360,   427,   650,   697,   513,   514,
     604,   452,   453,    20,   650,   748,   650,   219,   649,  -188,
     679,   248,   251,   227,   228,    17,   230,   232,   693,   657,
     658,   659,   780,   241,   692,   650,   707,   708,   781,   253,
     254,   591,   341,   341,   124,   649,   727,   759,   631,   334,
     692,   335,   679,   332,   692,   753,   646,   693,   657,   658,
     659,   649,   650,   276,   277,   649,   300,   355,   602,    94,
      22,   341,   611,   350,   307,    94,    25,   614,   650,   220,
     679,   316,   650,   709,   454,   101,    21,   461,   454,   551,
     294,   295,   296,   679,   323,    93,   804,   454,   120,   121,
     693,   657,   658,   659,   707,   708,   316,   361,   341,   424,
     425,   555,   515,   339,   505,   454,   122,   666,   755,   667,
     505,   118,   643,   304,   455,   669,   590,   710,   455,   368,
     610,   354,   371,   372,   785,   374,   375,   455,   231,   624,
     377,   378,   379,   380,   381,   313,   314,   384,   667,   428,
     146,   147,   389,   390,   698,   455,   393,   394,   395,   249,
     252,    22,   397,   398,   399,   400,   401,   402,   403,   404,
     405,   406,   407,   408,   409,   410,   411,   412,   413,   414,
     415,   416,   417,   418,   754,   119,   450,   433,   489,   422,
     423,   667,   123,   153,   154,   710,    95,   126,   692,    96,
      97,    98,    95,   434,   490,    96,   103,   104,   317,   649,
     127,   318,   319,   320,   457,   458,   459,   800,   801,   437,
     155,   156,   729,   341,   730,   352,   650,   157,   158,   159,
     634,   635,   636,   317,   789,   790,   318,   319,   487,   128,
     129,   160,   161,   162,   448,   540,   449,   613,   712,   713,
     163,   341,   341,   758,   776,   164,   130,   760,   131,   132,
     532,   533,   534,   535,   536,   165,   694,   133,   134,   699,
     166,   167,   168,   169,   170,   171,   172,   532,   533,   534,
     535,   536,   135,    62,   173,   136,   174,   292,   293,   294,
     295,   296,   137,   694,   149,   694,   138,   140,   589,   141,
     142,   143,   175,   145,   150,   199,   152,   182,   176,   177,
     102,   108,   109,   110,   111,   112,   113,   114,   115,   116,
     493,   183,   498,   493,   501,   757,   185,   188,   694,   290,
     291,   292,   293,   294,   295,   296,   178,   189,   190,   192,
     537,   324,  -116,   179,   180,   193,   202,   520,   153,   154,
     521,   522,   194,   523,   198,   298,   201,   537,   204,   203,
     524,   525,   205,   207,   208,   214,   215,   216,   527,     1,
       2,     3,   486,   580,   217,   155,   156,   224,   225,   226,
       4,   229,   157,   158,   159,   235,   240,   242,   243,     5,
     244,   245,   256,   257,   247,   258,   160,   161,   162,   301,
     302,   259,   260,   326,   261,   163,   262,   310,   263,   264,
     164,   327,   321,   265,   315,   266,    43,   267,   308,   268,
     165,   309,   269,   575,   270,   166,   167,   168,   169,   170,
     171,   172,   271,   272,   273,   274,   328,   607,   275,   173,
     322,   174,    54,    55,    56,   108,   109,   110,   111,   112,
     113,   114,   115,   116,   365,    57,   336,   175,   312,   343,
     344,   596,   345,   176,   177,   340,   346,   603,   347,   605,
     348,   349,   632,   572,   573,   356,   357,   153,   154,   358,
     366,   616,   364,   367,   305,   382,   383,   385,   369,   386,
     387,   178,   388,   299,   391,   392,   396,   419,   179,   180,
     420,   421,   629,   426,   155,   156,   430,   432,   431,   633,
     441,   157,   158,   159,   443,   447,   451,   485,   456,   488,
     508,   711,   714,   715,   716,   160,   161,   162,   519,   470,
     724,   512,   526,   802,   163,   530,   469,   503,   539,   164,
     472,   473,   474,   475,   478,   807,   808,   542,   528,   165,
     543,   733,   479,   686,   166,   167,   168,   169,   170,   171,
     172,   153,   154,   483,   756,   711,   510,   516,   173,   517,
     174,   518,   547,   553,   554,   559,   563,   766,   767,   562,
     724,   557,   769,   770,   570,   571,   175,   574,   155,   156,
     576,   577,   176,   177,   775,   491,   158,   159,   492,   578,
     583,   582,   585,   587,   750,   588,   341,   756,   593,   160,
     161,   162,   597,   598,   600,   606,   608,   618,   163,   612,
     178,   623,   306,   164,   796,   625,   626,   179,   180,   630,
     641,   540,   647,   165,   682,   683,   684,   685,   166,   167,
     168,   169,   170,   171,   172,   153,   154,   705,   701,   687,
     689,   690,   173,   722,   174,   691,   696,   702,   497,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   296,
     175,   720,   155,   156,   726,   704,   176,   177,  -116,   157,
     158,   159,   731,   735,   736,   738,   740,   739,   741,   743,
     742,   744,   763,   160,   161,   162,   745,   746,   747,   749,
     762,   764,   163,   771,   178,  -137,   773,   164,   774,   779,
     788,   179,   180,   792,   783,   373,   784,   165,   786,   768,
     337,   246,   166,   167,   168,   169,   170,   171,   172,   153,
     154,   752,   787,   794,   795,   797,   173,   798,   174,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   294,   295,   296,   175,   799,   155,   156,   803,   700,
     176,   177,   363,   157,   158,   159,   446,   791,   581,   509,
     617,   761,   107,   556,   370,   777,   206,   160,   161,   162,
     500,     0,   594,     0,     0,     0,   163,     0,   178,     0,
       0,   164,     0,     0,     0,   179,   180,     0,     0,     0,
       0,   165,   648,     0,     0,     0,   166,   167,   168,   169,
     170,   171,   172,   649,     0,     0,     0,     0,     0,     0,
     173,     0,   174,     0,     0,     0,     0,     0,     0,     0,
     650,     0,     0,     0,     0,     0,     0,     0,   175,   651,
     652,   653,   654,   655,   176,   177,     0,     0,     0,     0,
       0,     0,   656,   657,   658,   659,     0,     0,     0,     0,
       0,     0,     0,     0,   660,     0,     0,     0,     0,     0,
       0,     0,   178,     0,     0,     0,     0,     0,     0,   179,
     180,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   661,     0,   662,    28,     0,     0,   663,
       0,     0,     0,    54,    55,    56,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   664,   278,     0,   279,
     280,   281,   282,   283,   284,   285,   286,   287,   288,   289,
     290,   291,   292,   293,   294,   295,   296,   665,    29,    30,
      31,   666,     0,   667,     0,     0,     0,   668,     0,   669,
       0,     0,     0,    32,    33,    34,    35,     0,    36,    37,
      38,    39,    28,     0,     0,     0,     0,     0,    40,    41,
      42,    43,     0,     0,     0,     0,     0,     0,     0,    44,
      45,    46,    47,    48,    49,    50,     0,     0,     0,     0,
      51,    52,    53,     0,   442,     0,     0,    54,    55,    56,
       0,     0,     0,     0,    29,    30,    31,     0,     0,     0,
      57,     0,     0,     0,     0,     0,     0,     0,     0,    32,
      33,    34,    35,    58,    36,    37,    38,    39,     0,  -343,
       0,     0,     0,     0,    40,    41,    42,    43,     0,     0,
       0,    59,     0,     0,     0,    44,    45,    46,    47,    48,
      49,    50,   376,     0,     0,     0,    51,    52,    53,     0,
       0,     0,     0,    54,    55,    56,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    57,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    58,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   278,    59,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   278,     0,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   278,     0,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   278,     0,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   278,     0,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   278,     0,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   284,   285,   286,   287,
     288,   289,   290,   291,   292,   293,   294,   295,   296,   463,
     278,   464,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   296,
     278,   465,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   296,
     278,   468,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   296,
     278,   471,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   296,
     278,   480,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   296,
     278,   482,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   296,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   294,   295,   296,   278,   564,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   294,   295,   296,   278,   565,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   294,   295,   296,   278,   566,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   294,   295,   296,   278,   567,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   294,   295,   296,   278,   568,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   294,   295,   296,   278,   569,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   294,   295,   296,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   278,   595,
     279,   280,   281,   282,   283,   284,   285,   286,   287,   288,
     289,   290,   291,   292,   293,   294,   295,   296,   278,   615,
     279,   280,   281,   282,   283,   284,   285,   286,   287,   288,
     289,   290,   291,   292,   293,   294,   295,   296,   278,   621,
     279,   280,   281,   282,   283,   284,   285,   286,   287,   288,
     289,   290,   291,   292,   293,   294,   295,   296,   278,   622,
     279,   280,   281,   282,   283,   284,   285,   286,   287,   288,
     289,   290,   291,   292,   293,   294,   295,   296,   278,   627,
     279,   280,   281,   282,   283,   284,   285,   286,   287,   288,
     289,   290,   291,   292,   293,   294,   295,   296,   278,   638,
     279,   280,   281,   282,   283,   284,   285,   286,   287,   288,
     289,   290,   291,   292,   293,   294,   295,   296,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   640,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     278,   297,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   296,
     278,   460,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   296,
     278,   466,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   296,
       0,   467,     0,     0,     0,     0,     0,     0,     0,    72,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   476,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    72,     0,     0,     0,     0,     0,     0,
       0,     0,   278,    73,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,     0,     0,   540,   462,     0,    73,     0,     0,
       0,    74,   278,   477,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,     0,   481,     0,    74,   324,     0,     0,     0,
     324,     0,     0,     0,     0,     0,     0,    75,     0,     0,
       0,     0,     0,   772,    76,    77,    78,    79,    80,   -43,
      81,    82,    83,     0,     0,    84,    85,     0,    86,    87,
      88,    75,     0,     0,     0,    89,    90,    91,    76,    77,
      78,    79,    80,     0,    81,    82,    83,     0,     0,    84,
      85,   325,    86,    87,    88,   620,     0,     0,   326,    89,
      90,    91,   326,     0,     0,     0,   327,     0,     0,     0,
     327,    43,     0,     0,     0,    43,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   328,     0,     0,     0,   328,     0,    54,    55,    56,
       0,    54,    55,    56,     0,     0,     0,     0,     0,     0,
      57,     0,     0,     0,    57,   278,   484,   279,   280,   281,
     282,   283,   284,   285,   286,   287,   288,   289,   290,   291,
     292,   293,   294,   295,   296,   278,   546,   279,   280,   281,
     282,   283,   284,   285,   286,   287,   288,   289,   290,   291,
     292,   293,   294,   295,   296,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296
};

static const yytype_int16 yycheck[] =
{
      76,   112,   222,    23,    18,     4,   117,    74,    25,   137,
      86,     4,     4,   233,   234,   493,   679,    93,     4,     4,
       4,     5,   496,    15,     4,     5,     4,     4,     4,    15,
       4,   511,     4,     4,     5,    58,    36,    15,     4,    15,
      32,     4,   704,     4,     5,     4,    32,     4,     4,     5,
     584,     4,     5,     4,    32,   717,    32,     4,    15,    59,
     644,    10,    10,   130,   131,     0,   133,   134,    54,    55,
      56,    57,    10,   140,     4,    32,    54,    55,    16,   155,
     156,   561,   148,   148,     4,    15,   152,   152,   622,   148,
       4,   150,   676,    59,     4,    21,    59,    54,    55,    56,
      57,    15,    32,   179,   180,    15,   182,   235,   582,     4,
     133,   148,   592,   150,   190,     4,    58,   595,    32,    66,
     704,     4,    32,   101,   108,    58,    58,    59,   108,   103,
      32,    33,    34,   717,   210,    10,   799,   108,    49,    50,
      54,    55,    56,    57,    54,    55,     4,   108,   148,     3,
       4,   150,   108,   220,   153,   108,    37,   143,   150,   145,
     153,    58,   640,   148,   148,   151,   150,   145,   148,   245,
     150,   148,   248,   249,   150,   251,   252,   148,   150,   150,
     256,   257,   258,   259,   260,   202,   203,   263,   145,   148,
     148,   149,   268,   269,   151,   148,   272,   273,   274,   148,
     148,   133,   278,   279,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     296,   297,   298,   299,   150,    58,   354,   133,   133,   305,
     306,   145,    37,     3,     4,   145,   131,    58,     4,   134,
     135,   136,   131,   149,   149,   134,   135,   136,   131,    15,
      37,   134,   135,   136,   365,   366,   367,   789,   790,   326,
      30,    31,   696,   148,   698,   150,    32,    37,    38,    39,
     140,   141,   142,   131,   777,   778,   134,   135,   136,    37,
      37,    51,    52,    53,   351,    37,   353,    39,    54,    55,
      60,   148,   148,   150,   150,    65,    37,   731,    37,    37,
      70,    71,    72,    73,    74,    75,   669,    37,    37,   672,
      80,    81,    82,    83,    84,    85,    86,    70,    71,    72,
      73,    74,    37,   337,    94,    37,    96,    30,    31,    32,
      33,    34,    37,   696,   137,   698,    37,    37,   558,    37,
      37,    37,   112,    37,     4,   114,     4,     4,   118,   119,
     370,     6,     7,     8,     9,    10,    11,    12,    13,    14,
     436,     4,   438,   439,   440,   728,     4,     4,   731,    28,
      29,    30,    31,    32,    33,    34,   146,     4,     4,     4,
     150,     4,    37,   153,   154,     3,    16,   463,     3,     4,
     466,   467,     4,   469,     4,    10,     4,   150,    59,    16,
     476,   477,   149,    59,   149,     4,     4,     4,   484,   127,
     128,   129,   429,    36,     4,    30,    31,     4,     4,     4,
     138,     4,    37,    38,    39,     4,    37,     4,     4,   147,
       4,    37,    37,    37,    58,    37,    51,    52,    53,   148,
     148,    37,    37,    66,    37,    60,    37,     4,    37,    37,
      65,    74,    59,    37,   149,    37,    79,    37,   148,    37,
      75,   148,    37,   539,    37,    80,    81,    82,    83,    84,
      85,    86,    37,    37,    37,    37,    99,   588,    37,    94,
     149,    96,   105,   106,   107,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    10,   118,   150,   112,    58,   148,
     150,   577,   150,   118,   119,    59,   150,   583,   150,   585,
     150,   150,   623,   530,   531,   150,   150,     3,     4,   150,
      10,   597,   150,    10,    10,     4,     4,     4,   150,     4,
       4,   146,     4,   148,     4,     4,     4,     4,   153,   154,
       4,     4,   618,     4,    30,    31,   149,     4,   149,   625,
       4,    37,    38,    39,    37,     4,    37,     4,   150,    58,
      16,   682,   683,   684,   685,    51,    52,    53,     4,   150,
     691,    37,     4,   793,    60,    16,   148,   148,    37,    65,
     150,   150,   150,   150,   150,   805,   806,    16,   149,    75,
     103,   702,   150,   660,    80,    81,    82,    83,    84,    85,
      86,     3,     4,   150,   725,   726,   150,   150,    94,   150,
      96,   150,    92,     4,     4,    36,   150,   738,   739,    37,
     741,    94,   743,   744,   150,    59,   112,   150,    30,    31,
      16,    37,   118,   119,   755,    37,    38,    39,    40,    38,
      37,    58,    37,   150,   720,    10,   148,   768,   149,    51,
      52,    53,    37,   144,   104,   149,    96,    37,    60,    59,
     146,    10,   148,    65,   785,    37,    16,   153,   154,    58,
      58,    37,    16,    75,    37,    37,    37,    37,    80,    81,
      82,    83,    84,    85,    86,     3,     4,    25,    59,    37,
      37,    37,    94,     4,    96,    37,    37,    37,    16,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
     112,    37,    30,    31,    37,    58,   118,   119,    37,    37,
      38,    39,    37,     4,   103,    37,   150,    37,    37,    37,
     150,    37,    59,    51,    52,    53,   150,   150,   150,   150,
     150,    25,    60,    36,   146,   150,   150,    65,     4,     4,
       4,   153,   154,     4,   150,   250,   150,    75,   150,   741,
     218,   145,    80,    81,    82,    83,    84,    85,    86,     3,
       4,   721,   150,   150,   150,   150,    94,   150,    96,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,   112,   150,    30,    31,   150,   676,
     118,   119,   240,    37,    38,    39,   342,   780,   548,   445,
     599,   732,    26,   506,   247,   761,   101,    51,    52,    53,
     439,    -1,   573,    -1,    -1,    -1,    60,    -1,   146,    -1,
      -1,    65,    -1,    -1,    -1,   153,   154,    -1,    -1,    -1,
      -1,    75,     4,    -1,    -1,    -1,    80,    81,    82,    83,
      84,    85,    86,    15,    -1,    -1,    -1,    -1,    -1,    -1,
      94,    -1,    96,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      32,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,    41,
      42,    43,    44,    45,   118,   119,    -1,    -1,    -1,    -1,
      -1,    -1,    54,    55,    56,    57,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   146,    -1,    -1,    -1,    -1,    -1,    -1,   153,
     154,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    95,    -1,    97,     4,    -1,    -1,   101,
      -1,    -1,    -1,   105,   106,   107,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   118,    15,    -1,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,   139,    46,    47,
      48,   143,    -1,   145,    -1,    -1,    -1,   149,    -1,   151,
      -1,    -1,    -1,    61,    62,    63,    64,    -1,    66,    67,
      68,    69,     4,    -1,    -1,    -1,    -1,    -1,    76,    77,
      78,    79,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    87,
      88,    89,    90,    91,    92,    93,    -1,    -1,    -1,    -1,
      98,    99,   100,    -1,    36,    -1,    -1,   105,   106,   107,
      -1,    -1,    -1,    -1,    46,    47,    48,    -1,    -1,    -1,
     118,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    61,
      62,    63,    64,   131,    66,    67,    68,    69,    -1,   137,
      -1,    -1,    -1,    -1,    76,    77,    78,    79,    -1,    -1,
      -1,   149,    -1,    -1,    -1,    87,    88,    89,    90,    91,
      92,    93,   150,    -1,    -1,    -1,    98,    99,   100,    -1,
      -1,    -1,    -1,   105,   106,   107,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   118,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    15,   149,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    15,    -1,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    15,    -1,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    15,    -1,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    15,    -1,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    15,    -1,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,   148,
      15,   150,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      15,   150,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      15,   150,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      15,   150,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      15,   150,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      15,   150,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    15,   150,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    15,   150,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    15,   150,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    15,   150,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    15,   150,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    15,   150,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    15,   150,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    15,   150,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    15,   150,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    15,   150,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    15,   150,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    15,   150,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   150,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      15,   148,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      15,   148,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      15,   148,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      -1,   148,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     4,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   148,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     4,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    15,    38,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    -1,    -1,    37,    36,    -1,    38,    -1,    -1,
      -1,    66,    15,   148,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    -1,   148,    -1,    66,     4,    -1,    -1,    -1,
       4,    -1,    -1,    -1,    -1,    -1,    -1,   102,    -1,    -1,
      -1,    -1,    -1,   148,   109,   110,   111,   112,   113,   114,
     115,   116,   117,    -1,    -1,   120,   121,    -1,   123,   124,
     125,   102,    -1,    -1,    -1,   130,   131,   132,   109,   110,
     111,   112,   113,    -1,   115,   116,   117,    -1,    -1,   120,
     121,    59,   123,   124,   125,    59,    -1,    -1,    66,   130,
     131,   132,    66,    -1,    -1,    -1,    74,    -1,    -1,    -1,
      74,    79,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    99,    -1,    -1,    -1,    99,    -1,   105,   106,   107,
      -1,   105,   106,   107,    -1,    -1,    -1,    -1,    -1,    -1,
     118,    -1,    -1,    -1,   118,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,   127,   128,   129,   138,   147,   156,   172,   173,   160,
     161,   158,   159,   274,   275,   269,   270,     0,   174,   162,
       4,    58,   133,   278,   279,    58,   271,   272,     4,    46,
      47,    48,    61,    62,    63,    64,    66,    67,    68,    69,
      76,    77,    78,    79,    87,    88,    89,    90,    91,    92,
      93,    98,    99,   100,   105,   106,   107,   118,   131,   149,
     175,   184,   186,   207,   209,   220,   221,   223,   225,   261,
     276,   277,     4,    38,    66,   102,   109,   110,   111,   112,
     113,   115,   116,   117,   120,   121,   123,   124,   125,   130,
     131,   132,   163,    10,     4,   131,   134,   135,   136,   281,
     282,    58,   279,   135,   136,   273,   282,   272,     6,     7,
       8,     9,    10,    11,    12,    13,    14,   205,    58,    58,
      49,    50,    37,    37,     4,   157,    58,    37,    37,    37,
      37,    37,    37,    37,    37,    37,    37,    37,    37,   176,
      37,    37,    37,    37,   187,    37,   148,   149,   206,   137,
       4,   157,     4,     3,     4,    30,    31,    37,    38,    39,
      51,    52,    53,    60,    65,    75,    80,    81,    82,    83,
      84,    85,    86,    94,    96,   112,   118,   119,   146,   153,
     154,   229,     4,     4,   167,     4,   166,   165,     4,     4,
       4,   229,     4,     3,     4,   168,   169,   170,     4,   114,
     229,     4,    16,    16,    59,   149,   281,    59,   149,   227,
     228,   227,   185,   262,     4,     4,     4,     4,   177,     4,
      66,   210,   211,   212,     4,     4,     4,   157,   157,     4,
     157,   150,   157,   222,   224,     4,   226,   226,   178,   179,
      37,   157,     4,     4,     4,    37,   169,    58,    10,   148,
     164,    10,   148,   229,   229,   229,    37,    37,    37,    37,
      37,    37,    37,    37,    37,    37,    37,    37,    37,    37,
      37,    37,    37,    37,    37,    37,   229,   229,    15,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,   148,    10,   148,
     229,   148,   148,     4,   148,    10,   148,   229,   148,   148,
       4,   171,    58,   282,   282,   149,     4,   131,   134,   135,
     136,    59,   149,   229,     4,    59,    66,    74,    99,   186,
     236,     4,    59,   263,   148,   150,   150,   174,   213,   157,
      59,   148,   208,   148,   150,   150,   150,   150,   150,   150,
     150,   208,   150,   208,   148,   226,   150,   150,   150,     4,
       5,   108,   180,   178,   150,    10,    10,    10,   229,   150,
     278,   229,   229,   162,   229,   229,   150,   229,   229,   229,
     229,   229,     4,     4,   229,     4,     4,     4,     4,   229,
     229,     4,     4,   229,   229,   229,     4,   229,   229,   229,
     229,   229,   229,   229,   229,   229,   229,   229,   229,   229,
     229,   229,   229,   229,   229,   229,   229,   229,   229,     4,
       4,     4,   229,   229,     3,     4,     4,     4,   148,   284,
     149,   149,     4,   133,   149,   280,   237,   157,   242,   247,
     264,     4,    36,    37,   217,   214,   212,     4,   157,   157,
     226,    37,     4,     5,   108,   148,   150,   227,   227,   227,
     148,    59,    36,   148,   150,   150,   148,   148,   150,   148,
     150,   150,   150,   150,   150,   150,   148,   148,   150,   150,
     150,   148,   150,   150,    16,     4,   282,   136,    58,   133,
     149,    37,    40,   229,   251,   252,   249,    16,   229,   253,
     252,   229,   266,   148,     4,   153,   218,   219,    16,   210,
     150,   181,    37,     4,     5,   108,   150,   150,   150,     4,
     229,   229,   229,   229,   229,   229,     4,   229,   149,   285,
      16,   283,    70,    71,    72,    73,    74,   150,   250,    37,
      37,   251,    16,   103,   231,   185,    16,    92,   254,   248,
       4,   103,   267,     4,     4,   150,   219,    94,   215,    36,
     180,   183,    37,   150,   150,   150,   150,   150,   150,   150,
     150,    59,   282,   282,   150,   229,    16,    37,    38,   232,
      36,   231,    58,    37,   268,    37,   265,   150,    10,   208,
     150,   180,   182,   149,   285,   150,   229,    37,   144,   233,
     104,   234,   185,   229,   267,   229,   149,   227,    96,   216,
     150,   180,    59,    39,   251,   150,   229,   234,    37,   243,
      59,   150,   150,    10,   150,    37,    16,   150,   238,   229,
      58,   267,   227,   229,   140,   141,   142,   235,   150,   244,
     150,    58,   257,   251,   239,     4,    59,    16,     4,    15,
      32,    41,    42,    43,    44,    45,    54,    55,    56,    57,
      66,    95,    97,   101,   118,   139,   143,   145,   149,   151,
     188,   189,   191,   194,   195,   197,   200,   201,   202,   207,
     258,   245,    37,    37,    37,    37,   157,    37,   198,    37,
      37,    37,     4,    54,   189,   193,    37,     4,   151,   189,
     197,    59,    37,   206,    58,    25,   255,    54,    55,   101,
     145,   188,    54,    55,   188,   188,   188,   199,   203,   227,
      37,   196,     4,   190,   188,   192,    37,   152,   208,   193,
     193,    37,   240,   227,   201,     4,   103,   230,    37,    37,
     150,    37,   150,    37,    37,   150,   150,   150,   201,   150,
     229,     4,   194,    21,   150,   150,   188,   189,   150,   152,
     193,   255,   150,    59,    25,   256,   188,   188,   192,   188,
     188,    36,   148,   150,     4,   188,   150,   230,   259,     4,
      10,    16,   204,   150,   150,   150,   150,   150,     4,   256,
     256,   203,     4,   246,   150,   150,   188,   150,   150,   150,
     204,   204,   208,   150,   206,   241,   260,   208,   208
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   155,   156,   156,   156,   156,   156,   157,   159,   158,
     161,   160,   162,   162,   163,   163,   163,   163,   163,   163,
     163,   163,   163,   163,   163,   163,   163,   163,   163,   163,
     163,   163,   163,   163,   163,   163,   163,   163,   163,   163,
     164,   163,   163,   163,   165,   165,   165,   166,   166,   167,
     167,   168,   168,   168,   170,   169,   171,   171,   171,   173,
     172,   174,   174,   175,   175,   175,   175,   175,   175,   175,
     175,   175,   175,   175,   175,   175,   175,   175,   175,   175,
     175,   175,   176,   175,   175,   177,   175,   175,   175,   175,
     175,   175,   175,   175,   179,   178,   180,   180,   180,   180,
     180,   180,   181,   180,   182,   180,   183,   180,   184,   185,
     185,   185,   186,   186,   187,   186,   188,   188,   188,   189,
     189,   189,   189,   189,   189,   189,   189,   189,   189,   189,
     190,   190,   191,   192,   192,   193,   193,   194,   194,   194,
     194,   194,   194,   195,   196,   195,   197,   197,   197,   197,
     197,   197,   197,   197,   198,   197,   199,   197,   200,   200,
     201,   201,   202,   202,   202,   202,   202,   203,   204,   204,
     205,   205,   205,   205,   205,   205,   205,   205,   206,   206,
     207,   207,   207,   207,   207,   208,   208,   209,   210,   210,
     211,   211,   213,   212,   214,   212,   215,   216,   217,   217,
     218,   218,   219,   219,   220,   221,   221,   222,   222,   223,
     224,   224,   225,   225,   226,   226,   226,   228,   227,   229,
     229,   229,   229,   229,   229,   229,   229,   229,   229,   229,
     229,   229,   229,   229,   229,   229,   229,   229,   229,   229,
     229,   229,   229,   229,   229,   229,   229,   229,   229,   229,
     229,   229,   229,   229,   229,   229,   229,   229,   229,   229,
     229,   229,   229,   229,   229,   229,   229,   230,   230,   231,
     231,   232,   232,   233,   233,   234,   234,   235,   235,   235,
     235,   237,   238,   239,   240,   241,   236,   242,   243,   244,
     245,   246,   236,   247,   248,   236,   249,   236,   250,   250,
     250,   250,   250,   251,   251,   251,   252,   252,   252,   252,
     253,   253,   254,   254,   255,   255,   256,   256,   257,   258,
     259,   260,   257,   261,   262,   262,   264,   265,   263,   266,
     267,   267,   267,   268,   268,   270,   269,   271,   271,   272,
     273,   275,   274,   277,   276,   278,   278,   279,   279,   279,
     280,   280,   281,   281,   281,   281,   281,   282,   282,   282,
     282,   283,   282,   284,   282,   282,   282,   282,   282,   282,
     282,   285,   285
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
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
       1,     4,     0,     5,     4,     0,     5,     4,     4,     4,
       3,     3,     6,     4,     0,     2,     1,     3,     2,     1,
       3,     2,     0,     5,     0,     7,     0,     6,     4,     2,
       2,     0,     4,     2,     0,     7,     1,     1,     1,     1,
       5,     4,     4,     4,     7,     7,     7,     7,     8,     4,
       1,     3,     4,     2,     1,     3,     1,     1,     2,     3,
       4,     4,     5,     1,     0,     5,     2,     1,     1,     1,
       4,     1,     4,     4,     0,     8,     0,     5,     2,     1,
       0,     1,     1,     1,     1,     1,     1,     1,     2,     0,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       3,     3,     6,     6,     6,     1,     0,     4,     1,     0,
       3,     1,     0,     7,     0,     5,     3,     3,     0,     3,
       1,     2,     1,     2,     4,     4,     3,     3,     1,     4,
       3,     0,     1,     1,     0,     2,     3,     0,     2,     2,
       3,     4,     2,     2,     2,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     5,     3,     3,     4,     1,     1,     4,     4,     4,
       4,     4,     4,     4,     6,     6,     6,     4,     6,     4,
       1,     6,     6,     6,     4,     4,     4,     3,     0,     4,
       0,     4,     0,     1,     0,     4,     0,     1,     1,     1,
       0,     0,     0,     0,     0,     0,    20,     0,     0,     0,
       0,     0,    18,     0,     0,     7,     0,     5,     1,     1,
       1,     1,     1,     3,     0,     2,     3,     2,     6,    10,
       2,     1,     0,     1,     2,     0,     0,     3,     0,     0,
       0,     0,    11,     4,     0,     2,     0,     0,     6,     1,
       0,     3,     5,     0,     3,     0,     2,     1,     2,     4,
       2,     0,     2,     0,     5,     1,     2,     4,     5,     6,
       1,     2,     0,     2,     4,     4,     8,     1,     1,     3,
       3,     0,     9,     0,     7,     1,     3,     1,     3,     1,
       3,     0,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

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
#ifndef YYINITDEPTH
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
static YYSIZE_T
yystrlen (const char *yystr)
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
static char *
yystpcpy (char *yydest, const char *yysrc)
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

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULL, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULL;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULL, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
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
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
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

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
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
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

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
     '$$ = $1'.

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
#line 178 "ldgram.y" /* yacc.c:1661  */
    { ldlex_defsym(); }
#line 2361 "ldgram.c" /* yacc.c:1661  */
    break;

  case 9:
#line 180 "ldgram.y" /* yacc.c:1661  */
    {
		  ldlex_popstate();
		  lang_add_assignment (exp_defsym ((yyvsp[-2].name), (yyvsp[0].etree)));
		}
#line 2370 "ldgram.c" /* yacc.c:1661  */
    break;

  case 10:
#line 188 "ldgram.y" /* yacc.c:1661  */
    {
		  ldlex_mri_script ();
		  PUSH_ERROR (_("MRI style script"));
		}
#line 2379 "ldgram.c" /* yacc.c:1661  */
    break;

  case 11:
#line 193 "ldgram.y" /* yacc.c:1661  */
    {
		  ldlex_popstate ();
		  mri_draw_tree ();
		  POP_ERROR ();
		}
#line 2389 "ldgram.c" /* yacc.c:1661  */
    break;

  case 16:
#line 208 "ldgram.y" /* yacc.c:1661  */
    {
			einfo(_("%P%F: unrecognised keyword in MRI style script '%s'\n"),(yyvsp[0].name));
			}
#line 2397 "ldgram.c" /* yacc.c:1661  */
    break;

  case 17:
#line 211 "ldgram.y" /* yacc.c:1661  */
    {
			config.map_filename = "-";
			}
#line 2405 "ldgram.c" /* yacc.c:1661  */
    break;

  case 20:
#line 217 "ldgram.y" /* yacc.c:1661  */
    { mri_public((yyvsp[-2].name), (yyvsp[0].etree)); }
#line 2411 "ldgram.c" /* yacc.c:1661  */
    break;

  case 21:
#line 219 "ldgram.y" /* yacc.c:1661  */
    { mri_public((yyvsp[-2].name), (yyvsp[0].etree)); }
#line 2417 "ldgram.c" /* yacc.c:1661  */
    break;

  case 22:
#line 221 "ldgram.y" /* yacc.c:1661  */
    { mri_public((yyvsp[-1].name), (yyvsp[0].etree)); }
#line 2423 "ldgram.c" /* yacc.c:1661  */
    break;

  case 23:
#line 223 "ldgram.y" /* yacc.c:1661  */
    { mri_format((yyvsp[0].name)); }
#line 2429 "ldgram.c" /* yacc.c:1661  */
    break;

  case 24:
#line 225 "ldgram.y" /* yacc.c:1661  */
    { mri_output_section((yyvsp[-2].name), (yyvsp[0].etree));}
#line 2435 "ldgram.c" /* yacc.c:1661  */
    break;

  case 25:
#line 227 "ldgram.y" /* yacc.c:1661  */
    { mri_output_section((yyvsp[-1].name), (yyvsp[0].etree));}
#line 2441 "ldgram.c" /* yacc.c:1661  */
    break;

  case 26:
#line 229 "ldgram.y" /* yacc.c:1661  */
    { mri_output_section((yyvsp[-2].name), (yyvsp[0].etree));}
#line 2447 "ldgram.c" /* yacc.c:1661  */
    break;

  case 27:
#line 231 "ldgram.y" /* yacc.c:1661  */
    { mri_align((yyvsp[-2].name),(yyvsp[0].etree)); }
#line 2453 "ldgram.c" /* yacc.c:1661  */
    break;

  case 28:
#line 233 "ldgram.y" /* yacc.c:1661  */
    { mri_align((yyvsp[-2].name),(yyvsp[0].etree)); }
#line 2459 "ldgram.c" /* yacc.c:1661  */
    break;

  case 29:
#line 235 "ldgram.y" /* yacc.c:1661  */
    { mri_alignmod((yyvsp[-2].name),(yyvsp[0].etree)); }
#line 2465 "ldgram.c" /* yacc.c:1661  */
    break;

  case 30:
#line 237 "ldgram.y" /* yacc.c:1661  */
    { mri_alignmod((yyvsp[-2].name),(yyvsp[0].etree)); }
#line 2471 "ldgram.c" /* yacc.c:1661  */
    break;

  case 33:
#line 241 "ldgram.y" /* yacc.c:1661  */
    { mri_name((yyvsp[0].name)); }
#line 2477 "ldgram.c" /* yacc.c:1661  */
    break;

  case 34:
#line 243 "ldgram.y" /* yacc.c:1661  */
    { mri_alias((yyvsp[-2].name),(yyvsp[0].name),0);}
#line 2483 "ldgram.c" /* yacc.c:1661  */
    break;

  case 35:
#line 245 "ldgram.y" /* yacc.c:1661  */
    { mri_alias ((yyvsp[-2].name), 0, (int) (yyvsp[0].bigint).integer); }
#line 2489 "ldgram.c" /* yacc.c:1661  */
    break;

  case 36:
#line 247 "ldgram.y" /* yacc.c:1661  */
    { mri_base((yyvsp[0].etree)); }
#line 2495 "ldgram.c" /* yacc.c:1661  */
    break;

  case 37:
#line 249 "ldgram.y" /* yacc.c:1661  */
    { mri_truncate ((unsigned int) (yyvsp[0].bigint).integer); }
#line 2501 "ldgram.c" /* yacc.c:1661  */
    break;

  case 40:
#line 253 "ldgram.y" /* yacc.c:1661  */
    { ldlex_script (); ldfile_open_command_file((yyvsp[0].name)); }
#line 2507 "ldgram.c" /* yacc.c:1661  */
    break;

  case 41:
#line 255 "ldgram.y" /* yacc.c:1661  */
    { ldlex_popstate (); }
#line 2513 "ldgram.c" /* yacc.c:1661  */
    break;

  case 42:
#line 257 "ldgram.y" /* yacc.c:1661  */
    { lang_add_entry ((yyvsp[0].name), FALSE); }
#line 2519 "ldgram.c" /* yacc.c:1661  */
    break;

  case 44:
#line 262 "ldgram.y" /* yacc.c:1661  */
    { mri_order((yyvsp[0].name)); }
#line 2525 "ldgram.c" /* yacc.c:1661  */
    break;

  case 45:
#line 263 "ldgram.y" /* yacc.c:1661  */
    { mri_order((yyvsp[0].name)); }
#line 2531 "ldgram.c" /* yacc.c:1661  */
    break;

  case 47:
#line 269 "ldgram.y" /* yacc.c:1661  */
    { mri_load((yyvsp[0].name)); }
#line 2537 "ldgram.c" /* yacc.c:1661  */
    break;

  case 48:
#line 270 "ldgram.y" /* yacc.c:1661  */
    { mri_load((yyvsp[0].name)); }
#line 2543 "ldgram.c" /* yacc.c:1661  */
    break;

  case 49:
#line 275 "ldgram.y" /* yacc.c:1661  */
    { mri_only_load((yyvsp[0].name)); }
#line 2549 "ldgram.c" /* yacc.c:1661  */
    break;

  case 50:
#line 277 "ldgram.y" /* yacc.c:1661  */
    { mri_only_load((yyvsp[0].name)); }
#line 2555 "ldgram.c" /* yacc.c:1661  */
    break;

  case 51:
#line 281 "ldgram.y" /* yacc.c:1661  */
    { (yyval.name) = NULL; }
#line 2561 "ldgram.c" /* yacc.c:1661  */
    break;

  case 54:
#line 288 "ldgram.y" /* yacc.c:1661  */
    { ldlex_expression (); }
#line 2567 "ldgram.c" /* yacc.c:1661  */
    break;

  case 55:
#line 290 "ldgram.y" /* yacc.c:1661  */
    { ldlex_popstate (); }
#line 2573 "ldgram.c" /* yacc.c:1661  */
    break;

  case 56:
#line 294 "ldgram.y" /* yacc.c:1661  */
    { ldlang_add_undef ((yyvsp[0].name), FALSE); }
#line 2579 "ldgram.c" /* yacc.c:1661  */
    break;

  case 57:
#line 296 "ldgram.y" /* yacc.c:1661  */
    { ldlang_add_undef ((yyvsp[0].name), FALSE); }
#line 2585 "ldgram.c" /* yacc.c:1661  */
    break;

  case 58:
#line 298 "ldgram.y" /* yacc.c:1661  */
    { ldlang_add_undef ((yyvsp[0].name), FALSE); }
#line 2591 "ldgram.c" /* yacc.c:1661  */
    break;

  case 59:
#line 302 "ldgram.y" /* yacc.c:1661  */
    { ldlex_both(); }
#line 2597 "ldgram.c" /* yacc.c:1661  */
    break;

  case 60:
#line 304 "ldgram.y" /* yacc.c:1661  */
    { ldlex_popstate(); }
#line 2603 "ldgram.c" /* yacc.c:1661  */
    break;

  case 73:
#line 325 "ldgram.y" /* yacc.c:1661  */
    { lang_add_target((yyvsp[-1].name)); }
#line 2609 "ldgram.c" /* yacc.c:1661  */
    break;

  case 74:
#line 327 "ldgram.y" /* yacc.c:1661  */
    { ldfile_add_library_path ((yyvsp[-1].name), FALSE); }
#line 2615 "ldgram.c" /* yacc.c:1661  */
    break;

  case 75:
#line 329 "ldgram.y" /* yacc.c:1661  */
    { lang_add_output((yyvsp[-1].name), 1); }
#line 2621 "ldgram.c" /* yacc.c:1661  */
    break;

  case 76:
#line 331 "ldgram.y" /* yacc.c:1661  */
    { lang_add_output_format ((yyvsp[-1].name), (char *) NULL,
					    (char *) NULL, 1); }
#line 2628 "ldgram.c" /* yacc.c:1661  */
    break;

  case 77:
#line 334 "ldgram.y" /* yacc.c:1661  */
    { lang_add_output_format ((yyvsp[-5].name), (yyvsp[-3].name), (yyvsp[-1].name), 1); }
#line 2634 "ldgram.c" /* yacc.c:1661  */
    break;

  case 78:
#line 336 "ldgram.y" /* yacc.c:1661  */
    { ldfile_set_output_arch ((yyvsp[-1].name), bfd_arch_unknown); }
#line 2640 "ldgram.c" /* yacc.c:1661  */
    break;

  case 79:
#line 338 "ldgram.y" /* yacc.c:1661  */
    { command_line.force_common_definition = TRUE ; }
#line 2646 "ldgram.c" /* yacc.c:1661  */
    break;

  case 80:
#line 340 "ldgram.y" /* yacc.c:1661  */
    { command_line.inhibit_common_definition = TRUE ; }
#line 2652 "ldgram.c" /* yacc.c:1661  */
    break;

  case 82:
#line 343 "ldgram.y" /* yacc.c:1661  */
    { lang_enter_group (); }
#line 2658 "ldgram.c" /* yacc.c:1661  */
    break;

  case 83:
#line 345 "ldgram.y" /* yacc.c:1661  */
    { lang_leave_group (); }
#line 2664 "ldgram.c" /* yacc.c:1661  */
    break;

  case 84:
#line 347 "ldgram.y" /* yacc.c:1661  */
    { lang_add_map((yyvsp[-1].name)); }
#line 2670 "ldgram.c" /* yacc.c:1661  */
    break;

  case 85:
#line 349 "ldgram.y" /* yacc.c:1661  */
    { ldlex_script (); ldfile_open_command_file((yyvsp[0].name)); }
#line 2676 "ldgram.c" /* yacc.c:1661  */
    break;

  case 86:
#line 351 "ldgram.y" /* yacc.c:1661  */
    { ldlex_popstate (); }
#line 2682 "ldgram.c" /* yacc.c:1661  */
    break;

  case 87:
#line 353 "ldgram.y" /* yacc.c:1661  */
    {
		  lang_add_nocrossref ((yyvsp[-1].nocrossref));
		}
#line 2690 "ldgram.c" /* yacc.c:1661  */
    break;

  case 88:
#line 357 "ldgram.y" /* yacc.c:1661  */
    {
		  lang_add_nocrossref_to ((yyvsp[-1].nocrossref));
		}
#line 2698 "ldgram.c" /* yacc.c:1661  */
    break;

  case 90:
#line 362 "ldgram.y" /* yacc.c:1661  */
    { lang_add_insert ((yyvsp[0].name), 0); }
#line 2704 "ldgram.c" /* yacc.c:1661  */
    break;

  case 91:
#line 364 "ldgram.y" /* yacc.c:1661  */
    { lang_add_insert ((yyvsp[0].name), 1); }
#line 2710 "ldgram.c" /* yacc.c:1661  */
    break;

  case 92:
#line 366 "ldgram.y" /* yacc.c:1661  */
    { lang_memory_region_alias ((yyvsp[-3].name), (yyvsp[-1].name)); }
#line 2716 "ldgram.c" /* yacc.c:1661  */
    break;

  case 93:
#line 368 "ldgram.y" /* yacc.c:1661  */
    { lang_ld_feature ((yyvsp[-1].name)); }
#line 2722 "ldgram.c" /* yacc.c:1661  */
    break;

  case 94:
#line 372 "ldgram.y" /* yacc.c:1661  */
    { ldlex_inputlist(); }
#line 2728 "ldgram.c" /* yacc.c:1661  */
    break;

  case 95:
#line 374 "ldgram.y" /* yacc.c:1661  */
    { ldlex_popstate(); }
#line 2734 "ldgram.c" /* yacc.c:1661  */
    break;

  case 96:
#line 378 "ldgram.y" /* yacc.c:1661  */
    { lang_add_input_file((yyvsp[0].name),lang_input_file_is_search_file_enum,
				 (char *)NULL); }
#line 2741 "ldgram.c" /* yacc.c:1661  */
    break;

  case 97:
#line 381 "ldgram.y" /* yacc.c:1661  */
    { lang_add_input_file((yyvsp[0].name),lang_input_file_is_search_file_enum,
				 (char *)NULL); }
#line 2748 "ldgram.c" /* yacc.c:1661  */
    break;

  case 98:
#line 384 "ldgram.y" /* yacc.c:1661  */
    { lang_add_input_file((yyvsp[0].name),lang_input_file_is_search_file_enum,
				 (char *)NULL); }
#line 2755 "ldgram.c" /* yacc.c:1661  */
    break;

  case 99:
#line 387 "ldgram.y" /* yacc.c:1661  */
    { lang_add_input_file((yyvsp[0].name),lang_input_file_is_l_enum,
				 (char *)NULL); }
#line 2762 "ldgram.c" /* yacc.c:1661  */
    break;

  case 100:
#line 390 "ldgram.y" /* yacc.c:1661  */
    { lang_add_input_file((yyvsp[0].name),lang_input_file_is_l_enum,
				 (char *)NULL); }
#line 2769 "ldgram.c" /* yacc.c:1661  */
    break;

  case 101:
#line 393 "ldgram.y" /* yacc.c:1661  */
    { lang_add_input_file((yyvsp[0].name),lang_input_file_is_l_enum,
				 (char *)NULL); }
#line 2776 "ldgram.c" /* yacc.c:1661  */
    break;

  case 102:
#line 396 "ldgram.y" /* yacc.c:1661  */
    { (yyval.integer) = input_flags.add_DT_NEEDED_for_regular;
		    input_flags.add_DT_NEEDED_for_regular = TRUE; }
#line 2783 "ldgram.c" /* yacc.c:1661  */
    break;

  case 103:
#line 399 "ldgram.y" /* yacc.c:1661  */
    { input_flags.add_DT_NEEDED_for_regular = (yyvsp[-2].integer); }
#line 2789 "ldgram.c" /* yacc.c:1661  */
    break;

  case 104:
#line 401 "ldgram.y" /* yacc.c:1661  */
    { (yyval.integer) = input_flags.add_DT_NEEDED_for_regular;
		    input_flags.add_DT_NEEDED_for_regular = TRUE; }
#line 2796 "ldgram.c" /* yacc.c:1661  */
    break;

  case 105:
#line 404 "ldgram.y" /* yacc.c:1661  */
    { input_flags.add_DT_NEEDED_for_regular = (yyvsp[-2].integer); }
#line 2802 "ldgram.c" /* yacc.c:1661  */
    break;

  case 106:
#line 406 "ldgram.y" /* yacc.c:1661  */
    { (yyval.integer) = input_flags.add_DT_NEEDED_for_regular;
		    input_flags.add_DT_NEEDED_for_regular = TRUE; }
#line 2809 "ldgram.c" /* yacc.c:1661  */
    break;

  case 107:
#line 409 "ldgram.y" /* yacc.c:1661  */
    { input_flags.add_DT_NEEDED_for_regular = (yyvsp[-2].integer); }
#line 2815 "ldgram.c" /* yacc.c:1661  */
    break;

  case 112:
#line 424 "ldgram.y" /* yacc.c:1661  */
    { lang_add_entry ((yyvsp[-1].name), FALSE); }
#line 2821 "ldgram.c" /* yacc.c:1661  */
    break;

  case 114:
#line 426 "ldgram.y" /* yacc.c:1661  */
    {ldlex_expression ();}
#line 2827 "ldgram.c" /* yacc.c:1661  */
    break;

  case 115:
#line 427 "ldgram.y" /* yacc.c:1661  */
    { ldlex_popstate ();
		  lang_add_assignment (exp_assert ((yyvsp[-3].etree), (yyvsp[-1].name))); }
#line 2834 "ldgram.c" /* yacc.c:1661  */
    break;

  case 116:
#line 435 "ldgram.y" /* yacc.c:1661  */
    {
			  (yyval.cname) = (yyvsp[0].name);
			}
#line 2842 "ldgram.c" /* yacc.c:1661  */
    break;

  case 117:
#line 439 "ldgram.y" /* yacc.c:1661  */
    {
			  (yyval.cname) = "*";
			}
#line 2850 "ldgram.c" /* yacc.c:1661  */
    break;

  case 118:
#line 443 "ldgram.y" /* yacc.c:1661  */
    {
			  (yyval.cname) = "?";
			}
#line 2858 "ldgram.c" /* yacc.c:1661  */
    break;

  case 119:
#line 450 "ldgram.y" /* yacc.c:1661  */
    {
			  (yyval.wildcard).name = (yyvsp[0].cname);
			  (yyval.wildcard).sorted = none;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2869 "ldgram.c" /* yacc.c:1661  */
    break;

  case 120:
#line 457 "ldgram.y" /* yacc.c:1661  */
    {
			  (yyval.wildcard).name = (yyvsp[0].cname);
			  (yyval.wildcard).sorted = none;
			  (yyval.wildcard).exclude_name_list = (yyvsp[-2].name_list);
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2880 "ldgram.c" /* yacc.c:1661  */
    break;

  case 121:
#line 464 "ldgram.y" /* yacc.c:1661  */
    {
			  (yyval.wildcard).name = (yyvsp[-1].cname);
			  (yyval.wildcard).sorted = by_name;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2891 "ldgram.c" /* yacc.c:1661  */
    break;

  case 122:
#line 471 "ldgram.y" /* yacc.c:1661  */
    {
			  (yyval.wildcard).name = (yyvsp[-1].cname);
			  (yyval.wildcard).sorted = by_alignment;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2902 "ldgram.c" /* yacc.c:1661  */
    break;

  case 123:
#line 478 "ldgram.y" /* yacc.c:1661  */
    {
			  (yyval.wildcard).name = (yyvsp[-1].cname);
			  (yyval.wildcard).sorted = by_none;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2913 "ldgram.c" /* yacc.c:1661  */
    break;

  case 124:
#line 485 "ldgram.y" /* yacc.c:1661  */
    {
			  (yyval.wildcard).name = (yyvsp[-2].cname);
			  (yyval.wildcard).sorted = by_name_alignment;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2924 "ldgram.c" /* yacc.c:1661  */
    break;

  case 125:
#line 492 "ldgram.y" /* yacc.c:1661  */
    {
			  (yyval.wildcard).name = (yyvsp[-2].cname);
			  (yyval.wildcard).sorted = by_name;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2935 "ldgram.c" /* yacc.c:1661  */
    break;

  case 126:
#line 499 "ldgram.y" /* yacc.c:1661  */
    {
			  (yyval.wildcard).name = (yyvsp[-2].cname);
			  (yyval.wildcard).sorted = by_alignment_name;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2946 "ldgram.c" /* yacc.c:1661  */
    break;

  case 127:
#line 506 "ldgram.y" /* yacc.c:1661  */
    {
			  (yyval.wildcard).name = (yyvsp[-2].cname);
			  (yyval.wildcard).sorted = by_alignment;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2957 "ldgram.c" /* yacc.c:1661  */
    break;

  case 128:
#line 513 "ldgram.y" /* yacc.c:1661  */
    {
			  (yyval.wildcard).name = (yyvsp[-1].cname);
			  (yyval.wildcard).sorted = by_name;
			  (yyval.wildcard).exclude_name_list = (yyvsp[-3].name_list);
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2968 "ldgram.c" /* yacc.c:1661  */
    break;

  case 129:
#line 520 "ldgram.y" /* yacc.c:1661  */
    {
			  (yyval.wildcard).name = (yyvsp[-1].cname);
			  (yyval.wildcard).sorted = by_init_priority;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2979 "ldgram.c" /* yacc.c:1661  */
    break;

  case 130:
#line 529 "ldgram.y" /* yacc.c:1661  */
    {
			  struct flag_info_list *n;
			  n = ((struct flag_info_list *) xmalloc (sizeof *n));
			  if ((yyvsp[0].name)[0] == '!')
			    {
			      n->with = without_flags;
			      n->name = &(yyvsp[0].name)[1];
			    }
			  else
			    {
			      n->with = with_flags;
			      n->name = (yyvsp[0].name);
			    }
			  n->valid = FALSE;
			  n->next = NULL;
			  (yyval.flag_info_list) = n;
			}
#line 3001 "ldgram.c" /* yacc.c:1661  */
    break;

  case 131:
#line 547 "ldgram.y" /* yacc.c:1661  */
    {
			  struct flag_info_list *n;
			  n = ((struct flag_info_list *) xmalloc (sizeof *n));
			  if ((yyvsp[0].name)[0] == '!')
			    {
			      n->with = without_flags;
			      n->name = &(yyvsp[0].name)[1];
			    }
			  else
			    {
			      n->with = with_flags;
			      n->name = (yyvsp[0].name);
			    }
			  n->valid = FALSE;
			  n->next = (yyvsp[-2].flag_info_list);
			  (yyval.flag_info_list) = n;
			}
#line 3023 "ldgram.c" /* yacc.c:1661  */
    break;

  case 132:
#line 568 "ldgram.y" /* yacc.c:1661  */
    {
			  struct flag_info *n;
			  n = ((struct flag_info *) xmalloc (sizeof *n));
			  n->flag_list = (yyvsp[-1].flag_info_list);
			  n->flags_initialized = FALSE;
			  n->not_with_flags = 0;
			  n->only_with_flags = 0;
			  (yyval.flag_info) = n;
			}
#line 3037 "ldgram.c" /* yacc.c:1661  */
    break;

  case 133:
#line 581 "ldgram.y" /* yacc.c:1661  */
    {
			  struct name_list *tmp;
			  tmp = (struct name_list *) xmalloc (sizeof *tmp);
			  tmp->name = (yyvsp[0].cname);
			  tmp->next = (yyvsp[-1].name_list);
			  (yyval.name_list) = tmp;
			}
#line 3049 "ldgram.c" /* yacc.c:1661  */
    break;

  case 134:
#line 590 "ldgram.y" /* yacc.c:1661  */
    {
			  struct name_list *tmp;
			  tmp = (struct name_list *) xmalloc (sizeof *tmp);
			  tmp->name = (yyvsp[0].cname);
			  tmp->next = NULL;
			  (yyval.name_list) = tmp;
			}
#line 3061 "ldgram.c" /* yacc.c:1661  */
    break;

  case 135:
#line 601 "ldgram.y" /* yacc.c:1661  */
    {
			  struct wildcard_list *tmp;
			  tmp = (struct wildcard_list *) xmalloc (sizeof *tmp);
			  tmp->next = (yyvsp[-2].wildcard_list);
			  tmp->spec = (yyvsp[0].wildcard);
			  (yyval.wildcard_list) = tmp;
			}
#line 3073 "ldgram.c" /* yacc.c:1661  */
    break;

  case 136:
#line 610 "ldgram.y" /* yacc.c:1661  */
    {
			  struct wildcard_list *tmp;
			  tmp = (struct wildcard_list *) xmalloc (sizeof *tmp);
			  tmp->next = NULL;
			  tmp->spec = (yyvsp[0].wildcard);
			  (yyval.wildcard_list) = tmp;
			}
#line 3085 "ldgram.c" /* yacc.c:1661  */
    break;

  case 137:
#line 621 "ldgram.y" /* yacc.c:1661  */
    {
			  struct wildcard_spec tmp;
			  tmp.name = (yyvsp[0].name);
			  tmp.exclude_name_list = NULL;
			  tmp.sorted = none;
			  tmp.section_flag_list = NULL;
			  lang_add_wild (&tmp, NULL, ldgram_had_keep);
			}
#line 3098 "ldgram.c" /* yacc.c:1661  */
    break;

  case 138:
#line 630 "ldgram.y" /* yacc.c:1661  */
    {
			  struct wildcard_spec tmp;
			  tmp.name = (yyvsp[0].name);
			  tmp.exclude_name_list = NULL;
			  tmp.sorted = none;
			  tmp.section_flag_list = (yyvsp[-1].flag_info);
			  lang_add_wild (&tmp, NULL, ldgram_had_keep);
			}
#line 3111 "ldgram.c" /* yacc.c:1661  */
    break;

  case 139:
#line 639 "ldgram.y" /* yacc.c:1661  */
    {
			  lang_add_wild (NULL, (yyvsp[-1].wildcard_list), ldgram_had_keep);
			}
#line 3119 "ldgram.c" /* yacc.c:1661  */
    break;

  case 140:
#line 643 "ldgram.y" /* yacc.c:1661  */
    {
			  struct wildcard_spec tmp;
			  tmp.name = NULL;
			  tmp.exclude_name_list = NULL;
			  tmp.sorted = none;
			  tmp.section_flag_list = (yyvsp[-3].flag_info);
			  lang_add_wild (&tmp, (yyvsp[-1].wildcard_list), ldgram_had_keep);
			}
#line 3132 "ldgram.c" /* yacc.c:1661  */
    break;

  case 141:
#line 652 "ldgram.y" /* yacc.c:1661  */
    {
			  lang_add_wild (&(yyvsp[-3].wildcard), (yyvsp[-1].wildcard_list), ldgram_had_keep);
			}
#line 3140 "ldgram.c" /* yacc.c:1661  */
    break;

  case 142:
#line 656 "ldgram.y" /* yacc.c:1661  */
    {
			  (yyvsp[-3].wildcard).section_flag_list = (yyvsp[-4].flag_info);
			  lang_add_wild (&(yyvsp[-3].wildcard), (yyvsp[-1].wildcard_list), ldgram_had_keep);
			}
#line 3149 "ldgram.c" /* yacc.c:1661  */
    break;

  case 144:
#line 665 "ldgram.y" /* yacc.c:1661  */
    { ldgram_had_keep = TRUE; }
#line 3155 "ldgram.c" /* yacc.c:1661  */
    break;

  case 145:
#line 667 "ldgram.y" /* yacc.c:1661  */
    { ldgram_had_keep = FALSE; }
#line 3161 "ldgram.c" /* yacc.c:1661  */
    break;

  case 147:
#line 673 "ldgram.y" /* yacc.c:1661  */
    {
 		lang_add_attribute(lang_object_symbols_statement_enum);
	      	}
#line 3169 "ldgram.c" /* yacc.c:1661  */
    break;

  case 149:
#line 678 "ldgram.y" /* yacc.c:1661  */
    {

		  lang_add_attribute(lang_constructors_statement_enum);
		}
#line 3178 "ldgram.c" /* yacc.c:1661  */
    break;

  case 150:
#line 683 "ldgram.y" /* yacc.c:1661  */
    {
		  constructors_sorted = TRUE;
		  lang_add_attribute (lang_constructors_statement_enum);
		}
#line 3187 "ldgram.c" /* yacc.c:1661  */
    break;

  case 152:
#line 689 "ldgram.y" /* yacc.c:1661  */
    {
			  lang_add_data ((int) (yyvsp[-3].integer), (yyvsp[-1].etree));
			}
#line 3195 "ldgram.c" /* yacc.c:1661  */
    break;

  case 153:
#line 694 "ldgram.y" /* yacc.c:1661  */
    {
			  lang_add_fill ((yyvsp[-1].fill));
			}
#line 3203 "ldgram.c" /* yacc.c:1661  */
    break;

  case 154:
#line 697 "ldgram.y" /* yacc.c:1661  */
    {ldlex_expression ();}
#line 3209 "ldgram.c" /* yacc.c:1661  */
    break;

  case 155:
#line 698 "ldgram.y" /* yacc.c:1661  */
    { ldlex_popstate ();
			  lang_add_assignment (exp_assert ((yyvsp[-4].etree), (yyvsp[-2].name))); }
#line 3216 "ldgram.c" /* yacc.c:1661  */
    break;

  case 156:
#line 701 "ldgram.y" /* yacc.c:1661  */
    { ldlex_script (); ldfile_open_command_file((yyvsp[0].name)); }
#line 3222 "ldgram.c" /* yacc.c:1661  */
    break;

  case 157:
#line 703 "ldgram.y" /* yacc.c:1661  */
    { ldlex_popstate (); }
#line 3228 "ldgram.c" /* yacc.c:1661  */
    break;

  case 162:
#line 718 "ldgram.y" /* yacc.c:1661  */
    { (yyval.integer) = (yyvsp[0].token); }
#line 3234 "ldgram.c" /* yacc.c:1661  */
    break;

  case 163:
#line 720 "ldgram.y" /* yacc.c:1661  */
    { (yyval.integer) = (yyvsp[0].token); }
#line 3240 "ldgram.c" /* yacc.c:1661  */
    break;

  case 164:
#line 722 "ldgram.y" /* yacc.c:1661  */
    { (yyval.integer) = (yyvsp[0].token); }
#line 3246 "ldgram.c" /* yacc.c:1661  */
    break;

  case 165:
#line 724 "ldgram.y" /* yacc.c:1661  */
    { (yyval.integer) = (yyvsp[0].token); }
#line 3252 "ldgram.c" /* yacc.c:1661  */
    break;

  case 166:
#line 726 "ldgram.y" /* yacc.c:1661  */
    { (yyval.integer) = (yyvsp[0].token); }
#line 3258 "ldgram.c" /* yacc.c:1661  */
    break;

  case 167:
#line 731 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.fill) = exp_get_fill ((yyvsp[0].etree), 0, "fill value");
		}
#line 3266 "ldgram.c" /* yacc.c:1661  */
    break;

  case 168:
#line 738 "ldgram.y" /* yacc.c:1661  */
    { (yyval.fill) = (yyvsp[0].fill); }
#line 3272 "ldgram.c" /* yacc.c:1661  */
    break;

  case 169:
#line 739 "ldgram.y" /* yacc.c:1661  */
    { (yyval.fill) = (fill_type *) 0; }
#line 3278 "ldgram.c" /* yacc.c:1661  */
    break;

  case 170:
#line 744 "ldgram.y" /* yacc.c:1661  */
    { (yyval.token) = '+'; }
#line 3284 "ldgram.c" /* yacc.c:1661  */
    break;

  case 171:
#line 746 "ldgram.y" /* yacc.c:1661  */
    { (yyval.token) = '-'; }
#line 3290 "ldgram.c" /* yacc.c:1661  */
    break;

  case 172:
#line 748 "ldgram.y" /* yacc.c:1661  */
    { (yyval.token) = '*'; }
#line 3296 "ldgram.c" /* yacc.c:1661  */
    break;

  case 173:
#line 750 "ldgram.y" /* yacc.c:1661  */
    { (yyval.token) = '/'; }
#line 3302 "ldgram.c" /* yacc.c:1661  */
    break;

  case 174:
#line 752 "ldgram.y" /* yacc.c:1661  */
    { (yyval.token) = LSHIFT; }
#line 3308 "ldgram.c" /* yacc.c:1661  */
    break;

  case 175:
#line 754 "ldgram.y" /* yacc.c:1661  */
    { (yyval.token) = RSHIFT; }
#line 3314 "ldgram.c" /* yacc.c:1661  */
    break;

  case 176:
#line 756 "ldgram.y" /* yacc.c:1661  */
    { (yyval.token) = '&'; }
#line 3320 "ldgram.c" /* yacc.c:1661  */
    break;

  case 177:
#line 758 "ldgram.y" /* yacc.c:1661  */
    { (yyval.token) = '|'; }
#line 3326 "ldgram.c" /* yacc.c:1661  */
    break;

  case 180:
#line 768 "ldgram.y" /* yacc.c:1661  */
    {
		  lang_add_assignment (exp_assign ((yyvsp[-2].name), (yyvsp[0].etree), FALSE));
		}
#line 3334 "ldgram.c" /* yacc.c:1661  */
    break;

  case 181:
#line 772 "ldgram.y" /* yacc.c:1661  */
    {
		  lang_add_assignment (exp_assign ((yyvsp[-2].name),
						   exp_binop ((yyvsp[-1].token),
							      exp_nameop (NAME,
									  (yyvsp[-2].name)),
							      (yyvsp[0].etree)), FALSE));
		}
#line 3346 "ldgram.c" /* yacc.c:1661  */
    break;

  case 182:
#line 780 "ldgram.y" /* yacc.c:1661  */
    {
		  lang_add_assignment (exp_assign ((yyvsp[-3].name), (yyvsp[-1].etree), TRUE));
		}
#line 3354 "ldgram.c" /* yacc.c:1661  */
    break;

  case 183:
#line 784 "ldgram.y" /* yacc.c:1661  */
    {
		  lang_add_assignment (exp_provide ((yyvsp[-3].name), (yyvsp[-1].etree), FALSE));
		}
#line 3362 "ldgram.c" /* yacc.c:1661  */
    break;

  case 184:
#line 788 "ldgram.y" /* yacc.c:1661  */
    {
		  lang_add_assignment (exp_provide ((yyvsp[-3].name), (yyvsp[-1].etree), TRUE));
		}
#line 3370 "ldgram.c" /* yacc.c:1661  */
    break;

  case 192:
#line 811 "ldgram.y" /* yacc.c:1661  */
    { region = lang_memory_region_lookup ((yyvsp[0].name), TRUE); }
#line 3376 "ldgram.c" /* yacc.c:1661  */
    break;

  case 193:
#line 814 "ldgram.y" /* yacc.c:1661  */
    {}
#line 3382 "ldgram.c" /* yacc.c:1661  */
    break;

  case 194:
#line 816 "ldgram.y" /* yacc.c:1661  */
    { ldlex_script (); ldfile_open_command_file((yyvsp[0].name)); }
#line 3388 "ldgram.c" /* yacc.c:1661  */
    break;

  case 195:
#line 818 "ldgram.y" /* yacc.c:1661  */
    { ldlex_popstate (); }
#line 3394 "ldgram.c" /* yacc.c:1661  */
    break;

  case 196:
#line 823 "ldgram.y" /* yacc.c:1661  */
    {
		  region->origin_exp = (yyvsp[0].etree);
		  region->current = region->origin;
		}
#line 3403 "ldgram.c" /* yacc.c:1661  */
    break;

  case 197:
#line 831 "ldgram.y" /* yacc.c:1661  */
    {
		  region->length_exp = (yyvsp[0].etree);
		}
#line 3411 "ldgram.c" /* yacc.c:1661  */
    break;

  case 198:
#line 838 "ldgram.y" /* yacc.c:1661  */
    { /* dummy action to avoid bison 1.25 error message */ }
#line 3417 "ldgram.c" /* yacc.c:1661  */
    break;

  case 202:
#line 849 "ldgram.y" /* yacc.c:1661  */
    { lang_set_flags (region, (yyvsp[0].name), 0); }
#line 3423 "ldgram.c" /* yacc.c:1661  */
    break;

  case 203:
#line 851 "ldgram.y" /* yacc.c:1661  */
    { lang_set_flags (region, (yyvsp[0].name), 1); }
#line 3429 "ldgram.c" /* yacc.c:1661  */
    break;

  case 204:
#line 856 "ldgram.y" /* yacc.c:1661  */
    { lang_startup((yyvsp[-1].name)); }
#line 3435 "ldgram.c" /* yacc.c:1661  */
    break;

  case 206:
#line 862 "ldgram.y" /* yacc.c:1661  */
    { ldemul_hll((char *)NULL); }
#line 3441 "ldgram.c" /* yacc.c:1661  */
    break;

  case 207:
#line 867 "ldgram.y" /* yacc.c:1661  */
    { ldemul_hll((yyvsp[0].name)); }
#line 3447 "ldgram.c" /* yacc.c:1661  */
    break;

  case 208:
#line 869 "ldgram.y" /* yacc.c:1661  */
    { ldemul_hll((yyvsp[0].name)); }
#line 3453 "ldgram.c" /* yacc.c:1661  */
    break;

  case 210:
#line 877 "ldgram.y" /* yacc.c:1661  */
    { ldemul_syslib((yyvsp[0].name)); }
#line 3459 "ldgram.c" /* yacc.c:1661  */
    break;

  case 212:
#line 883 "ldgram.y" /* yacc.c:1661  */
    { lang_float(TRUE); }
#line 3465 "ldgram.c" /* yacc.c:1661  */
    break;

  case 213:
#line 885 "ldgram.y" /* yacc.c:1661  */
    { lang_float(FALSE); }
#line 3471 "ldgram.c" /* yacc.c:1661  */
    break;

  case 214:
#line 890 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.nocrossref) = NULL;
		}
#line 3479 "ldgram.c" /* yacc.c:1661  */
    break;

  case 215:
#line 894 "ldgram.y" /* yacc.c:1661  */
    {
		  struct lang_nocrossref *n;

		  n = (struct lang_nocrossref *) xmalloc (sizeof *n);
		  n->name = (yyvsp[-1].name);
		  n->next = (yyvsp[0].nocrossref);
		  (yyval.nocrossref) = n;
		}
#line 3492 "ldgram.c" /* yacc.c:1661  */
    break;

  case 216:
#line 903 "ldgram.y" /* yacc.c:1661  */
    {
		  struct lang_nocrossref *n;

		  n = (struct lang_nocrossref *) xmalloc (sizeof *n);
		  n->name = (yyvsp[-2].name);
		  n->next = (yyvsp[0].nocrossref);
		  (yyval.nocrossref) = n;
		}
#line 3505 "ldgram.c" /* yacc.c:1661  */
    break;

  case 217:
#line 913 "ldgram.y" /* yacc.c:1661  */
    { ldlex_expression (); }
#line 3511 "ldgram.c" /* yacc.c:1661  */
    break;

  case 218:
#line 915 "ldgram.y" /* yacc.c:1661  */
    { ldlex_popstate (); (yyval.etree)=(yyvsp[0].etree);}
#line 3517 "ldgram.c" /* yacc.c:1661  */
    break;

  case 219:
#line 920 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_unop ('-', (yyvsp[0].etree)); }
#line 3523 "ldgram.c" /* yacc.c:1661  */
    break;

  case 220:
#line 922 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = (yyvsp[-1].etree); }
#line 3529 "ldgram.c" /* yacc.c:1661  */
    break;

  case 221:
#line 924 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_unop ((int) (yyvsp[-3].integer),(yyvsp[-1].etree)); }
#line 3535 "ldgram.c" /* yacc.c:1661  */
    break;

  case 222:
#line 926 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_unop ('!', (yyvsp[0].etree)); }
#line 3541 "ldgram.c" /* yacc.c:1661  */
    break;

  case 223:
#line 928 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = (yyvsp[0].etree); }
#line 3547 "ldgram.c" /* yacc.c:1661  */
    break;

  case 224:
#line 930 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_unop ('~', (yyvsp[0].etree));}
#line 3553 "ldgram.c" /* yacc.c:1661  */
    break;

  case 225:
#line 933 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop ('*', (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3559 "ldgram.c" /* yacc.c:1661  */
    break;

  case 226:
#line 935 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop ('/', (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3565 "ldgram.c" /* yacc.c:1661  */
    break;

  case 227:
#line 937 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop ('%', (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3571 "ldgram.c" /* yacc.c:1661  */
    break;

  case 228:
#line 939 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop ('+', (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3577 "ldgram.c" /* yacc.c:1661  */
    break;

  case 229:
#line 941 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop ('-' , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3583 "ldgram.c" /* yacc.c:1661  */
    break;

  case 230:
#line 943 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop (LSHIFT , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3589 "ldgram.c" /* yacc.c:1661  */
    break;

  case 231:
#line 945 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop (RSHIFT , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3595 "ldgram.c" /* yacc.c:1661  */
    break;

  case 232:
#line 947 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop (EQ , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3601 "ldgram.c" /* yacc.c:1661  */
    break;

  case 233:
#line 949 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop (NE , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3607 "ldgram.c" /* yacc.c:1661  */
    break;

  case 234:
#line 951 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop (LE , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3613 "ldgram.c" /* yacc.c:1661  */
    break;

  case 235:
#line 953 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop (GE , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3619 "ldgram.c" /* yacc.c:1661  */
    break;

  case 236:
#line 955 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop ('<' , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3625 "ldgram.c" /* yacc.c:1661  */
    break;

  case 237:
#line 957 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop ('>' , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3631 "ldgram.c" /* yacc.c:1661  */
    break;

  case 238:
#line 959 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop ('&' , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3637 "ldgram.c" /* yacc.c:1661  */
    break;

  case 239:
#line 961 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop ('^' , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3643 "ldgram.c" /* yacc.c:1661  */
    break;

  case 240:
#line 963 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop ('|' , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3649 "ldgram.c" /* yacc.c:1661  */
    break;

  case 241:
#line 965 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_trinop ('?' , (yyvsp[-4].etree), (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3655 "ldgram.c" /* yacc.c:1661  */
    break;

  case 242:
#line 967 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop (ANDAND , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3661 "ldgram.c" /* yacc.c:1661  */
    break;

  case 243:
#line 969 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop (OROR , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3667 "ldgram.c" /* yacc.c:1661  */
    break;

  case 244:
#line 971 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_nameop (DEFINED, (yyvsp[-1].name)); }
#line 3673 "ldgram.c" /* yacc.c:1661  */
    break;

  case 245:
#line 973 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_bigintop ((yyvsp[0].bigint).integer, (yyvsp[0].bigint).str); }
#line 3679 "ldgram.c" /* yacc.c:1661  */
    break;

  case 246:
#line 975 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_nameop (SIZEOF_HEADERS,0); }
#line 3685 "ldgram.c" /* yacc.c:1661  */
    break;

  case 247:
#line 978 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_nameop (ALIGNOF,(yyvsp[-1].name)); }
#line 3691 "ldgram.c" /* yacc.c:1661  */
    break;

  case 248:
#line 980 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_nameop (SIZEOF,(yyvsp[-1].name)); }
#line 3697 "ldgram.c" /* yacc.c:1661  */
    break;

  case 249:
#line 982 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_nameop (ADDR,(yyvsp[-1].name)); }
#line 3703 "ldgram.c" /* yacc.c:1661  */
    break;

  case 250:
#line 984 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_nameop (LOADADDR,(yyvsp[-1].name)); }
#line 3709 "ldgram.c" /* yacc.c:1661  */
    break;

  case 251:
#line 986 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_nameop (CONSTANT,(yyvsp[-1].name)); }
#line 3715 "ldgram.c" /* yacc.c:1661  */
    break;

  case 252:
#line 988 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_unop (ABSOLUTE, (yyvsp[-1].etree)); }
#line 3721 "ldgram.c" /* yacc.c:1661  */
    break;

  case 253:
#line 990 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_unop (ALIGN_K,(yyvsp[-1].etree)); }
#line 3727 "ldgram.c" /* yacc.c:1661  */
    break;

  case 254:
#line 992 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop (ALIGN_K,(yyvsp[-3].etree),(yyvsp[-1].etree)); }
#line 3733 "ldgram.c" /* yacc.c:1661  */
    break;

  case 255:
#line 994 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop (DATA_SEGMENT_ALIGN, (yyvsp[-3].etree), (yyvsp[-1].etree)); }
#line 3739 "ldgram.c" /* yacc.c:1661  */
    break;

  case 256:
#line 996 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop (DATA_SEGMENT_RELRO_END, (yyvsp[-1].etree), (yyvsp[-3].etree)); }
#line 3745 "ldgram.c" /* yacc.c:1661  */
    break;

  case 257:
#line 998 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_unop (DATA_SEGMENT_END, (yyvsp[-1].etree)); }
#line 3751 "ldgram.c" /* yacc.c:1661  */
    break;

  case 258:
#line 1000 "ldgram.y" /* yacc.c:1661  */
    { /* The operands to the expression node are
			     placed in the opposite order from the way
			     in which they appear in the script as
			     that allows us to reuse more code in
			     fold_binary.  */
			  (yyval.etree) = exp_binop (SEGMENT_START,
					  (yyvsp[-1].etree),
					  exp_nameop (NAME, (yyvsp[-3].name))); }
#line 3764 "ldgram.c" /* yacc.c:1661  */
    break;

  case 259:
#line 1009 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_unop (ALIGN_K,(yyvsp[-1].etree)); }
#line 3770 "ldgram.c" /* yacc.c:1661  */
    break;

  case 260:
#line 1011 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_nameop (NAME,(yyvsp[0].name)); }
#line 3776 "ldgram.c" /* yacc.c:1661  */
    break;

  case 261:
#line 1013 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop (MAX_K, (yyvsp[-3].etree), (yyvsp[-1].etree) ); }
#line 3782 "ldgram.c" /* yacc.c:1661  */
    break;

  case 262:
#line 1015 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_binop (MIN_K, (yyvsp[-3].etree), (yyvsp[-1].etree) ); }
#line 3788 "ldgram.c" /* yacc.c:1661  */
    break;

  case 263:
#line 1017 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_assert ((yyvsp[-3].etree), (yyvsp[-1].name)); }
#line 3794 "ldgram.c" /* yacc.c:1661  */
    break;

  case 264:
#line 1019 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_nameop (ORIGIN, (yyvsp[-1].name)); }
#line 3800 "ldgram.c" /* yacc.c:1661  */
    break;

  case 265:
#line 1021 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_nameop (LENGTH, (yyvsp[-1].name)); }
#line 3806 "ldgram.c" /* yacc.c:1661  */
    break;

  case 266:
#line 1023 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = exp_unop (LOG2CEIL, (yyvsp[-1].etree)); }
#line 3812 "ldgram.c" /* yacc.c:1661  */
    break;

  case 267:
#line 1028 "ldgram.y" /* yacc.c:1661  */
    { (yyval.name) = (yyvsp[0].name); }
#line 3818 "ldgram.c" /* yacc.c:1661  */
    break;

  case 268:
#line 1029 "ldgram.y" /* yacc.c:1661  */
    { (yyval.name) = 0; }
#line 3824 "ldgram.c" /* yacc.c:1661  */
    break;

  case 269:
#line 1033 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = (yyvsp[-1].etree); }
#line 3830 "ldgram.c" /* yacc.c:1661  */
    break;

  case 270:
#line 1034 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = 0; }
#line 3836 "ldgram.c" /* yacc.c:1661  */
    break;

  case 271:
#line 1038 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = (yyvsp[-1].etree); }
#line 3842 "ldgram.c" /* yacc.c:1661  */
    break;

  case 272:
#line 1039 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = 0; }
#line 3848 "ldgram.c" /* yacc.c:1661  */
    break;

  case 273:
#line 1043 "ldgram.y" /* yacc.c:1661  */
    { (yyval.token) = ALIGN_WITH_INPUT; }
#line 3854 "ldgram.c" /* yacc.c:1661  */
    break;

  case 274:
#line 1044 "ldgram.y" /* yacc.c:1661  */
    { (yyval.token) = 0; }
#line 3860 "ldgram.c" /* yacc.c:1661  */
    break;

  case 275:
#line 1048 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = (yyvsp[-1].etree); }
#line 3866 "ldgram.c" /* yacc.c:1661  */
    break;

  case 276:
#line 1049 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = 0; }
#line 3872 "ldgram.c" /* yacc.c:1661  */
    break;

  case 277:
#line 1053 "ldgram.y" /* yacc.c:1661  */
    { (yyval.token) = ONLY_IF_RO; }
#line 3878 "ldgram.c" /* yacc.c:1661  */
    break;

  case 278:
#line 1054 "ldgram.y" /* yacc.c:1661  */
    { (yyval.token) = ONLY_IF_RW; }
#line 3884 "ldgram.c" /* yacc.c:1661  */
    break;

  case 279:
#line 1055 "ldgram.y" /* yacc.c:1661  */
    { (yyval.token) = SPECIAL; }
#line 3890 "ldgram.c" /* yacc.c:1661  */
    break;

  case 280:
#line 1056 "ldgram.y" /* yacc.c:1661  */
    { (yyval.token) = 0; }
#line 3896 "ldgram.c" /* yacc.c:1661  */
    break;

  case 281:
#line 1059 "ldgram.y" /* yacc.c:1661  */
    { ldlex_expression(); }
#line 3902 "ldgram.c" /* yacc.c:1661  */
    break;

  case 282:
#line 1064 "ldgram.y" /* yacc.c:1661  */
    { ldlex_popstate (); ldlex_script (); }
#line 3908 "ldgram.c" /* yacc.c:1661  */
    break;

  case 283:
#line 1067 "ldgram.y" /* yacc.c:1661  */
    {
			  lang_enter_output_section_statement((yyvsp[-9].name), (yyvsp[-7].etree),
							      sectype,
							      (yyvsp[-5].etree), (yyvsp[-3].etree), (yyvsp[-6].etree), (yyvsp[-1].token), (yyvsp[-4].token));
			}
#line 3918 "ldgram.c" /* yacc.c:1661  */
    break;

  case 284:
#line 1073 "ldgram.y" /* yacc.c:1661  */
    { ldlex_popstate (); ldlex_expression (); }
#line 3924 "ldgram.c" /* yacc.c:1661  */
    break;

  case 285:
#line 1075 "ldgram.y" /* yacc.c:1661  */
    {
		  ldlex_popstate ();
		  lang_leave_output_section_statement ((yyvsp[0].fill), (yyvsp[-3].name), (yyvsp[-1].section_phdr), (yyvsp[-2].name));
		}
#line 3933 "ldgram.c" /* yacc.c:1661  */
    break;

  case 286:
#line 1080 "ldgram.y" /* yacc.c:1661  */
    {}
#line 3939 "ldgram.c" /* yacc.c:1661  */
    break;

  case 287:
#line 1082 "ldgram.y" /* yacc.c:1661  */
    { ldlex_expression (); }
#line 3945 "ldgram.c" /* yacc.c:1661  */
    break;

  case 288:
#line 1084 "ldgram.y" /* yacc.c:1661  */
    { ldlex_popstate (); ldlex_script (); }
#line 3951 "ldgram.c" /* yacc.c:1661  */
    break;

  case 289:
#line 1086 "ldgram.y" /* yacc.c:1661  */
    {
			  lang_enter_overlay ((yyvsp[-5].etree), (yyvsp[-2].etree));
			}
#line 3959 "ldgram.c" /* yacc.c:1661  */
    break;

  case 290:
#line 1091 "ldgram.y" /* yacc.c:1661  */
    { ldlex_popstate (); ldlex_expression (); }
#line 3965 "ldgram.c" /* yacc.c:1661  */
    break;

  case 291:
#line 1093 "ldgram.y" /* yacc.c:1661  */
    {
			  ldlex_popstate ();
			  lang_leave_overlay ((yyvsp[-11].etree), (int) (yyvsp[-12].integer),
					      (yyvsp[0].fill), (yyvsp[-3].name), (yyvsp[-1].section_phdr), (yyvsp[-2].name));
			}
#line 3975 "ldgram.c" /* yacc.c:1661  */
    break;

  case 293:
#line 1103 "ldgram.y" /* yacc.c:1661  */
    { ldlex_expression (); }
#line 3981 "ldgram.c" /* yacc.c:1661  */
    break;

  case 294:
#line 1105 "ldgram.y" /* yacc.c:1661  */
    {
		  ldlex_popstate ();
		  lang_add_assignment (exp_assign (".", (yyvsp[0].etree), FALSE));
		}
#line 3990 "ldgram.c" /* yacc.c:1661  */
    break;

  case 296:
#line 1111 "ldgram.y" /* yacc.c:1661  */
    { ldlex_script (); ldfile_open_command_file((yyvsp[0].name)); }
#line 3996 "ldgram.c" /* yacc.c:1661  */
    break;

  case 297:
#line 1113 "ldgram.y" /* yacc.c:1661  */
    { ldlex_popstate (); }
#line 4002 "ldgram.c" /* yacc.c:1661  */
    break;

  case 298:
#line 1117 "ldgram.y" /* yacc.c:1661  */
    { sectype = noload_section; }
#line 4008 "ldgram.c" /* yacc.c:1661  */
    break;

  case 299:
#line 1118 "ldgram.y" /* yacc.c:1661  */
    { sectype = noalloc_section; }
#line 4014 "ldgram.c" /* yacc.c:1661  */
    break;

  case 300:
#line 1119 "ldgram.y" /* yacc.c:1661  */
    { sectype = noalloc_section; }
#line 4020 "ldgram.c" /* yacc.c:1661  */
    break;

  case 301:
#line 1120 "ldgram.y" /* yacc.c:1661  */
    { sectype = noalloc_section; }
#line 4026 "ldgram.c" /* yacc.c:1661  */
    break;

  case 302:
#line 1121 "ldgram.y" /* yacc.c:1661  */
    { sectype = noalloc_section; }
#line 4032 "ldgram.c" /* yacc.c:1661  */
    break;

  case 304:
#line 1126 "ldgram.y" /* yacc.c:1661  */
    { sectype = normal_section; }
#line 4038 "ldgram.c" /* yacc.c:1661  */
    break;

  case 305:
#line 1127 "ldgram.y" /* yacc.c:1661  */
    { sectype = normal_section; }
#line 4044 "ldgram.c" /* yacc.c:1661  */
    break;

  case 306:
#line 1131 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = (yyvsp[-2].etree); }
#line 4050 "ldgram.c" /* yacc.c:1661  */
    break;

  case 307:
#line 1132 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = (etree_type *)NULL;  }
#line 4056 "ldgram.c" /* yacc.c:1661  */
    break;

  case 308:
#line 1137 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = (yyvsp[-3].etree); }
#line 4062 "ldgram.c" /* yacc.c:1661  */
    break;

  case 309:
#line 1139 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = (yyvsp[-7].etree); }
#line 4068 "ldgram.c" /* yacc.c:1661  */
    break;

  case 310:
#line 1143 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = (yyvsp[-1].etree); }
#line 4074 "ldgram.c" /* yacc.c:1661  */
    break;

  case 311:
#line 1144 "ldgram.y" /* yacc.c:1661  */
    { (yyval.etree) = (etree_type *) NULL;  }
#line 4080 "ldgram.c" /* yacc.c:1661  */
    break;

  case 312:
#line 1149 "ldgram.y" /* yacc.c:1661  */
    { (yyval.integer) = 0; }
#line 4086 "ldgram.c" /* yacc.c:1661  */
    break;

  case 313:
#line 1151 "ldgram.y" /* yacc.c:1661  */
    { (yyval.integer) = 1; }
#line 4092 "ldgram.c" /* yacc.c:1661  */
    break;

  case 314:
#line 1156 "ldgram.y" /* yacc.c:1661  */
    { (yyval.name) = (yyvsp[0].name); }
#line 4098 "ldgram.c" /* yacc.c:1661  */
    break;

  case 315:
#line 1157 "ldgram.y" /* yacc.c:1661  */
    { (yyval.name) = DEFAULT_MEMORY_REGION; }
#line 4104 "ldgram.c" /* yacc.c:1661  */
    break;

  case 316:
#line 1162 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.section_phdr) = NULL;
		}
#line 4112 "ldgram.c" /* yacc.c:1661  */
    break;

  case 317:
#line 1166 "ldgram.y" /* yacc.c:1661  */
    {
		  struct lang_output_section_phdr_list *n;

		  n = ((struct lang_output_section_phdr_list *)
		       xmalloc (sizeof *n));
		  n->name = (yyvsp[0].name);
		  n->used = FALSE;
		  n->next = (yyvsp[-2].section_phdr);
		  (yyval.section_phdr) = n;
		}
#line 4127 "ldgram.c" /* yacc.c:1661  */
    break;

  case 319:
#line 1182 "ldgram.y" /* yacc.c:1661  */
    {
			  ldlex_script ();
			  lang_enter_overlay_section ((yyvsp[0].name));
			}
#line 4136 "ldgram.c" /* yacc.c:1661  */
    break;

  case 320:
#line 1187 "ldgram.y" /* yacc.c:1661  */
    { ldlex_popstate (); ldlex_expression (); }
#line 4142 "ldgram.c" /* yacc.c:1661  */
    break;

  case 321:
#line 1189 "ldgram.y" /* yacc.c:1661  */
    {
			  ldlex_popstate ();
			  lang_leave_overlay_section ((yyvsp[0].fill), (yyvsp[-1].section_phdr));
			}
#line 4151 "ldgram.c" /* yacc.c:1661  */
    break;

  case 326:
#line 1206 "ldgram.y" /* yacc.c:1661  */
    { ldlex_expression (); }
#line 4157 "ldgram.c" /* yacc.c:1661  */
    break;

  case 327:
#line 1207 "ldgram.y" /* yacc.c:1661  */
    { ldlex_popstate (); }
#line 4163 "ldgram.c" /* yacc.c:1661  */
    break;

  case 328:
#line 1209 "ldgram.y" /* yacc.c:1661  */
    {
		  lang_new_phdr ((yyvsp[-5].name), (yyvsp[-3].etree), (yyvsp[-2].phdr).filehdr, (yyvsp[-2].phdr).phdrs, (yyvsp[-2].phdr).at,
				 (yyvsp[-2].phdr).flags);
		}
#line 4172 "ldgram.c" /* yacc.c:1661  */
    break;

  case 329:
#line 1217 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.etree) = (yyvsp[0].etree);

		  if ((yyvsp[0].etree)->type.node_class == etree_name
		      && (yyvsp[0].etree)->type.node_code == NAME)
		    {
		      const char *s;
		      unsigned int i;
		      static const char * const phdr_types[] =
			{
			  "PT_NULL", "PT_LOAD", "PT_DYNAMIC",
			  "PT_INTERP", "PT_NOTE", "PT_SHLIB",
			  "PT_PHDR", "PT_TLS"
			};

		      s = (yyvsp[0].etree)->name.name;
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
#line 4217 "ldgram.c" /* yacc.c:1661  */
    break;

  case 330:
#line 1261 "ldgram.y" /* yacc.c:1661  */
    {
		  memset (&(yyval.phdr), 0, sizeof (struct phdr_info));
		}
#line 4225 "ldgram.c" /* yacc.c:1661  */
    break;

  case 331:
#line 1265 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.phdr) = (yyvsp[0].phdr);
		  if (strcmp ((yyvsp[-2].name), "FILEHDR") == 0 && (yyvsp[-1].etree) == NULL)
		    (yyval.phdr).filehdr = TRUE;
		  else if (strcmp ((yyvsp[-2].name), "PHDRS") == 0 && (yyvsp[-1].etree) == NULL)
		    (yyval.phdr).phdrs = TRUE;
		  else if (strcmp ((yyvsp[-2].name), "FLAGS") == 0 && (yyvsp[-1].etree) != NULL)
		    (yyval.phdr).flags = (yyvsp[-1].etree);
		  else
		    einfo (_("%X%P:%S: PHDRS syntax error at `%s'\n"),
			   NULL, (yyvsp[-2].name));
		}
#line 4242 "ldgram.c" /* yacc.c:1661  */
    break;

  case 332:
#line 1278 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.phdr) = (yyvsp[0].phdr);
		  (yyval.phdr).at = (yyvsp[-2].etree);
		}
#line 4251 "ldgram.c" /* yacc.c:1661  */
    break;

  case 333:
#line 1286 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.etree) = NULL;
		}
#line 4259 "ldgram.c" /* yacc.c:1661  */
    break;

  case 334:
#line 1290 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.etree) = (yyvsp[-1].etree);
		}
#line 4267 "ldgram.c" /* yacc.c:1661  */
    break;

  case 335:
#line 1296 "ldgram.y" /* yacc.c:1661  */
    {
		  ldlex_version_file ();
		  PUSH_ERROR (_("dynamic list"));
		}
#line 4276 "ldgram.c" /* yacc.c:1661  */
    break;

  case 336:
#line 1301 "ldgram.y" /* yacc.c:1661  */
    {
		  ldlex_popstate ();
		  POP_ERROR ();
		}
#line 4285 "ldgram.c" /* yacc.c:1661  */
    break;

  case 340:
#line 1318 "ldgram.y" /* yacc.c:1661  */
    {
		  lang_append_dynamic_list ((yyvsp[-1].versyms));
		}
#line 4293 "ldgram.c" /* yacc.c:1661  */
    break;

  case 341:
#line 1326 "ldgram.y" /* yacc.c:1661  */
    {
		  ldlex_version_file ();
		  PUSH_ERROR (_("VERSION script"));
		}
#line 4302 "ldgram.c" /* yacc.c:1661  */
    break;

  case 342:
#line 1331 "ldgram.y" /* yacc.c:1661  */
    {
		  ldlex_popstate ();
		  POP_ERROR ();
		}
#line 4311 "ldgram.c" /* yacc.c:1661  */
    break;

  case 343:
#line 1340 "ldgram.y" /* yacc.c:1661  */
    {
		  ldlex_version_script ();
		}
#line 4319 "ldgram.c" /* yacc.c:1661  */
    break;

  case 344:
#line 1344 "ldgram.y" /* yacc.c:1661  */
    {
		  ldlex_popstate ();
		}
#line 4327 "ldgram.c" /* yacc.c:1661  */
    break;

  case 347:
#line 1356 "ldgram.y" /* yacc.c:1661  */
    {
		  lang_register_vers_node (NULL, (yyvsp[-2].versnode), NULL);
		}
#line 4335 "ldgram.c" /* yacc.c:1661  */
    break;

  case 348:
#line 1360 "ldgram.y" /* yacc.c:1661  */
    {
		  lang_register_vers_node ((yyvsp[-4].name), (yyvsp[-2].versnode), NULL);
		}
#line 4343 "ldgram.c" /* yacc.c:1661  */
    break;

  case 349:
#line 1364 "ldgram.y" /* yacc.c:1661  */
    {
		  lang_register_vers_node ((yyvsp[-5].name), (yyvsp[-3].versnode), (yyvsp[-1].deflist));
		}
#line 4351 "ldgram.c" /* yacc.c:1661  */
    break;

  case 350:
#line 1371 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.deflist) = lang_add_vers_depend (NULL, (yyvsp[0].name));
		}
#line 4359 "ldgram.c" /* yacc.c:1661  */
    break;

  case 351:
#line 1375 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.deflist) = lang_add_vers_depend ((yyvsp[-1].deflist), (yyvsp[0].name));
		}
#line 4367 "ldgram.c" /* yacc.c:1661  */
    break;

  case 352:
#line 1382 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.versnode) = lang_new_vers_node (NULL, NULL);
		}
#line 4375 "ldgram.c" /* yacc.c:1661  */
    break;

  case 353:
#line 1386 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.versnode) = lang_new_vers_node ((yyvsp[-1].versyms), NULL);
		}
#line 4383 "ldgram.c" /* yacc.c:1661  */
    break;

  case 354:
#line 1390 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.versnode) = lang_new_vers_node ((yyvsp[-1].versyms), NULL);
		}
#line 4391 "ldgram.c" /* yacc.c:1661  */
    break;

  case 355:
#line 1394 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.versnode) = lang_new_vers_node (NULL, (yyvsp[-1].versyms));
		}
#line 4399 "ldgram.c" /* yacc.c:1661  */
    break;

  case 356:
#line 1398 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.versnode) = lang_new_vers_node ((yyvsp[-5].versyms), (yyvsp[-1].versyms));
		}
#line 4407 "ldgram.c" /* yacc.c:1661  */
    break;

  case 357:
#line 1405 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, (yyvsp[0].name), ldgram_vers_current_lang, FALSE);
		}
#line 4415 "ldgram.c" /* yacc.c:1661  */
    break;

  case 358:
#line 1409 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, (yyvsp[0].name), ldgram_vers_current_lang, TRUE);
		}
#line 4423 "ldgram.c" /* yacc.c:1661  */
    break;

  case 359:
#line 1413 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[-2].versyms), (yyvsp[0].name), ldgram_vers_current_lang, FALSE);
		}
#line 4431 "ldgram.c" /* yacc.c:1661  */
    break;

  case 360:
#line 1417 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[-2].versyms), (yyvsp[0].name), ldgram_vers_current_lang, TRUE);
		}
#line 4439 "ldgram.c" /* yacc.c:1661  */
    break;

  case 361:
#line 1421 "ldgram.y" /* yacc.c:1661  */
    {
			  (yyval.name) = ldgram_vers_current_lang;
			  ldgram_vers_current_lang = (yyvsp[-1].name);
			}
#line 4448 "ldgram.c" /* yacc.c:1661  */
    break;

  case 362:
#line 1426 "ldgram.y" /* yacc.c:1661  */
    {
			  struct bfd_elf_version_expr *pat;
			  for (pat = (yyvsp[-2].versyms); pat->next != NULL; pat = pat->next);
			  pat->next = (yyvsp[-8].versyms);
			  (yyval.versyms) = (yyvsp[-2].versyms);
			  ldgram_vers_current_lang = (yyvsp[-3].name);
			}
#line 4460 "ldgram.c" /* yacc.c:1661  */
    break;

  case 363:
#line 1434 "ldgram.y" /* yacc.c:1661  */
    {
			  (yyval.name) = ldgram_vers_current_lang;
			  ldgram_vers_current_lang = (yyvsp[-1].name);
			}
#line 4469 "ldgram.c" /* yacc.c:1661  */
    break;

  case 364:
#line 1439 "ldgram.y" /* yacc.c:1661  */
    {
			  (yyval.versyms) = (yyvsp[-2].versyms);
			  ldgram_vers_current_lang = (yyvsp[-3].name);
			}
#line 4478 "ldgram.c" /* yacc.c:1661  */
    break;

  case 365:
#line 1444 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, "global", ldgram_vers_current_lang, FALSE);
		}
#line 4486 "ldgram.c" /* yacc.c:1661  */
    break;

  case 366:
#line 1448 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[-2].versyms), "global", ldgram_vers_current_lang, FALSE);
		}
#line 4494 "ldgram.c" /* yacc.c:1661  */
    break;

  case 367:
#line 1452 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, "local", ldgram_vers_current_lang, FALSE);
		}
#line 4502 "ldgram.c" /* yacc.c:1661  */
    break;

  case 368:
#line 1456 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[-2].versyms), "local", ldgram_vers_current_lang, FALSE);
		}
#line 4510 "ldgram.c" /* yacc.c:1661  */
    break;

  case 369:
#line 1460 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, "extern", ldgram_vers_current_lang, FALSE);
		}
#line 4518 "ldgram.c" /* yacc.c:1661  */
    break;

  case 370:
#line 1464 "ldgram.y" /* yacc.c:1661  */
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[-2].versyms), "extern", ldgram_vers_current_lang, FALSE);
		}
#line 4526 "ldgram.c" /* yacc.c:1661  */
    break;


#line 4530 "ldgram.c" /* yacc.c:1661  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
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

  /* Else will try to reuse lookahead token after shifting the error
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

  /* Do not reclaim the symbols of the rule whose action triggered
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
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
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

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


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

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
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
  return yyresult;
}
#line 1474 "ldgram.y" /* yacc.c:1906  */

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

/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

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
#define YYBISON_VERSION "3.0.4"

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

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
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
    FORCE_GROUP_ALLOCATION = 304,
    SEGMENT_START = 305,
    INCLUDE = 306,
    MEMORY = 307,
    REGION_ALIAS = 308,
    LD_FEATURE = 309,
    NOLOAD = 310,
    DSECT = 311,
    COPY = 312,
    INFO = 313,
    OVERLAY = 314,
    DEFINED = 315,
    TARGET_K = 316,
    SEARCH_DIR = 317,
    MAP = 318,
    ENTRY = 319,
    NEXT = 320,
    SIZEOF = 321,
    ALIGNOF = 322,
    ADDR = 323,
    LOADADDR = 324,
    MAX_K = 325,
    MIN_K = 326,
    STARTUP = 327,
    HLL = 328,
    SYSLIB = 329,
    FLOAT = 330,
    NOFLOAT = 331,
    NOCROSSREFS = 332,
    NOCROSSREFS_TO = 333,
    ORIGIN = 334,
    FILL = 335,
    LENGTH = 336,
    CREATE_OBJECT_SYMBOLS = 337,
    INPUT = 338,
    GROUP = 339,
    OUTPUT = 340,
    CONSTRUCTORS = 341,
    ALIGNMOD = 342,
    AT = 343,
    SUBALIGN = 344,
    HIDDEN = 345,
    PROVIDE = 346,
    PROVIDE_HIDDEN = 347,
    AS_NEEDED = 348,
    CHIP = 349,
    LIST = 350,
    SECT = 351,
    ABSOLUTE = 352,
    LOAD = 353,
    NEWLINE = 354,
    ENDWORD = 355,
    ORDER = 356,
    NAMEWORD = 357,
    ASSERT_K = 358,
    LOG2CEIL = 359,
    FORMAT = 360,
    PUBLIC = 361,
    DEFSYMEND = 362,
    BASE = 363,
    ALIAS = 364,
    TRUNCATE = 365,
    REL = 366,
    INPUT_SCRIPT = 367,
    INPUT_MRI_SCRIPT = 368,
    INPUT_DEFSYM = 369,
    CASE = 370,
    EXTERN = 371,
    START = 372,
    VERS_TAG = 373,
    VERS_IDENTIFIER = 374,
    GLOBAL = 375,
    LOCAL = 376,
    VERSIONK = 377,
    INPUT_VERSION_SCRIPT = 378,
    KEEP = 379,
    ONLY_IF_RO = 380,
    ONLY_IF_RW = 381,
    SPECIAL = 382,
    INPUT_SECTION_FLAGS = 383,
    ALIGN_WITH_INPUT = 384,
    EXCLUDE_FILE = 385,
    CONSTANT = 386,
    INPUT_DYNAMIC_LIST = 387
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
#define FORCE_GROUP_ALLOCATION 304
#define SEGMENT_START 305
#define INCLUDE 306
#define MEMORY 307
#define REGION_ALIAS 308
#define LD_FEATURE 309
#define NOLOAD 310
#define DSECT 311
#define COPY 312
#define INFO 313
#define OVERLAY 314
#define DEFINED 315
#define TARGET_K 316
#define SEARCH_DIR 317
#define MAP 318
#define ENTRY 319
#define NEXT 320
#define SIZEOF 321
#define ALIGNOF 322
#define ADDR 323
#define LOADADDR 324
#define MAX_K 325
#define MIN_K 326
#define STARTUP 327
#define HLL 328
#define SYSLIB 329
#define FLOAT 330
#define NOFLOAT 331
#define NOCROSSREFS 332
#define NOCROSSREFS_TO 333
#define ORIGIN 334
#define FILL 335
#define LENGTH 336
#define CREATE_OBJECT_SYMBOLS 337
#define INPUT 338
#define GROUP 339
#define OUTPUT 340
#define CONSTRUCTORS 341
#define ALIGNMOD 342
#define AT 343
#define SUBALIGN 344
#define HIDDEN 345
#define PROVIDE 346
#define PROVIDE_HIDDEN 347
#define AS_NEEDED 348
#define CHIP 349
#define LIST 350
#define SECT 351
#define ABSOLUTE 352
#define LOAD 353
#define NEWLINE 354
#define ENDWORD 355
#define ORDER 356
#define NAMEWORD 357
#define ASSERT_K 358
#define LOG2CEIL 359
#define FORMAT 360
#define PUBLIC 361
#define DEFSYMEND 362
#define BASE 363
#define ALIAS 364
#define TRUNCATE 365
#define REL 366
#define INPUT_SCRIPT 367
#define INPUT_MRI_SCRIPT 368
#define INPUT_DEFSYM 369
#define CASE 370
#define EXTERN 371
#define START 372
#define VERS_TAG 373
#define VERS_IDENTIFIER 374
#define GLOBAL 375
#define LOCAL 376
#define VERSIONK 377
#define INPUT_VERSION_SCRIPT 378
#define KEEP 379
#define ONLY_IF_RO 380
#define ONLY_IF_RW 381
#define SPECIAL 382
#define INPUT_SECTION_FLAGS 383
#define ALIGN_WITH_INPUT 384
#define EXCLUDE_FILE 385
#define CONSTANT 386
#define INPUT_DYNAMIC_LIST 387

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

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

#line 440 "ldgram.c" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_LDGRAM_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 457 "ldgram.c" /* yacc.c:358  */

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

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
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
#define YYLAST   1947

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  156
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  131
/* YYNRULES -- Number of rules.  */
#define YYNRULES  373
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  810

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   387

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   154,     2,     2,     2,    34,    21,     2,
      37,   151,    32,    30,   149,    31,     2,    33,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    16,   150,
      24,    10,    25,    15,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   152,     2,   153,    20,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    58,    19,    59,   155,     2,     2,     2,
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
     141,   142,   143,   144,   145,   146,   147,   148
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
     339,   341,   343,   345,   344,   348,   351,   350,   354,   358,
     362,   363,   365,   367,   369,   374,   374,   379,   382,   385,
     388,   391,   394,   398,   397,   403,   402,   408,   407,   415,
     419,   420,   421,   425,   427,   428,   428,   436,   440,   444,
     451,   458,   465,   472,   479,   486,   493,   500,   507,   514,
     521,   530,   548,   569,   582,   591,   602,   611,   622,   631,
     640,   644,   653,   657,   665,   667,   666,   673,   674,   678,
     679,   684,   689,   690,   695,   699,   699,   703,   702,   709,
     710,   713,   715,   719,   721,   723,   725,   727,   732,   739,
     741,   745,   747,   749,   751,   753,   755,   757,   759,   764,
     764,   769,   773,   781,   785,   789,   797,   797,   801,   804,
     804,   807,   808,   813,   812,   818,   817,   824,   832,   840,
     841,   845,   846,   850,   852,   857,   862,   863,   868,   870,
     876,   878,   880,   884,   886,   892,   895,   904,   915,   915,
     921,   923,   925,   927,   929,   931,   934,   936,   938,   940,
     942,   944,   946,   948,   950,   952,   954,   956,   958,   960,
     962,   964,   966,   968,   970,   972,   974,   976,   979,   981,
     983,   985,   987,   989,   991,   993,   995,   997,   999,  1001,
    1010,  1012,  1014,  1016,  1018,  1020,  1022,  1024,  1030,  1031,
    1035,  1036,  1040,  1041,  1045,  1046,  1050,  1051,  1055,  1056,
    1057,  1058,  1061,  1066,  1069,  1075,  1077,  1061,  1084,  1086,
    1088,  1093,  1095,  1083,  1105,  1107,  1105,  1113,  1112,  1119,
    1120,  1121,  1122,  1123,  1127,  1128,  1129,  1133,  1134,  1139,
    1140,  1145,  1146,  1151,  1152,  1157,  1159,  1164,  1167,  1180,
    1184,  1189,  1191,  1182,  1199,  1202,  1204,  1208,  1209,  1208,
    1218,  1263,  1266,  1279,  1288,  1291,  1298,  1298,  1310,  1311,
    1315,  1319,  1328,  1328,  1342,  1342,  1352,  1353,  1357,  1361,
    1365,  1372,  1376,  1384,  1387,  1391,  1395,  1399,  1406,  1410,
    1414,  1418,  1423,  1422,  1436,  1435,  1445,  1449,  1453,  1457,
    1461,  1465,  1471,  1473
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
  "FORCE_GROUP_ALLOCATION", "SEGMENT_START", "INCLUDE", "MEMORY",
  "REGION_ALIAS", "LD_FEATURE", "NOLOAD", "DSECT", "COPY", "INFO",
  "OVERLAY", "DEFINED", "TARGET_K", "SEARCH_DIR", "MAP", "ENTRY", "NEXT",
  "SIZEOF", "ALIGNOF", "ADDR", "LOADADDR", "MAX_K", "MIN_K", "STARTUP",
  "HLL", "SYSLIB", "FLOAT", "NOFLOAT", "NOCROSSREFS", "NOCROSSREFS_TO",
  "ORIGIN", "FILL", "LENGTH", "CREATE_OBJECT_SYMBOLS", "INPUT", "GROUP",
  "OUTPUT", "CONSTRUCTORS", "ALIGNMOD", "AT", "SUBALIGN", "HIDDEN",
  "PROVIDE", "PROVIDE_HIDDEN", "AS_NEEDED", "CHIP", "LIST", "SECT",
  "ABSOLUTE", "LOAD", "NEWLINE", "ENDWORD", "ORDER", "NAMEWORD",
  "ASSERT_K", "LOG2CEIL", "FORMAT", "PUBLIC", "DEFSYMEND", "BASE", "ALIAS",
  "TRUNCATE", "REL", "INPUT_SCRIPT", "INPUT_MRI_SCRIPT", "INPUT_DEFSYM",
  "CASE", "EXTERN", "START", "VERS_TAG", "VERS_IDENTIFIER", "GLOBAL",
  "LOCAL", "VERSIONK", "INPUT_VERSION_SCRIPT", "KEEP", "ONLY_IF_RO",
  "ONLY_IF_RW", "SPECIAL", "INPUT_SECTION_FLAGS", "ALIGN_WITH_INPUT",
  "EXCLUDE_FILE", "CONSTANT", "INPUT_DYNAMIC_LIST", "','", "';'", "')'",
  "'['", "']'", "'!'", "'~'", "$accept", "file", "filename", "defsym_expr",
  "$@1", "mri_script_file", "$@2", "mri_script_lines",
  "mri_script_command", "$@3", "ordernamelist", "mri_load_name_list",
  "mri_abs_name_list", "casesymlist", "extern_name_list", "$@4",
  "extern_name_list_body", "script_file", "$@5", "ifile_list", "ifile_p1",
  "$@6", "$@7", "input_list", "$@8", "input_list1", "@9", "@10", "@11",
  "sections", "sec_or_group_p1", "statement_anywhere", "$@12",
  "wildcard_name", "wildcard_spec", "sect_flag_list", "sect_flags",
  "exclude_name_list", "section_NAME_list", "input_section_spec_no_keep",
  "input_section_spec", "$@13", "statement", "$@14", "$@15",
  "statement_list", "statement_list_opt", "length", "fill_exp", "fill_opt",
  "assign_op", "end", "assignment", "opt_comma", "memory",
  "memory_spec_list_opt", "memory_spec_list", "memory_spec", "$@16",
  "$@17", "origin_spec", "length_spec", "attributes_opt",
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
  "opt_semicolon", YY_NULLPTR
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
     379,   380,   381,   382,   383,   384,   385,   386,   387,    44,
      59,    41,    91,    93,    33,   126
};
# endif

#define YYPACT_NINF -656

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-656)))

#define YYTABLE_NINF -345

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     152,  -656,  -656,  -656,  -656,  -656,    78,  -656,  -656,  -656,
    -656,  -656,    77,  -656,    66,  -656,    53,  -656,   860,  1690,
     113,   104,    89,    66,  -656,   111,    53,  -656,   527,   170,
     173,   114,   102,  -656,   208,  -656,  -656,   197,   195,   221,
     235,   236,   240,   242,   246,   256,   262,   275,  -656,  -656,
     280,   283,   284,  -656,   286,   290,   291,   298,  -656,   300,
    -656,  -656,  -656,  -656,   -19,  -656,  -656,  -656,  -656,  -656,
    -656,  -656,   209,  -656,   344,   197,   346,   705,  -656,   348,
     350,   353,  -656,  -656,   357,   361,   363,   705,   364,   366,
     369,  -656,   370,   241,   705,  -656,   371,  -656,   354,   360,
     320,   230,   104,  -656,  -656,  -656,   329,   244,  -656,  -656,
    -656,  -656,  -656,  -656,  -656,  -656,  -656,  -656,  -656,  -656,
    -656,   388,   391,   392,   394,  -656,  -656,    27,   395,   399,
     402,   197,   197,   403,   197,    20,  -656,   410,   410,  -656,
     378,   197,   414,   415,   416,   384,  -656,  -656,  -656,  -656,
     365,    29,  -656,    42,  -656,  -656,   705,   705,   705,   387,
     389,   390,   396,   397,  -656,   405,   424,   425,   427,   428,
     429,   432,   433,   434,   435,   441,   442,   444,   445,   447,
     705,   705,   816,   407,  -656,   276,  -656,   282,     8,  -656,
    -656,   493,  1896,   287,  -656,  -656,   336,  -656,   436,  -656,
    -656,  1896,   374,   111,   111,   289,   128,   439,   297,   128,
    -656,   705,  -656,   322,    34,  -656,  -656,   -51,   335,  -656,
    -656,   197,   440,    50,  -656,   351,   355,   359,   362,   377,
     400,   401,  -656,  -656,    83,    93,    45,   404,   406,   409,
      31,  -656,   412,   485,   495,   498,   705,   413,    66,   705,
     705,  -656,   705,   705,  -656,  -656,  1072,   705,   705,   705,
     705,   705,   507,   510,   705,   511,   512,   515,   518,   705,
     705,   521,   525,   705,   705,   705,   539,  -656,  -656,   705,
     705,   705,   705,   705,   705,   705,   705,   705,   705,   705,
     705,   705,   705,   705,   705,   705,   705,   705,   705,   705,
     705,  1896,   543,   544,  -656,   546,   705,   705,  1896,   234,
     554,  -656,    46,  -656,   417,   418,  -656,  -656,   561,  -656,
    -656,  -656,   -76,  -656,  1896,   527,  -656,   197,  -656,  -656,
    -656,  -656,  -656,  -656,  -656,   562,  -656,  -656,   938,   533,
    -656,  -656,  -656,    27,   567,  -656,  -656,  -656,  -656,  -656,
    -656,  -656,   197,  -656,   197,   410,  -656,  -656,  -656,  -656,
    -656,  -656,   535,    28,   430,  -656,  -656,  -656,  -656,  1497,
    -656,    18,  1896,  1896,  1714,  1896,  1896,  -656,   870,  1092,
    1517,  1537,  1112,   438,   454,  1132,   456,   457,   460,   463,
    1557,  1577,   464,   469,  1152,  1630,  1172,   470,  1856,  1913,
    1052,  1187,  1321,  1455,   570,   570,   273,   273,   273,   273,
     352,   352,   217,   217,  -656,  -656,  -656,  1896,  1896,  1896,
    -656,  -656,  -656,  1896,  1896,  -656,  -656,  -656,  -656,   580,
     111,   134,   128,   531,  -656,  -656,   -75,   579,  -656,   619,
     579,   705,   475,  -656,     4,   576,    27,  -656,   474,  -656,
    -656,  -656,  -656,  -656,  -656,   589,    39,  -656,   476,   477,
     478,   629,  -656,  -656,   705,  -656,  -656,   705,   705,  -656,
     705,  -656,  -656,  -656,  -656,  -656,  -656,   705,   705,  -656,
    -656,  -656,   630,  -656,  -656,   705,  -656,   486,   621,  -656,
    -656,  -656,   258,   601,  1833,   625,   542,  -656,  -656,  1876,
     550,  -656,  1896,    24,   647,  -656,   648,     0,  -656,   558,
     618,  -656,    31,  -656,  -656,  -656,   622,  -656,  -656,  -656,
     516,  1207,  1227,  1247,  1267,  1287,  1307,   517,  1896,   128,
     610,   111,   111,  -656,  -656,  -656,  -656,  -656,  -656,   522,
     705,   -18,   659,  -656,   640,   642,   368,  -656,  -656,   542,
     620,   644,   645,  -656,   532,  -656,  -656,  -656,   674,   537,
    -656,    11,    31,  -656,  -656,  -656,  -656,  -656,  -656,  -656,
    -656,  -656,  -656,   538,   486,  -656,  1342,  -656,   705,   650,
     545,  -656,   584,  -656,   705,    24,   705,   541,  -656,  -656,
     596,  -656,    17,    31,   128,   635,   239,  1362,   705,  -656,
     584,   660,  -656,  1629,  1382,  -656,  1402,  -656,  -656,   686,
    -656,  -656,    37,  -656,   670,   694,  -656,  1422,  -656,   705,
     653,  -656,  -656,    24,  -656,  -656,   705,  -656,  -656,   -81,
    1442,  -656,  -656,  -656,  1477,  -656,  -656,  -656,   654,  -656,
    -656,   676,  -656,    36,   699,   765,  -656,  -656,  -656,   443,
    -656,  -656,  -656,  -656,  -656,  -656,  -656,   680,   681,   682,
     683,   197,   684,  -656,  -656,  -656,   685,   687,   688,  -656,
      87,  -656,   690,    33,  -656,  -656,  -656,   765,   664,   691,
     -19,   671,   706,   220,   304,    95,    95,  -656,  -656,   693,
    -656,   733,    95,  -656,   703,  -656,   -52,    87,   704,    87,
     708,  -656,  -656,  -656,  -656,   765,   742,   643,   711,   712,
     599,   714,   602,   715,   717,   604,   608,   609,   765,   611,
    -656,   705,    15,  -656,    -1,  -656,    14,    81,  -656,    87,
     143,   -28,    87,   706,   612,   702,  -656,   739,  -656,    95,
      95,  -656,    95,  -656,    95,    95,  -656,  -656,  -656,   731,
    -656,  1650,   617,   624,   766,  -656,    95,  -656,  -656,  -656,
    -656,   164,   643,  -656,  -656,   768,   106,   626,   627,    19,
     628,   631,  -656,   772,  -656,  -656,  -656,  -656,  -656,  -656,
    -656,  -656,   779,  -656,   633,   634,    95,   652,   661,   662,
     106,   106,  -656,  -656,   537,  -656,  -656,   663,  -656,  -656,
     -19,  -656,  -656,  -656,  -656,  -656,   537,   537,  -656,  -656
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    59,    10,     8,   342,   336,     0,     2,    62,     3,
      13,     6,     0,     4,     0,     5,     0,     1,    60,    11,
       0,   353,     0,   343,   346,     0,   337,   338,     0,     0,
       0,     0,     0,    79,     0,    81,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   213,   214,
       0,     0,     0,    83,     0,     0,     0,     0,   115,     0,
      72,    61,    64,    70,     0,    63,    66,    67,    68,    69,
      65,    71,     0,    16,     0,     0,     0,     0,    17,     0,
       0,     0,    19,    46,     0,     0,     0,     0,     0,     0,
      51,    54,     0,     0,     0,   359,   370,   358,   366,   368,
       0,     0,   353,   347,   366,   368,     0,     0,   339,   171,
     172,   173,   174,   218,   175,   176,   177,   178,   218,   112,
     325,     0,     0,     0,     0,     7,    86,   190,     0,     0,
       0,     0,     0,     0,     0,     0,   212,   215,   215,    95,
       0,     0,     0,     0,     0,     0,    54,   180,   179,   114,
       0,     0,    40,     0,   246,   261,     0,     0,     0,     0,
       0,     0,     0,     0,   247,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    14,     0,    49,    31,    47,    32,    18,    33,
      23,     0,    36,     0,    37,    52,    38,    39,     0,    42,
      12,     9,     0,     0,     0,     0,   354,     0,     0,   341,
     181,     0,   182,     0,     0,    91,    92,     0,     0,    62,
     193,     0,     0,   187,   192,     0,     0,     0,     0,     0,
       0,     0,   207,   209,   187,   187,   215,     0,     0,     0,
       0,    95,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    13,     0,     0,   224,   220,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   223,   225,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    25,     0,     0,    45,     0,     0,     0,    22,     0,
       0,    56,    55,   364,     0,     0,   348,   361,   371,   360,
     367,   369,     0,   340,   219,   282,   109,     0,   288,   294,
     111,   110,   327,   324,   326,     0,    76,    78,   344,   199,
     195,   188,   186,     0,     0,    94,    73,    74,    85,   113,
     205,   206,     0,   210,     0,   215,   216,    88,    89,    82,
      97,   100,     0,    96,     0,    75,   218,   218,   218,     0,
      90,     0,    27,    28,    43,    29,    30,   221,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   244,
     243,   241,   240,   239,   233,   234,   237,   238,   235,   236,
     231,   232,   229,   230,   226,   227,   228,    15,    26,    24,
      50,    48,    44,    20,    21,    35,    34,    53,    57,     0,
       0,   355,   356,     0,   351,   349,     0,   305,   297,     0,
     305,     0,     0,    87,     0,     0,   190,   191,     0,   208,
     211,   217,   103,    99,   102,     0,     0,    84,     0,     0,
       0,     0,   345,    41,     0,   254,   260,     0,     0,   258,
       0,   245,   222,   249,   248,   250,   251,     0,     0,   265,
     266,   253,     0,   267,   252,     0,    58,   372,   369,   362,
     352,   350,     0,     0,   305,     0,   271,   112,   312,     0,
     313,   295,   330,   331,     0,   203,     0,     0,   201,     0,
       0,    93,     0,   107,    98,   101,     0,   183,   184,   185,
       0,     0,     0,     0,     0,     0,     0,     0,   242,   373,
       0,     0,     0,   299,   300,   301,   302,   303,   306,     0,
       0,     0,     0,   308,     0,   273,     0,   311,   314,   271,
       0,   334,     0,   328,     0,   204,   200,   202,     0,   187,
     196,     0,     0,   105,   116,   255,   256,   257,   259,   262,
     263,   264,   365,     0,   372,   304,     0,   307,     0,     0,
     275,   298,   277,   112,     0,   331,     0,     0,    77,   218,
       0,   104,     0,     0,   357,     0,   305,     0,     0,   274,
     277,     0,   289,     0,     0,   332,     0,   329,   197,     0,
     194,   108,     0,   363,     0,     0,   270,     0,   283,     0,
       0,   296,   335,   331,   218,   106,     0,   309,   272,   281,
       0,   290,   333,   198,     0,   278,   279,   280,     0,   276,
     319,   305,   284,     0,     0,   161,   320,   291,   310,   138,
     119,   118,   163,   164,   165,   166,   167,     0,     0,     0,
       0,     0,     0,   148,   150,   155,     0,     0,     0,   149,
       0,   120,     0,     0,   144,   152,   160,   162,     0,     0,
       0,     0,   316,     0,     0,     0,     0,   157,   218,     0,
     145,     0,     0,   117,     0,   137,   187,     0,   139,     0,
       0,   159,   285,   218,   147,   161,     0,   269,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   161,     0,
     168,     0,     0,   131,     0,   135,     0,     0,   140,     0,
     187,   187,     0,   316,     0,     0,   315,     0,   317,     0,
       0,   151,     0,   122,     0,     0,   123,   124,   130,     0,
     154,     0,   117,     0,     0,   133,     0,   134,   136,   142,
     141,   187,   269,   153,   321,     0,   170,     0,     0,     0,
       0,     0,   158,     0,   146,   132,   121,   143,   317,   317,
     268,   218,     0,   292,     0,     0,     0,     0,     0,     0,
     170,   170,   169,   318,   187,   126,   125,     0,   127,   128,
       0,   286,   322,   293,   129,   156,   187,   187,   287,   323
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -656,  -656,   -68,  -656,  -656,  -656,  -656,   547,  -656,  -656,
    -656,  -656,  -656,  -656,   649,  -656,  -656,  -656,  -656,   574,
    -656,  -656,  -656,   553,  -656,  -444,  -656,  -656,  -656,  -656,
    -471,   -13,  -656,  1027,  -383,  -656,  -656,    54,  -615,    79,
    -656,  -656,   122,  -656,  -656,  -656,  -613,  -656,    23,  -635,
    -656,  -655,  -420,  -221,  -656,   380,  -656,   462,  -656,  -656,
    -656,  -656,  -656,  -656,   308,  -656,  -656,  -656,  -656,  -656,
    -656,  -129,  -112,  -656,   -77,    49,   267,  -656,  -656,   223,
    -656,  -656,  -656,  -656,  -656,  -656,  -656,  -656,  -656,  -656,
    -656,  -656,  -656,  -656,  -656,  -656,  -467,   411,  -656,  -656,
      84,  -511,  -656,  -656,  -656,  -656,  -656,  -656,  -656,  -656,
    -656,  -656,  -540,  -656,  -656,  -656,  -656,   801,  -656,  -656,
    -656,  -656,  -656,   581,   -20,  -656,   726,   -14,  -656,  -656,
     279
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     6,   126,    11,    12,     9,    10,    19,    93,   251,
     188,   187,   185,   196,   197,   198,   312,     7,     8,    18,
      61,   140,   219,   239,   240,   363,   512,   593,   562,    62,
     213,   330,   145,   671,   672,   724,   673,   726,   696,   674,
     675,   722,   676,   689,   718,   677,   678,   679,   719,   783,
     118,   149,    64,   729,    65,   222,   223,   224,   339,   446,
     559,   610,   445,   507,   508,    66,    67,   234,    68,   235,
      69,   237,   720,   211,   256,   738,   545,   580,   600,   602,
     638,   331,   437,   629,   645,   733,   806,   439,   620,   640,
     682,   794,   440,   550,   497,   539,   495,   496,   500,   549,
     707,   766,   643,   681,   779,   807,    70,   214,   334,   441,
     587,   503,   553,   585,    15,    16,    26,    27,   106,    13,
      14,    71,    72,    23,    24,   436,   100,   101,   532,   430,
     530
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
     182,   210,   343,   103,   505,    63,   212,   152,   505,   238,
     192,   107,   304,   352,   354,   453,   454,   201,   693,   752,
     754,   453,   454,   693,   125,   704,   546,   542,   551,   650,
     650,   220,   453,   454,   650,   360,   361,   698,   332,   249,
     646,   453,   454,   514,   515,   605,   651,   651,   650,   236,
     428,   651,   252,   533,   534,   535,   536,   537,   434,   490,
     635,   636,   637,   228,   229,   651,   231,   233,   561,   694,
     658,   659,   660,   242,   435,   491,    21,   462,    17,   254,
     255,    20,   730,   632,   731,   693,  -189,   694,   658,   659,
     660,   693,   735,   333,   221,   647,   650,   342,   335,   693,
     336,   728,   650,   277,   278,   749,   301,   356,    95,  -189,
     650,    25,   603,   651,   308,    95,   781,   761,   592,   651,
     455,   342,   782,    94,    21,   760,   455,   651,   552,   615,
     147,   148,   317,   538,   324,   708,   709,   455,   317,   123,
     362,   694,   658,   659,   660,   805,   455,   102,   516,   612,
     755,   556,    22,   340,   506,   801,   802,   305,   506,   667,
     456,   668,   591,   121,   122,   756,   456,   670,   611,   369,
     786,   232,   372,   373,   644,   375,   376,   456,   250,   668,
     378,   379,   380,   381,   382,   699,   456,   385,   625,   314,
     315,   253,   390,   391,   355,   429,   394,   395,   396,   342,
      22,   125,   398,   399,   400,   401,   402,   403,   404,   405,
     406,   407,   408,   409,   410,   411,   412,   413,   414,   415,
     416,   417,   418,   419,   693,   680,   451,   711,   119,   423,
     424,   120,   342,   668,   351,   650,    96,   425,   426,    97,
      98,    99,   342,    96,   353,   124,    97,   104,   105,   295,
     296,   297,   651,   127,   458,   459,   460,   680,   128,   438,
     318,   154,   155,   319,   320,   321,   318,   790,   791,   319,
     320,   488,   129,   130,   708,   709,   541,   131,   614,   132,
       1,     2,     3,   133,   449,   680,   450,   695,   156,   157,
     700,     4,   342,   134,   759,   158,   159,   160,   680,   135,
       5,   291,   292,   293,   294,   295,   296,   297,   693,   161,
     162,   163,   136,   342,   695,   777,   695,   137,   164,   650,
     138,   139,   710,   141,   165,    63,   325,   142,   143,   533,
     534,   535,   536,   537,   166,   144,   651,   146,   590,   167,
     168,   169,   170,   171,   172,   173,   758,   150,   151,   695,
     153,   103,   183,   174,   184,   175,   200,   186,   713,   714,
     494,   189,   499,   494,   502,   190,   711,   191,   193,   194,
     203,   176,   325,   195,   199,   202,   204,   177,   178,   205,
     206,   326,   293,   294,   295,   296,   297,   521,   208,   327,
     522,   523,   215,   524,   209,   216,   217,   328,   218,   225,
     525,   526,    44,   226,   581,   179,   227,   230,   528,   538,
     154,   155,   180,   181,   236,   241,   487,   299,   243,   244,
     245,   246,   329,   248,   257,   302,   258,   259,    55,    56,
      57,   303,   313,   260,   261,   327,   309,   156,   157,   316,
     311,    58,   262,   328,   158,   159,   160,   323,    44,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   161,   162,
     163,   263,   264,   576,   265,   266,   267,   164,   329,   268,
     269,   270,   271,   165,    55,    56,    57,   608,   272,   273,
    -117,   274,   275,   166,   276,   310,   337,    58,   167,   168,
     169,   170,   171,   172,   173,   366,   154,   155,   322,   341,
     344,   597,   174,   306,   175,   367,   345,   604,   368,   606,
     346,   383,   633,   347,   384,   386,   387,   573,   574,   388,
     176,   617,   389,   156,   157,   392,   177,   178,   348,   393,
     158,   159,   160,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   630,   397,   161,   162,   163,   420,   421,   634,
     422,   349,   350,   164,   179,   357,   300,   358,   427,   165,
     359,   180,   181,   365,   370,   433,   442,   431,   432,   166,
     444,   448,   452,   803,   167,   168,   169,   170,   171,   172,
     173,   457,   154,   155,   486,   808,   809,   470,   174,   489,
     175,   734,   509,   687,   287,   288,   289,   290,   291,   292,
     293,   294,   295,   296,   297,   471,   176,   473,   474,   156,
     157,   475,   177,   178,   476,   479,   492,   159,   160,   493,
     480,   484,   154,   155,   504,   511,   513,   517,   518,   519,
     161,   162,   163,   520,   527,   498,   529,   531,   540,   164,
     179,   543,   307,   548,   751,   165,   544,   180,   181,   156,
     157,   554,   555,   558,   560,   166,   158,   159,   160,   563,
     167,   168,   169,   170,   171,   172,   173,   564,   571,   572,
     161,   162,   163,   575,   174,   577,   175,   578,   583,   164,
     579,   584,   586,   588,   589,   165,   342,   598,   594,   601,
     599,   607,   176,   609,   613,   166,   624,   619,   177,   178,
     167,   168,   169,   170,   171,   172,   173,   626,   154,   155,
     627,   631,   642,   541,   174,   648,   175,   683,   684,   685,
     686,   688,   690,   702,   691,   692,   179,   697,   703,   705,
     721,   706,   176,   180,   181,   156,   157,   723,   177,   178,
     727,  -117,   158,   159,   160,   732,   736,   737,   739,   740,
     741,   742,   744,   743,   745,   746,   161,   162,   163,   747,
     748,   764,   750,   763,   765,   164,   179,   772,  -138,   649,
     775,   165,   780,   180,   181,   774,   789,   784,   785,   787,
     650,   166,   788,   793,   795,   796,   167,   168,   169,   170,
     171,   172,   173,   338,   364,   247,   769,   651,   374,   701,
     174,   753,   175,   798,   792,   447,   652,   653,   654,   655,
     656,   778,   799,   800,   804,   557,   582,   762,   176,   657,
     658,   659,   660,   618,   177,   178,   510,   108,   207,   371,
       0,   279,   661,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   296,
     297,   501,   179,   595,     0,     0,     0,     0,     0,   180,
     181,   662,     0,   663,    28,     0,     0,   664,     0,     0,
       0,    55,    56,    57,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   665,   279,     0,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   294,   295,   296,   297,   666,    29,    30,    31,   667,
       0,   668,     0,     0,     0,   669,     0,   670,     0,     0,
       0,    32,    33,    34,    35,    36,     0,    37,    38,    39,
      40,     0,     0,     0,     0,     0,     0,    41,    42,    43,
      44,     0,    28,     0,     0,     0,     0,     0,    45,    46,
      47,    48,    49,    50,    51,     0,     0,     0,     0,    52,
      53,    54,     0,     0,     0,   298,    55,    56,    57,     0,
       0,     0,     0,     0,   443,     0,     0,     0,     0,    58,
       0,     0,     0,     0,    29,    30,    31,     0,     0,     0,
       0,     0,    59,     0,     0,     0,     0,     0,  -344,    32,
      33,    34,    35,    36,     0,    37,    38,    39,    40,     0,
      60,     0,     0,     0,     0,    41,    42,    43,    44,   464,
       0,   465,     0,     0,     0,     0,    45,    46,    47,    48,
      49,    50,    51,     0,     0,     0,     0,    52,    53,    54,
       0,     0,     0,     0,    55,    56,    57,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    58,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      59,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   297,   279,    60,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   297,   279,     0,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   297,   279,     0,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   297,   279,     0,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   297,   279,     0,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   297,   279,     0,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   297,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     296,   297,   279,   377,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     296,   297,   279,   466,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     296,   297,   279,   469,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     296,   297,   279,   472,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     296,   297,   279,   481,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     296,   297,   279,   483,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     296,   297,   284,   285,   286,   287,   288,   289,   290,   291,
     292,   293,   294,   295,   296,   297,     0,   279,   565,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   297,   279,   566,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   297,   279,   567,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   297,   279,   568,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   297,   279,   569,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   297,   279,   570,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   297,   285,   286,   287,
     288,   289,   290,   291,   292,   293,   294,   295,   296,   297,
       0,     0,   279,   596,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     296,   297,   279,   616,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     296,   297,   279,   622,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     296,   297,   279,   623,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     296,   297,   279,   628,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     296,   297,   279,   639,   280,   281,   282,   283,   284,   285,
     286,   287,   288,   289,   290,   291,   292,   293,   294,   295,
     296,   297,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   641,     0,
       0,     0,     0,   325,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,   461,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   294,   295,   296,   297,   279,   467,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   294,   295,   296,   297,     0,   468,     0,   621,     0,
       0,     0,     0,     0,    73,     0,   327,     0,     0,     0,
       0,     0,     0,     0,   328,     0,   477,     0,     0,    44,
     712,   715,   716,   717,     0,     0,     0,     0,    73,   725,
       0,     0,     0,     0,     0,     0,   478,     0,    74,   329,
       0,     0,     0,     0,     0,    55,    56,    57,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    58,     0,
     463,     0,    74,   757,   712,     0,     0,    75,     0,     0,
       0,     0,     0,     0,     0,     0,   767,   768,     0,   725,
       0,   770,   771,     0,     0,     0,     0,     0,     0,   482,
       0,    75,     0,   776,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    76,     0,     0,   757,     0,     0,   773,
      77,    78,    79,    80,    81,   -43,    82,    83,    84,     0,
       0,    85,    86,   797,    87,    88,    89,    76,     0,     0,
       0,    90,    91,    92,    77,    78,    79,    80,    81,     0,
      82,    83,    84,     0,     0,    85,    86,     0,    87,    88,
      89,     0,     0,     0,     0,    90,    91,    92,   279,     0,
     280,   281,   282,   283,   284,   285,   286,   287,   288,   289,
     290,   291,   292,   293,   294,   295,   296,   297,     0,     0,
     541,   279,   485,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   296,
     297,   279,   547,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   296,
     297,   279,     0,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   296,
     297,   281,   282,   283,   284,   285,   286,   287,   288,   289,
     290,   291,   292,   293,   294,   295,   296,   297
};

static const yytype_int16 yycheck[] =
{
      77,   113,   223,    23,     4,    18,   118,    75,     4,   138,
      87,    25,     4,   234,   235,     4,     5,    94,     4,     4,
      21,     4,     5,     4,     4,   680,   497,   494,     4,    15,
      15,     4,     4,     5,    15,     4,     5,     4,     4,    10,
       4,     4,     5,     4,     5,   585,    32,    32,    15,     4,
       4,    32,    10,    71,    72,    73,    74,    75,   134,   134,
     141,   142,   143,   131,   132,    32,   134,   135,   512,    54,
      55,    56,    57,   141,   150,   150,    58,    59,     0,   156,
     157,     4,   697,   623,   699,     4,    36,    54,    55,    56,
      57,     4,   705,    59,    67,    59,    15,   149,   149,     4,
     151,   153,    15,   180,   181,   718,   183,   236,     4,    59,
      15,    58,   583,    32,   191,     4,    10,   732,   562,    32,
     109,   149,    16,    10,    58,   153,   109,    32,   104,   596,
     149,   150,     4,   151,   211,    54,    55,   109,     4,    37,
     109,    54,    55,    56,    57,   800,   109,    58,   109,   593,
     151,   151,   134,   221,   154,   790,   791,   149,   154,   144,
     149,   146,   151,    49,    50,   151,   149,   152,   151,   246,
     151,   151,   249,   250,   641,   252,   253,   149,   149,   146,
     257,   258,   259,   260,   261,   152,   149,   264,   151,   203,
     204,   149,   269,   270,   149,   149,   273,   274,   275,   149,
     134,     4,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   294,   295,   296,
     297,   298,   299,   300,     4,   645,   355,   146,    58,   306,
     307,    58,   149,   146,   151,    15,   132,     3,     4,   135,
     136,   137,   149,   132,   151,    37,   135,   136,   137,    32,
      33,    34,    32,    58,   366,   367,   368,   677,    37,   327,
     132,     3,     4,   135,   136,   137,   132,   778,   779,   135,
     136,   137,    37,    37,    54,    55,    37,    37,    39,    37,
     128,   129,   130,    37,   352,   705,   354,   670,    30,    31,
     673,   139,   149,    37,   151,    37,    38,    39,   718,    37,
     148,    28,    29,    30,    31,    32,    33,    34,     4,    51,
      52,    53,    37,   149,   697,   151,   699,    37,    60,    15,
      37,    37,   102,    37,    66,   338,     4,    37,    37,    71,
      72,    73,    74,    75,    76,    37,    32,    37,   559,    81,
      82,    83,    84,    85,    86,    87,   729,   138,     4,   732,
       4,   371,     4,    95,     4,    97,   115,     4,    54,    55,
     437,     4,   439,   440,   441,     4,   146,     4,     4,     3,
      16,   113,     4,     4,     4,     4,    16,   119,   120,    59,
     150,    59,    30,    31,    32,    33,    34,   464,    59,    67,
     467,   468,     4,   470,   150,     4,     4,    75,     4,     4,
     477,   478,    80,     4,    36,   147,     4,     4,   485,   151,
       3,     4,   154,   155,     4,    37,   430,    10,     4,     4,
       4,    37,   100,    58,    37,   149,    37,    37,   106,   107,
     108,   149,    58,    37,    37,    67,   149,    30,    31,   150,
       4,   119,    37,    75,    37,    38,    39,   150,    80,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    51,    52,
      53,    37,    37,   540,    37,    37,    37,    60,   100,    37,
      37,    37,    37,    66,   106,   107,   108,   589,    37,    37,
      37,    37,    37,    76,    37,   149,   151,   119,    81,    82,
      83,    84,    85,    86,    87,    10,     3,     4,    59,    59,
     149,   578,    95,    10,    97,    10,   151,   584,    10,   586,
     151,     4,   624,   151,     4,     4,     4,   531,   532,     4,
     113,   598,     4,    30,    31,     4,   119,   120,   151,     4,
      37,    38,    39,     6,     7,     8,     9,    10,    11,    12,
      13,    14,   619,     4,    51,    52,    53,     4,     4,   626,
       4,   151,   151,    60,   147,   151,   149,   151,     4,    66,
     151,   154,   155,   151,   151,     4,     4,   150,   150,    76,
      37,     4,    37,   794,    81,    82,    83,    84,    85,    86,
      87,   151,     3,     4,     4,   806,   807,   149,    95,    58,
      97,   703,    16,   661,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,   151,   113,   151,   151,    30,
      31,   151,   119,   120,   151,   151,    37,    38,    39,    40,
     151,   151,     3,     4,   149,   151,    37,   151,   151,   151,
      51,    52,    53,     4,     4,    16,   150,    16,    37,    60,
     147,    16,   149,    93,   721,    66,   104,   154,   155,    30,
      31,     4,     4,    95,    36,    76,    37,    38,    39,    37,
      81,    82,    83,    84,    85,    86,    87,   151,   151,    59,
      51,    52,    53,   151,    95,    16,    97,    37,    58,    60,
      38,    37,    37,   151,    10,    66,   149,    37,   150,   105,
     145,   150,   113,    97,    59,    76,    10,    37,   119,   120,
      81,    82,    83,    84,    85,    86,    87,    37,     3,     4,
      16,    58,    58,    37,    95,    16,    97,    37,    37,    37,
      37,    37,    37,    59,    37,    37,   147,    37,    37,    58,
      37,    25,   113,   154,   155,    30,    31,     4,   119,   120,
      37,    37,    37,    38,    39,    37,     4,   104,    37,    37,
     151,    37,    37,   151,    37,   151,    51,    52,    53,   151,
     151,    59,   151,   151,    25,    60,   147,    36,   151,     4,
       4,    66,     4,   154,   155,   151,     4,   151,   151,   151,
      15,    76,   151,     4,   151,   151,    81,    82,    83,    84,
      85,    86,    87,   219,   241,   146,   742,    32,   251,   677,
      95,   722,    97,   151,   781,   343,    41,    42,    43,    44,
      45,   762,   151,   151,   151,   507,   549,   733,   113,    54,
      55,    56,    57,   600,   119,   120,   446,    26,   102,   248,
      -1,    15,    67,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,   440,   147,   574,    -1,    -1,    -1,    -1,    -1,   154,
     155,    96,    -1,    98,     4,    -1,    -1,   102,    -1,    -1,
      -1,   106,   107,   108,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   119,    15,    -1,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,   140,    46,    47,    48,   144,
      -1,   146,    -1,    -1,    -1,   150,    -1,   152,    -1,    -1,
      -1,    61,    62,    63,    64,    65,    -1,    67,    68,    69,
      70,    -1,    -1,    -1,    -1,    -1,    -1,    77,    78,    79,
      80,    -1,     4,    -1,    -1,    -1,    -1,    -1,    88,    89,
      90,    91,    92,    93,    94,    -1,    -1,    -1,    -1,    99,
     100,   101,    -1,    -1,    -1,   149,   106,   107,   108,    -1,
      -1,    -1,    -1,    -1,    36,    -1,    -1,    -1,    -1,   119,
      -1,    -1,    -1,    -1,    46,    47,    48,    -1,    -1,    -1,
      -1,    -1,   132,    -1,    -1,    -1,    -1,    -1,   138,    61,
      62,    63,    64,    65,    -1,    67,    68,    69,    70,    -1,
     150,    -1,    -1,    -1,    -1,    77,    78,    79,    80,   149,
      -1,   151,    -1,    -1,    -1,    -1,    88,    89,    90,    91,
      92,    93,    94,    -1,    -1,    -1,    -1,    99,   100,   101,
      -1,    -1,    -1,    -1,   106,   107,   108,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     132,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    15,   150,    17,
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
      28,    29,    30,    31,    32,    33,    34,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    15,   151,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    15,   151,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    15,   151,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    15,   151,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    15,   151,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    15,   151,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    -1,    15,   151,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    15,   151,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    15,   151,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    15,   151,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    15,   151,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    15,   151,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      -1,    -1,    15,   151,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    15,   151,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    15,   151,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    15,   151,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    15,   151,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    15,   151,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   151,    -1,
      -1,    -1,    -1,     4,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    15,   149,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    15,   149,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    -1,   149,    -1,    59,    -1,
      -1,    -1,    -1,    -1,     4,    -1,    67,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    -1,   149,    -1,    -1,    80,
     683,   684,   685,   686,    -1,    -1,    -1,    -1,     4,   692,
      -1,    -1,    -1,    -1,    -1,    -1,   149,    -1,    38,   100,
      -1,    -1,    -1,    -1,    -1,   106,   107,   108,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,
      36,    -1,    38,   726,   727,    -1,    -1,    67,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   739,   740,    -1,   742,
      -1,   744,   745,    -1,    -1,    -1,    -1,    -1,    -1,   149,
      -1,    67,    -1,   756,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   103,    -1,    -1,   769,    -1,    -1,   149,
     110,   111,   112,   113,   114,   115,   116,   117,   118,    -1,
      -1,   121,   122,   786,   124,   125,   126,   103,    -1,    -1,
      -1,   131,   132,   133,   110,   111,   112,   113,   114,    -1,
     116,   117,   118,    -1,    -1,   121,   122,    -1,   124,   125,
     126,    -1,    -1,    -1,    -1,   131,   132,   133,    15,    -1,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    -1,    -1,
      37,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    15,    -1,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,   128,   129,   130,   139,   148,   157,   173,   174,   161,
     162,   159,   160,   275,   276,   270,   271,     0,   175,   163,
       4,    58,   134,   279,   280,    58,   272,   273,     4,    46,
      47,    48,    61,    62,    63,    64,    65,    67,    68,    69,
      70,    77,    78,    79,    80,    88,    89,    90,    91,    92,
      93,    94,    99,   100,   101,   106,   107,   108,   119,   132,
     150,   176,   185,   187,   208,   210,   221,   222,   224,   226,
     262,   277,   278,     4,    38,    67,   103,   110,   111,   112,
     113,   114,   116,   117,   118,   121,   122,   124,   125,   126,
     131,   132,   133,   164,    10,     4,   132,   135,   136,   137,
     282,   283,    58,   280,   136,   137,   274,   283,   273,     6,
       7,     8,     9,    10,    11,    12,    13,    14,   206,    58,
      58,    49,    50,    37,    37,     4,   158,    58,    37,    37,
      37,    37,    37,    37,    37,    37,    37,    37,    37,    37,
     177,    37,    37,    37,    37,   188,    37,   149,   150,   207,
     138,     4,   158,     4,     3,     4,    30,    31,    37,    38,
      39,    51,    52,    53,    60,    66,    76,    81,    82,    83,
      84,    85,    86,    87,    95,    97,   113,   119,   120,   147,
     154,   155,   230,     4,     4,   168,     4,   167,   166,     4,
       4,     4,   230,     4,     3,     4,   169,   170,   171,     4,
     115,   230,     4,    16,    16,    59,   150,   282,    59,   150,
     228,   229,   228,   186,   263,     4,     4,     4,     4,   178,
       4,    67,   211,   212,   213,     4,     4,     4,   158,   158,
       4,   158,   151,   158,   223,   225,     4,   227,   227,   179,
     180,    37,   158,     4,     4,     4,    37,   170,    58,    10,
     149,   165,    10,   149,   230,   230,   230,    37,    37,    37,
      37,    37,    37,    37,    37,    37,    37,    37,    37,    37,
      37,    37,    37,    37,    37,    37,    37,   230,   230,    15,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,   149,    10,
     149,   230,   149,   149,     4,   149,    10,   149,   230,   149,
     149,     4,   172,    58,   283,   283,   150,     4,   132,   135,
     136,   137,    59,   150,   230,     4,    59,    67,    75,   100,
     187,   237,     4,    59,   264,   149,   151,   151,   175,   214,
     158,    59,   149,   209,   149,   151,   151,   151,   151,   151,
     151,   151,   209,   151,   209,   149,   227,   151,   151,   151,
       4,     5,   109,   181,   179,   151,    10,    10,    10,   230,
     151,   279,   230,   230,   163,   230,   230,   151,   230,   230,
     230,   230,   230,     4,     4,   230,     4,     4,     4,     4,
     230,   230,     4,     4,   230,   230,   230,     4,   230,   230,
     230,   230,   230,   230,   230,   230,   230,   230,   230,   230,
     230,   230,   230,   230,   230,   230,   230,   230,   230,   230,
       4,     4,     4,   230,   230,     3,     4,     4,     4,   149,
     285,   150,   150,     4,   134,   150,   281,   238,   158,   243,
     248,   265,     4,    36,    37,   218,   215,   213,     4,   158,
     158,   227,    37,     4,     5,   109,   149,   151,   228,   228,
     228,   149,    59,    36,   149,   151,   151,   149,   149,   151,
     149,   151,   151,   151,   151,   151,   151,   149,   149,   151,
     151,   151,   149,   151,   151,    16,     4,   283,   137,    58,
     134,   150,    37,    40,   230,   252,   253,   250,    16,   230,
     254,   253,   230,   267,   149,     4,   154,   219,   220,    16,
     211,   151,   182,    37,     4,     5,   109,   151,   151,   151,
       4,   230,   230,   230,   230,   230,   230,     4,   230,   150,
     286,    16,   284,    71,    72,    73,    74,    75,   151,   251,
      37,    37,   252,    16,   104,   232,   186,    16,    93,   255,
     249,     4,   104,   268,     4,     4,   151,   220,    95,   216,
      36,   181,   184,    37,   151,   151,   151,   151,   151,   151,
     151,   151,    59,   283,   283,   151,   230,    16,    37,    38,
     233,    36,   232,    58,    37,   269,    37,   266,   151,    10,
     209,   151,   181,   183,   150,   286,   151,   230,    37,   145,
     234,   105,   235,   186,   230,   268,   230,   150,   228,    97,
     217,   151,   181,    59,    39,   252,   151,   230,   235,    37,
     244,    59,   151,   151,    10,   151,    37,    16,   151,   239,
     230,    58,   268,   228,   230,   141,   142,   143,   236,   151,
     245,   151,    58,   258,   252,   240,     4,    59,    16,     4,
      15,    32,    41,    42,    43,    44,    45,    54,    55,    56,
      57,    67,    96,    98,   102,   119,   140,   144,   146,   150,
     152,   189,   190,   192,   195,   196,   198,   201,   202,   203,
     208,   259,   246,    37,    37,    37,    37,   158,    37,   199,
      37,    37,    37,     4,    54,   190,   194,    37,     4,   152,
     190,   198,    59,    37,   207,    58,    25,   256,    54,    55,
     102,   146,   189,    54,    55,   189,   189,   189,   200,   204,
     228,    37,   197,     4,   191,   189,   193,    37,   153,   209,
     194,   194,    37,   241,   228,   202,     4,   104,   231,    37,
      37,   151,    37,   151,    37,    37,   151,   151,   151,   202,
     151,   230,     4,   195,    21,   151,   151,   189,   190,   151,
     153,   194,   256,   151,    59,    25,   257,   189,   189,   193,
     189,   189,    36,   149,   151,     4,   189,   151,   231,   260,
       4,    10,    16,   205,   151,   151,   151,   151,   151,     4,
     257,   257,   204,     4,   247,   151,   151,   189,   151,   151,
     151,   205,   205,   209,   151,   207,   242,   261,   209,   209
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   156,   157,   157,   157,   157,   157,   158,   160,   159,
     162,   161,   163,   163,   164,   164,   164,   164,   164,   164,
     164,   164,   164,   164,   164,   164,   164,   164,   164,   164,
     164,   164,   164,   164,   164,   164,   164,   164,   164,   164,
     165,   164,   164,   164,   166,   166,   166,   167,   167,   168,
     168,   169,   169,   169,   171,   170,   172,   172,   172,   174,
     173,   175,   175,   176,   176,   176,   176,   176,   176,   176,
     176,   176,   176,   176,   176,   176,   176,   176,   176,   176,
     176,   176,   176,   177,   176,   176,   178,   176,   176,   176,
     176,   176,   176,   176,   176,   180,   179,   181,   181,   181,
     181,   181,   181,   182,   181,   183,   181,   184,   181,   185,
     186,   186,   186,   187,   187,   188,   187,   189,   189,   189,
     190,   190,   190,   190,   190,   190,   190,   190,   190,   190,
     190,   191,   191,   192,   193,   193,   194,   194,   195,   195,
     195,   195,   195,   195,   196,   197,   196,   198,   198,   198,
     198,   198,   198,   198,   198,   199,   198,   200,   198,   201,
     201,   202,   202,   203,   203,   203,   203,   203,   204,   205,
     205,   206,   206,   206,   206,   206,   206,   206,   206,   207,
     207,   208,   208,   208,   208,   208,   209,   209,   210,   211,
     211,   212,   212,   214,   213,   215,   213,   216,   217,   218,
     218,   219,   219,   220,   220,   221,   222,   222,   223,   223,
     224,   225,   225,   226,   226,   227,   227,   227,   229,   228,
     230,   230,   230,   230,   230,   230,   230,   230,   230,   230,
     230,   230,   230,   230,   230,   230,   230,   230,   230,   230,
     230,   230,   230,   230,   230,   230,   230,   230,   230,   230,
     230,   230,   230,   230,   230,   230,   230,   230,   230,   230,
     230,   230,   230,   230,   230,   230,   230,   230,   231,   231,
     232,   232,   233,   233,   234,   234,   235,   235,   236,   236,
     236,   236,   238,   239,   240,   241,   242,   237,   243,   244,
     245,   246,   247,   237,   248,   249,   237,   250,   237,   251,
     251,   251,   251,   251,   252,   252,   252,   253,   253,   253,
     253,   254,   254,   255,   255,   256,   256,   257,   257,   258,
     259,   260,   261,   258,   262,   263,   263,   265,   266,   264,
     267,   268,   268,   268,   269,   269,   271,   270,   272,   272,
     273,   274,   276,   275,   278,   277,   279,   279,   280,   280,
     280,   281,   281,   282,   282,   282,   282,   282,   283,   283,
     283,   283,   284,   283,   285,   283,   283,   283,   283,   283,
     283,   283,   286,   286
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
       1,     1,     4,     0,     5,     4,     0,     5,     4,     4,
       4,     3,     3,     6,     4,     0,     2,     1,     3,     2,
       1,     3,     2,     0,     5,     0,     7,     0,     6,     4,
       2,     2,     0,     4,     2,     0,     7,     1,     1,     1,
       1,     5,     4,     4,     4,     7,     7,     7,     7,     8,
       4,     1,     3,     4,     2,     1,     3,     1,     1,     2,
       3,     4,     4,     5,     1,     0,     5,     2,     1,     1,
       1,     4,     1,     4,     4,     0,     8,     0,     5,     2,
       1,     0,     1,     1,     1,     1,     1,     1,     1,     2,
       0,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     3,     3,     6,     6,     6,     1,     0,     4,     1,
       0,     3,     1,     0,     7,     0,     5,     3,     3,     0,
       3,     1,     2,     1,     2,     4,     4,     3,     3,     1,
       4,     3,     0,     1,     1,     0,     2,     3,     0,     2,
       2,     3,     4,     2,     2,     2,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     5,     3,     3,     4,     1,     1,     4,     4,
       4,     4,     4,     4,     4,     6,     6,     6,     4,     6,
       4,     1,     6,     6,     6,     4,     4,     4,     3,     0,
       4,     0,     4,     0,     1,     0,     4,     0,     1,     1,
       1,     0,     0,     0,     0,     0,     0,    20,     0,     0,
       0,     0,     0,    18,     0,     0,     7,     0,     5,     1,
       1,     1,     1,     1,     3,     0,     2,     3,     2,     6,
      10,     2,     1,     0,     1,     2,     0,     0,     3,     0,
       0,     0,     0,    11,     4,     0,     2,     0,     0,     6,
       1,     0,     3,     5,     0,     3,     0,     2,     1,     2,
       4,     2,     0,     2,     0,     5,     1,     2,     4,     5,
       6,     1,     2,     0,     2,     4,     4,     8,     1,     1,
       3,     3,     0,     9,     0,     7,     1,     3,     1,     3,
       1,     3,     0,     1
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
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
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
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
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
#line 178 "ldgram.y" /* yacc.c:1646  */
    { ldlex_defsym(); }
#line 2367 "ldgram.c" /* yacc.c:1646  */
    break;

  case 9:
#line 180 "ldgram.y" /* yacc.c:1646  */
    {
		  ldlex_popstate();
		  lang_add_assignment (exp_defsym ((yyvsp[-2].name), (yyvsp[0].etree)));
		}
#line 2376 "ldgram.c" /* yacc.c:1646  */
    break;

  case 10:
#line 188 "ldgram.y" /* yacc.c:1646  */
    {
		  ldlex_mri_script ();
		  PUSH_ERROR (_("MRI style script"));
		}
#line 2385 "ldgram.c" /* yacc.c:1646  */
    break;

  case 11:
#line 193 "ldgram.y" /* yacc.c:1646  */
    {
		  ldlex_popstate ();
		  mri_draw_tree ();
		  POP_ERROR ();
		}
#line 2395 "ldgram.c" /* yacc.c:1646  */
    break;

  case 16:
#line 208 "ldgram.y" /* yacc.c:1646  */
    {
			einfo(_("%P%F: unrecognised keyword in MRI style script '%s'\n"),(yyvsp[0].name));
			}
#line 2403 "ldgram.c" /* yacc.c:1646  */
    break;

  case 17:
#line 211 "ldgram.y" /* yacc.c:1646  */
    {
			config.map_filename = "-";
			}
#line 2411 "ldgram.c" /* yacc.c:1646  */
    break;

  case 20:
#line 217 "ldgram.y" /* yacc.c:1646  */
    { mri_public((yyvsp[-2].name), (yyvsp[0].etree)); }
#line 2417 "ldgram.c" /* yacc.c:1646  */
    break;

  case 21:
#line 219 "ldgram.y" /* yacc.c:1646  */
    { mri_public((yyvsp[-2].name), (yyvsp[0].etree)); }
#line 2423 "ldgram.c" /* yacc.c:1646  */
    break;

  case 22:
#line 221 "ldgram.y" /* yacc.c:1646  */
    { mri_public((yyvsp[-1].name), (yyvsp[0].etree)); }
#line 2429 "ldgram.c" /* yacc.c:1646  */
    break;

  case 23:
#line 223 "ldgram.y" /* yacc.c:1646  */
    { mri_format((yyvsp[0].name)); }
#line 2435 "ldgram.c" /* yacc.c:1646  */
    break;

  case 24:
#line 225 "ldgram.y" /* yacc.c:1646  */
    { mri_output_section((yyvsp[-2].name), (yyvsp[0].etree));}
#line 2441 "ldgram.c" /* yacc.c:1646  */
    break;

  case 25:
#line 227 "ldgram.y" /* yacc.c:1646  */
    { mri_output_section((yyvsp[-1].name), (yyvsp[0].etree));}
#line 2447 "ldgram.c" /* yacc.c:1646  */
    break;

  case 26:
#line 229 "ldgram.y" /* yacc.c:1646  */
    { mri_output_section((yyvsp[-2].name), (yyvsp[0].etree));}
#line 2453 "ldgram.c" /* yacc.c:1646  */
    break;

  case 27:
#line 231 "ldgram.y" /* yacc.c:1646  */
    { mri_align((yyvsp[-2].name),(yyvsp[0].etree)); }
#line 2459 "ldgram.c" /* yacc.c:1646  */
    break;

  case 28:
#line 233 "ldgram.y" /* yacc.c:1646  */
    { mri_align((yyvsp[-2].name),(yyvsp[0].etree)); }
#line 2465 "ldgram.c" /* yacc.c:1646  */
    break;

  case 29:
#line 235 "ldgram.y" /* yacc.c:1646  */
    { mri_alignmod((yyvsp[-2].name),(yyvsp[0].etree)); }
#line 2471 "ldgram.c" /* yacc.c:1646  */
    break;

  case 30:
#line 237 "ldgram.y" /* yacc.c:1646  */
    { mri_alignmod((yyvsp[-2].name),(yyvsp[0].etree)); }
#line 2477 "ldgram.c" /* yacc.c:1646  */
    break;

  case 33:
#line 241 "ldgram.y" /* yacc.c:1646  */
    { mri_name((yyvsp[0].name)); }
#line 2483 "ldgram.c" /* yacc.c:1646  */
    break;

  case 34:
#line 243 "ldgram.y" /* yacc.c:1646  */
    { mri_alias((yyvsp[-2].name),(yyvsp[0].name),0);}
#line 2489 "ldgram.c" /* yacc.c:1646  */
    break;

  case 35:
#line 245 "ldgram.y" /* yacc.c:1646  */
    { mri_alias ((yyvsp[-2].name), 0, (int) (yyvsp[0].bigint).integer); }
#line 2495 "ldgram.c" /* yacc.c:1646  */
    break;

  case 36:
#line 247 "ldgram.y" /* yacc.c:1646  */
    { mri_base((yyvsp[0].etree)); }
#line 2501 "ldgram.c" /* yacc.c:1646  */
    break;

  case 37:
#line 249 "ldgram.y" /* yacc.c:1646  */
    { mri_truncate ((unsigned int) (yyvsp[0].bigint).integer); }
#line 2507 "ldgram.c" /* yacc.c:1646  */
    break;

  case 40:
#line 253 "ldgram.y" /* yacc.c:1646  */
    { ldlex_script (); ldfile_open_command_file((yyvsp[0].name)); }
#line 2513 "ldgram.c" /* yacc.c:1646  */
    break;

  case 41:
#line 255 "ldgram.y" /* yacc.c:1646  */
    { ldlex_popstate (); }
#line 2519 "ldgram.c" /* yacc.c:1646  */
    break;

  case 42:
#line 257 "ldgram.y" /* yacc.c:1646  */
    { lang_add_entry ((yyvsp[0].name), FALSE); }
#line 2525 "ldgram.c" /* yacc.c:1646  */
    break;

  case 44:
#line 262 "ldgram.y" /* yacc.c:1646  */
    { mri_order((yyvsp[0].name)); }
#line 2531 "ldgram.c" /* yacc.c:1646  */
    break;

  case 45:
#line 263 "ldgram.y" /* yacc.c:1646  */
    { mri_order((yyvsp[0].name)); }
#line 2537 "ldgram.c" /* yacc.c:1646  */
    break;

  case 47:
#line 269 "ldgram.y" /* yacc.c:1646  */
    { mri_load((yyvsp[0].name)); }
#line 2543 "ldgram.c" /* yacc.c:1646  */
    break;

  case 48:
#line 270 "ldgram.y" /* yacc.c:1646  */
    { mri_load((yyvsp[0].name)); }
#line 2549 "ldgram.c" /* yacc.c:1646  */
    break;

  case 49:
#line 275 "ldgram.y" /* yacc.c:1646  */
    { mri_only_load((yyvsp[0].name)); }
#line 2555 "ldgram.c" /* yacc.c:1646  */
    break;

  case 50:
#line 277 "ldgram.y" /* yacc.c:1646  */
    { mri_only_load((yyvsp[0].name)); }
#line 2561 "ldgram.c" /* yacc.c:1646  */
    break;

  case 51:
#line 281 "ldgram.y" /* yacc.c:1646  */
    { (yyval.name) = NULL; }
#line 2567 "ldgram.c" /* yacc.c:1646  */
    break;

  case 54:
#line 288 "ldgram.y" /* yacc.c:1646  */
    { ldlex_expression (); }
#line 2573 "ldgram.c" /* yacc.c:1646  */
    break;

  case 55:
#line 290 "ldgram.y" /* yacc.c:1646  */
    { ldlex_popstate (); }
#line 2579 "ldgram.c" /* yacc.c:1646  */
    break;

  case 56:
#line 294 "ldgram.y" /* yacc.c:1646  */
    { ldlang_add_undef ((yyvsp[0].name), FALSE); }
#line 2585 "ldgram.c" /* yacc.c:1646  */
    break;

  case 57:
#line 296 "ldgram.y" /* yacc.c:1646  */
    { ldlang_add_undef ((yyvsp[0].name), FALSE); }
#line 2591 "ldgram.c" /* yacc.c:1646  */
    break;

  case 58:
#line 298 "ldgram.y" /* yacc.c:1646  */
    { ldlang_add_undef ((yyvsp[0].name), FALSE); }
#line 2597 "ldgram.c" /* yacc.c:1646  */
    break;

  case 59:
#line 302 "ldgram.y" /* yacc.c:1646  */
    { ldlex_both(); }
#line 2603 "ldgram.c" /* yacc.c:1646  */
    break;

  case 60:
#line 304 "ldgram.y" /* yacc.c:1646  */
    { ldlex_popstate(); }
#line 2609 "ldgram.c" /* yacc.c:1646  */
    break;

  case 73:
#line 325 "ldgram.y" /* yacc.c:1646  */
    { lang_add_target((yyvsp[-1].name)); }
#line 2615 "ldgram.c" /* yacc.c:1646  */
    break;

  case 74:
#line 327 "ldgram.y" /* yacc.c:1646  */
    { ldfile_add_library_path ((yyvsp[-1].name), FALSE); }
#line 2621 "ldgram.c" /* yacc.c:1646  */
    break;

  case 75:
#line 329 "ldgram.y" /* yacc.c:1646  */
    { lang_add_output((yyvsp[-1].name), 1); }
#line 2627 "ldgram.c" /* yacc.c:1646  */
    break;

  case 76:
#line 331 "ldgram.y" /* yacc.c:1646  */
    { lang_add_output_format ((yyvsp[-1].name), (char *) NULL,
					    (char *) NULL, 1); }
#line 2634 "ldgram.c" /* yacc.c:1646  */
    break;

  case 77:
#line 334 "ldgram.y" /* yacc.c:1646  */
    { lang_add_output_format ((yyvsp[-5].name), (yyvsp[-3].name), (yyvsp[-1].name), 1); }
#line 2640 "ldgram.c" /* yacc.c:1646  */
    break;

  case 78:
#line 336 "ldgram.y" /* yacc.c:1646  */
    { ldfile_set_output_arch ((yyvsp[-1].name), bfd_arch_unknown); }
#line 2646 "ldgram.c" /* yacc.c:1646  */
    break;

  case 79:
#line 338 "ldgram.y" /* yacc.c:1646  */
    { command_line.force_common_definition = TRUE ; }
#line 2652 "ldgram.c" /* yacc.c:1646  */
    break;

  case 80:
#line 340 "ldgram.y" /* yacc.c:1646  */
    { command_line.force_group_allocation = TRUE ; }
#line 2658 "ldgram.c" /* yacc.c:1646  */
    break;

  case 81:
#line 342 "ldgram.y" /* yacc.c:1646  */
    { command_line.inhibit_common_definition = TRUE ; }
#line 2664 "ldgram.c" /* yacc.c:1646  */
    break;

  case 83:
#line 345 "ldgram.y" /* yacc.c:1646  */
    { lang_enter_group (); }
#line 2670 "ldgram.c" /* yacc.c:1646  */
    break;

  case 84:
#line 347 "ldgram.y" /* yacc.c:1646  */
    { lang_leave_group (); }
#line 2676 "ldgram.c" /* yacc.c:1646  */
    break;

  case 85:
#line 349 "ldgram.y" /* yacc.c:1646  */
    { lang_add_map((yyvsp[-1].name)); }
#line 2682 "ldgram.c" /* yacc.c:1646  */
    break;

  case 86:
#line 351 "ldgram.y" /* yacc.c:1646  */
    { ldlex_script (); ldfile_open_command_file((yyvsp[0].name)); }
#line 2688 "ldgram.c" /* yacc.c:1646  */
    break;

  case 87:
#line 353 "ldgram.y" /* yacc.c:1646  */
    { ldlex_popstate (); }
#line 2694 "ldgram.c" /* yacc.c:1646  */
    break;

  case 88:
#line 355 "ldgram.y" /* yacc.c:1646  */
    {
		  lang_add_nocrossref ((yyvsp[-1].nocrossref));
		}
#line 2702 "ldgram.c" /* yacc.c:1646  */
    break;

  case 89:
#line 359 "ldgram.y" /* yacc.c:1646  */
    {
		  lang_add_nocrossref_to ((yyvsp[-1].nocrossref));
		}
#line 2710 "ldgram.c" /* yacc.c:1646  */
    break;

  case 91:
#line 364 "ldgram.y" /* yacc.c:1646  */
    { lang_add_insert ((yyvsp[0].name), 0); }
#line 2716 "ldgram.c" /* yacc.c:1646  */
    break;

  case 92:
#line 366 "ldgram.y" /* yacc.c:1646  */
    { lang_add_insert ((yyvsp[0].name), 1); }
#line 2722 "ldgram.c" /* yacc.c:1646  */
    break;

  case 93:
#line 368 "ldgram.y" /* yacc.c:1646  */
    { lang_memory_region_alias ((yyvsp[-3].name), (yyvsp[-1].name)); }
#line 2728 "ldgram.c" /* yacc.c:1646  */
    break;

  case 94:
#line 370 "ldgram.y" /* yacc.c:1646  */
    { lang_ld_feature ((yyvsp[-1].name)); }
#line 2734 "ldgram.c" /* yacc.c:1646  */
    break;

  case 95:
#line 374 "ldgram.y" /* yacc.c:1646  */
    { ldlex_inputlist(); }
#line 2740 "ldgram.c" /* yacc.c:1646  */
    break;

  case 96:
#line 376 "ldgram.y" /* yacc.c:1646  */
    { ldlex_popstate(); }
#line 2746 "ldgram.c" /* yacc.c:1646  */
    break;

  case 97:
#line 380 "ldgram.y" /* yacc.c:1646  */
    { lang_add_input_file((yyvsp[0].name),lang_input_file_is_search_file_enum,
				 (char *)NULL); }
#line 2753 "ldgram.c" /* yacc.c:1646  */
    break;

  case 98:
#line 383 "ldgram.y" /* yacc.c:1646  */
    { lang_add_input_file((yyvsp[0].name),lang_input_file_is_search_file_enum,
				 (char *)NULL); }
#line 2760 "ldgram.c" /* yacc.c:1646  */
    break;

  case 99:
#line 386 "ldgram.y" /* yacc.c:1646  */
    { lang_add_input_file((yyvsp[0].name),lang_input_file_is_search_file_enum,
				 (char *)NULL); }
#line 2767 "ldgram.c" /* yacc.c:1646  */
    break;

  case 100:
#line 389 "ldgram.y" /* yacc.c:1646  */
    { lang_add_input_file((yyvsp[0].name),lang_input_file_is_l_enum,
				 (char *)NULL); }
#line 2774 "ldgram.c" /* yacc.c:1646  */
    break;

  case 101:
#line 392 "ldgram.y" /* yacc.c:1646  */
    { lang_add_input_file((yyvsp[0].name),lang_input_file_is_l_enum,
				 (char *)NULL); }
#line 2781 "ldgram.c" /* yacc.c:1646  */
    break;

  case 102:
#line 395 "ldgram.y" /* yacc.c:1646  */
    { lang_add_input_file((yyvsp[0].name),lang_input_file_is_l_enum,
				 (char *)NULL); }
#line 2788 "ldgram.c" /* yacc.c:1646  */
    break;

  case 103:
#line 398 "ldgram.y" /* yacc.c:1646  */
    { (yyval.integer) = input_flags.add_DT_NEEDED_for_regular;
		    input_flags.add_DT_NEEDED_for_regular = TRUE; }
#line 2795 "ldgram.c" /* yacc.c:1646  */
    break;

  case 104:
#line 401 "ldgram.y" /* yacc.c:1646  */
    { input_flags.add_DT_NEEDED_for_regular = (yyvsp[-2].integer); }
#line 2801 "ldgram.c" /* yacc.c:1646  */
    break;

  case 105:
#line 403 "ldgram.y" /* yacc.c:1646  */
    { (yyval.integer) = input_flags.add_DT_NEEDED_for_regular;
		    input_flags.add_DT_NEEDED_for_regular = TRUE; }
#line 2808 "ldgram.c" /* yacc.c:1646  */
    break;

  case 106:
#line 406 "ldgram.y" /* yacc.c:1646  */
    { input_flags.add_DT_NEEDED_for_regular = (yyvsp[-2].integer); }
#line 2814 "ldgram.c" /* yacc.c:1646  */
    break;

  case 107:
#line 408 "ldgram.y" /* yacc.c:1646  */
    { (yyval.integer) = input_flags.add_DT_NEEDED_for_regular;
		    input_flags.add_DT_NEEDED_for_regular = TRUE; }
#line 2821 "ldgram.c" /* yacc.c:1646  */
    break;

  case 108:
#line 411 "ldgram.y" /* yacc.c:1646  */
    { input_flags.add_DT_NEEDED_for_regular = (yyvsp[-2].integer); }
#line 2827 "ldgram.c" /* yacc.c:1646  */
    break;

  case 113:
#line 426 "ldgram.y" /* yacc.c:1646  */
    { lang_add_entry ((yyvsp[-1].name), FALSE); }
#line 2833 "ldgram.c" /* yacc.c:1646  */
    break;

  case 115:
#line 428 "ldgram.y" /* yacc.c:1646  */
    {ldlex_expression ();}
#line 2839 "ldgram.c" /* yacc.c:1646  */
    break;

  case 116:
#line 429 "ldgram.y" /* yacc.c:1646  */
    { ldlex_popstate ();
		  lang_add_assignment (exp_assert ((yyvsp[-3].etree), (yyvsp[-1].name))); }
#line 2846 "ldgram.c" /* yacc.c:1646  */
    break;

  case 117:
#line 437 "ldgram.y" /* yacc.c:1646  */
    {
			  (yyval.cname) = (yyvsp[0].name);
			}
#line 2854 "ldgram.c" /* yacc.c:1646  */
    break;

  case 118:
#line 441 "ldgram.y" /* yacc.c:1646  */
    {
			  (yyval.cname) = "*";
			}
#line 2862 "ldgram.c" /* yacc.c:1646  */
    break;

  case 119:
#line 445 "ldgram.y" /* yacc.c:1646  */
    {
			  (yyval.cname) = "?";
			}
#line 2870 "ldgram.c" /* yacc.c:1646  */
    break;

  case 120:
#line 452 "ldgram.y" /* yacc.c:1646  */
    {
			  (yyval.wildcard).name = (yyvsp[0].cname);
			  (yyval.wildcard).sorted = none;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2881 "ldgram.c" /* yacc.c:1646  */
    break;

  case 121:
#line 459 "ldgram.y" /* yacc.c:1646  */
    {
			  (yyval.wildcard).name = (yyvsp[0].cname);
			  (yyval.wildcard).sorted = none;
			  (yyval.wildcard).exclude_name_list = (yyvsp[-2].name_list);
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2892 "ldgram.c" /* yacc.c:1646  */
    break;

  case 122:
#line 466 "ldgram.y" /* yacc.c:1646  */
    {
			  (yyval.wildcard).name = (yyvsp[-1].cname);
			  (yyval.wildcard).sorted = by_name;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2903 "ldgram.c" /* yacc.c:1646  */
    break;

  case 123:
#line 473 "ldgram.y" /* yacc.c:1646  */
    {
			  (yyval.wildcard).name = (yyvsp[-1].cname);
			  (yyval.wildcard).sorted = by_alignment;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2914 "ldgram.c" /* yacc.c:1646  */
    break;

  case 124:
#line 480 "ldgram.y" /* yacc.c:1646  */
    {
			  (yyval.wildcard).name = (yyvsp[-1].cname);
			  (yyval.wildcard).sorted = by_none;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2925 "ldgram.c" /* yacc.c:1646  */
    break;

  case 125:
#line 487 "ldgram.y" /* yacc.c:1646  */
    {
			  (yyval.wildcard).name = (yyvsp[-2].cname);
			  (yyval.wildcard).sorted = by_name_alignment;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2936 "ldgram.c" /* yacc.c:1646  */
    break;

  case 126:
#line 494 "ldgram.y" /* yacc.c:1646  */
    {
			  (yyval.wildcard).name = (yyvsp[-2].cname);
			  (yyval.wildcard).sorted = by_name;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2947 "ldgram.c" /* yacc.c:1646  */
    break;

  case 127:
#line 501 "ldgram.y" /* yacc.c:1646  */
    {
			  (yyval.wildcard).name = (yyvsp[-2].cname);
			  (yyval.wildcard).sorted = by_alignment_name;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2958 "ldgram.c" /* yacc.c:1646  */
    break;

  case 128:
#line 508 "ldgram.y" /* yacc.c:1646  */
    {
			  (yyval.wildcard).name = (yyvsp[-2].cname);
			  (yyval.wildcard).sorted = by_alignment;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2969 "ldgram.c" /* yacc.c:1646  */
    break;

  case 129:
#line 515 "ldgram.y" /* yacc.c:1646  */
    {
			  (yyval.wildcard).name = (yyvsp[-1].cname);
			  (yyval.wildcard).sorted = by_name;
			  (yyval.wildcard).exclude_name_list = (yyvsp[-3].name_list);
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2980 "ldgram.c" /* yacc.c:1646  */
    break;

  case 130:
#line 522 "ldgram.y" /* yacc.c:1646  */
    {
			  (yyval.wildcard).name = (yyvsp[-1].cname);
			  (yyval.wildcard).sorted = by_init_priority;
			  (yyval.wildcard).exclude_name_list = NULL;
			  (yyval.wildcard).section_flag_list = NULL;
			}
#line 2991 "ldgram.c" /* yacc.c:1646  */
    break;

  case 131:
#line 531 "ldgram.y" /* yacc.c:1646  */
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
#line 3013 "ldgram.c" /* yacc.c:1646  */
    break;

  case 132:
#line 549 "ldgram.y" /* yacc.c:1646  */
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
#line 3035 "ldgram.c" /* yacc.c:1646  */
    break;

  case 133:
#line 570 "ldgram.y" /* yacc.c:1646  */
    {
			  struct flag_info *n;
			  n = ((struct flag_info *) xmalloc (sizeof *n));
			  n->flag_list = (yyvsp[-1].flag_info_list);
			  n->flags_initialized = FALSE;
			  n->not_with_flags = 0;
			  n->only_with_flags = 0;
			  (yyval.flag_info) = n;
			}
#line 3049 "ldgram.c" /* yacc.c:1646  */
    break;

  case 134:
#line 583 "ldgram.y" /* yacc.c:1646  */
    {
			  struct name_list *tmp;
			  tmp = (struct name_list *) xmalloc (sizeof *tmp);
			  tmp->name = (yyvsp[0].cname);
			  tmp->next = (yyvsp[-1].name_list);
			  (yyval.name_list) = tmp;
			}
#line 3061 "ldgram.c" /* yacc.c:1646  */
    break;

  case 135:
#line 592 "ldgram.y" /* yacc.c:1646  */
    {
			  struct name_list *tmp;
			  tmp = (struct name_list *) xmalloc (sizeof *tmp);
			  tmp->name = (yyvsp[0].cname);
			  tmp->next = NULL;
			  (yyval.name_list) = tmp;
			}
#line 3073 "ldgram.c" /* yacc.c:1646  */
    break;

  case 136:
#line 603 "ldgram.y" /* yacc.c:1646  */
    {
			  struct wildcard_list *tmp;
			  tmp = (struct wildcard_list *) xmalloc (sizeof *tmp);
			  tmp->next = (yyvsp[-2].wildcard_list);
			  tmp->spec = (yyvsp[0].wildcard);
			  (yyval.wildcard_list) = tmp;
			}
#line 3085 "ldgram.c" /* yacc.c:1646  */
    break;

  case 137:
#line 612 "ldgram.y" /* yacc.c:1646  */
    {
			  struct wildcard_list *tmp;
			  tmp = (struct wildcard_list *) xmalloc (sizeof *tmp);
			  tmp->next = NULL;
			  tmp->spec = (yyvsp[0].wildcard);
			  (yyval.wildcard_list) = tmp;
			}
#line 3097 "ldgram.c" /* yacc.c:1646  */
    break;

  case 138:
#line 623 "ldgram.y" /* yacc.c:1646  */
    {
			  struct wildcard_spec tmp;
			  tmp.name = (yyvsp[0].name);
			  tmp.exclude_name_list = NULL;
			  tmp.sorted = none;
			  tmp.section_flag_list = NULL;
			  lang_add_wild (&tmp, NULL, ldgram_had_keep);
			}
#line 3110 "ldgram.c" /* yacc.c:1646  */
    break;

  case 139:
#line 632 "ldgram.y" /* yacc.c:1646  */
    {
			  struct wildcard_spec tmp;
			  tmp.name = (yyvsp[0].name);
			  tmp.exclude_name_list = NULL;
			  tmp.sorted = none;
			  tmp.section_flag_list = (yyvsp[-1].flag_info);
			  lang_add_wild (&tmp, NULL, ldgram_had_keep);
			}
#line 3123 "ldgram.c" /* yacc.c:1646  */
    break;

  case 140:
#line 641 "ldgram.y" /* yacc.c:1646  */
    {
			  lang_add_wild (NULL, (yyvsp[-1].wildcard_list), ldgram_had_keep);
			}
#line 3131 "ldgram.c" /* yacc.c:1646  */
    break;

  case 141:
#line 645 "ldgram.y" /* yacc.c:1646  */
    {
			  struct wildcard_spec tmp;
			  tmp.name = NULL;
			  tmp.exclude_name_list = NULL;
			  tmp.sorted = none;
			  tmp.section_flag_list = (yyvsp[-3].flag_info);
			  lang_add_wild (&tmp, (yyvsp[-1].wildcard_list), ldgram_had_keep);
			}
#line 3144 "ldgram.c" /* yacc.c:1646  */
    break;

  case 142:
#line 654 "ldgram.y" /* yacc.c:1646  */
    {
			  lang_add_wild (&(yyvsp[-3].wildcard), (yyvsp[-1].wildcard_list), ldgram_had_keep);
			}
#line 3152 "ldgram.c" /* yacc.c:1646  */
    break;

  case 143:
#line 658 "ldgram.y" /* yacc.c:1646  */
    {
			  (yyvsp[-3].wildcard).section_flag_list = (yyvsp[-4].flag_info);
			  lang_add_wild (&(yyvsp[-3].wildcard), (yyvsp[-1].wildcard_list), ldgram_had_keep);
			}
#line 3161 "ldgram.c" /* yacc.c:1646  */
    break;

  case 145:
#line 667 "ldgram.y" /* yacc.c:1646  */
    { ldgram_had_keep = TRUE; }
#line 3167 "ldgram.c" /* yacc.c:1646  */
    break;

  case 146:
#line 669 "ldgram.y" /* yacc.c:1646  */
    { ldgram_had_keep = FALSE; }
#line 3173 "ldgram.c" /* yacc.c:1646  */
    break;

  case 148:
#line 675 "ldgram.y" /* yacc.c:1646  */
    {
 		lang_add_attribute(lang_object_symbols_statement_enum);
	      	}
#line 3181 "ldgram.c" /* yacc.c:1646  */
    break;

  case 150:
#line 680 "ldgram.y" /* yacc.c:1646  */
    {

		  lang_add_attribute(lang_constructors_statement_enum);
		}
#line 3190 "ldgram.c" /* yacc.c:1646  */
    break;

  case 151:
#line 685 "ldgram.y" /* yacc.c:1646  */
    {
		  constructors_sorted = TRUE;
		  lang_add_attribute (lang_constructors_statement_enum);
		}
#line 3199 "ldgram.c" /* yacc.c:1646  */
    break;

  case 153:
#line 691 "ldgram.y" /* yacc.c:1646  */
    {
			  lang_add_data ((int) (yyvsp[-3].integer), (yyvsp[-1].etree));
			}
#line 3207 "ldgram.c" /* yacc.c:1646  */
    break;

  case 154:
#line 696 "ldgram.y" /* yacc.c:1646  */
    {
			  lang_add_fill ((yyvsp[-1].fill));
			}
#line 3215 "ldgram.c" /* yacc.c:1646  */
    break;

  case 155:
#line 699 "ldgram.y" /* yacc.c:1646  */
    {ldlex_expression ();}
#line 3221 "ldgram.c" /* yacc.c:1646  */
    break;

  case 156:
#line 700 "ldgram.y" /* yacc.c:1646  */
    { ldlex_popstate ();
			  lang_add_assignment (exp_assert ((yyvsp[-4].etree), (yyvsp[-2].name))); }
#line 3228 "ldgram.c" /* yacc.c:1646  */
    break;

  case 157:
#line 703 "ldgram.y" /* yacc.c:1646  */
    { ldlex_script (); ldfile_open_command_file((yyvsp[0].name)); }
#line 3234 "ldgram.c" /* yacc.c:1646  */
    break;

  case 158:
#line 705 "ldgram.y" /* yacc.c:1646  */
    { ldlex_popstate (); }
#line 3240 "ldgram.c" /* yacc.c:1646  */
    break;

  case 163:
#line 720 "ldgram.y" /* yacc.c:1646  */
    { (yyval.integer) = (yyvsp[0].token); }
#line 3246 "ldgram.c" /* yacc.c:1646  */
    break;

  case 164:
#line 722 "ldgram.y" /* yacc.c:1646  */
    { (yyval.integer) = (yyvsp[0].token); }
#line 3252 "ldgram.c" /* yacc.c:1646  */
    break;

  case 165:
#line 724 "ldgram.y" /* yacc.c:1646  */
    { (yyval.integer) = (yyvsp[0].token); }
#line 3258 "ldgram.c" /* yacc.c:1646  */
    break;

  case 166:
#line 726 "ldgram.y" /* yacc.c:1646  */
    { (yyval.integer) = (yyvsp[0].token); }
#line 3264 "ldgram.c" /* yacc.c:1646  */
    break;

  case 167:
#line 728 "ldgram.y" /* yacc.c:1646  */
    { (yyval.integer) = (yyvsp[0].token); }
#line 3270 "ldgram.c" /* yacc.c:1646  */
    break;

  case 168:
#line 733 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.fill) = exp_get_fill ((yyvsp[0].etree), 0, "fill value");
		}
#line 3278 "ldgram.c" /* yacc.c:1646  */
    break;

  case 169:
#line 740 "ldgram.y" /* yacc.c:1646  */
    { (yyval.fill) = (yyvsp[0].fill); }
#line 3284 "ldgram.c" /* yacc.c:1646  */
    break;

  case 170:
#line 741 "ldgram.y" /* yacc.c:1646  */
    { (yyval.fill) = (fill_type *) 0; }
#line 3290 "ldgram.c" /* yacc.c:1646  */
    break;

  case 171:
#line 746 "ldgram.y" /* yacc.c:1646  */
    { (yyval.token) = '+'; }
#line 3296 "ldgram.c" /* yacc.c:1646  */
    break;

  case 172:
#line 748 "ldgram.y" /* yacc.c:1646  */
    { (yyval.token) = '-'; }
#line 3302 "ldgram.c" /* yacc.c:1646  */
    break;

  case 173:
#line 750 "ldgram.y" /* yacc.c:1646  */
    { (yyval.token) = '*'; }
#line 3308 "ldgram.c" /* yacc.c:1646  */
    break;

  case 174:
#line 752 "ldgram.y" /* yacc.c:1646  */
    { (yyval.token) = '/'; }
#line 3314 "ldgram.c" /* yacc.c:1646  */
    break;

  case 175:
#line 754 "ldgram.y" /* yacc.c:1646  */
    { (yyval.token) = LSHIFT; }
#line 3320 "ldgram.c" /* yacc.c:1646  */
    break;

  case 176:
#line 756 "ldgram.y" /* yacc.c:1646  */
    { (yyval.token) = RSHIFT; }
#line 3326 "ldgram.c" /* yacc.c:1646  */
    break;

  case 177:
#line 758 "ldgram.y" /* yacc.c:1646  */
    { (yyval.token) = '&'; }
#line 3332 "ldgram.c" /* yacc.c:1646  */
    break;

  case 178:
#line 760 "ldgram.y" /* yacc.c:1646  */
    { (yyval.token) = '|'; }
#line 3338 "ldgram.c" /* yacc.c:1646  */
    break;

  case 181:
#line 770 "ldgram.y" /* yacc.c:1646  */
    {
		  lang_add_assignment (exp_assign ((yyvsp[-2].name), (yyvsp[0].etree), FALSE));
		}
#line 3346 "ldgram.c" /* yacc.c:1646  */
    break;

  case 182:
#line 774 "ldgram.y" /* yacc.c:1646  */
    {
		  lang_add_assignment (exp_assign ((yyvsp[-2].name),
						   exp_binop ((yyvsp[-1].token),
							      exp_nameop (NAME,
									  (yyvsp[-2].name)),
							      (yyvsp[0].etree)), FALSE));
		}
#line 3358 "ldgram.c" /* yacc.c:1646  */
    break;

  case 183:
#line 782 "ldgram.y" /* yacc.c:1646  */
    {
		  lang_add_assignment (exp_assign ((yyvsp[-3].name), (yyvsp[-1].etree), TRUE));
		}
#line 3366 "ldgram.c" /* yacc.c:1646  */
    break;

  case 184:
#line 786 "ldgram.y" /* yacc.c:1646  */
    {
		  lang_add_assignment (exp_provide ((yyvsp[-3].name), (yyvsp[-1].etree), FALSE));
		}
#line 3374 "ldgram.c" /* yacc.c:1646  */
    break;

  case 185:
#line 790 "ldgram.y" /* yacc.c:1646  */
    {
		  lang_add_assignment (exp_provide ((yyvsp[-3].name), (yyvsp[-1].etree), TRUE));
		}
#line 3382 "ldgram.c" /* yacc.c:1646  */
    break;

  case 193:
#line 813 "ldgram.y" /* yacc.c:1646  */
    { region = lang_memory_region_lookup ((yyvsp[0].name), TRUE); }
#line 3388 "ldgram.c" /* yacc.c:1646  */
    break;

  case 194:
#line 816 "ldgram.y" /* yacc.c:1646  */
    {}
#line 3394 "ldgram.c" /* yacc.c:1646  */
    break;

  case 195:
#line 818 "ldgram.y" /* yacc.c:1646  */
    { ldlex_script (); ldfile_open_command_file((yyvsp[0].name)); }
#line 3400 "ldgram.c" /* yacc.c:1646  */
    break;

  case 196:
#line 820 "ldgram.y" /* yacc.c:1646  */
    { ldlex_popstate (); }
#line 3406 "ldgram.c" /* yacc.c:1646  */
    break;

  case 197:
#line 825 "ldgram.y" /* yacc.c:1646  */
    {
		  region->origin_exp = (yyvsp[0].etree);
		  region->current = region->origin;
		}
#line 3415 "ldgram.c" /* yacc.c:1646  */
    break;

  case 198:
#line 833 "ldgram.y" /* yacc.c:1646  */
    {
		  region->length_exp = (yyvsp[0].etree);
		}
#line 3423 "ldgram.c" /* yacc.c:1646  */
    break;

  case 199:
#line 840 "ldgram.y" /* yacc.c:1646  */
    { /* dummy action to avoid bison 1.25 error message */ }
#line 3429 "ldgram.c" /* yacc.c:1646  */
    break;

  case 203:
#line 851 "ldgram.y" /* yacc.c:1646  */
    { lang_set_flags (region, (yyvsp[0].name), 0); }
#line 3435 "ldgram.c" /* yacc.c:1646  */
    break;

  case 204:
#line 853 "ldgram.y" /* yacc.c:1646  */
    { lang_set_flags (region, (yyvsp[0].name), 1); }
#line 3441 "ldgram.c" /* yacc.c:1646  */
    break;

  case 205:
#line 858 "ldgram.y" /* yacc.c:1646  */
    { lang_startup((yyvsp[-1].name)); }
#line 3447 "ldgram.c" /* yacc.c:1646  */
    break;

  case 207:
#line 864 "ldgram.y" /* yacc.c:1646  */
    { ldemul_hll((char *)NULL); }
#line 3453 "ldgram.c" /* yacc.c:1646  */
    break;

  case 208:
#line 869 "ldgram.y" /* yacc.c:1646  */
    { ldemul_hll((yyvsp[0].name)); }
#line 3459 "ldgram.c" /* yacc.c:1646  */
    break;

  case 209:
#line 871 "ldgram.y" /* yacc.c:1646  */
    { ldemul_hll((yyvsp[0].name)); }
#line 3465 "ldgram.c" /* yacc.c:1646  */
    break;

  case 211:
#line 879 "ldgram.y" /* yacc.c:1646  */
    { ldemul_syslib((yyvsp[0].name)); }
#line 3471 "ldgram.c" /* yacc.c:1646  */
    break;

  case 213:
#line 885 "ldgram.y" /* yacc.c:1646  */
    { lang_float(TRUE); }
#line 3477 "ldgram.c" /* yacc.c:1646  */
    break;

  case 214:
#line 887 "ldgram.y" /* yacc.c:1646  */
    { lang_float(FALSE); }
#line 3483 "ldgram.c" /* yacc.c:1646  */
    break;

  case 215:
#line 892 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.nocrossref) = NULL;
		}
#line 3491 "ldgram.c" /* yacc.c:1646  */
    break;

  case 216:
#line 896 "ldgram.y" /* yacc.c:1646  */
    {
		  struct lang_nocrossref *n;

		  n = (struct lang_nocrossref *) xmalloc (sizeof *n);
		  n->name = (yyvsp[-1].name);
		  n->next = (yyvsp[0].nocrossref);
		  (yyval.nocrossref) = n;
		}
#line 3504 "ldgram.c" /* yacc.c:1646  */
    break;

  case 217:
#line 905 "ldgram.y" /* yacc.c:1646  */
    {
		  struct lang_nocrossref *n;

		  n = (struct lang_nocrossref *) xmalloc (sizeof *n);
		  n->name = (yyvsp[-2].name);
		  n->next = (yyvsp[0].nocrossref);
		  (yyval.nocrossref) = n;
		}
#line 3517 "ldgram.c" /* yacc.c:1646  */
    break;

  case 218:
#line 915 "ldgram.y" /* yacc.c:1646  */
    { ldlex_expression (); }
#line 3523 "ldgram.c" /* yacc.c:1646  */
    break;

  case 219:
#line 917 "ldgram.y" /* yacc.c:1646  */
    { ldlex_popstate (); (yyval.etree)=(yyvsp[0].etree);}
#line 3529 "ldgram.c" /* yacc.c:1646  */
    break;

  case 220:
#line 922 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_unop ('-', (yyvsp[0].etree)); }
#line 3535 "ldgram.c" /* yacc.c:1646  */
    break;

  case 221:
#line 924 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = (yyvsp[-1].etree); }
#line 3541 "ldgram.c" /* yacc.c:1646  */
    break;

  case 222:
#line 926 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_unop ((int) (yyvsp[-3].integer),(yyvsp[-1].etree)); }
#line 3547 "ldgram.c" /* yacc.c:1646  */
    break;

  case 223:
#line 928 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_unop ('!', (yyvsp[0].etree)); }
#line 3553 "ldgram.c" /* yacc.c:1646  */
    break;

  case 224:
#line 930 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = (yyvsp[0].etree); }
#line 3559 "ldgram.c" /* yacc.c:1646  */
    break;

  case 225:
#line 932 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_unop ('~', (yyvsp[0].etree));}
#line 3565 "ldgram.c" /* yacc.c:1646  */
    break;

  case 226:
#line 935 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop ('*', (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3571 "ldgram.c" /* yacc.c:1646  */
    break;

  case 227:
#line 937 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop ('/', (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3577 "ldgram.c" /* yacc.c:1646  */
    break;

  case 228:
#line 939 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop ('%', (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3583 "ldgram.c" /* yacc.c:1646  */
    break;

  case 229:
#line 941 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop ('+', (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3589 "ldgram.c" /* yacc.c:1646  */
    break;

  case 230:
#line 943 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop ('-' , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3595 "ldgram.c" /* yacc.c:1646  */
    break;

  case 231:
#line 945 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop (LSHIFT , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3601 "ldgram.c" /* yacc.c:1646  */
    break;

  case 232:
#line 947 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop (RSHIFT , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3607 "ldgram.c" /* yacc.c:1646  */
    break;

  case 233:
#line 949 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop (EQ , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3613 "ldgram.c" /* yacc.c:1646  */
    break;

  case 234:
#line 951 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop (NE , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3619 "ldgram.c" /* yacc.c:1646  */
    break;

  case 235:
#line 953 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop (LE , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3625 "ldgram.c" /* yacc.c:1646  */
    break;

  case 236:
#line 955 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop (GE , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3631 "ldgram.c" /* yacc.c:1646  */
    break;

  case 237:
#line 957 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop ('<' , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3637 "ldgram.c" /* yacc.c:1646  */
    break;

  case 238:
#line 959 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop ('>' , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3643 "ldgram.c" /* yacc.c:1646  */
    break;

  case 239:
#line 961 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop ('&' , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3649 "ldgram.c" /* yacc.c:1646  */
    break;

  case 240:
#line 963 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop ('^' , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3655 "ldgram.c" /* yacc.c:1646  */
    break;

  case 241:
#line 965 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop ('|' , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3661 "ldgram.c" /* yacc.c:1646  */
    break;

  case 242:
#line 967 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_trinop ('?' , (yyvsp[-4].etree), (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3667 "ldgram.c" /* yacc.c:1646  */
    break;

  case 243:
#line 969 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop (ANDAND , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3673 "ldgram.c" /* yacc.c:1646  */
    break;

  case 244:
#line 971 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop (OROR , (yyvsp[-2].etree), (yyvsp[0].etree)); }
#line 3679 "ldgram.c" /* yacc.c:1646  */
    break;

  case 245:
#line 973 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_nameop (DEFINED, (yyvsp[-1].name)); }
#line 3685 "ldgram.c" /* yacc.c:1646  */
    break;

  case 246:
#line 975 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_bigintop ((yyvsp[0].bigint).integer, (yyvsp[0].bigint).str); }
#line 3691 "ldgram.c" /* yacc.c:1646  */
    break;

  case 247:
#line 977 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_nameop (SIZEOF_HEADERS,0); }
#line 3697 "ldgram.c" /* yacc.c:1646  */
    break;

  case 248:
#line 980 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_nameop (ALIGNOF,(yyvsp[-1].name)); }
#line 3703 "ldgram.c" /* yacc.c:1646  */
    break;

  case 249:
#line 982 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_nameop (SIZEOF,(yyvsp[-1].name)); }
#line 3709 "ldgram.c" /* yacc.c:1646  */
    break;

  case 250:
#line 984 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_nameop (ADDR,(yyvsp[-1].name)); }
#line 3715 "ldgram.c" /* yacc.c:1646  */
    break;

  case 251:
#line 986 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_nameop (LOADADDR,(yyvsp[-1].name)); }
#line 3721 "ldgram.c" /* yacc.c:1646  */
    break;

  case 252:
#line 988 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_nameop (CONSTANT,(yyvsp[-1].name)); }
#line 3727 "ldgram.c" /* yacc.c:1646  */
    break;

  case 253:
#line 990 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_unop (ABSOLUTE, (yyvsp[-1].etree)); }
#line 3733 "ldgram.c" /* yacc.c:1646  */
    break;

  case 254:
#line 992 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_unop (ALIGN_K,(yyvsp[-1].etree)); }
#line 3739 "ldgram.c" /* yacc.c:1646  */
    break;

  case 255:
#line 994 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop (ALIGN_K,(yyvsp[-3].etree),(yyvsp[-1].etree)); }
#line 3745 "ldgram.c" /* yacc.c:1646  */
    break;

  case 256:
#line 996 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop (DATA_SEGMENT_ALIGN, (yyvsp[-3].etree), (yyvsp[-1].etree)); }
#line 3751 "ldgram.c" /* yacc.c:1646  */
    break;

  case 257:
#line 998 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop (DATA_SEGMENT_RELRO_END, (yyvsp[-1].etree), (yyvsp[-3].etree)); }
#line 3757 "ldgram.c" /* yacc.c:1646  */
    break;

  case 258:
#line 1000 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_unop (DATA_SEGMENT_END, (yyvsp[-1].etree)); }
#line 3763 "ldgram.c" /* yacc.c:1646  */
    break;

  case 259:
#line 1002 "ldgram.y" /* yacc.c:1646  */
    { /* The operands to the expression node are
			     placed in the opposite order from the way
			     in which they appear in the script as
			     that allows us to reuse more code in
			     fold_binary.  */
			  (yyval.etree) = exp_binop (SEGMENT_START,
					  (yyvsp[-1].etree),
					  exp_nameop (NAME, (yyvsp[-3].name))); }
#line 3776 "ldgram.c" /* yacc.c:1646  */
    break;

  case 260:
#line 1011 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_unop (ALIGN_K,(yyvsp[-1].etree)); }
#line 3782 "ldgram.c" /* yacc.c:1646  */
    break;

  case 261:
#line 1013 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_nameop (NAME,(yyvsp[0].name)); }
#line 3788 "ldgram.c" /* yacc.c:1646  */
    break;

  case 262:
#line 1015 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop (MAX_K, (yyvsp[-3].etree), (yyvsp[-1].etree) ); }
#line 3794 "ldgram.c" /* yacc.c:1646  */
    break;

  case 263:
#line 1017 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_binop (MIN_K, (yyvsp[-3].etree), (yyvsp[-1].etree) ); }
#line 3800 "ldgram.c" /* yacc.c:1646  */
    break;

  case 264:
#line 1019 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_assert ((yyvsp[-3].etree), (yyvsp[-1].name)); }
#line 3806 "ldgram.c" /* yacc.c:1646  */
    break;

  case 265:
#line 1021 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_nameop (ORIGIN, (yyvsp[-1].name)); }
#line 3812 "ldgram.c" /* yacc.c:1646  */
    break;

  case 266:
#line 1023 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_nameop (LENGTH, (yyvsp[-1].name)); }
#line 3818 "ldgram.c" /* yacc.c:1646  */
    break;

  case 267:
#line 1025 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = exp_unop (LOG2CEIL, (yyvsp[-1].etree)); }
#line 3824 "ldgram.c" /* yacc.c:1646  */
    break;

  case 268:
#line 1030 "ldgram.y" /* yacc.c:1646  */
    { (yyval.name) = (yyvsp[0].name); }
#line 3830 "ldgram.c" /* yacc.c:1646  */
    break;

  case 269:
#line 1031 "ldgram.y" /* yacc.c:1646  */
    { (yyval.name) = 0; }
#line 3836 "ldgram.c" /* yacc.c:1646  */
    break;

  case 270:
#line 1035 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = (yyvsp[-1].etree); }
#line 3842 "ldgram.c" /* yacc.c:1646  */
    break;

  case 271:
#line 1036 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = 0; }
#line 3848 "ldgram.c" /* yacc.c:1646  */
    break;

  case 272:
#line 1040 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = (yyvsp[-1].etree); }
#line 3854 "ldgram.c" /* yacc.c:1646  */
    break;

  case 273:
#line 1041 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = 0; }
#line 3860 "ldgram.c" /* yacc.c:1646  */
    break;

  case 274:
#line 1045 "ldgram.y" /* yacc.c:1646  */
    { (yyval.token) = ALIGN_WITH_INPUT; }
#line 3866 "ldgram.c" /* yacc.c:1646  */
    break;

  case 275:
#line 1046 "ldgram.y" /* yacc.c:1646  */
    { (yyval.token) = 0; }
#line 3872 "ldgram.c" /* yacc.c:1646  */
    break;

  case 276:
#line 1050 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = (yyvsp[-1].etree); }
#line 3878 "ldgram.c" /* yacc.c:1646  */
    break;

  case 277:
#line 1051 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = 0; }
#line 3884 "ldgram.c" /* yacc.c:1646  */
    break;

  case 278:
#line 1055 "ldgram.y" /* yacc.c:1646  */
    { (yyval.token) = ONLY_IF_RO; }
#line 3890 "ldgram.c" /* yacc.c:1646  */
    break;

  case 279:
#line 1056 "ldgram.y" /* yacc.c:1646  */
    { (yyval.token) = ONLY_IF_RW; }
#line 3896 "ldgram.c" /* yacc.c:1646  */
    break;

  case 280:
#line 1057 "ldgram.y" /* yacc.c:1646  */
    { (yyval.token) = SPECIAL; }
#line 3902 "ldgram.c" /* yacc.c:1646  */
    break;

  case 281:
#line 1058 "ldgram.y" /* yacc.c:1646  */
    { (yyval.token) = 0; }
#line 3908 "ldgram.c" /* yacc.c:1646  */
    break;

  case 282:
#line 1061 "ldgram.y" /* yacc.c:1646  */
    { ldlex_expression(); }
#line 3914 "ldgram.c" /* yacc.c:1646  */
    break;

  case 283:
#line 1066 "ldgram.y" /* yacc.c:1646  */
    { ldlex_popstate (); ldlex_script (); }
#line 3920 "ldgram.c" /* yacc.c:1646  */
    break;

  case 284:
#line 1069 "ldgram.y" /* yacc.c:1646  */
    {
			  lang_enter_output_section_statement((yyvsp[-9].name), (yyvsp[-7].etree),
							      sectype,
							      (yyvsp[-5].etree), (yyvsp[-3].etree), (yyvsp[-6].etree), (yyvsp[-1].token), (yyvsp[-4].token));
			}
#line 3930 "ldgram.c" /* yacc.c:1646  */
    break;

  case 285:
#line 1075 "ldgram.y" /* yacc.c:1646  */
    { ldlex_popstate (); ldlex_expression (); }
#line 3936 "ldgram.c" /* yacc.c:1646  */
    break;

  case 286:
#line 1077 "ldgram.y" /* yacc.c:1646  */
    {
		  ldlex_popstate ();
		  lang_leave_output_section_statement ((yyvsp[0].fill), (yyvsp[-3].name), (yyvsp[-1].section_phdr), (yyvsp[-2].name));
		}
#line 3945 "ldgram.c" /* yacc.c:1646  */
    break;

  case 287:
#line 1082 "ldgram.y" /* yacc.c:1646  */
    {}
#line 3951 "ldgram.c" /* yacc.c:1646  */
    break;

  case 288:
#line 1084 "ldgram.y" /* yacc.c:1646  */
    { ldlex_expression (); }
#line 3957 "ldgram.c" /* yacc.c:1646  */
    break;

  case 289:
#line 1086 "ldgram.y" /* yacc.c:1646  */
    { ldlex_popstate (); ldlex_script (); }
#line 3963 "ldgram.c" /* yacc.c:1646  */
    break;

  case 290:
#line 1088 "ldgram.y" /* yacc.c:1646  */
    {
			  lang_enter_overlay ((yyvsp[-5].etree), (yyvsp[-2].etree));
			}
#line 3971 "ldgram.c" /* yacc.c:1646  */
    break;

  case 291:
#line 1093 "ldgram.y" /* yacc.c:1646  */
    { ldlex_popstate (); ldlex_expression (); }
#line 3977 "ldgram.c" /* yacc.c:1646  */
    break;

  case 292:
#line 1095 "ldgram.y" /* yacc.c:1646  */
    {
			  ldlex_popstate ();
			  lang_leave_overlay ((yyvsp[-11].etree), (int) (yyvsp[-12].integer),
					      (yyvsp[0].fill), (yyvsp[-3].name), (yyvsp[-1].section_phdr), (yyvsp[-2].name));
			}
#line 3987 "ldgram.c" /* yacc.c:1646  */
    break;

  case 294:
#line 1105 "ldgram.y" /* yacc.c:1646  */
    { ldlex_expression (); }
#line 3993 "ldgram.c" /* yacc.c:1646  */
    break;

  case 295:
#line 1107 "ldgram.y" /* yacc.c:1646  */
    {
		  ldlex_popstate ();
		  lang_add_assignment (exp_assign (".", (yyvsp[0].etree), FALSE));
		}
#line 4002 "ldgram.c" /* yacc.c:1646  */
    break;

  case 297:
#line 1113 "ldgram.y" /* yacc.c:1646  */
    { ldlex_script (); ldfile_open_command_file((yyvsp[0].name)); }
#line 4008 "ldgram.c" /* yacc.c:1646  */
    break;

  case 298:
#line 1115 "ldgram.y" /* yacc.c:1646  */
    { ldlex_popstate (); }
#line 4014 "ldgram.c" /* yacc.c:1646  */
    break;

  case 299:
#line 1119 "ldgram.y" /* yacc.c:1646  */
    { sectype = noload_section; }
#line 4020 "ldgram.c" /* yacc.c:1646  */
    break;

  case 300:
#line 1120 "ldgram.y" /* yacc.c:1646  */
    { sectype = noalloc_section; }
#line 4026 "ldgram.c" /* yacc.c:1646  */
    break;

  case 301:
#line 1121 "ldgram.y" /* yacc.c:1646  */
    { sectype = noalloc_section; }
#line 4032 "ldgram.c" /* yacc.c:1646  */
    break;

  case 302:
#line 1122 "ldgram.y" /* yacc.c:1646  */
    { sectype = noalloc_section; }
#line 4038 "ldgram.c" /* yacc.c:1646  */
    break;

  case 303:
#line 1123 "ldgram.y" /* yacc.c:1646  */
    { sectype = noalloc_section; }
#line 4044 "ldgram.c" /* yacc.c:1646  */
    break;

  case 305:
#line 1128 "ldgram.y" /* yacc.c:1646  */
    { sectype = normal_section; }
#line 4050 "ldgram.c" /* yacc.c:1646  */
    break;

  case 306:
#line 1129 "ldgram.y" /* yacc.c:1646  */
    { sectype = normal_section; }
#line 4056 "ldgram.c" /* yacc.c:1646  */
    break;

  case 307:
#line 1133 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = (yyvsp[-2].etree); }
#line 4062 "ldgram.c" /* yacc.c:1646  */
    break;

  case 308:
#line 1134 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = (etree_type *)NULL;  }
#line 4068 "ldgram.c" /* yacc.c:1646  */
    break;

  case 309:
#line 1139 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = (yyvsp[-3].etree); }
#line 4074 "ldgram.c" /* yacc.c:1646  */
    break;

  case 310:
#line 1141 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = (yyvsp[-7].etree); }
#line 4080 "ldgram.c" /* yacc.c:1646  */
    break;

  case 311:
#line 1145 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = (yyvsp[-1].etree); }
#line 4086 "ldgram.c" /* yacc.c:1646  */
    break;

  case 312:
#line 1146 "ldgram.y" /* yacc.c:1646  */
    { (yyval.etree) = (etree_type *) NULL;  }
#line 4092 "ldgram.c" /* yacc.c:1646  */
    break;

  case 313:
#line 1151 "ldgram.y" /* yacc.c:1646  */
    { (yyval.integer) = 0; }
#line 4098 "ldgram.c" /* yacc.c:1646  */
    break;

  case 314:
#line 1153 "ldgram.y" /* yacc.c:1646  */
    { (yyval.integer) = 1; }
#line 4104 "ldgram.c" /* yacc.c:1646  */
    break;

  case 315:
#line 1158 "ldgram.y" /* yacc.c:1646  */
    { (yyval.name) = (yyvsp[0].name); }
#line 4110 "ldgram.c" /* yacc.c:1646  */
    break;

  case 316:
#line 1159 "ldgram.y" /* yacc.c:1646  */
    { (yyval.name) = DEFAULT_MEMORY_REGION; }
#line 4116 "ldgram.c" /* yacc.c:1646  */
    break;

  case 317:
#line 1164 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.section_phdr) = NULL;
		}
#line 4124 "ldgram.c" /* yacc.c:1646  */
    break;

  case 318:
#line 1168 "ldgram.y" /* yacc.c:1646  */
    {
		  struct lang_output_section_phdr_list *n;

		  n = ((struct lang_output_section_phdr_list *)
		       xmalloc (sizeof *n));
		  n->name = (yyvsp[0].name);
		  n->used = FALSE;
		  n->next = (yyvsp[-2].section_phdr);
		  (yyval.section_phdr) = n;
		}
#line 4139 "ldgram.c" /* yacc.c:1646  */
    break;

  case 320:
#line 1184 "ldgram.y" /* yacc.c:1646  */
    {
			  ldlex_script ();
			  lang_enter_overlay_section ((yyvsp[0].name));
			}
#line 4148 "ldgram.c" /* yacc.c:1646  */
    break;

  case 321:
#line 1189 "ldgram.y" /* yacc.c:1646  */
    { ldlex_popstate (); ldlex_expression (); }
#line 4154 "ldgram.c" /* yacc.c:1646  */
    break;

  case 322:
#line 1191 "ldgram.y" /* yacc.c:1646  */
    {
			  ldlex_popstate ();
			  lang_leave_overlay_section ((yyvsp[0].fill), (yyvsp[-1].section_phdr));
			}
#line 4163 "ldgram.c" /* yacc.c:1646  */
    break;

  case 327:
#line 1208 "ldgram.y" /* yacc.c:1646  */
    { ldlex_expression (); }
#line 4169 "ldgram.c" /* yacc.c:1646  */
    break;

  case 328:
#line 1209 "ldgram.y" /* yacc.c:1646  */
    { ldlex_popstate (); }
#line 4175 "ldgram.c" /* yacc.c:1646  */
    break;

  case 329:
#line 1211 "ldgram.y" /* yacc.c:1646  */
    {
		  lang_new_phdr ((yyvsp[-5].name), (yyvsp[-3].etree), (yyvsp[-2].phdr).filehdr, (yyvsp[-2].phdr).phdrs, (yyvsp[-2].phdr).at,
				 (yyvsp[-2].phdr).flags);
		}
#line 4184 "ldgram.c" /* yacc.c:1646  */
    break;

  case 330:
#line 1219 "ldgram.y" /* yacc.c:1646  */
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
#line 4229 "ldgram.c" /* yacc.c:1646  */
    break;

  case 331:
#line 1263 "ldgram.y" /* yacc.c:1646  */
    {
		  memset (&(yyval.phdr), 0, sizeof (struct phdr_info));
		}
#line 4237 "ldgram.c" /* yacc.c:1646  */
    break;

  case 332:
#line 1267 "ldgram.y" /* yacc.c:1646  */
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
#line 4254 "ldgram.c" /* yacc.c:1646  */
    break;

  case 333:
#line 1280 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.phdr) = (yyvsp[0].phdr);
		  (yyval.phdr).at = (yyvsp[-2].etree);
		}
#line 4263 "ldgram.c" /* yacc.c:1646  */
    break;

  case 334:
#line 1288 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.etree) = NULL;
		}
#line 4271 "ldgram.c" /* yacc.c:1646  */
    break;

  case 335:
#line 1292 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.etree) = (yyvsp[-1].etree);
		}
#line 4279 "ldgram.c" /* yacc.c:1646  */
    break;

  case 336:
#line 1298 "ldgram.y" /* yacc.c:1646  */
    {
		  ldlex_version_file ();
		  PUSH_ERROR (_("dynamic list"));
		}
#line 4288 "ldgram.c" /* yacc.c:1646  */
    break;

  case 337:
#line 1303 "ldgram.y" /* yacc.c:1646  */
    {
		  ldlex_popstate ();
		  POP_ERROR ();
		}
#line 4297 "ldgram.c" /* yacc.c:1646  */
    break;

  case 341:
#line 1320 "ldgram.y" /* yacc.c:1646  */
    {
		  lang_append_dynamic_list ((yyvsp[-1].versyms));
		}
#line 4305 "ldgram.c" /* yacc.c:1646  */
    break;

  case 342:
#line 1328 "ldgram.y" /* yacc.c:1646  */
    {
		  ldlex_version_file ();
		  PUSH_ERROR (_("VERSION script"));
		}
#line 4314 "ldgram.c" /* yacc.c:1646  */
    break;

  case 343:
#line 1333 "ldgram.y" /* yacc.c:1646  */
    {
		  ldlex_popstate ();
		  POP_ERROR ();
		}
#line 4323 "ldgram.c" /* yacc.c:1646  */
    break;

  case 344:
#line 1342 "ldgram.y" /* yacc.c:1646  */
    {
		  ldlex_version_script ();
		}
#line 4331 "ldgram.c" /* yacc.c:1646  */
    break;

  case 345:
#line 1346 "ldgram.y" /* yacc.c:1646  */
    {
		  ldlex_popstate ();
		}
#line 4339 "ldgram.c" /* yacc.c:1646  */
    break;

  case 348:
#line 1358 "ldgram.y" /* yacc.c:1646  */
    {
		  lang_register_vers_node (NULL, (yyvsp[-2].versnode), NULL);
		}
#line 4347 "ldgram.c" /* yacc.c:1646  */
    break;

  case 349:
#line 1362 "ldgram.y" /* yacc.c:1646  */
    {
		  lang_register_vers_node ((yyvsp[-4].name), (yyvsp[-2].versnode), NULL);
		}
#line 4355 "ldgram.c" /* yacc.c:1646  */
    break;

  case 350:
#line 1366 "ldgram.y" /* yacc.c:1646  */
    {
		  lang_register_vers_node ((yyvsp[-5].name), (yyvsp[-3].versnode), (yyvsp[-1].deflist));
		}
#line 4363 "ldgram.c" /* yacc.c:1646  */
    break;

  case 351:
#line 1373 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.deflist) = lang_add_vers_depend (NULL, (yyvsp[0].name));
		}
#line 4371 "ldgram.c" /* yacc.c:1646  */
    break;

  case 352:
#line 1377 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.deflist) = lang_add_vers_depend ((yyvsp[-1].deflist), (yyvsp[0].name));
		}
#line 4379 "ldgram.c" /* yacc.c:1646  */
    break;

  case 353:
#line 1384 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.versnode) = lang_new_vers_node (NULL, NULL);
		}
#line 4387 "ldgram.c" /* yacc.c:1646  */
    break;

  case 354:
#line 1388 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.versnode) = lang_new_vers_node ((yyvsp[-1].versyms), NULL);
		}
#line 4395 "ldgram.c" /* yacc.c:1646  */
    break;

  case 355:
#line 1392 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.versnode) = lang_new_vers_node ((yyvsp[-1].versyms), NULL);
		}
#line 4403 "ldgram.c" /* yacc.c:1646  */
    break;

  case 356:
#line 1396 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.versnode) = lang_new_vers_node (NULL, (yyvsp[-1].versyms));
		}
#line 4411 "ldgram.c" /* yacc.c:1646  */
    break;

  case 357:
#line 1400 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.versnode) = lang_new_vers_node ((yyvsp[-5].versyms), (yyvsp[-1].versyms));
		}
#line 4419 "ldgram.c" /* yacc.c:1646  */
    break;

  case 358:
#line 1407 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, (yyvsp[0].name), ldgram_vers_current_lang, FALSE);
		}
#line 4427 "ldgram.c" /* yacc.c:1646  */
    break;

  case 359:
#line 1411 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, (yyvsp[0].name), ldgram_vers_current_lang, TRUE);
		}
#line 4435 "ldgram.c" /* yacc.c:1646  */
    break;

  case 360:
#line 1415 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[-2].versyms), (yyvsp[0].name), ldgram_vers_current_lang, FALSE);
		}
#line 4443 "ldgram.c" /* yacc.c:1646  */
    break;

  case 361:
#line 1419 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[-2].versyms), (yyvsp[0].name), ldgram_vers_current_lang, TRUE);
		}
#line 4451 "ldgram.c" /* yacc.c:1646  */
    break;

  case 362:
#line 1423 "ldgram.y" /* yacc.c:1646  */
    {
			  (yyval.name) = ldgram_vers_current_lang;
			  ldgram_vers_current_lang = (yyvsp[-1].name);
			}
#line 4460 "ldgram.c" /* yacc.c:1646  */
    break;

  case 363:
#line 1428 "ldgram.y" /* yacc.c:1646  */
    {
			  struct bfd_elf_version_expr *pat;
			  for (pat = (yyvsp[-2].versyms); pat->next != NULL; pat = pat->next);
			  pat->next = (yyvsp[-8].versyms);
			  (yyval.versyms) = (yyvsp[-2].versyms);
			  ldgram_vers_current_lang = (yyvsp[-3].name);
			}
#line 4472 "ldgram.c" /* yacc.c:1646  */
    break;

  case 364:
#line 1436 "ldgram.y" /* yacc.c:1646  */
    {
			  (yyval.name) = ldgram_vers_current_lang;
			  ldgram_vers_current_lang = (yyvsp[-1].name);
			}
#line 4481 "ldgram.c" /* yacc.c:1646  */
    break;

  case 365:
#line 1441 "ldgram.y" /* yacc.c:1646  */
    {
			  (yyval.versyms) = (yyvsp[-2].versyms);
			  ldgram_vers_current_lang = (yyvsp[-3].name);
			}
#line 4490 "ldgram.c" /* yacc.c:1646  */
    break;

  case 366:
#line 1446 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, "global", ldgram_vers_current_lang, FALSE);
		}
#line 4498 "ldgram.c" /* yacc.c:1646  */
    break;

  case 367:
#line 1450 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[-2].versyms), "global", ldgram_vers_current_lang, FALSE);
		}
#line 4506 "ldgram.c" /* yacc.c:1646  */
    break;

  case 368:
#line 1454 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, "local", ldgram_vers_current_lang, FALSE);
		}
#line 4514 "ldgram.c" /* yacc.c:1646  */
    break;

  case 369:
#line 1458 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[-2].versyms), "local", ldgram_vers_current_lang, FALSE);
		}
#line 4522 "ldgram.c" /* yacc.c:1646  */
    break;

  case 370:
#line 1462 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.versyms) = lang_new_vers_pattern (NULL, "extern", ldgram_vers_current_lang, FALSE);
		}
#line 4530 "ldgram.c" /* yacc.c:1646  */
    break;

  case 371:
#line 1466 "ldgram.y" /* yacc.c:1646  */
    {
		  (yyval.versyms) = lang_new_vers_pattern ((yyvsp[-2].versyms), "extern", ldgram_vers_current_lang, FALSE);
		}
#line 4538 "ldgram.c" /* yacc.c:1646  */
    break;


#line 4542 "ldgram.c" /* yacc.c:1646  */
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
#line 1476 "ldgram.y" /* yacc.c:1906  */

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

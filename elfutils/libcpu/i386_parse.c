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


/* Substitute the variable and function names.  */
#define yyparse         i386_parse
#define yylex           i386_lex
#define yyerror         i386_error
#define yydebug         i386_debug
#define yynerrs         i386_nerrs

#define yylval          i386_lval
#define yychar          i386_char

/* Copy the first part of user declarations.  */
#line 1 "i386_parse.y" /* yacc.c:339  */

/* Parser for i386 CPU description.
   Copyright (C) 2004, 2005, 2007, 2008, 2009 Red Hat, Inc.
   Written by Ulrich Drepper <drepper@redhat.com>, 2004.

   This file is free software; you can redistribute it and/or modify
   it under the terms of either

     * the GNU Lesser General Public License as published by the Free
       Software Foundation; either version 3 of the License, or (at
       your option) any later version

   or

     * the GNU General Public License as published by the Free
       Software Foundation; either version 2 of the License, or (at
       your option) any later version

   or both in parallel, as here.

   elfutils is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   General Public License for more details.

   You should have received copies of the GNU General Public License and
   the GNU Lesser General Public License along with this program.  If
   not, see <http://www.gnu.org/licenses/>.  */

#ifdef HAVE_CONFIG_H
# include <config.h>
#endif

#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <error.h>
#include <inttypes.h>
#include <libintl.h>
#include <math.h>
#include <obstack.h>
#include <search.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <libeu.h>
#include <system.h>

#define obstack_chunk_alloc xmalloc
#define obstack_chunk_free free

/* The error handler.  */
static void yyerror (const char *s);

extern int yylex (void);
extern int i386_lineno;
extern char *infname;


struct known_bitfield
{
  char *name;
  unsigned long int bits;
  int tmp;
};


struct bitvalue
{
  enum bittype { zeroone, field, failure } type;
  union
  {
    unsigned int value;
    struct known_bitfield *field;
  };
  struct bitvalue *next;
};


struct argname
{
  enum nametype { string, nfield } type;
  union
  {
    char *str;
    struct known_bitfield *field;
  };
  struct argname *next;
};


struct argument
{
  struct argname *name;
  struct argument *next;
};


struct instruction
{
  /* The byte encoding.  */
  struct bitvalue *bytes;

  /* Prefix possible.  */
  int repe;
  int rep;

  /* Mnemonic.  */
  char *mnemonic;

  /* Suffix.  */
  enum { suffix_none = 0, suffix_w, suffix_w0, suffix_W, suffix_tttn,
	 suffix_w1, suffix_W1, suffix_D } suffix;

  /* Flag set if modr/m is used.  */
  int modrm;

  /* Operands.  */
  struct operand
  {
    char *fct;
    char *str;
    int off1;
    int off2;
    int off3;
  } operands[3];

  struct instruction *next;
};


struct synonym
{
  char *from;
  char *to;
};


struct suffix
{
  char *name;
  int idx;
};


struct argstring
{
  char *str;
  int idx;
  int off;
};


static struct known_bitfield ax_reg =
  {
    .name = "ax", .bits = 0, .tmp = 0
  };

static struct known_bitfield dx_reg =
  {
    .name = "dx", .bits = 0, .tmp = 0
  };

static struct known_bitfield di_reg =
  {
    .name = "es_di", .bits = 0, .tmp = 0
  };

static struct known_bitfield si_reg =
  {
    .name = "ds_si", .bits = 0, .tmp = 0
  };

static struct known_bitfield bx_reg =
  {
    .name = "ds_bx", .bits = 0, .tmp = 0
  };


static int bitfield_compare (const void *p1, const void *p2);
static void new_bitfield (char *name, unsigned long int num);
static void check_bits (struct bitvalue *value);
static int check_duplicates (struct bitvalue *val);
static int check_argsdef (struct bitvalue *bitval, struct argument *args);
static int check_bitsused (struct bitvalue *bitval,
			   struct known_bitfield *suffix,
			   struct argument *args);
static struct argname *combine (struct argname *name);
static void fillin_arg (struct bitvalue *bytes, struct argname *name,
			struct instruction *instr, int n);
static void find_numbers (void);
static int compare_syn (const void *p1, const void *p2);
static int compare_suf (const void *p1, const void *p2);
static void instrtable_out (void);
#if 0
static void create_mnemonic_table (void);
#endif

static void *bitfields;
static struct instruction *instructions;
static size_t ninstructions;
static void *synonyms;
static void *suffixes;
static int nsuffixes;
static void *mnemonics;
size_t nmnemonics;
extern FILE *outfile;

/* Number of bits used mnemonics.  */
#if 0
static size_t best_mnemonic_bits;
#endif

#line 290 "i386_parse.c" /* yacc.c:339  */

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
#ifndef YY_I386_I_PARSE_H_INCLUDED
# define YY_I386_I_PARSE_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int i386_debug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    kMASK = 258,
    kPREFIX = 259,
    kSUFFIX = 260,
    kSYNONYM = 261,
    kID = 262,
    kNUMBER = 263,
    kPERCPERC = 264,
    kBITFIELD = 265,
    kCHAR = 266,
    kSPACE = 267
  };
#endif
/* Tokens.  */
#define kMASK 258
#define kPREFIX 259
#define kSUFFIX 260
#define kSYNONYM 261
#define kID 262
#define kNUMBER 263
#define kPERCPERC 264
#define kBITFIELD 265
#define kCHAR 266
#define kSPACE 267

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 217 "i386_parse.y" /* yacc.c:355  */

  unsigned long int num;
  char *str;
  char ch;
  struct known_bitfield *field;
  struct bitvalue *bit;
  struct argname *name;
  struct argument *arg;

#line 364 "i386_parse.c" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE i386_lval;

int i386_parse (void);

#endif /* !YY_I386_I_PARSE_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 381 "i386_parse.c" /* yacc.c:358  */

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
#define YYFINAL  12
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   37

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  18
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  14
/* YYNRULES -- Number of rules.  */
#define YYNRULES  32
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  49

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   267

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      13,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    15,     2,     2,     2,    16,    17,
       2,     2,     2,     2,     2,     2,     2,     2,    14,     2,
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
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   247,   247,   257,   258,   261,   263,   265,   267,   279,
     282,   283,   286,   369,   372,   388,   391,   401,   408,   416,
     420,   427,   434,   456,   459,   462,   472,   480,   488,   491,
     523,   532,   539
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "kMASK", "kPREFIX", "kSUFFIX",
  "kSYNONYM", "kID", "kNUMBER", "kPERCPERC", "kBITFIELD", "kCHAR",
  "kSPACE", "'\\n'", "':'", "','", "'0'", "'1'", "$accept", "spec",
  "masks", "mask", "instrs", "instr", "bitfieldopt", "bytes", "byte",
  "bit", "optargs", "args", "arg", "argcomp", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,    10,    58,    44,    48,    49
};
# endif

#define YYPACT_NINF -35

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-35)))

#define YYTABLE_NINF -1

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int8 yypact[] =
{
      12,     9,    10,    11,    13,    22,    -2,   -35,    16,   -35,
     -35,    15,   -35,    14,    12,   -35,   -35,    -4,   -35,   -35,
     -35,   -35,    17,   -35,   -12,    -4,   -35,    -4,    18,    -4,
     -35,   -35,   -35,    19,    -4,    18,    20,    -6,   -35,   -35,
     -35,   -35,   -35,    21,    -6,   -35,    -6,   -35,    -6
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       9,     0,     0,     0,     0,     0,     0,     4,     0,     6,
       7,     0,     1,     0,     9,     5,     8,    13,     3,    22,
      20,    21,     2,    11,     0,    17,    19,    13,    15,     0,
      18,    10,    14,     0,    16,    15,    24,     0,    12,    31,
      29,    30,    32,    23,    26,    28,     0,    27,    25
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -35,   -35,   -35,    23,   -35,     2,    -1,   -35,     4,   -25,
     -35,   -35,   -15,   -34
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     5,     6,     7,    22,    23,    33,    24,    25,    26,
      38,    43,    44,    45
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint8 yytable[] =
{
      30,    39,    28,    29,    40,    41,    19,    13,    42,    30,
      47,    14,    20,    21,    47,     1,     2,     3,     4,     8,
       9,    10,    12,    11,    15,    16,    35,    17,    32,    31,
      27,    48,    37,    34,    36,     0,    46,    18
};

static const yytype_int8 yycheck[] =
{
      25,     7,    14,    15,    10,    11,    10,     9,    14,    34,
      44,    13,    16,    17,    48,     3,     4,     5,     6,    10,
      10,    10,     0,    10,     8,    10,     7,    13,    10,    27,
      13,    46,    12,    29,    35,    -1,    15,    14
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     3,     4,     5,     6,    19,    20,    21,    10,    10,
      10,    10,     0,     9,    13,     8,    10,    13,    21,    10,
      16,    17,    22,    23,    25,    26,    27,    13,    14,    15,
      27,    23,    10,    24,    26,     7,    24,    12,    28,     7,
      10,    11,    14,    29,    30,    31,    15,    31,    30
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    18,    19,    20,    20,    21,    21,    21,    21,    21,
      22,    22,    23,    23,    24,    24,    25,    25,    26,    26,
      27,    27,    27,    28,    28,    29,    29,    30,    30,    31,
      31,    31,    31
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     4,     3,     1,     3,     2,     2,     3,     0,
       3,     1,     6,     0,     1,     0,     3,     1,     2,     1,
       1,     1,     1,     2,     0,     3,     1,     2,     1,     1,
       1,     1,     1
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
        case 2:
#line 248 "i386_parse.y" /* yacc.c:1646  */
    {
		      if (error_message_count != 0)
			error (EXIT_FAILURE, 0,
			       "terminated due to previous error");

		      instrtable_out ();
		    }
#line 1486 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 5:
#line 262 "i386_parse.y" /* yacc.c:1646  */
    { new_bitfield ((yyvsp[-1].str), (yyvsp[0].num)); }
#line 1492 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 6:
#line 264 "i386_parse.y" /* yacc.c:1646  */
    { new_bitfield ((yyvsp[0].str), -1); }
#line 1498 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 7:
#line 266 "i386_parse.y" /* yacc.c:1646  */
    { new_bitfield ((yyvsp[0].str), -2); }
#line 1504 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 8:
#line 268 "i386_parse.y" /* yacc.c:1646  */
    {
		      struct synonym *newp = xmalloc (sizeof (*newp));
		      newp->from = (yyvsp[-1].str);
		      newp->to = (yyvsp[0].str);
		      if (tfind (newp, &synonyms, compare_syn) != NULL)
			error (0, 0,
			       "%d: duplicate definition for synonym '%s'",
			       i386_lineno, (yyvsp[-1].str));
		      else if (tsearch ( newp, &synonyms, compare_syn) == NULL)
			error (EXIT_FAILURE, 0, "tsearch");
		    }
#line 1520 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 12:
#line 287 "i386_parse.y" /* yacc.c:1646  */
    {
		      if ((yyvsp[-3].field) != NULL && strcmp ((yyvsp[-3].field)->name, "RE") != 0
			  && strcmp ((yyvsp[-3].field)->name, "R") != 0)
			{
			  error (0, 0, "%d: only 'R' and 'RE' prefix allowed",
				 i386_lineno - 1);
			}
		      if (check_duplicates ((yyvsp[-5].bit)) == 0
			  && check_argsdef ((yyvsp[-5].bit), (yyvsp[0].arg)) == 0
			  && check_bitsused ((yyvsp[-5].bit), (yyvsp[-1].field), (yyvsp[0].arg)) == 0)
			{
			  struct instruction *newp = xcalloc (sizeof (*newp),
							      1);
			  if ((yyvsp[-3].field) != NULL)
			    {
			      if (strcmp ((yyvsp[-3].field)->name, "RE") == 0)
				newp->repe = 1;
			      else if (strcmp ((yyvsp[-3].field)->name, "R") == 0)
				newp->rep = 1;
			    }

			  newp->bytes = (yyvsp[-5].bit);
			  newp->mnemonic = (yyvsp[-2].str);
			  if (newp->mnemonic != (void *) -1l
			      && tfind ((yyvsp[-2].str), &mnemonics,
					(int (*)(const void *, const void *)) strcmp) == NULL)
			    {
			      if (tsearch ((yyvsp[-2].str), &mnemonics,
					   (int (*)(const void *, const void *)) strcmp) == NULL)
				error (EXIT_FAILURE, errno, "tsearch");
			      ++nmnemonics;
			    }

			  if ((yyvsp[-1].field) != NULL)
			    {
			      if (strcmp ((yyvsp[-1].field)->name, "w") == 0)
				newp->suffix = suffix_w;
			      else if (strcmp ((yyvsp[-1].field)->name, "w0") == 0)
				newp->suffix = suffix_w0;
			      else if (strcmp ((yyvsp[-1].field)->name, "tttn") == 0)
				newp->suffix = suffix_tttn;
			      else if (strcmp ((yyvsp[-1].field)->name, "w1") == 0)
				newp->suffix = suffix_w1;
			      else if (strcmp ((yyvsp[-1].field)->name, "W") == 0)
				newp->suffix = suffix_W;
			      else if (strcmp ((yyvsp[-1].field)->name, "W1") == 0)
				newp->suffix = suffix_W1;
			      else if (strcmp ((yyvsp[-1].field)->name, "D") == 0)
				newp->suffix = suffix_D;
			      else
				error (EXIT_FAILURE, 0,
				       "%s: %d: unknown suffix '%s'",
				       infname, i386_lineno - 1, (yyvsp[-1].field)->name);

			      struct suffix search = { .name = (yyvsp[-1].field)->name };
			      if (tfind (&search, &suffixes, compare_suf)
				  == NULL)
				{
				  struct suffix *ns = xmalloc (sizeof (*ns));
				  ns->name = (yyvsp[-1].field)->name;
				  ns->idx = ++nsuffixes;
				  if (tsearch (ns, &suffixes, compare_suf)
				      == NULL)
				    error (EXIT_FAILURE, errno, "tsearch");
				}
			    }

			  struct argument *args = (yyvsp[0].arg);
			  int n = 0;
			  while (args != NULL)
			    {
			      fillin_arg ((yyvsp[-5].bit), args->name, newp, n);

			      args = args->next;
			      ++n;
			    }

			  newp->next = instructions;
			  instructions = newp;
			  ++ninstructions;
			}
		    }
#line 1607 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 14:
#line 373 "i386_parse.y" /* yacc.c:1646  */
    {
		      struct known_bitfield search;
		      search.name = (yyvsp[0].str);
		      struct known_bitfield **res;
		      res = tfind (&search, &bitfields, bitfield_compare);
		      if (res == NULL)
			{
			  error (0, 0, "%d: unknown bitfield '%s'",
				 i386_lineno, search.name);
			  (yyval.field) = NULL;
			}
		      else
			(yyval.field) = *res;
		    }
#line 1626 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 15:
#line 388 "i386_parse.y" /* yacc.c:1646  */
    { (yyval.field) = NULL; }
#line 1632 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 16:
#line 392 "i386_parse.y" /* yacc.c:1646  */
    {
		      check_bits ((yyvsp[0].bit));

		      struct bitvalue *runp = (yyvsp[-2].bit);
		      while (runp->next != NULL)
			runp = runp->next;
		      runp->next = (yyvsp[0].bit);
		      (yyval.bit) = (yyvsp[-2].bit);
		    }
#line 1646 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 17:
#line 402 "i386_parse.y" /* yacc.c:1646  */
    {
		      check_bits ((yyvsp[0].bit));
		      (yyval.bit) = (yyvsp[0].bit);
		    }
#line 1655 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 18:
#line 409 "i386_parse.y" /* yacc.c:1646  */
    {
		      struct bitvalue *runp = (yyvsp[-1].bit);
		      while (runp->next != NULL)
			runp = runp->next;
		      runp->next = (yyvsp[0].bit);
		      (yyval.bit) = (yyvsp[-1].bit);
		    }
#line 1667 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 19:
#line 417 "i386_parse.y" /* yacc.c:1646  */
    { (yyval.bit) = (yyvsp[0].bit); }
#line 1673 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 20:
#line 421 "i386_parse.y" /* yacc.c:1646  */
    {
		      (yyval.bit) = xmalloc (sizeof (struct bitvalue));
		      (yyval.bit)->type = zeroone;
		      (yyval.bit)->value = 0;
		      (yyval.bit)->next = NULL;
		    }
#line 1684 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 21:
#line 428 "i386_parse.y" /* yacc.c:1646  */
    {
		      (yyval.bit) = xmalloc (sizeof (struct bitvalue));
		      (yyval.bit)->type = zeroone;
		      (yyval.bit)->value = 1;
		      (yyval.bit)->next = NULL;
		    }
#line 1695 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 22:
#line 435 "i386_parse.y" /* yacc.c:1646  */
    {
		      (yyval.bit) = xmalloc (sizeof (struct bitvalue));
		      struct known_bitfield search;
		      search.name = (yyvsp[0].str);
		      struct known_bitfield **res;
		      res = tfind (&search, &bitfields, bitfield_compare);
		      if (res == NULL)
			{
			  error (0, 0, "%d: unknown bitfield '%s'",
				 i386_lineno, search.name);
			  (yyval.bit)->type = failure;
			}
		      else
			{
			  (yyval.bit)->type = field;
			  (yyval.bit)->field = *res;
			}
		      (yyval.bit)->next = NULL;
		    }
#line 1719 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 23:
#line 457 "i386_parse.y" /* yacc.c:1646  */
    { (yyval.arg) = (yyvsp[0].arg); }
#line 1725 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 24:
#line 459 "i386_parse.y" /* yacc.c:1646  */
    { (yyval.arg) = NULL; }
#line 1731 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 25:
#line 463 "i386_parse.y" /* yacc.c:1646  */
    {
		      struct argument *runp = (yyvsp[-2].arg);
		      while (runp->next != NULL)
			runp = runp->next;
		      runp->next = xmalloc (sizeof (struct argument));
		      runp->next->name = combine ((yyvsp[0].name));
		      runp->next->next = NULL;
		      (yyval.arg) = (yyvsp[-2].arg);
		    }
#line 1745 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 26:
#line 473 "i386_parse.y" /* yacc.c:1646  */
    {
		      (yyval.arg) = xmalloc (sizeof (struct argument));
		      (yyval.arg)->name = combine ((yyvsp[0].name));
		      (yyval.arg)->next = NULL;
		    }
#line 1755 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 27:
#line 481 "i386_parse.y" /* yacc.c:1646  */
    {
		      struct argname *runp = (yyvsp[-1].name);
		      while (runp->next != NULL)
			runp = runp->next;
		      runp->next = (yyvsp[0].name);
		      (yyval.name) = (yyvsp[-1].name);
		    }
#line 1767 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 28:
#line 489 "i386_parse.y" /* yacc.c:1646  */
    { (yyval.name) = (yyvsp[0].name); }
#line 1773 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 29:
#line 492 "i386_parse.y" /* yacc.c:1646  */
    {
		      (yyval.name) = xmalloc (sizeof (struct argname));
		      (yyval.name)->type = nfield;
		      (yyval.name)->next = NULL;

		      struct known_bitfield search;
		      search.name = (yyvsp[0].str);
		      struct known_bitfield **res;
		      res = tfind (&search, &bitfields, bitfield_compare);
		      if (res == NULL)
			{
			  if (strcmp ((yyvsp[0].str), "ax") == 0)
			    (yyval.name)->field = &ax_reg;
			  else if (strcmp ((yyvsp[0].str), "dx") == 0)
			    (yyval.name)->field = &dx_reg;
			  else if (strcmp ((yyvsp[0].str), "es_di") == 0)
			    (yyval.name)->field = &di_reg;
			  else if (strcmp ((yyvsp[0].str), "ds_si") == 0)
			    (yyval.name)->field = &si_reg;
			  else if (strcmp ((yyvsp[0].str), "ds_bx") == 0)
			    (yyval.name)->field = &bx_reg;
			  else
			    {
			      error (0, 0, "%d: unknown bitfield '%s'",
				     i386_lineno, search.name);
			      (yyval.name)->field = NULL;
			    }
			}
		      else
			(yyval.name)->field = *res;
		    }
#line 1809 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 30:
#line 524 "i386_parse.y" /* yacc.c:1646  */
    {
		      (yyval.name) = xmalloc (sizeof (struct argname));
		      (yyval.name)->type = string;
		      (yyval.name)->next = NULL;
		      (yyval.name)->str = xmalloc (2);
		      (yyval.name)->str[0] = (yyvsp[0].ch);
		      (yyval.name)->str[1] = '\0';
		    }
#line 1822 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 31:
#line 533 "i386_parse.y" /* yacc.c:1646  */
    {
		      (yyval.name) = xmalloc (sizeof (struct argname));
		      (yyval.name)->type = string;
		      (yyval.name)->next = NULL;
		      (yyval.name)->str = (yyvsp[0].str);
		    }
#line 1833 "i386_parse.c" /* yacc.c:1646  */
    break;

  case 32:
#line 540 "i386_parse.y" /* yacc.c:1646  */
    {
		      (yyval.name) = xmalloc (sizeof (struct argname));
		      (yyval.name)->type = string;
		      (yyval.name)->next = NULL;
		      (yyval.name)->str = xmalloc (2);
		      (yyval.name)->str[0] = ':';
		      (yyval.name)->str[1] = '\0';
		    }
#line 1846 "i386_parse.c" /* yacc.c:1646  */
    break;


#line 1850 "i386_parse.c" /* yacc.c:1646  */
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
#line 550 "i386_parse.y" /* yacc.c:1906  */


static void
yyerror (const char *s)
{
  error (0, 0, gettext ("while reading i386 CPU description: %s at line %d"),
         gettext (s), i386_lineno);
}


static int
bitfield_compare (const void *p1, const void *p2)
{
  struct known_bitfield *f1 = (struct known_bitfield *) p1;
  struct known_bitfield *f2 = (struct known_bitfield *) p2;

  return strcmp (f1->name, f2->name);
}


static void
new_bitfield (char *name, unsigned long int num)
{
  struct known_bitfield *newp = xmalloc (sizeof (struct known_bitfield));
  newp->name = name;
  newp->bits = num;
  newp->tmp = 0;

  if (tfind (newp, &bitfields, bitfield_compare) != NULL)
    {
      error (0, 0, "%d: duplicated definition of bitfield '%s'",
	     i386_lineno, name);
      free (name);
      return;
    }

  if (tsearch (newp, &bitfields, bitfield_compare) == NULL)
    error (EXIT_FAILURE, errno, "%d: cannot insert new bitfield '%s'",
	   i386_lineno, name);
}


/* Check that the number of bits is a multiple of 8.  */
static void
check_bits (struct bitvalue *val)
{
  struct bitvalue *runp = val;
  unsigned int total = 0;

  while (runp != NULL)
    {
      if (runp->type == zeroone)
	++total;
      else if (runp->field == NULL)
	/* No sense doing anything, the field is not known.  */
	return;
      else
	total += runp->field->bits;

      runp = runp->next;
    }

  if (total % 8 != 0)
    {
      struct obstack os;
      obstack_init (&os);

      while (val != NULL)
	{
	  if (val->type == zeroone)
	    obstack_printf (&os, "%u", val->value);
	  else
	    obstack_printf (&os, "{%s}", val->field->name);
	  val = val->next;
	}
      obstack_1grow (&os, '\0');

      error (0, 0, "%d: field '%s' not a multiple of 8 bits in size",
	     i386_lineno, (char *) obstack_finish (&os));

      obstack_free (&os, NULL);
    }
}


static int
check_duplicates (struct bitvalue *val)
{
  static int testcnt;
  ++testcnt;

  int result = 0;
  while (val != NULL)
    {
      if (val->type == field && val->field != NULL)
	{
	  if (val->field->tmp == testcnt)
	    {
	      error (0, 0, "%d: bitfield '%s' used more than once",
		     i386_lineno - 1, val->field->name);
	      result = 1;
	    }
	  val->field->tmp = testcnt;
	}

      val = val->next;
    }

  return result;
}


static int
check_argsdef (struct bitvalue *bitval, struct argument *args)
{
  int result = 0;

  while (args != NULL)
    {
      for (struct argname *name = args->name; name != NULL; name = name->next)
	if (name->type == nfield && name->field != NULL
	    && name->field != &ax_reg && name->field != &dx_reg
	    && name->field != &di_reg && name->field != &si_reg
	    && name->field != &bx_reg)
	  {
	    struct bitvalue *runp = bitval;

	    while (runp != NULL)
	      if (runp->type == field && runp->field == name->field)
		break;
	      else
		runp = runp->next;

	    if (runp == NULL)
	      {
		error (0, 0, "%d: unknown bitfield '%s' used in output format",
		       i386_lineno - 1, name->field->name);
		result = 1;
	      }
	  }

      args = args->next;
    }

  return result;
}


static int
check_bitsused (struct bitvalue *bitval, struct known_bitfield *suffix,
		struct argument *args)
{
  int result = 0;

  while (bitval != NULL)
    {
      if (bitval->type == field && bitval->field != NULL
	  && bitval->field != suffix
	  /* {w} is handled special.  */
	  && strcmp (bitval->field->name, "w") != 0)
	{
	  struct argument *runp;
	  for (runp = args; runp != NULL; runp = runp->next)
	    {
	      struct argname *name = runp->name;

	      while (name != NULL)
		if (name->type == nfield && name->field == bitval->field)
		  break;
		else
		  name = name->next;

	      if (name != NULL)
		break;
	    }

#if 0
	  if (runp == NULL)
	    {
	      error (0, 0, "%d: bitfield '%s' not used",
		     i386_lineno - 1, bitval->field->name);
	      result = 1;
	    }
#endif
	}

      bitval = bitval->next;
    }

  return result;
}


static struct argname *
combine (struct argname *name)
{
  struct argname *last_str = NULL;
  for (struct argname *runp = name; runp != NULL; runp = runp->next)
    {
      if (runp->type == string)
	{
	  if (last_str == NULL)
	    last_str = runp;
	  else
	    {
	      last_str->str = xrealloc (last_str->str,
					strlen (last_str->str)
					+ strlen (runp->str) + 1);
	      strcat (last_str->str, runp->str);
	      last_str->next = runp->next;
	    }
	}
      else
	last_str = NULL;
    }
  return name;
}


#define obstack_grow_str(ob, str) obstack_grow (ob, str, strlen (str))


static void
fillin_arg (struct bitvalue *bytes, struct argname *name,
	    struct instruction *instr, int n)
{
  static struct obstack ob;
  static int initialized;
  if (! initialized)
    {
      initialized = 1;
      obstack_init (&ob);
    }

  struct argname *runp = name;
  int cnt = 0;
  while (runp != NULL)
    {
      /* We ignore strings in the function name.  */
      if (runp->type == string)
	{
	  if (instr->operands[n].str != NULL)
	    error (EXIT_FAILURE, 0,
		   "%d: cannot have more than one string parameter",
		   i386_lineno - 1);

	  instr->operands[n].str = runp->str;
	}
      else
	{
	  assert (runp->type == nfield);

	  /* Construct the function name.  */
	  if (cnt++ > 0)
	    obstack_1grow (&ob, '$');

	  if (runp->field == NULL)
	    /* Add some string which contains invalid characters.  */
	    obstack_grow_str (&ob, "!!!INVALID!!!");
	  else
	    {
	      char *fieldname = runp->field->name;

	      struct synonym search = { .from = fieldname };

	      struct synonym **res = tfind (&search, &synonyms, compare_syn);
	      if (res != NULL)
		fieldname = (*res)->to;

	      obstack_grow_str (&ob, fieldname);
	    }

	  /* Now compute the bit offset of the field.  */
	  struct bitvalue *b = bytes;
	  int bitoff = 0;
	  if (runp->field != NULL)
	    while (b != NULL)
	      {
		if (b->type == field && b->field != NULL)
		  {
		    if (strcmp (b->field->name, runp->field->name) == 0)
		      break;
		    bitoff += b->field->bits;
		  }
		else
		  ++bitoff;

		b = b->next;
	      }
	  if (instr->operands[n].off1 == 0)
	    instr->operands[n].off1 = bitoff;
	  else if (instr->operands[n].off2 == 0)
	    instr->operands[n].off2 = bitoff;
	  else if (instr->operands[n].off3 == 0)
	    instr->operands[n].off3 = bitoff;
	  else
	    error (EXIT_FAILURE, 0,
		   "%d: cannot have more than three fields in parameter",
		   i386_lineno - 1);

	  if  (runp->field != NULL
	       && strncasecmp (runp->field->name, "mod", 3) == 0)
	    instr->modrm = 1;
	}

      runp = runp->next;
    }
  if (obstack_object_size (&ob) == 0)
    obstack_grow_str (&ob, "string");
  obstack_1grow (&ob, '\0');
  char *fct = obstack_finish (&ob);

  instr->operands[n].fct = fct;
}


#if 0
static void
nameout (const void *nodep, VISIT value, int level)
{
  if (value == leaf || value == postorder)
    printf ("  %s\n", *(const char **) nodep);
}
#endif


static int
compare_argstring (const void *p1, const void *p2)
{
  const struct argstring *a1 = (const struct argstring *) p1;
  const struct argstring *a2 = (const struct argstring *) p2;

  return strcmp (a1->str, a2->str);
}


static int maxoff[3][3];
static int minoff[3][3] = { { 1000, 1000, 1000 },
			    { 1000, 1000, 1000 },
			    { 1000, 1000, 1000 } };
static int nbitoff[3][3];
static void *fct_names[3];
static int nbitfct[3];
static int nbitsuf;
static void *strs[3];
static int nbitstr[3];
static int total_bits = 2;	// Already counted the rep/repe bits.

static void
find_numbers (void)
{
  int nfct_names[3] = { 0, 0, 0 };
  int nstrs[3] = { 0, 0, 0 };

  /* We reverse the order of the instruction list while processing it.
     Later phases need it in the order in which the input file has
     them.  */
  struct instruction *reversed = NULL;

  struct instruction *runp = instructions;
  while (runp != NULL)
    {
      for (int i = 0; i < 3; ++i)
	if (runp->operands[i].fct != NULL)
	  {
	    struct argstring search = { .str = runp->operands[i].fct };
	    if (tfind (&search, &fct_names[i], compare_argstring) == NULL)
	      {
		struct argstring *newp = xmalloc (sizeof (*newp));
		newp->str = runp->operands[i].fct;
		newp->idx = 0;
		if (tsearch (newp, &fct_names[i], compare_argstring) == NULL)
		  error (EXIT_FAILURE, errno, "tsearch");
		++nfct_names[i];
	      }

	    if (runp->operands[i].str != NULL)
	      {
		search.str = runp->operands[i].str;
		if (tfind (&search, &strs[i], compare_argstring) == NULL)
		  {
		    struct argstring *newp = xmalloc (sizeof (*newp));
		    newp->str = runp->operands[i].str;
		    newp->idx = 0;
		    if (tsearch (newp, &strs[i], compare_argstring) == NULL)
		      error (EXIT_FAILURE, errno, "tsearch");
		    ++nstrs[i];
		  }
	      }

	    maxoff[i][0] = MAX (maxoff[i][0], runp->operands[i].off1);
	    maxoff[i][1] = MAX (maxoff[i][1], runp->operands[i].off2);
	    maxoff[i][2] = MAX (maxoff[i][2], runp->operands[i].off3);

	    if (runp->operands[i].off1 > 0)
	      minoff[i][0] = MIN (minoff[i][0], runp->operands[i].off1);
	    if (runp->operands[i].off2 > 0)
	      minoff[i][1] = MIN (minoff[i][1], runp->operands[i].off2);
	    if (runp->operands[i].off3 > 0)
	      minoff[i][2] = MIN (minoff[i][2], runp->operands[i].off3);
	  }

      struct instruction *old = runp;
      runp = runp->next;

      old->next = reversed;
      reversed = old;
    }
  instructions = reversed;

  int d;
  int c;
  for (int i = 0; i < 3; ++i)
    {
      // printf ("min1 = %d, min2 = %d, min3 = %d\n", minoff[i][0], minoff[i][1], minoff[i][2]);
      // printf ("max1 = %d, max2 = %d, max3 = %d\n", maxoff[i][0], maxoff[i][1], maxoff[i][2]);

      if (minoff[i][0] == 1000)
	nbitoff[i][0] = 0;
      else
	{
	  nbitoff[i][0] = 1;
	  d = maxoff[i][0] - minoff[i][0];
	  c = 1;
	  while (c < d)
	    {
	      ++nbitoff[i][0];
	      c *= 2;
	    }
	  total_bits += nbitoff[i][0];
	}

      if (minoff[i][1] == 1000)
	nbitoff[i][1] = 0;
      else
	{
	  nbitoff[i][1] = 1;
	  d = maxoff[i][1] - minoff[i][1];
	  c = 1;
	  while (c < d)
	    {
	      ++nbitoff[i][1];
	      c *= 2;
	    }
	  total_bits += nbitoff[i][1];
	}

      if (minoff[i][2] == 1000)
	nbitoff[i][2] = 0;
      else
	{
	  nbitoff[i][2] = 1;
	  d = maxoff[i][2] - minoff[i][2];
	  c = 1;
	  while (c < d)
	    {
	      ++nbitoff[i][2];
	      c *= 2;
	    }
	  total_bits += nbitoff[i][2];
	}
      // printf ("off1 = %d, off2 = %d, off3 = %d\n", nbitoff[i][0], nbitoff[i][1], nbitoff[i][2]);

      nbitfct[i] = 1;
      d = nfct_names[i];
      c = 1;
      while (c < d)
	{
	  ++nbitfct[i];
	  c *= 2;
	}
      total_bits += nbitfct[i];
      // printf ("%d fct[%d], %d bits\n", nfct_names[i], i, nbitfct[i]);

      if (nstrs[i] != 0)
	{
	  nbitstr[i] = 1;
	  d = nstrs[i];
	  c = 1;
	  while (c < d)
	    {
	      ++nbitstr[i];
	      c *= 2;
	    }
	  total_bits += nbitstr[i];
	}

      // twalk (fct_names[i], nameout);
    }

  nbitsuf = 0;
  d = nsuffixes;
  c = 1;
  while (c < d)
    {
      ++nbitsuf;
      c *= 2;
    }
  total_bits += nbitsuf;
  // printf ("%d suffixes, %d bits\n", nsuffixes, nbitsuf);
}


static int
compare_syn (const void *p1, const void *p2)
{
  const struct synonym *s1 = (const struct synonym *) p1;
  const struct synonym *s2 = (const struct synonym *) p2;

  return strcmp (s1->from, s2->from);
}


static int
compare_suf (const void *p1, const void *p2)
{
  const struct suffix *s1 = (const struct suffix *) p1;
  const struct suffix *s2 = (const struct suffix *) p2;

  return strcmp (s1->name, s2->name);
}


static int count_op_str;
static int off_op_str;
static void
print_op_str (const void *nodep, VISIT value,
	      int level __attribute__ ((unused)))
{
  if (value == leaf || value == postorder)
    {
      const char *str = (*(struct argstring **) nodep)->str;
      fprintf (outfile, "%s\n  \"%s",
	       count_op_str == 0 ? "" : "\\0\"", str);
      (*(struct argstring **) nodep)->idx = ++count_op_str;
      (*(struct argstring **) nodep)->off = off_op_str;
      off_op_str += strlen (str) + 1;
    }
}


static void
print_op_str_idx (const void *nodep, VISIT value,
		  int level __attribute__ ((unused)))
{
  if (value == leaf || value == postorder)
    printf ("  %d,\n", (*(struct argstring **) nodep)->off);
}


static void
print_op_fct (const void *nodep, VISIT value,
	      int level __attribute__ ((unused)))
{
  if (value == leaf || value == postorder)
    {
      fprintf (outfile, "  FCT_%s,\n", (*(struct argstring **) nodep)->str);
      (*(struct argstring **) nodep)->idx = ++count_op_str;
    }
}


#if NMNES < 2
# error "bogus NMNES value"
#endif

static void
instrtable_out (void)
{
  find_numbers ();

#if 0
  create_mnemonic_table ();

  fprintf (outfile, "#define MNEMONIC_BITS %zu\n", best_mnemonic_bits);
#else
  fprintf (outfile, "#define MNEMONIC_BITS %ld\n",
	   lrint (ceil (log2 (NMNES))));
#endif
  fprintf (outfile, "#define SUFFIX_BITS %d\n", nbitsuf);
  for (int i = 0; i < 3; ++i)
    {
      fprintf (outfile, "#define FCT%d_BITS %d\n", i + 1, nbitfct[i]);
      if (nbitstr[i] != 0)
	fprintf (outfile, "#define STR%d_BITS %d\n", i + 1, nbitstr[i]);
      fprintf (outfile, "#define OFF%d_1_BITS %d\n", i + 1, nbitoff[i][0]);
      fprintf (outfile, "#define OFF%d_1_BIAS %d\n", i + 1, minoff[i][0]);
      if (nbitoff[i][1] != 0)
	{
	  fprintf (outfile, "#define OFF%d_2_BITS %d\n", i + 1, nbitoff[i][1]);
	  fprintf (outfile, "#define OFF%d_2_BIAS %d\n", i + 1, minoff[i][1]);
	}
      if (nbitoff[i][2] != 0)
	{
	  fprintf (outfile, "#define OFF%d_3_BITS %d\n", i + 1, nbitoff[i][2]);
	  fprintf (outfile, "#define OFF%d_3_BIAS %d\n", i + 1, minoff[i][2]);
	}
    }

  fputs ("\n#include <i386_data.h>\n\n", outfile);


#define APPEND(a, b) APPEND_ (a, b)
#define APPEND_(a, b) a##b
#define EMIT_SUFFIX(suf) \
  fprintf (outfile, "#define suffix_%s %d\n", #suf, APPEND (suffix_, suf))
  EMIT_SUFFIX (none);
  EMIT_SUFFIX (w);
  EMIT_SUFFIX (w0);
  EMIT_SUFFIX (W);
  EMIT_SUFFIX (tttn);
  EMIT_SUFFIX (D);
  EMIT_SUFFIX (w1);
  EMIT_SUFFIX (W1);

  fputc_unlocked ('\n', outfile);

  for (int i = 0; i < 3; ++i)
    {
      /* Functions.  */
      count_op_str = 0;
      fprintf (outfile, "static const opfct_t op%d_fct[] =\n{\n  NULL,\n",
	       i + 1);
      twalk (fct_names[i], print_op_fct);
      fputs ("};\n", outfile);

      /* The operand strings.  */
      if (nbitstr[i] != 0)
	{
	  count_op_str = 0;
	  off_op_str = 0;
	  fprintf (outfile, "static const char op%d_str[] =", i + 1);
	  twalk (strs[i], print_op_str);
	  fputs ("\";\n", outfile);

	  fprintf (outfile, "static const uint8_t op%d_str_idx[] = {\n",
		   i + 1);
	  twalk (strs[i], print_op_str_idx);
	  fputs ("};\n", outfile);
	}
    }


  fputs ("static const struct instr_enc instrtab[] =\n{\n", outfile);
  struct instruction *instr;
  for (instr = instructions; instr != NULL; instr = instr->next)
    {
      fputs ("  {", outfile);
      if (instr->mnemonic == (void *) -1l)
	fputs (" .mnemonic = MNE_INVALID,", outfile);
      else
	fprintf (outfile, " .mnemonic = MNE_%s,", instr->mnemonic);
      fprintf (outfile, " .rep = %d,", instr->rep);
      fprintf (outfile, " .repe = %d,", instr->repe);
      fprintf (outfile, " .suffix = %d,", instr->suffix);
      fprintf (outfile, " .modrm = %d,", instr->modrm);

      for (int i = 0; i < 3; ++i)
	{
	  int idx = 0;
	  if (instr->operands[i].fct != NULL)
	    {
	      struct argstring search = { .str = instr->operands[i].fct };
	      struct argstring **res = tfind (&search, &fct_names[i],
					      compare_argstring);
	      assert (res != NULL);
	      idx = (*res)->idx;
	    }
	  fprintf (outfile, " .fct%d = %d,", i + 1, idx);

	  idx = 0;
	  if (instr->operands[i].str != NULL)
	    {
	      struct argstring search = { .str = instr->operands[i].str };
	      struct argstring **res = tfind (&search, &strs[i],
					      compare_argstring);
	      assert (res != NULL);
	      idx = (*res)->idx;
	    }
	  if (nbitstr[i] != 0)
	    fprintf (outfile, " .str%d = %d,", i + 1, idx);

	  fprintf (outfile, " .off%d_1 = %d,", i + 1,
		   MAX (0, instr->operands[i].off1 - minoff[i][0]));

	  if (nbitoff[i][1] != 0)
	    fprintf (outfile, " .off%d_2 = %d,", i + 1,
		     MAX (0, instr->operands[i].off2 - minoff[i][1]));

	  if (nbitoff[i][2] != 0)
	    fprintf (outfile, " .off%d_3 = %d,", i + 1,
		     MAX (0, instr->operands[i].off3 - minoff[i][2]));
	}

      fputs (" },\n", outfile);
    }
  fputs ("};\n", outfile);

  fputs ("static const uint8_t match_data[] =\n{\n", outfile);
  size_t cnt = 0;
  for (instr = instructions; instr != NULL; instr = instr->next, ++cnt)
    {
      /* First count the number of bytes.  */
      size_t totalbits = 0;
      size_t zerobits = 0;
      bool leading_p = true;
      size_t leadingbits = 0;
      struct bitvalue *b = instr->bytes;
      while (b != NULL)
	{
	  if (b->type == zeroone)
	    {
	      ++totalbits;
	      zerobits = 0;
	      if (leading_p)
		++leadingbits;
	    }
	  else
	    {
	      totalbits += b->field->bits;
	      /* We must always count the mod/rm byte.  */
	      if (strncasecmp (b->field->name, "mod", 3) == 0)
		zerobits = 0;
	      else
		zerobits += b->field->bits;
	      leading_p = false;
	    }
	  b = b->next;
	}
      size_t nbytes = (totalbits - zerobits + 7) / 8;
      assert (nbytes > 0);
      size_t leadingbytes = leadingbits / 8;

      fprintf (outfile, "  %#zx,", nbytes | (leadingbytes << 4));

      /* Now create the mask and byte values.  */
      uint8_t byte = 0;
      uint8_t mask = 0;
      int nbits = 0;
      b = instr->bytes;
      while (b != NULL)
	{
	  if (b->type == zeroone)
	    {
	      byte = (byte << 1) | b->value;
	      mask = (mask << 1) | 1;
	      if (++nbits == 8)
		{
		  if (leadingbytes > 0)
		    {
		      assert (mask == 0xff);
		      fprintf (outfile, " %#" PRIx8 ",", byte);
		      --leadingbytes;
		    }
		  else
		    fprintf (outfile, " %#" PRIx8 ", %#" PRIx8 ",",
			     mask, byte);
		  byte = mask = nbits = 0;
		  if (--nbytes == 0)
		    break;
		}
	    }
	  else
	    {
	      assert (leadingbytes == 0);

	      unsigned long int remaining = b->field->bits;
	      while (nbits + remaining > 8)
		{
		  fprintf (outfile, " %#" PRIx8 ", %#" PRIx8 ",",
			   mask << (8 - nbits), byte << (8 - nbits));
		  remaining = nbits + remaining - 8;
		  byte = mask = nbits = 0;
		  if (--nbytes == 0)
		    break;
		}
	      byte <<= remaining;
	      mask <<= remaining;
	      nbits += remaining;
	      if (nbits == 8)
		{
		  fprintf (outfile, " %#" PRIx8 ", %#" PRIx8 ",", mask, byte);
		  byte = mask = nbits = 0;
		  if (--nbytes == 0)
		    break;
		}
	    }
	  b = b->next;
	}

      fputc_unlocked ('\n', outfile);
    }
  fputs ("};\n", outfile);
}


#if 0
static size_t mnemonic_maxlen;
static size_t mnemonic_minlen;
static size_t
which_chars (const char *str[], size_t nstr)
{
  char used_char[256];
  memset (used_char, '\0', sizeof (used_char));
  mnemonic_maxlen = 0;
  mnemonic_minlen = 10000;
  for (size_t cnt = 0; cnt < nstr; ++cnt)
    {
      const unsigned char *cp = (const unsigned char *) str[cnt];
      mnemonic_maxlen = MAX (mnemonic_maxlen, strlen ((char *) cp));
      mnemonic_minlen = MIN (mnemonic_minlen, strlen ((char *) cp));
      do
        used_char[*cp++] = 1;
      while (*cp != '\0');
    }
  size_t nused_char = 0;
  for (size_t cnt = 0; cnt < 256; ++cnt)
    if (used_char[cnt] != 0)
      ++nused_char;
  return nused_char;
}


static const char **mnemonic_strs;
static size_t nmnemonic_strs;
static void
add_mnemonics (const void *nodep, VISIT value,
	       int level __attribute__ ((unused)))
{
  if (value == leaf || value == postorder)
    mnemonic_strs[nmnemonic_strs++] = *(const char **) nodep;
}


struct charfreq
{
  char ch;
  int freq;
};
static struct charfreq pfxfreq[256];
static struct charfreq sfxfreq[256];


static int
compare_freq (const void *p1, const void *p2)
{
  const struct charfreq *c1 = (const struct charfreq *) p1;
  const struct charfreq *c2 = (const struct charfreq *) p2;

  if (c1->freq > c2->freq)
    return -1;
  if (c1->freq < c2->freq)
    return 1;
  return 0;
}


static size_t
compute_pfxfreq (const char *str[], size_t nstr)
{
  memset (pfxfreq, '\0', sizeof (pfxfreq));

  for (size_t i = 0; i < nstr; ++i)
    pfxfreq[i].ch = i;

  for (size_t i = 0; i < nstr; ++i)
    ++pfxfreq[*((const unsigned char *) str[i])].freq;

  qsort (pfxfreq, 256, sizeof (struct charfreq), compare_freq);

  size_t n = 0;
  while (n < 256 && pfxfreq[n].freq != 0)
    ++n;
  return n;
}


struct strsnlen
{
  const char *str;
  size_t len;
};

static size_t
compute_sfxfreq (size_t nstr, struct strsnlen *strsnlen)
{
  memset (sfxfreq, '\0', sizeof (sfxfreq));

  for (size_t i = 0; i < nstr; ++i)
    sfxfreq[i].ch = i;

  for (size_t i = 0; i < nstr; ++i)
    ++sfxfreq[((const unsigned char *) strchrnul (strsnlen[i].str, '\0'))[-1]].freq;

  qsort (sfxfreq, 256, sizeof (struct charfreq), compare_freq);

  size_t n = 0;
  while (n < 256 && sfxfreq[n].freq != 0)
    ++n;
  return n;
}


static void
create_mnemonic_table (void)
{
  mnemonic_strs = xmalloc (nmnemonics * sizeof (char *));

  twalk (mnemonics, add_mnemonics);

  (void) which_chars (mnemonic_strs, nmnemonic_strs);

  size_t best_so_far = 100000000;
  char *best_prefix = NULL;
  char *best_suffix = NULL;
  char *best_table = NULL;
  size_t best_table_size = 0;
  size_t best_table_bits = 0;
  size_t best_prefix_bits = 0;

  /* We can precompute the prefix characters.  */
  size_t npfx_char = compute_pfxfreq (mnemonic_strs, nmnemonic_strs);

  /* Compute best size for string representation including explicit NUL.  */
  for (size_t pfxbits = 0; (1u << pfxbits) < 2 * npfx_char; ++pfxbits)
    {
      char prefix[1 << pfxbits];
      size_t i;
      for (i = 0; i < (1u << pfxbits) - 1; ++i)
	prefix[i] = pfxfreq[i].ch;
      prefix[i] = '\0';

      struct strsnlen strsnlen[nmnemonic_strs];

      for (i = 0; i < nmnemonic_strs; ++i)
	{
	  if (strchr (prefix, *mnemonic_strs[i]) != NULL)
	    strsnlen[i].str = mnemonic_strs[i] + 1;
	  else
	    strsnlen[i].str = mnemonic_strs[i];
	  strsnlen[i].len = strlen (strsnlen[i].str);
	}

      /* With the prefixes gone, try to combine strings.  */
      size_t nstrsnlen = 1;
      for (i = 1; i < nmnemonic_strs; ++i)
	{
	  size_t j;
	  for (j = 0; j < nstrsnlen; ++j)
	    if (strsnlen[i].len > strsnlen[j].len
		&& strcmp (strsnlen[j].str,
			   strsnlen[i].str + (strsnlen[i].len
					      - strsnlen[j].len)) == 0)
	      {
		strsnlen[j] = strsnlen[i];
		break;
	      }
	    else if (strsnlen[i].len < strsnlen[j].len
		     && strcmp (strsnlen[i].str,
				strsnlen[j].str + (strsnlen[j].len
						   - strsnlen[i].len)) == 0)
	      break;
;
	  if (j == nstrsnlen)
	      strsnlen[nstrsnlen++] = strsnlen[i];
	}

      size_t nsfx_char = compute_sfxfreq (nstrsnlen, strsnlen);

      for (size_t sfxbits = 0; (1u << sfxbits) < 2 * nsfx_char; ++sfxbits)
	{
	  char suffix[1 << sfxbits];

	  for (i = 0; i < (1u << sfxbits) - 1; ++i)
	    suffix[i] = sfxfreq[i].ch;
	  suffix[i] = '\0';

	  size_t newlen[nstrsnlen];

	  for (i = 0; i < nstrsnlen; ++i)
	    if (strchr (suffix, strsnlen[i].str[strsnlen[i].len - 1]) != NULL)
	      newlen[i] = strsnlen[i].len - 1;
	    else
	      newlen[i] = strsnlen[i].len;

	  char charused[256];
	  memset (charused, '\0', sizeof (charused));
	  size_t ncharused = 0;

	  const char *tablestr[nstrsnlen];
	  size_t ntablestr = 1;
	  tablestr[0] = strsnlen[0].str;
	  size_t table = newlen[0] + 1;
	  for (i = 1; i < nstrsnlen; ++i)
	    {
	      size_t j;
	      for (j = 0; j < ntablestr; ++j)
		if (newlen[i] > newlen[j]
		    && memcmp (tablestr[j],
			       strsnlen[i].str + (newlen[i] - newlen[j]),
			       newlen[j]) == 0)
		  {
		    table += newlen[i] - newlen[j];
		    tablestr[j] = strsnlen[i].str;
		    newlen[j] = newlen[i];
		    break;
		  }
		else if (newlen[i] < newlen[j]
		     && memcmp (strsnlen[i].str,
				tablestr[j] + (newlen[j] - newlen[i]),
				newlen[i]) == 0)
		  break;

	      if (j == ntablestr)
		{
		  table += newlen[i] + 1;
		  tablestr[ntablestr] = strsnlen[i].str;
		  newlen[ntablestr] = newlen[i];

		  ++ntablestr;
		}

	      for (size_t x = 0; x < newlen[j]; ++x)
		if (charused[((const unsigned char *) tablestr[j])[x]]++ == 0)
		  ++ncharused;
	    }

	  size_t ncharused_bits = 0;
	  i = 1;
	  while (i < ncharused)
	    {
	      i *= 2;
	      ++ncharused_bits;
	    }

	  size_t table_bits = 0;
	  i = 1;
	  while (i < table)
	    {
	      i *= 2;
	      ++table_bits;
	    }

	  size_t mnemonic_bits = table_bits + pfxbits + sfxbits;
	  size_t new_total = (((table + 7) / 8) * ncharused_bits + ncharused
			      + (pfxbits == 0 ? 0 : (1 << pfxbits) - 1)
			      + (sfxbits == 0 ? 0 : (1 << sfxbits) - 1)
			      + (((total_bits + mnemonic_bits + 7) / 8)
				 * ninstructions));

	  if (new_total < best_so_far)
	    {
	      best_so_far = new_total;
	      best_mnemonic_bits = mnemonic_bits;

	      free (best_suffix);
	      best_suffix = xstrdup (suffix);

	      free (best_prefix);
	      best_prefix = xstrdup (prefix);
	      best_prefix_bits = pfxbits;

	      best_table_size = table;
	      best_table_bits = table_bits;
	      char *cp = best_table = xrealloc (best_table, table);
	      for (i = 0; i < ntablestr; ++i)
		{
		  assert (cp + newlen[i] + 1 <= best_table + table);
		  cp = mempcpy (cp, tablestr[i], newlen[i]);
		  *cp++ = '\0';
		}
	      assert (cp == best_table + table);
	    }
	}
    }

  fputs ("static const char mnemonic_table[] =\n\"", outfile);
  for (size_t i = 0; i < best_table_size; ++i)
    {
      if (((i + 1) % 60) == 0)
	fputs ("\"\n\"", outfile);
      if (!isascii (best_table[i]) || !isprint (best_table[i]))
	fprintf (outfile, "\\%03o", best_table[i]);
      else
	fputc (best_table[i], outfile);
    }
  fputs ("\";\n", outfile);

  if (best_prefix[0] != '\0')
    fprintf (outfile,
	     "static const char prefix[%zu] = \"%s\";\n"
	     "#define PREFIXCHAR_BITS %zu\n",
	     strlen (best_prefix), best_prefix, best_prefix_bits);
  else
    fputs ("#define NO_PREFIX\n", outfile);

  if (best_suffix[0] != '\0')
    fprintf (outfile, "static const char suffix[%zu] = \"%s\";\n",
	     strlen (best_suffix), best_suffix);
  else
    fputs ("#define NO_SUFFIX\n", outfile);

  for (size_t i = 0; i < nmnemonic_strs; ++i)
    {
      const char *mne = mnemonic_strs[i];

      size_t pfxval = 0;
      char *cp = strchr (best_prefix, *mne);
      if (cp != NULL)
	{
	  pfxval = 1 + (cp - best_prefix);
	  ++mne;
	}

      size_t l = strlen (mne);

      size_t sfxval = 0;
      cp = strchr (best_suffix, mne[l - 1]);
      if (cp != NULL)
	{
	  sfxval = 1 + (cp - best_suffix);
	  --l;
	}

      char *off = memmem (best_table, best_table_size, mne, l);
      while (off[l] != '\0')
	{
	  off = memmem (off + 1, best_table_size, mne, l);
	  assert (off != NULL);
	}

      fprintf (outfile, "#define MNE_%s %#zx\n",
	       mnemonic_strs[i],
	       (off - best_table)
	       + ((pfxval + (sfxval << best_prefix_bits)) << best_table_bits));
    }
}
#endif

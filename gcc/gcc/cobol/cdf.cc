/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Substitute the type names.  */
#define YYSTYPE         YDFSTYPE
#define YYLTYPE         YDFLTYPE
/* Substitute the variable and function names.  */
#define yyparse         ydfparse
#define yylex           ydflex
#define yyerror         ydferror
#define yydebug         ydfdebug
#define yynerrs         ydfnerrs
#define yylval          ydflval
#define yychar          ydfchar
#define yylloc          ydflloc

/* First part of user prologue.  */
#line 30 "cdf.y"


#include "cobol-system.h"
#include <coretypes.h>
#include <tree.h>

#undef yy_flex_debug

#include "../../libgcobol/ec.h"
#include "../../libgcobol/common-defs.h"
#include "util.h"
#include "cbldiag.h"
#include "symbols.h"
#include "copybook.h"
#include "../../libgcobol/exceptl.h"
#include "exceptg.h"

#define COUNT_OF(X) (sizeof(X) / sizeof(X[0]))

copybook_t copybook;

static inline bool
is_word( int c ) {
  return c == '_' || ISALNUM(c);
}

static std::pair<long long, bool>
integer_literal( const char input[] ) {
  long long v;
  int n;
  bool fOK = 1 == sscanf(input, "%lld%n", &v, &n) &&
             n == (int)strlen(input);
  return std::make_pair(v, fOK);
}

/* "The renamed symbols include 'yyparse', 'yylex', 'yyerror',
    'yynerrs', 'yylval', 'yylloc', 'yychar' and 'yydebug'.  [...] The
    renamed macros include 'YYSTYPE', 'YYLTYPE', and 'YYDEBUG'" */

extern int yylineno, yyleng;
extern char *yytext;

static int ydflex(void);

#define PROGRAM current_program_index()

const YYLTYPE& cobol_location();
static YYLTYPE location_set( const YYLTYPE& loc );
void input_file_status_notify();

#define YYLLOC_DEFAULT(Current, Rhs, N) 				\
  do {									\
      if (N)                                                            \
        {                                                               \
          (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;        \
          (Current).first_column = YYRHSLOC (Rhs, 1).first_column;      \
          (Current).last_line    = YYRHSLOC (Rhs, N).last_line;         \
          (Current).last_column  = YYRHSLOC (Rhs, N).last_column;       \
	  location_dump("cdf.c", N,					\
			"rhs N  ", YYRHSLOC (Rhs, N));			\
        }                                                               \
      else                                                              \
        {                                                               \
          (Current).first_line   =					\
	  (Current).last_line    = YYRHSLOC (Rhs, 0).last_line;		\
          (Current).first_column =					\
	  (Current).last_column  = YYRHSLOC (Rhs, 0).last_column;	\
        }                                                               \
      location_dump("cdf.c", __LINE__, "current", (Current));		\
      input_file_status_notify();					\
      location_set(Current);                                            \
  } while (0)

#line 161 "cdf.y"

static char *display_msg;
const char * keyword_str( int token );

exception_turn_t exception_turn;
			
bool
apply_cdf_turn( const exception_turn_t& turn ) {
  cbl_enabled_exceptions_t& enabled_exceptions( cdf_enabled_exceptions() );
  
  for( auto elem : turn.exception_files() ) {
    std::set<size_t> files(elem.second.begin(), elem.second.end());
    enabled_exceptions.turn_on_off(turn.enabled,
                                   turn.location,
                                   elem.first, files);
  }
  if( getenv("GCOBOL_SHOW") ) enabled_exceptions.dump();
  return true;
}

#line 176 "cdf.cc"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

#include "cdf.h"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_BOOL = 3,                       /* BOOL  */
  YYSYMBOL_FEATURE = 4,                    /* FEATURE  */
  YYSYMBOL_NUMBER = 5,                     /* NUMBER  */
  YYSYMBOL_EXCEPTION_NAME = 6,             /* "EXCEPTION NAME"  */
  YYSYMBOL_BY = 7,                         /* BY  */
  YYSYMBOL_COPY = 8,                       /* COPY  */
  YYSYMBOL_CDF_DISPLAY = 9,                /* ">>DISPLAY"  */
  YYSYMBOL_IN = 10,                        /* IN  */
  YYSYMBOL_NAME = 11,                      /* NAME  */
  YYSYMBOL_NUMSTR = 12,                    /* "numeric literal"  */
  YYSYMBOL_OF = 13,                        /* OF  */
  YYSYMBOL_PSEUDOTEXT = 14,                /* PSEUDOTEXT  */
  YYSYMBOL_REPLACING = 15,                 /* REPLACING  */
  YYSYMBOL_LITERAL = 16,                   /* LITERAL  */
  YYSYMBOL_SUPPRESS = 17,                  /* SUPPRESS  */
  YYSYMBOL_LSUB = 18,                      /* "("  */
  YYSYMBOL_SUBSCRIPT = 19,                 /* SUBSCRIPT  */
  YYSYMBOL_RSUB = 20,                      /* ")"  */
  YYSYMBOL_CDF_DEFINE = 21,                /* ">>DEFINE"  */
  YYSYMBOL_CDF_IF = 22,                    /* ">>IF"  */
  YYSYMBOL_CDF_ELSE = 23,                  /* ">>ELSE"  */
  YYSYMBOL_CDF_END_IF = 24,                /* ">>END-IF"  */
  YYSYMBOL_CDF_EVALUATE = 25,              /* ">>EVALUATE"  */
  YYSYMBOL_CDF_WHEN = 26,                  /* ">>WHEN"  */
  YYSYMBOL_CDF_END_EVALUATE = 27,          /* ">>END-EVALUATE"  */
  YYSYMBOL_ALL = 28,                       /* ALL  */
  YYSYMBOL_CALL_CONVENTION = 29,           /* ">>CALL-CONVENTION"  */
  YYSYMBOL_COBOL_WORDS = 30,               /* ">>COBOL-WORDS"  */
  YYSYMBOL_CDF_PUSH = 31,                  /* ">>PUSH"  */
  YYSYMBOL_CDF_POP = 32,                   /* ">>POP"  */
  YYSYMBOL_SOURCE_FORMAT = 33,             /* ">>SOURCE FORMAT"  */
  YYSYMBOL_AS = 34,                        /* AS  */
  YYSYMBOL_CONSTANT = 35,                  /* CONSTANT  */
  YYSYMBOL_DEFINED = 36,                   /* DEFINED  */
  YYSYMBOL_OTHER = 37,                     /* OTHER  */
  YYSYMBOL_PARAMETER_kw = 38,              /* "PARAMETER"  */
  YYSYMBOL_OFF = 39,                       /* OFF  */
  YYSYMBOL_OVERRIDE = 40,                  /* OVERRIDE  */
  YYSYMBOL_THRU = 41,                      /* THRU  */
  YYSYMBOL_TRUE_kw = 42,                   /* "True"  */
  YYSYMBOL_CALL_COBOL = 43,                /* "CALL"  */
  YYSYMBOL_CALL_VERBATIM = 44,             /* "CALL (as C)"  */
  YYSYMBOL_TURN = 45,                      /* TURN  */
  YYSYMBOL_CHECKING = 46,                  /* CHECKING  */
  YYSYMBOL_LOCATION = 47,                  /* LOCATION  */
  YYSYMBOL_ON = 48,                        /* ON  */
  YYSYMBOL_WITH = 49,                      /* WITH  */
  YYSYMBOL_OR = 50,                        /* OR  */
  YYSYMBOL_AND = 51,                       /* AND  */
  YYSYMBOL_NOT = 52,                       /* NOT  */
  YYSYMBOL_53_ = 53,                       /* '<'  */
  YYSYMBOL_54_ = 54,                       /* '>'  */
  YYSYMBOL_EQ = 55,                        /* EQ  */
  YYSYMBOL_56_EQUAL_ = 56,                 /* "EQUAL"  */
  YYSYMBOL_NE = 57,                        /* NE  */
  YYSYMBOL_LE = 58,                        /* LE  */
  YYSYMBOL_GE = 59,                        /* GE  */
  YYSYMBOL_60_ = 60,                       /* '-'  */
  YYSYMBOL_61_ = 61,                       /* '+'  */
  YYSYMBOL_62_ = 62,                       /* '*'  */
  YYSYMBOL_63_ = 63,                       /* '/'  */
  YYSYMBOL_NEG = 64,                       /* NEG  */
  YYSYMBOL_65_ = 65,                       /* '.'  */
  YYSYMBOL_66_ = 66,                       /* '('  */
  YYSYMBOL_67_ = 67,                       /* ')'  */
  YYSYMBOL_YYACCEPT = 68,                  /* $accept  */
  YYSYMBOL_top = 69,                       /* top  */
  YYSYMBOL_completes = 70,                 /* completes  */
  YYSYMBOL_complete = 71,                  /* complete  */
  YYSYMBOL_cdf_display = 72,               /* cdf_display  */
  YYSYMBOL_strings = 73,                   /* strings  */
  YYSYMBOL_partials = 74,                  /* partials  */
  YYSYMBOL_partial = 75,                   /* partial  */
  YYSYMBOL_cdf_define = 76,                /* cdf_define  */
  YYSYMBOL_cdf_constant = 77,              /* cdf_constant  */
  YYSYMBOL_override = 78,                  /* override  */
  YYSYMBOL_cdf_turn = 79,                  /* cdf_turn  */
  YYSYMBOL_cdf_call_convention = 80,       /* cdf_call_convention  */
  YYSYMBOL_cdf_push = 81,                  /* cdf_push  */
  YYSYMBOL_cdf_pop = 82,                   /* cdf_pop  */
  YYSYMBOL_cdf_stackable = 83,             /* cdf_stackable  */
  YYSYMBOL_except_names = 84,              /* except_names  */
  YYSYMBOL_except_name = 85,               /* except_name  */
  YYSYMBOL_except_check = 86,              /* except_check  */
  YYSYMBOL_filenames = 87,                 /* filenames  */
  YYSYMBOL_filename = 88,                  /* filename  */
  YYSYMBOL_cdf_if = 89,                    /* cdf_if  */
  YYSYMBOL_90_1 = 90,                      /* $@1  */
  YYSYMBOL_cdf_evaluate = 91,              /* cdf_evaluate  */
  YYSYMBOL_cdf_eval_when = 92,             /* cdf_eval_when  */
  YYSYMBOL_cdf_eval_obj = 93,              /* cdf_eval_obj  */
  YYSYMBOL_cdf_cond_expr = 94,             /* cdf_cond_expr  */
  YYSYMBOL_cdf_bool_expr = 95,             /* cdf_bool_expr  */
  YYSYMBOL_cdf_and = 96,                   /* cdf_and  */
  YYSYMBOL_cdf_reloper = 97,               /* cdf_reloper  */
  YYSYMBOL_cdf_relexpr = 98,               /* cdf_relexpr  */
  YYSYMBOL_cdf_expr = 99,                  /* cdf_expr  */
  YYSYMBOL_cdf_factor = 100,               /* cdf_factor  */
  YYSYMBOL_copy = 101,                     /* copy  */
  YYSYMBOL_copy_impl = 102,                /* copy_impl  */
  YYSYMBOL_copybook_name = 103,            /* copybook_name  */
  YYSYMBOL_replace_bys = 104,              /* replace_bys  */
  YYSYMBOL_replace_by = 105,               /* replace_by  */
  YYSYMBOL_suppress = 106,                 /* suppress  */
  YYSYMBOL_name_any = 107,                 /* name_any  */
  YYSYMBOL_name_one = 108,                 /* name_one  */
  YYSYMBOL_namelit = 109,                  /* namelit  */
  YYSYMBOL_name = 110,                     /* name  */
  YYSYMBOL_inof = 111,                     /* inof  */
  YYSYMBOL_subscripts = 112,               /* subscripts  */
  YYSYMBOL_subscript = 113,                /* subscript  */
  YYSYMBOL_as = 114,                       /* as  */
  YYSYMBOL_on = 115,                       /* on  */
  YYSYMBOL_with = 116                      /* with  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

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


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
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

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if 1

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
#endif /* 1 */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YDFLTYPE_IS_TRIVIAL && YDFLTYPE_IS_TRIVIAL \
             && defined YDFSTYPE_IS_TRIVIAL && YDFSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
  YYLTYPE yyls_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE) \
             + YYSIZEOF (YYLTYPE)) \
      + 2 * YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  76
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   198

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  68
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  49
/* YYNRULES -- Number of rules.  */
#define YYNRULES  126
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  174

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   961


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      66,    67,    62,    61,     2,    60,    65,    63,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      53,     2,    54,     2,     2,     2,     2,     2,     2,     2,
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
       2,     2,     2,     2,     2,     2,     1,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       6,     2,     2,     2,     2,     2,    11,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    55,    16,
       2,     2,     2,     2,     5,     2,    12,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    35,     8,    36,     2,     4,     2,    18,
      38,    40,     2,     2,    20,     2,     2,    19,    17,     2,
       2,     2,    30,     2,     2,    21,     9,    22,    23,    24,
      25,    26,    27,    29,    43,    44,    31,    32,    33,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,    28,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      34,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     7,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    46,     2,
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
       2,     2,     2,     2,     2,     2,    10,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      47,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,    13,    39,     2,
      48,     2,     2,     2,     2,     2,     2,     2,     2,    37,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    14,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,    15,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,    42,     2,    45,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    49,     2,     2,     2,     2,     2,
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
      41,    50,    51,    52,    57,    58,    59,     2,    64,     2,
       3,    56
};

#if YDFDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,   274,   274,   275,   283,   287,   290,   291,   292,   294,
     295,   296,   297,   298,   299,   308,   316,   319,   326,   330,
     335,   336,   337,   338,   339,   340,   343,   367,   373,   377,
     392,   399,   407,   408,   410,   411,   414,   422,   425,   430,
     441,   453,   454,   455,   456,   457,   460,   461,   463,   467,
     474,   475,   476,   482,   486,   495,   506,   509,   509,   515,
     516,   519,   522,   523,   524,   527,   528,   543,   544,   555,
     556,   559,   560,   563,   564,   567,   568,   569,   582,   596,
     597,   598,   601,   602,   603,   604,   605,   606,   607,   608,
     611,   626,   627,   628,   639,   641,   642,   644,   652,   663,
     664,   667,   698,   699,   705,   706,   711,   722,   723,   726,
     737,   746,   747,   750,   751,   760,   761,   764,   765,   774,
     775,   785,   786,   789,   790,   793,   794
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if 1
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "BOOL", "FEATURE",
  "NUMBER", "\"EXCEPTION NAME\"", "BY", "COPY", "\">>DISPLAY\"", "IN",
  "NAME", "\"numeric literal\"", "OF", "PSEUDOTEXT", "REPLACING",
  "LITERAL", "SUPPRESS", "\"(\"", "SUBSCRIPT", "\")\"", "\">>DEFINE\"",
  "\">>IF\"", "\">>ELSE\"", "\">>END-IF\"", "\">>EVALUATE\"", "\">>WHEN\"",
  "\">>END-EVALUATE\"", "ALL", "\">>CALL-CONVENTION\"",
  "\">>COBOL-WORDS\"", "\">>PUSH\"", "\">>POP\"", "\">>SOURCE FORMAT\"",
  "AS", "CONSTANT", "DEFINED", "OTHER", "\"PARAMETER\"", "OFF", "OVERRIDE",
  "THRU", "\"True\"", "\"CALL\"", "\"CALL (as C)\"", "TURN", "CHECKING",
  "LOCATION", "ON", "WITH", "OR", "AND", "NOT", "'<'", "'>'", "EQ",
  "\"EQUAL\"", "NE", "LE", "GE", "'-'", "'+'", "'*'", "'/'", "NEG", "'.'",
  "'('", "')'", "$accept", "top", "completes", "complete", "cdf_display",
  "strings", "partials", "partial", "cdf_define", "cdf_constant",
  "override", "cdf_turn", "cdf_call_convention", "cdf_push", "cdf_pop",
  "cdf_stackable", "except_names", "except_name", "except_check",
  "filenames", "filename", "cdf_if", "$@1", "cdf_evaluate",
  "cdf_eval_when", "cdf_eval_obj", "cdf_cond_expr", "cdf_bool_expr",
  "cdf_and", "cdf_reloper", "cdf_relexpr", "cdf_expr", "cdf_factor",
  "copy", "copy_impl", "copybook_name", "replace_bys", "replace_by",
  "suppress", "name_any", "name_one", "namelit", "name", "inof",
  "subscripts", "subscript", "as", "on", "with", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-113)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-126)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     122,    95,     0,    11,     1,  -113,  -113,    14,    17,  -113,
      87,    87,  -113,  -113,    39,    23,   147,  -113,  -113,   171,
    -113,  -113,  -113,  -113,  -113,  -113,  -113,  -113,  -113,     6,
    -113,    32,  -113,  -113,  -113,    42,  -113,    15,    55,  -113,
      44,  -113,  -113,    37,  -113,    40,  -113,  -113,    98,    98,
      98,    74,  -113,    31,    67,  -113,   127,   100,  -113,  -113,
    -113,   100,  -113,  -113,  -113,    61,  -113,  -113,  -113,  -113,
    -113,  -113,  -113,   108,     2,  -113,  -113,  -113,  -113,  -113,
    -113,  -113,  -113,   110,    95,  -113,  -113,    -4,   -23,   103,
    -113,  -113,   127,  -113,  -113,   -16,    74,    74,    98,    98,
      98,    98,    98,    98,    98,    98,    98,    98,    98,  -113,
     108,  -113,    24,  -113,  -113,   125,  -113,  -113,  -113,    98,
      -2,  -113,  -113,    67,  -113,   100,   100,   100,   100,   100,
     100,    25,    25,  -113,  -113,   100,  -113,  -113,  -113,    21,
    -113,  -113,  -113,  -113,   125,  -113,   121,  -113,    47,   -22,
      89,  -113,   -22,  -113,    85,  -113,   125,  -113,  -113,    86,
    -113,   131,    86,  -113,  -113,  -113,  -113,  -113,  -113,  -113,
     113,  -113,  -113,  -113
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,     0,     0,    32,     0,    21,    22,     0,     0,    25,
       0,     0,    37,    38,     0,     0,     5,     6,    10,     2,
      18,     9,    11,    12,    13,    14,    20,    23,    24,     0,
      94,   102,   106,   107,   108,    97,    16,    15,   121,    33,
       0,    57,    65,     0,    91,    90,    93,    92,     0,     0,
       0,     0,    56,    67,    70,    72,    73,    81,    89,    90,
      60,    59,    64,    61,    62,    81,    44,    41,    42,    43,
      45,    39,    40,    48,     0,    46,     1,     7,     8,    19,
       4,     3,   103,    96,     0,    17,   122,     0,   121,     0,
      68,    66,    74,    87,    86,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    55,
      49,    53,   123,    47,    36,     0,    98,    31,    30,     0,
       0,    58,    88,    69,    71,    75,    80,    77,    78,    76,
      79,    83,    82,    84,    85,    63,    54,    51,   124,    50,
     113,   111,   105,   112,    95,    99,     0,   104,   109,    34,
      34,    28,    34,   126,     0,   100,     0,   115,   116,     0,
     119,     0,   110,   117,    35,    27,    29,    26,    52,   101,
       0,   114,   118,   120
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -113,  -113,  -113,   134,  -113,  -113,  -113,     8,  -113,  -113,
     -68,  -113,  -113,  -113,  -113,   140,  -113,    64,  -113,  -113,
      45,  -113,  -113,  -113,  -113,  -113,   144,   106,    79,    80,
     128,    -7,  -113,  -113,  -113,  -113,  -113,    43,  -113,    27,
     104,  -113,  -113,  -113,  -113,  -112,   101,  -113,  -113
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,    15,    16,    17,    18,    37,    19,    20,    21,    40,
     165,    22,    23,    24,    25,    71,    74,    75,   114,   110,
     111,    26,    89,    27,    28,    63,    52,    53,    54,    55,
      56,    57,    58,    29,    30,    31,   144,   145,    83,   146,
      35,   147,   148,   161,   162,   163,    87,   139,   154
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      61,    65,    41,    44,    42,    43,    44,    80,    73,    59,
      46,    86,    45,    46,    47,    38,    36,    47,   164,    44,
      42,    43,    44,    76,    78,    59,    46,    79,    45,    46,
      47,    85,   119,    47,    96,   117,   150,   151,   104,   105,
     106,   107,    93,    94,   118,    73,    39,   170,   112,    82,
     172,   122,    84,    48,    62,    88,    60,   157,    49,    50,
     158,    49,    50,   137,    51,   159,   160,    51,  -125,    48,
     153,    81,   138,    90,    49,    50,    91,    49,    50,    44,
      51,    96,   166,    51,   167,    59,    46,   106,   107,    86,
      47,   125,   126,   127,   128,   129,   130,   131,   132,   133,
     134,   135,   108,    44,   159,   160,    32,    33,    66,    59,
      46,    34,   149,   152,    47,    67,    68,    69,    97,   109,
      70,   104,   105,   106,   107,   115,    48,   121,   156,   164,
       1,     2,   168,   173,    49,    50,   140,   141,   113,   142,
      51,   143,   171,     3,     4,     5,     6,     7,     8,     9,
      77,    72,    64,    10,    11,   136,     2,    95,    49,    50,
     104,   105,   106,   107,    51,    12,    13,    14,     3,     4,
       5,     6,     7,     8,     9,   123,    92,   124,    10,    11,
      98,    99,   100,   169,   101,   102,   103,   155,   116,   120,
      12,    13,    14,     4,     5,     6,     7,     8,     9
};

static const yytype_uint8 yycheck[] =
{
       7,     8,     1,     5,     3,     4,     5,     1,     6,    11,
      12,    34,    11,    12,    16,     4,    16,    16,    40,     5,
       3,     4,     5,     0,    16,    11,    12,    19,    11,    12,
      16,    16,    55,    16,    50,    39,    38,    39,    60,    61,
      62,    63,    49,    50,    48,     6,    35,   159,    46,    17,
     162,    67,    10,    52,    37,    11,    42,    10,    60,    61,
      13,    60,    61,    39,    66,    18,    19,    66,    47,    52,
      49,    65,    48,    36,    60,    61,    36,    60,    61,     5,
      66,    50,   150,    66,   152,    11,    12,    62,    63,    34,
      16,    98,    99,   100,   101,   102,   103,   104,   105,   106,
     107,   108,    41,     5,    18,    19,    11,    12,    21,    11,
      12,    16,   119,   120,    16,    28,    29,    30,    51,    11,
      33,    60,    61,    62,    63,    15,    52,    24,     7,    40,
       8,     9,    47,    20,    60,    61,    11,    12,    74,    14,
      66,    16,    11,    21,    22,    23,    24,    25,    26,    27,
      16,    11,     8,    31,    32,   110,     9,    51,    60,    61,
      60,    61,    62,    63,    66,    43,    44,    45,    21,    22,
      23,    24,    25,    26,    27,    96,    48,    97,    31,    32,
      53,    54,    55,   156,    57,    58,    59,   144,    84,    88,
      43,    44,    45,    22,    23,    24,    25,    26,    27
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     8,     9,    21,    22,    23,    24,    25,    26,    27,
      31,    32,    43,    44,    45,    69,    70,    71,    72,    74,
      75,    76,    79,    80,    81,    82,    89,    91,    92,   101,
     102,   103,    11,    12,    16,   108,    16,    73,     4,    35,
      77,     1,     3,     4,     5,    11,    12,    16,    52,    60,
      61,    66,    94,    95,    96,    97,    98,    99,   100,    11,
      42,    99,    37,    93,    94,    99,    21,    28,    29,    30,
      33,    83,    83,     6,    84,    85,     0,    71,    75,    75,
       1,    65,    17,   106,    10,    16,    34,   114,    11,    90,
      36,    36,    98,    99,    99,    95,    50,    51,    53,    54,
      55,    57,    58,    59,    60,    61,    62,    63,    41,    11,
      87,    88,    46,    85,    86,    15,   108,    39,    48,    55,
     114,    24,    67,    96,    97,    99,    99,    99,    99,    99,
      99,    99,    99,    99,    99,    99,    88,    39,    48,   115,
      11,    12,    14,    16,   104,   105,   107,   109,   110,    99,
      38,    39,    99,    49,   116,   105,     7,    10,    13,    18,
      19,   111,   112,   113,    40,    78,    78,    78,    47,   107,
     113,    11,   113,    20
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    68,    69,    69,    69,    69,    70,    70,    70,    71,
      71,    71,    71,    71,    71,    72,    73,    73,    74,    74,
      75,    75,    75,    75,    75,    75,    76,    76,    76,    76,
      76,    76,    77,    77,    78,    78,    79,    80,    80,    81,
      82,    83,    83,    83,    83,    83,    84,    84,    85,    85,
      86,    86,    86,    87,    87,    88,    89,    90,    89,    91,
      91,    92,    93,    93,    93,    94,    94,    94,    94,    95,
      95,    96,    96,    97,    97,    98,    98,    98,    98,    98,
      98,    98,    99,    99,    99,    99,    99,    99,    99,    99,
     100,   100,   100,   100,   101,   102,   102,   103,   103,   104,
     104,   105,   106,   106,   107,   107,   108,   108,   108,   109,
     109,   109,   109,   110,   110,   111,   111,   112,   112,   113,
     113,   114,   114,   115,   115,   116,   116
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     2,     1,     1,     2,     2,     1,
       1,     1,     1,     1,     1,     2,     1,     2,     1,     2,
       1,     1,     1,     1,     1,     1,     6,     6,     5,     6,
       4,     4,     0,     1,     0,     1,     3,     1,     1,     2,
       2,     1,     1,     1,     1,     1,     1,     2,     1,     2,
       2,     2,     4,     1,     2,     1,     2,     0,     4,     2,
       2,     2,     1,     3,     1,     1,     2,     1,     2,     3,
       1,     3,     1,     1,     2,     3,     3,     3,     3,     3,
       3,     1,     3,     3,     3,     3,     2,     2,     3,     1,
       1,     1,     1,     1,     1,     4,     2,     2,     4,     1,
       2,     3,     0,     1,     1,     1,     1,     1,     1,     1,
       2,     1,     1,     1,     3,     1,     1,     1,     2,     1,
       3,     0,     1,     0,     1,     0,     1
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YDF_YDFEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YDF_YDFEMPTY)                                        \
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

/* Backward compatibility with an undocumented macro.
   Use YDF_YDFerror or YDF_YDFUNDEF. */
#define YYERRCODE YDF_YDFUNDEF

/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)                                \
    do                                                                  \
      if (N)                                                            \
        {                                                               \
          (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;        \
          (Current).first_column = YYRHSLOC (Rhs, 1).first_column;      \
          (Current).last_line    = YYRHSLOC (Rhs, N).last_line;         \
          (Current).last_column  = YYRHSLOC (Rhs, N).last_column;       \
        }                                                               \
      else                                                              \
        {                                                               \
          (Current).first_line   = (Current).last_line   =              \
            YYRHSLOC (Rhs, 0).last_line;                                \
          (Current).first_column = (Current).last_column =              \
            YYRHSLOC (Rhs, 0).last_column;                              \
        }                                                               \
    while (0)
#endif

#define YYRHSLOC(Rhs, K) ((Rhs)[K])


/* Enable debugging if requested.  */
#if YDFDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)


/* YYLOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

# ifndef YYLOCATION_PRINT

#  if defined YY_LOCATION_PRINT

   /* Temporary convenience wrapper in case some people defined the
      undocumented and private YY_LOCATION_PRINT macros.  */
#   define YYLOCATION_PRINT(File, Loc)  YY_LOCATION_PRINT(File, *(Loc))

#  elif defined YDFLTYPE_IS_TRIVIAL && YDFLTYPE_IS_TRIVIAL

/* Print *YYLOCP on YYO.  Private, do not rely on its existence. */

YY_ATTRIBUTE_UNUSED
static int
yy_location_print_ (FILE *yyo, YYLTYPE const * const yylocp)
{
  int res = 0;
  int end_col = 0 != yylocp->last_column ? yylocp->last_column - 1 : 0;
  if (0 <= yylocp->first_line)
    {
      res += YYFPRINTF (yyo, "%d", yylocp->first_line);
      if (0 <= yylocp->first_column)
        res += YYFPRINTF (yyo, ".%d", yylocp->first_column);
    }
  if (0 <= yylocp->last_line)
    {
      if (yylocp->first_line < yylocp->last_line)
        {
          res += YYFPRINTF (yyo, "-%d", yylocp->last_line);
          if (0 <= end_col)
            res += YYFPRINTF (yyo, ".%d", end_col);
        }
      else if (0 <= end_col && yylocp->first_column < end_col)
        res += YYFPRINTF (yyo, "-%d", end_col);
    }
  return res;
}

#   define YYLOCATION_PRINT  yy_location_print_

    /* Temporary convenience wrapper in case some people defined the
       undocumented and private YY_LOCATION_PRINT macros.  */
#   define YY_LOCATION_PRINT(File, Loc)  YYLOCATION_PRINT(File, &(Loc))

#  else

#   define YYLOCATION_PRINT(File, Loc) ((void) 0)
    /* Temporary convenience wrapper in case some people defined the
       undocumented and private YY_LOCATION_PRINT macros.  */
#   define YY_LOCATION_PRINT  YYLOCATION_PRINT

#  endif
# endif /* !defined YYLOCATION_PRINT */


# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value, Location); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  YY_USE (yylocationp);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  switch (yykind)
    {
    case YYSYMBOL_BOOL: /* BOOL  */
#line 192 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).boolean)? "true" : "false" ); }
#line 1195 "cdf.cc"
        break;

    case YYSYMBOL_NAME: /* NAME  */
#line 193 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1201 "cdf.cc"
        break;

    case YYSYMBOL_NUMSTR: /* "numeric literal"  */
#line 193 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1207 "cdf.cc"
        break;

    case YYSYMBOL_PSEUDOTEXT: /* PSEUDOTEXT  */
#line 193 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1213 "cdf.cc"
        break;

    case YYSYMBOL_LITERAL: /* LITERAL  */
#line 193 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1219 "cdf.cc"
        break;

    case YYSYMBOL_LSUB: /* "("  */
#line 193 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1225 "cdf.cc"
        break;

    case YYSYMBOL_SUBSCRIPT: /* SUBSCRIPT  */
#line 193 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1231 "cdf.cc"
        break;

    case YYSYMBOL_RSUB: /* ")"  */
#line 193 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1237 "cdf.cc"
        break;

    case YYSYMBOL_DEFINED: /* DEFINED  */
#line 192 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).boolean)? "true" : "false" ); }
#line 1243 "cdf.cc"
        break;

    case YYSYMBOL_override: /* override  */
#line 192 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).boolean)? "true" : "false" ); }
#line 1249 "cdf.cc"
        break;

    case YYSYMBOL_except_check: /* except_check  */
#line 192 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).boolean)? "true" : "false" ); }
#line 1255 "cdf.cc"
        break;

    case YYSYMBOL_cdf_cond_expr: /* cdf_cond_expr  */
#line 192 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).boolean)? "true" : "false" ); }
#line 1261 "cdf.cc"
        break;

    case YYSYMBOL_cdf_bool_expr: /* cdf_bool_expr  */
#line 198 "cdf.y"
         { fprintf(yyo, HOST_SIZE_T_PRINT_DEC " '%s'",
		   (fmt_size_t)((*yyvaluep).cdfval).number, ((*yyvaluep).cdfval).string? ((*yyvaluep).cdfval).string : "" ); }
#line 1268 "cdf.cc"
        break;

    case YYSYMBOL_cdf_and: /* cdf_and  */
#line 198 "cdf.y"
         { fprintf(yyo, HOST_SIZE_T_PRINT_DEC " '%s'",
		   (fmt_size_t)((*yyvaluep).cdfval).number, ((*yyvaluep).cdfval).string? ((*yyvaluep).cdfval).string : "" ); }
#line 1275 "cdf.cc"
        break;

    case YYSYMBOL_cdf_reloper: /* cdf_reloper  */
#line 198 "cdf.y"
         { fprintf(yyo, HOST_SIZE_T_PRINT_DEC " '%s'",
		   (fmt_size_t)((*yyvaluep).cdfval).number, ((*yyvaluep).cdfval).string? ((*yyvaluep).cdfval).string : "" ); }
#line 1282 "cdf.cc"
        break;

    case YYSYMBOL_cdf_relexpr: /* cdf_relexpr  */
#line 198 "cdf.y"
         { fprintf(yyo, HOST_SIZE_T_PRINT_DEC " '%s'",
		   (fmt_size_t)((*yyvaluep).cdfval).number, ((*yyvaluep).cdfval).string? ((*yyvaluep).cdfval).string : "" ); }
#line 1289 "cdf.cc"
        break;

    case YYSYMBOL_cdf_expr: /* cdf_expr  */
#line 198 "cdf.y"
         { fprintf(yyo, HOST_SIZE_T_PRINT_DEC " '%s'",
		   (fmt_size_t)((*yyvaluep).cdfval).number, ((*yyvaluep).cdfval).string? ((*yyvaluep).cdfval).string : "" ); }
#line 1296 "cdf.cc"
        break;

    case YYSYMBOL_cdf_factor: /* cdf_factor  */
#line 198 "cdf.y"
         { fprintf(yyo, HOST_SIZE_T_PRINT_DEC " '%s'",
		   (fmt_size_t)((*yyvaluep).cdfval).number, ((*yyvaluep).cdfval).string? ((*yyvaluep).cdfval).string : "" ); }
#line 1303 "cdf.cc"
        break;

    case YYSYMBOL_name_any: /* name_any  */
#line 194 "cdf.y"
         { fprintf(yyo, "%s '%s'",
		   keyword_str(((*yyvaluep).cdfarg).token),
		   ((*yyvaluep).cdfarg).string? ((*yyvaluep).cdfarg).string : "<nil>" ); }
#line 1311 "cdf.cc"
        break;

    case YYSYMBOL_name_one: /* name_one  */
#line 194 "cdf.y"
         { fprintf(yyo, "%s '%s'",
		   keyword_str(((*yyvaluep).cdfarg).token),
		   ((*yyvaluep).cdfarg).string? ((*yyvaluep).cdfarg).string : "<nil>" ); }
#line 1319 "cdf.cc"
        break;

    case YYSYMBOL_namelit: /* namelit  */
#line 194 "cdf.y"
         { fprintf(yyo, "%s '%s'",
		   keyword_str(((*yyvaluep).cdfarg).token),
		   ((*yyvaluep).cdfarg).string? ((*yyvaluep).cdfarg).string : "<nil>" ); }
#line 1327 "cdf.cc"
        break;

    case YYSYMBOL_name: /* name  */
#line 193 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1333 "cdf.cc"
        break;

    case YYSYMBOL_inof: /* inof  */
#line 193 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1339 "cdf.cc"
        break;

    case YYSYMBOL_subscripts: /* subscripts  */
#line 193 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1345 "cdf.cc"
        break;

    case YYSYMBOL_subscript: /* subscript  */
#line 193 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1351 "cdf.cc"
        break;

      default:
        break;
    }
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  YYLOCATION_PRINT (yyo, yylocationp);
  YYFPRINTF (yyo, ": ");
  yy_symbol_value_print (yyo, yykind, yyvaluep, yylocationp);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
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
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp, YYLTYPE *yylsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)],
                       &(yylsp[(yyi + 1) - (yynrhs)]));
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, yylsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YDFDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YDFDEBUG */


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


/* Context of a parse error.  */
typedef struct
{
  yy_state_t *yyssp;
  yysymbol_kind_t yytoken;
  YYLTYPE *yylloc;
} yypcontext_t;

/* Put in YYARG at most YYARGN of the expected tokens given the
   current YYCTX, and return the number of tokens stored in YYARG.  If
   YYARG is null, return the number of expected tokens (guaranteed to
   be less than YYNTOKENS).  Return YYENOMEM on memory exhaustion.
   Return 0 if there are more than YYARGN expected tokens, yet fill
   YYARG up to YYARGN. */
static int
yypcontext_expected_tokens (const yypcontext_t *yyctx,
                            yysymbol_kind_t yyarg[], int yyargn)
{
  /* Actual size of YYARG. */
  int yycount = 0;
  int yyn = yypact[+*yyctx->yyssp];
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
        if (yycheck[yyx + yyn] == yyx && yyx != YYSYMBOL_YYerror
            && !yytable_value_is_error (yytable[yyx + yyn]))
          {
            if (!yyarg)
              ++yycount;
            else if (yycount == yyargn)
              return 0;
            else
              yyarg[yycount++] = YY_CAST (yysymbol_kind_t, yyx);
          }
    }
  if (yyarg && yycount == 0 && 0 < yyargn)
    yyarg[0] = YYSYMBOL_YYEMPTY;
  return yycount;
}




#ifndef yystrlen
# if defined __GLIBC__ && defined _STRING_H
#  define yystrlen(S) (YY_CAST (YYPTRDIFF_T, strlen (S)))
# else
/* Return the length of YYSTR.  */
static YYPTRDIFF_T
yystrlen (const char *yystr)
{
  YYPTRDIFF_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
# endif
#endif

#ifndef yystpcpy
# if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#  define yystpcpy stpcpy
# else
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
# endif
#endif

#ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYPTRDIFF_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYPTRDIFF_T yyn = 0;
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
            else
              goto append;

          append:
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

  if (yyres)
    return yystpcpy (yyres, yystr) - yyres;
  else
    return yystrlen (yystr);
}
#endif


static int
yy_syntax_error_arguments (const yypcontext_t *yyctx,
                           yysymbol_kind_t yyarg[], int yyargn)
{
  /* Actual size of YYARG. */
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
  if (yyctx->yytoken != YYSYMBOL_YYEMPTY)
    {
      int yyn;
      if (yyarg)
        yyarg[yycount] = yyctx->yytoken;
      ++yycount;
      yyn = yypcontext_expected_tokens (yyctx,
                                        yyarg ? yyarg + 1 : yyarg, yyargn - 1);
      if (yyn == YYENOMEM)
        return YYENOMEM;
      else
        yycount += yyn;
    }
  return yycount;
}

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return -1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return YYENOMEM if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYPTRDIFF_T *yymsg_alloc, char **yymsg,
                const yypcontext_t *yyctx)
{
  enum { YYARGS_MAX = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat: reported tokens (one for the "unexpected",
     one per "expected"). */
  yysymbol_kind_t yyarg[YYARGS_MAX];
  /* Cumulated lengths of YYARG.  */
  YYPTRDIFF_T yysize = 0;

  /* Actual size of YYARG. */
  int yycount = yy_syntax_error_arguments (yyctx, yyarg, YYARGS_MAX);
  if (yycount == YYENOMEM)
    return YYENOMEM;

  switch (yycount)
    {
#define YYCASE_(N, S)                       \
      case N:                               \
        yyformat = S;                       \
        break
    default: /* Avoid compiler warnings. */
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
#undef YYCASE_
    }

  /* Compute error message size.  Don't count the "%s"s, but reserve
     room for the terminator.  */
  yysize = yystrlen (yyformat) - 2 * yycount + 1;
  {
    int yyi;
    for (yyi = 0; yyi < yycount; ++yyi)
      {
        YYPTRDIFF_T yysize1
          = yysize + yytnamerr (YY_NULLPTR, yytname[yyarg[yyi]]);
        if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
          yysize = yysize1;
        else
          return YYENOMEM;
      }
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return -1;
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
          yyp += yytnamerr (yyp, yytname[yyarg[yyi++]]);
          yyformat += 2;
        }
      else
        {
          ++yyp;
          ++yyformat;
        }
  }
  return 0;
}


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep, YYLTYPE *yylocationp)
{
  YY_USE (yyvaluep);
  YY_USE (yylocationp);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Location data for the lookahead symbol.  */
YYLTYPE yylloc
# if defined YDFLTYPE_IS_TRIVIAL && YDFLTYPE_IS_TRIVIAL
  = { 1, 1, 1, 1 }
# endif
;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

    /* The location stack: array, bottom, top.  */
    YYLTYPE yylsa[YYINITDEPTH];
    YYLTYPE *yyls = yylsa;
    YYLTYPE *yylsp = yyls;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;
  YYLTYPE yyloc;

  /* The locations where the error started and ended.  */
  YYLTYPE yyerror_range[3];

  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYPTRDIFF_T yymsg_alloc = sizeof yymsgbuf;

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N), yylsp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YDF_YDFEMPTY; /* Cause a token to be read.  */

  yylsp[0] = yylloc;
  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;
        YYLTYPE *yyls1 = yyls;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yyls1, yysize * YYSIZEOF (*yylsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
        yyls = yyls1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
        YYSTACK_RELOCATE (yyls_alloc, yyls);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;
      yylsp = yyls + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


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

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YDF_YDFEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YDF_YYEOF)
    {
      yychar = YDF_YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YDF_YDFerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YDF_YDFUNDEF;
      yytoken = YYSYMBOL_YYerror;
      yyerror_range[1] = yylloc;
      goto yyerrlab1;
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
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END
  *++yylsp = yylloc;

  /* Discard the shifted token.  */
  yychar = YDF_YDFEMPTY;
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
| yyreduce -- do a reduction.  |
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

  /* Default location. */
  YYLLOC_DEFAULT (yyloc, (yylsp - yylen), yylen);
  yyerror_range[1] = yyloc;
  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* top: partials  */
#line 274 "cdf.y"
                         { YYACCEPT; }
#line 2041 "cdf.cc"
    break;

  case 3: /* top: copy '.'  */
#line 276 "cdf.y"
                {
		  const char *library = copybook.library();
		  if( !library ) library = "SYSLIB";
		  const char *source = copybook.source();
		  dbgmsg("COPY %s from %s", source, library);
		  YYACCEPT;
		}
#line 2053 "cdf.cc"
    break;

  case 4: /* top: copy error  */
#line 283 "cdf.y"
                           {
		  error_msg((yylsp[0]), "COPY directive must end in a %<.%>");
		  YYABORT;
		}
#line 2062 "cdf.cc"
    break;

  case 5: /* top: completes  */
#line 287 "cdf.y"
                          { YYACCEPT; }
#line 2068 "cdf.cc"
    break;

  case 15: /* cdf_display: ">>DISPLAY" strings  */
#line 308 "cdf.y"
                                    {
		  if( scanner_parsing() ) {
		    fprintf(stderr, "%s\n", display_msg);
		    free(display_msg);
		    display_msg = NULL;
		  }
		}
#line 2080 "cdf.cc"
    break;

  case 16: /* strings: LITERAL  */
#line 316 "cdf.y"
                        {
		  display_msg = xstrdup((yyvsp[0].string));
		}
#line 2088 "cdf.cc"
    break;

  case 17: /* strings: strings LITERAL  */
#line 319 "cdf.y"
                                {
		  char *p = display_msg;
		  display_msg = xasprintf("%s %s", p, (yyvsp[0].string));
		  free(p);
		}
#line 2098 "cdf.cc"
    break;

  case 18: /* partials: partial  */
#line 327 "cdf.y"
                {
		  if( ! scanner_parsing() ) YYACCEPT;
		}
#line 2106 "cdf.cc"
    break;

  case 19: /* partials: partials partial  */
#line 331 "cdf.y"
                {
		  if( ! scanner_parsing() ) YYACCEPT;
		}
#line 2114 "cdf.cc"
    break;

  case 21: /* partial: ">>ELSE"  */
#line 336 "cdf.y"
                                  { scanner_parsing_toggle(); }
#line 2120 "cdf.cc"
    break;

  case 22: /* partial: ">>END-IF"  */
#line 337 "cdf.y"
                                  { scanner_parsing_pop(); }
#line 2126 "cdf.cc"
    break;

  case 25: /* partial: ">>END-EVALUATE"  */
#line 340 "cdf.y"
                                  { scanner_parsing_pop(); }
#line 2132 "cdf.cc"
    break;

  case 26: /* cdf_define: ">>DEFINE" cdf_constant NAME as cdf_expr override  */
#line 344 "cdf.y"
                {
		  if( keyword_tok((yyvsp[-3].string)) ) {
		    error_msg((yylsp[-3]), "%s is a COBOL keyword", (yyvsp[-3].string));
		    YYERROR;
		  }
		  if( !cdfval_add( (yyvsp[-3].string), cdfval_t((yyvsp[-1].cdfval)), (yyvsp[0].boolean)) ) {
		    error_msg((yylsp[-3]), "name already in dictionary: %s", (yyvsp[-3].string));
                    cdf_values_t& dictionary( cdf_dictionary() );
		    const cdfval_t& entry = dictionary[(yyvsp[-3].string)];
		    if( entry.filename ) {
		      error_msg((yylsp[-3]), "%s previously defined in %s:%d",
				(yyvsp[-3].string), entry.filename, entry.lineno);
		    } else {
		      error_msg((yylsp[-3]), "%s was defined on the command line", (yyvsp[-3].string));
		    }
		    YYERROR;
		  }
                  if( symbols_begin() < symbols_end() ) {
                    cbl_field_t field = cdf_literalize((yyvsp[-3].string), (yyvsp[-1].cdfval));
                    symbol_field_add(current_program_index(), &field);                    
                  }

		}
#line 2160 "cdf.cc"
    break;

  case 27: /* cdf_define: ">>DEFINE" cdf_constant NAME EQ cdf_expr override  */
#line 368 "cdf.y"
                {  /* accept, but as error */
		  if( scanner_parsing() ) {
		    error_msg((yylsp[-3]), "CDF error: %s = value invalid", (yyvsp[-3].string));
		  }
		}
#line 2170 "cdf.cc"
    break;

  case 28: /* cdf_define: ">>DEFINE" cdf_constant NAME as OFF  */
#line 374 "cdf.y"
                {
		  cdfval_off( (yyvsp[-2].string));
		}
#line 2178 "cdf.cc"
    break;

  case 29: /* cdf_define: ">>DEFINE" cdf_constant NAME as "PARAMETER" override  */
#line 385 "cdf.y"
                {
		  if( 0 == cdf_dictionary().count((yyvsp[-3].string)) ) {
                    cbl_message((yylsp[-3]), CdfParameterW,
                                "CDF: '%s' is defined AS PARAMETER "
                                "but was not defined", (yyvsp[-3].string));
		  }
		}
#line 2190 "cdf.cc"
    break;

  case 30: /* cdf_define: ">>DEFINE" FEATURE as ON  */
#line 392 "cdf.y"
                                         {
		  auto feature = cbl_gcobol_feature_t((yyvsp[-2].number));
		  if( ! cobol_gcobol_feature_set(feature, true) ) {
		    error_msg((yylsp[-2]),
                              "%<>>DEFINE %%EBCDIC-MODE%> is invalid within program body");
		  }
		}
#line 2202 "cdf.cc"
    break;

  case 31: /* cdf_define: ">>DEFINE" FEATURE as OFF  */
#line 399 "cdf.y"
                                          {
		  auto feature = cbl_gcobol_feature_t((yyvsp[-2].number));
		  if( ! cobol_gcobol_feature_set(feature, false) ) {
		    error_msg((yylsp[-2]),
                              "%<>>DEFINE %%EBCDIC-MODE%> is invalid within program body");
		  }
		}
#line 2214 "cdf.cc"
    break;

  case 34: /* override: %empty  */
#line 410 "cdf.y"
                         { (yyval.boolean) = false; }
#line 2220 "cdf.cc"
    break;

  case 35: /* override: OVERRIDE  */
#line 411 "cdf.y"
                         { (yyval.boolean) = true; }
#line 2226 "cdf.cc"
    break;

  case 36: /* cdf_turn: TURN except_names except_check  */
#line 415 "cdf.y"
                {
		  apply_cdf_turn(exception_turn);
		  exception_turn.clear();
		}
#line 2235 "cdf.cc"
    break;

  case 37: /* cdf_call_convention: "CALL"  */
#line 422 "cdf.y"
                           {
                  current_call_convention(cbl_call_cobol_e);
                }
#line 2243 "cdf.cc"
    break;

  case 38: /* cdf_call_convention: "CALL (as C)"  */
#line 425 "cdf.y"
                              {
                  current_call_convention(cbl_call_verbatim_e);
                }
#line 2251 "cdf.cc"
    break;

  case 39: /* cdf_push: ">>PUSH" cdf_stackable  */
#line 430 "cdf.y"
                                       {
		  switch( (yyvsp[0].number) ) {
                  case YDF_ALL: 		cdf_push(); break;
                  case YDF_CALL_CONVENTION: cdf_push_call_convention(); break;
                  case YDF_CDF_DEFINE: 	cdf_push_dictionary(); break;
                  case YDF_COBOL_WORDS: 	cdf_push_current_tokens(); break;
                  case YDF_SOURCE_FORMAT:	cdf_push_source_format(); break;
                  default: gcc_unreachable(); 
                  }
                }
#line 2266 "cdf.cc"
    break;

  case 40: /* cdf_pop: ">>POP" cdf_stackable  */
#line 441 "cdf.y"
                                      {
		  switch( (yyvsp[0].number) ) {
                  case YDF_ALL: 		cdf_pop(); break;
                  case YDF_CALL_CONVENTION: cdf_pop_call_convention(); break;
                  case YDF_CDF_DEFINE: 	cdf_pop_dictionary(); break;
                  case YDF_COBOL_WORDS: 	cdf_pop_current_tokens(); break;
                  case YDF_SOURCE_FORMAT:	cdf_pop_source_format(); break; 
                  default: gcc_unreachable(); 
                  }
                }
#line 2281 "cdf.cc"
    break;

  case 41: /* cdf_stackable: ALL  */
#line 453 "cdf.y"
                                { (yyval.number) = YDF_ALL; }
#line 2287 "cdf.cc"
    break;

  case 42: /* cdf_stackable: ">>CALL-CONVENTION"  */
#line 454 "cdf.y"
                                { (yyval.number) = YDF_CALL_CONVENTION; }
#line 2293 "cdf.cc"
    break;

  case 43: /* cdf_stackable: ">>COBOL-WORDS"  */
#line 455 "cdf.y"
                                { (yyval.number) = YDF_COBOL_WORDS; }
#line 2299 "cdf.cc"
    break;

  case 44: /* cdf_stackable: ">>DEFINE"  */
#line 456 "cdf.y"
                                { (yyval.number) = YDF_CDF_DEFINE; }
#line 2305 "cdf.cc"
    break;

  case 45: /* cdf_stackable: ">>SOURCE FORMAT"  */
#line 457 "cdf.y"
                                { (yyval.number) = YDF_SOURCE_FORMAT; }
#line 2311 "cdf.cc"
    break;

  case 48: /* except_name: "EXCEPTION NAME"  */
#line 463 "cdf.y"
                                   {
		  assert((yyvsp[0].number) != ec_none_e);
		  exception_turn.add_exception(ec_type_t((yyvsp[0].number)));
		}
#line 2320 "cdf.cc"
    break;

  case 49: /* except_name: "EXCEPTION NAME" filenames  */
#line 467 "cdf.y"
                                             {
		  assert((yyvsp[-1].number) != ec_none_e);
		  std::list<size_t> files((yyvsp[0].files)->begin(), (yyvsp[0].files)->end());
		  exception_turn.add_exception(ec_type_t((yyvsp[-1].number)), files);
		}
#line 2330 "cdf.cc"
    break;

  case 50: /* except_check: CHECKING on  */
#line 474 "cdf.y"
                             { (yyval.boolean) = exception_turn.enable(true); }
#line 2336 "cdf.cc"
    break;

  case 51: /* except_check: CHECKING OFF  */
#line 475 "cdf.y"
                             { (yyval.boolean) = exception_turn.enable(false); }
#line 2342 "cdf.cc"
    break;

  case 52: /* except_check: CHECKING on with LOCATION  */
#line 477 "cdf.y"
                {
		  (yyval.boolean) = exception_turn.enable(true, true);
		}
#line 2350 "cdf.cc"
    break;

  case 53: /* filenames: filename  */
#line 482 "cdf.y"
                         {
		  (yyval.files) = new std::set<size_t>;
		  (yyval.files)->insert(symbol_index(symbol_elem_of((yyvsp[0].file))));
		}
#line 2359 "cdf.cc"
    break;

  case 54: /* filenames: filenames filename  */
#line 486 "cdf.y"
                                   {
		  (yyval.files) = (yyvsp[-1].files);
		  auto inserted = (yyval.files)->insert(symbol_index(symbol_elem_of((yyvsp[0].file))));
		  if( ! inserted.second ) {
		    error_msg((yylsp[0]), "%s: No file-name shall be specified more than "
			      "once for one exception condition", (yyvsp[0].file)->name);
		  }
		}
#line 2372 "cdf.cc"
    break;

  case 55: /* filename: NAME  */
#line 496 "cdf.y"
                {
                  struct symbol_elem_t *e = symbol_file(PROGRAM, (yyvsp[0].string));
                  if( !(e && e->type == SymFile) ) {
		    error_msg((yylsp[0]), "invalid file name '%s'", (yyvsp[0].string));
		    YYERROR;
                  }
                  (yyval.file) = cbl_file_of(e);
                }
#line 2385 "cdf.cc"
    break;

  case 56: /* cdf_if: ">>IF" cdf_cond_expr  */
#line 506 "cdf.y"
                                     {
		  scanner_parsing(YDF_CDF_IF, (yyvsp[0].boolean));
		}
#line 2393 "cdf.cc"
    break;

  case 57: /* $@1: %empty  */
#line 509 "cdf.y"
                             {
		}
#line 2400 "cdf.cc"
    break;

  case 58: /* cdf_if: ">>IF" error $@1 ">>END-IF"  */
#line 510 "cdf.y"
                             { // not pushed, don't pop
		  if( ! scanner_parsing() ) YYACCEPT;
		}
#line 2408 "cdf.cc"
    break;

  case 66: /* cdf_cond_expr: NAME DEFINED  */
#line 529 "cdf.y"
                {
                  cdf_values_t& dictionary( cdf_dictionary() );
		  auto p = dictionary.find((yyvsp[-1].string));
		  bool found = p != dictionary.end();
		  if( !(yyvsp[0].boolean) ) found = ! found;
		  (yyval.boolean) = found;
		  if( found ) {
		    dbgmsg("CDF: %s found in dictionary (result %s)",
			   (yyvsp[-1].string), (yyval.boolean)? "true" : "false");
		  } else {
		    dbgmsg("CDF: %s not found in dictionary (result %s)",
			   (yyvsp[-1].string), (yyval.boolean)? "true" : "false");
		  }
		}
#line 2427 "cdf.cc"
    break;

  case 67: /* cdf_cond_expr: cdf_bool_expr  */
#line 543 "cdf.y"
                              { (yyval.boolean) = (yyvsp[0].cdfval)((yylsp[0])) == 0? false : true; }
#line 2433 "cdf.cc"
    break;

  case 68: /* cdf_cond_expr: FEATURE DEFINED  */
#line 544 "cdf.y"
                                {
		  const auto& feature((yyvsp[-1].number));
		  (yyval.boolean) = (feature == int(feature & cbl_gcobol_features));
		  dbgmsg("CDF: feature 0x%02x is %s", (yyvsp[-1].number), (yyval.boolean)? "ON" : "OFF");
		}
#line 2443 "cdf.cc"
    break;

  case 69: /* cdf_bool_expr: cdf_bool_expr OR cdf_and  */
#line 555 "cdf.y"
                                         { (yyval.cdfval) = cdfval_t((yyvsp[-2].cdfval)((yylsp[-2])) || (yyvsp[0].cdfval)((yylsp[0]))); }
#line 2449 "cdf.cc"
    break;

  case 71: /* cdf_and: cdf_and AND cdf_reloper  */
#line 559 "cdf.y"
                                        { (yyval.cdfval) = cdfval_t((yyvsp[-2].cdfval)((yylsp[-2])) && (yyvsp[0].cdfval)((yylsp[0]))); }
#line 2455 "cdf.cc"
    break;

  case 74: /* cdf_reloper: NOT cdf_relexpr  */
#line 564 "cdf.y"
                                { (yyval.cdfval) = cdfval_t((yyvsp[0].cdfval).number? 1 : 0); }
#line 2461 "cdf.cc"
    break;

  case 75: /* cdf_relexpr: cdf_relexpr '<' cdf_expr  */
#line 567 "cdf.y"
                                         { (yyval.cdfval) = (yyvsp[-2].cdfval)((yylsp[-2])) <  (yyvsp[0].cdfval)((yylsp[0])); }
#line 2467 "cdf.cc"
    break;

  case 76: /* cdf_relexpr: cdf_relexpr LE cdf_expr  */
#line 568 "cdf.y"
                                         { (yyval.cdfval) = (yyvsp[-2].cdfval)((yylsp[-2])) <= (yyvsp[0].cdfval)((yylsp[0])); }
#line 2473 "cdf.cc"
    break;

  case 77: /* cdf_relexpr: cdf_relexpr EQ cdf_expr  */
#line 569 "cdf.y"
                                        {
		  (yyval.cdfval) = cdfval_t(false);
		  if( ( (yyvsp[-2].cdfval).string &&  (yyvsp[0].cdfval).string) ||
		      (!(yyvsp[-2].cdfval).string && !(yyvsp[0].cdfval).string) )
		  {
		      (yyval.cdfval) = (yyvsp[-2].cdfval) == (yyvsp[0].cdfval);
		  } else {
		    const char *msg = (yyvsp[-2].cdfval).string?
		      "incommensurate comparison is FALSE: '%s' = %ld" :
		      "incommensurate comparison is FALSE: %ld = '%s'" ;
		    error_msg((yylsp[-2]), "%s", msg);
		  }
		}
#line 2491 "cdf.cc"
    break;

  case 78: /* cdf_relexpr: cdf_relexpr NE cdf_expr  */
#line 583 "cdf.y"
                {
		  (yyval.cdfval) = cdfval_t(false);
		  if( ( (yyvsp[-2].cdfval).string &&  (yyvsp[0].cdfval).string) ||
		      (!(yyvsp[-2].cdfval).string && !(yyvsp[0].cdfval).string) )
		  {
		      (yyval.cdfval) = (yyvsp[-2].cdfval) != (yyvsp[0].cdfval);
		  } else {
		    const char *msg = (yyvsp[-2].cdfval).string?
		      "incommensurate comparison is FALSE: '%s' = %ld" :
		      "incommensurate comparison is FALSE: %ld = '%s'" ;
		    error_msg((yylsp[-2]), "%s", msg);
		  }
		}
#line 2509 "cdf.cc"
    break;

  case 79: /* cdf_relexpr: cdf_relexpr GE cdf_expr  */
#line 596 "cdf.y"
                                         { (yyval.cdfval) = (yyvsp[-2].cdfval)((yylsp[-2])) >= (yyvsp[0].cdfval)((yylsp[0])); }
#line 2515 "cdf.cc"
    break;

  case 80: /* cdf_relexpr: cdf_relexpr '>' cdf_expr  */
#line 597 "cdf.y"
                                         { (yyval.cdfval) = (yyvsp[-2].cdfval)((yylsp[-2])) >  (yyvsp[0].cdfval)((yylsp[0])); }
#line 2521 "cdf.cc"
    break;

  case 82: /* cdf_expr: cdf_expr '+' cdf_expr  */
#line 601 "cdf.y"
                                      { (yyval.cdfval) = (yyvsp[-2].cdfval)((yylsp[-2])) + (yyvsp[0].cdfval)((yylsp[0])); }
#line 2527 "cdf.cc"
    break;

  case 83: /* cdf_expr: cdf_expr '-' cdf_expr  */
#line 602 "cdf.y"
                                      { (yyval.cdfval) = (yyvsp[-2].cdfval)((yylsp[-2])) - (yyvsp[0].cdfval)((yylsp[0])); }
#line 2533 "cdf.cc"
    break;

  case 84: /* cdf_expr: cdf_expr '*' cdf_expr  */
#line 603 "cdf.y"
                                      { (yyval.cdfval) = (yyvsp[-2].cdfval)((yylsp[-2])) * (yyvsp[0].cdfval)((yylsp[0])); }
#line 2539 "cdf.cc"
    break;

  case 85: /* cdf_expr: cdf_expr '/' cdf_expr  */
#line 604 "cdf.y"
                                      { (yyval.cdfval) = (yyvsp[-2].cdfval)((yylsp[-2])) / (yyvsp[0].cdfval)((yylsp[0])); }
#line 2545 "cdf.cc"
    break;

  case 86: /* cdf_expr: '+' cdf_expr  */
#line 605 "cdf.y"
                                                { (yyval.cdfval) = (yyvsp[0].cdfval)((yylsp[0])); }
#line 2551 "cdf.cc"
    break;

  case 87: /* cdf_expr: '-' cdf_expr  */
#line 606 "cdf.y"
                                                { (yyval.cdfval) = negate((yyvsp[0].cdfval)((yylsp[0]))); }
#line 2557 "cdf.cc"
    break;

  case 88: /* cdf_expr: '(' cdf_bool_expr ')'  */
#line 607 "cdf.y"
                                                { (yyval.cdfval) = (yyvsp[-1].cdfval)((yylsp[-1])); }
#line 2563 "cdf.cc"
    break;

  case 90: /* cdf_factor: NAME  */
#line 611 "cdf.y"
                     {
                  cdf_values_t& dictionary( cdf_dictionary() );
		  auto that = dictionary.find((yyvsp[0].string));
		  if( that != dictionary.end() ) {
		    (yyval.cdfval) = that->second;
		  } else {
		    if( ! scanner_parsing() ) {
		      cbl_message(CdfNotFoundW,
                                  "CDF skipping: no such variable '%s'", (yyvsp[0].string));
		    } else {
		      error_msg((yylsp[0]), "CDF error: no such variable '%s'", (yyvsp[0].string));
		    }
		    (yyval.cdfval) = cdfval_t();
		  }
		}
#line 2583 "cdf.cc"
    break;

  case 91: /* cdf_factor: NUMBER  */
#line 626 "cdf.y"
                       { (yyval.cdfval) = cdfval_t((yyvsp[0].number)); }
#line 2589 "cdf.cc"
    break;

  case 92: /* cdf_factor: LITERAL  */
#line 627 "cdf.y"
                        { (yyval.cdfval) = cdfval_t((yyvsp[0].string)); }
#line 2595 "cdf.cc"
    break;

  case 93: /* cdf_factor: "numeric literal"  */
#line 628 "cdf.y"
                       {
		  auto value = integer_literal((yyvsp[0].string));
		  if( !value.second ) {
		    error_msg((yylsp[0]), "CDF error: parsed %qs as %lld",
		             (yyvsp[0].string), value.first);
		    YYERROR;
		  }
		  (yyval.cdfval) = cdfval_t(value.first);
		}
#line 2609 "cdf.cc"
    break;

  case 97: /* copybook_name: COPY name_one  */
#line 645 "cdf.y"
                {
		  if( -1 == copybook.open((yylsp[0]), (yyvsp[0].cdfarg).string) ) {
		    error_msg((yylsp[0]), "could not open copybook file "
		             "for '%s'", (yyvsp[0].cdfarg).string);
		    YYABORT;
		  }
		}
#line 2621 "cdf.cc"
    break;

  case 98: /* copybook_name: COPY name_one IN name_one  */
#line 653 "cdf.y"
                {
		  copybook.library((yylsp[0]), (yyvsp[0].cdfarg).string);
		  if( -1 == copybook.open((yylsp[-2]), (yyvsp[-2].cdfarg).string) ) {
		    error_msg((yylsp[-2]), "could not open copybook file "
		             "for %<%s%> in %<%s%>", (yyvsp[-2].cdfarg).string, (yyvsp[0].cdfarg).string);
		    YYABORT;
		  }
		}
#line 2634 "cdf.cc"
    break;

  case 101: /* replace_by: name_any BY name_any  */
#line 668 "cdf.y"
                {
		  bool add_whitespace = false;
		  replace_type_t type = {};
		  switch((yyvsp[-2].cdfarg).token) {
		  case YDF_NUMSTR:
		  case YDF_LITERAL:
		    type = string_e;
		    break;
		  case YDF_NAME:
		    type = token_e;
		    break;
		  case YDF_PSEUDOTEXT:
		    type = pseudo_e;
		    add_whitespace = (yyvsp[0].cdfarg).token != YDF_PSEUDOTEXT;
		    break;
		  default:
		      cbl_err("%s:%d: logic error on token %s",
			   __FILE__, __LINE__, keyword_str((yyvsp[-2].cdfarg).token));
		      break;
		  }
		  char *replacement = const_cast<char*>((yyvsp[0].cdfarg).string);
		  if( add_whitespace ) {
		    char *s = xasprintf(" %s ", replacement);
		    free(replacement);
		    replacement = s;
		  }
		  copybook.replacement( type, (yyvsp[-2].cdfarg).string, replacement );
		}
#line 2667 "cdf.cc"
    break;

  case 103: /* suppress: SUPPRESS  */
#line 700 "cdf.y"
                {
		  copybook.suppress();
		}
#line 2675 "cdf.cc"
    break;

  case 105: /* name_any: PSEUDOTEXT  */
#line 706 "cdf.y"
                           {
		  (yyval.cdfarg) = cdf_arg_t{YDF_PSEUDOTEXT, (yyvsp[0].string)};
		}
#line 2683 "cdf.cc"
    break;

  case 106: /* name_one: NAME  */
#line 712 "cdf.y"
                {
                  cdf_values_t& dictionary( cdf_dictionary() );
		  cdf_arg_t arg = { YDF_NAME, (yyvsp[0].string) };
		  auto p = dictionary.find((yyvsp[0].string));

		  if( p != dictionary.end() ) {
		    arg.string = p->second.string;
		  }
		  (yyval.cdfarg) = arg;
		}
#line 2698 "cdf.cc"
    break;

  case 107: /* name_one: "numeric literal"  */
#line 722 "cdf.y"
                        { (yyval.cdfarg) = cdf_arg_t{YDF_NUMSTR, (yyvsp[0].string)}; }
#line 2704 "cdf.cc"
    break;

  case 108: /* name_one: LITERAL  */
#line 723 "cdf.y"
                        { (yyval.cdfarg) = cdf_arg_t{YDF_LITERAL, (yyvsp[0].string)}; }
#line 2710 "cdf.cc"
    break;

  case 109: /* namelit: name  */
#line 727 "cdf.y"
                {
                  cdf_values_t& dictionary( cdf_dictionary() );
		  cdf_arg_t arg = { YDF_NAME, (yyvsp[0].string) };
		  auto p = dictionary.find((yyvsp[0].string));

		  if( p != dictionary.end() ) {
		    arg.string = p->second.string;
		  }
		  (yyval.cdfarg) = arg;
		}
#line 2725 "cdf.cc"
    break;

  case 110: /* namelit: name subscripts  */
#line 738 "cdf.y"
                {
		  char *s = xasprintf( "%s%s", (yyvsp[-1].string), (yyvsp[0].string) );
		  free(const_cast<char*>((yyvsp[-1].string)));
		  free(const_cast<char*>((yyvsp[0].string)));

		  cdf_arg_t arg = { YDF_NAME, s };
		  (yyval.cdfarg) = arg;
		}
#line 2738 "cdf.cc"
    break;

  case 111: /* namelit: "numeric literal"  */
#line 746 "cdf.y"
                        { (yyval.cdfarg) = cdf_arg_t{YDF_NUMSTR, (yyvsp[0].string)}; }
#line 2744 "cdf.cc"
    break;

  case 112: /* namelit: LITERAL  */
#line 747 "cdf.y"
                        { (yyval.cdfarg) = cdf_arg_t{YDF_LITERAL, (yyvsp[0].string)}; }
#line 2750 "cdf.cc"
    break;

  case 114: /* name: name inof NAME  */
#line 752 "cdf.y"
                {
		  char *s = xasprintf( "%s %s %s", (yyvsp[-2].string), (yyvsp[-1].string), (yyvsp[0].string) );
		  assert((yyval.string) == (yyvsp[-2].string));
		  free(const_cast<char*>((yyvsp[-2].string)));
		  free(const_cast<char*>((yyvsp[0].string)));
		  (yyval.string) = s;
		}
#line 2762 "cdf.cc"
    break;

  case 115: /* inof: IN  */
#line 760 "cdf.y"
                   { static const char in[] = "IN"; (yyval.string) = in; }
#line 2768 "cdf.cc"
    break;

  case 116: /* inof: OF  */
#line 761 "cdf.y"
                   { static const char of[] = "OF"; (yyval.string) = of; }
#line 2774 "cdf.cc"
    break;

  case 118: /* subscripts: subscripts subscript  */
#line 766 "cdf.y"
                {
		  char *s = xasprintf("%s%s", (yyvsp[-1].string), (yyvsp[0].string) );
		  if( (yyval.string) != (yyvsp[-1].string) ) free(const_cast<char*>((yyval.string)));
		  free(const_cast<char*>((yyvsp[-1].string)));
		  free(const_cast<char*>((yyvsp[0].string)));
		  (yyval.string) = s;
		}
#line 2786 "cdf.cc"
    break;

  case 120: /* subscript: "(" subscript ")"  */
#line 776 "cdf.y"
                {
		  char *s = xasprintf( "%s%s%s", (yyvsp[-2].string), (yyvsp[-1].string), (yyvsp[0].string) );
		  free(const_cast<char*>((yyvsp[-2].string)));
		  free(const_cast<char*>((yyvsp[-1].string)));
		  free(const_cast<char*>((yyvsp[0].string)));
		  (yyval.string) = s;
		}
#line 2798 "cdf.cc"
    break;


#line 2802 "cdf.cc"

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
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;
  *++yylsp = yyloc;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YDF_YDFEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      {
        yypcontext_t yyctx
          = {yyssp, yytoken, &yylloc};
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = yysyntax_error (&yymsg_alloc, &yymsg, &yyctx);
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == -1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = YY_CAST (char *,
                             YYSTACK_ALLOC (YY_CAST (YYSIZE_T, yymsg_alloc)));
            if (yymsg)
              {
                yysyntax_error_status
                  = yysyntax_error (&yymsg_alloc, &yymsg, &yyctx);
                yymsgp = yymsg;
              }
            else
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = YYENOMEM;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == YYENOMEM)
          YYNOMEM;
      }
    }

  yyerror_range[1] = yylloc;
  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YDF_YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YDF_YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval, &yylloc);
          yychar = YDF_YDFEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

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

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;

      yyerror_range[1] = *yylsp;
      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp, yylsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  yyerror_range[2] = yylloc;
  ++yylsp;
  YYLLOC_DEFAULT (*yylsp, yyerror_range, 2);

  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YDF_YDFEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval, &yylloc);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp, yylsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
  return yyresult;
}

#line 797 "cdf.y"


static YYLTYPE cdf_location;

static YYLTYPE
location_set( const YYLTYPE& loc ) {
  return cdf_location = loc;
}

bool // used by cobol1.cc
defined_cmd( const char arg[] )
{
  cdf_values_t& dictionary( cdf_dictionary() );
  cdfval_t value(1);

  char *name = xstrdup(arg);
  char *p = strchr(name, '=');
  if(p) {
    *p++ = '\0';
    int pos, number;
    if( 1 == sscanf(p, "%d%n", &number, &pos) && size_t(pos) == strlen(p) ) {
	value = cdfval_t(number);
    } else {
      value = cdfval_t(p);  // it's a string
    }
  }

  dictionary[name] = value;

  auto cdf_name = dictionary.find(name);
  assert(cdf_name != dictionary.end());
  assert(cdf_name->second.is_numeric() || cdf_name->second.string != NULL);

  if( yydebug ) {
    if( cdf_name->second.is_numeric() ) {
      dbgmsg("%s: added -D %s = " HOST_SIZE_T_PRINT_DEC,
             __func__, name, (fmt_size_t)cdf_name->second.as_number());
    } else {
      dbgmsg("%s: added -D %s = \"%s\"", __func__, name, cdf_name->second.string);
    }
  }
  return true;
}

bool operator==( const cdfval_base_t& lhs, int rhs ) {
  gcc_assert( !lhs.string );
  return lhs.number == rhs;
}

bool operator||( const cdfval_base_t& lhs, const cdfval_base_t& rhs ) {
  gcc_assert( !lhs.string && !rhs.string );
  return lhs.number || rhs.number;
}

bool operator&&( const cdfval_base_t& lhs, const cdfval_base_t& rhs ) {
  gcc_assert( !lhs.string && !rhs.string );
  return lhs.number && rhs.number;
}

cdfval_t operator<( const cdfval_base_t& lhs, const cdfval_base_t& rhs ) {
  gcc_assert( !lhs.string && !rhs.string );
  return cdfval_t(lhs.number < rhs.number);
}

cdfval_t operator<=( const cdfval_base_t& lhs, const cdfval_base_t& rhs ) {
  gcc_assert( !lhs.string && !rhs.string );
  return cdfval_t(lhs.number <= rhs.number);
}

cdfval_t operator==( const cdfval_base_t& lhs, const cdfval_base_t& rhs ) {
  if( lhs.string && rhs.string ) {
    return cdfval_t(0 == strcasecmp(lhs.string, rhs.string));
  }
  if( !lhs.string && !rhs.string ) {
    return cdfval_t(lhs.number == rhs.number);
  }
  cbl_internal_error("incommensurate operands");
  return false;
}

cdfval_t operator!=( const cdfval_base_t& lhs, const cdfval_base_t& rhs ) {
  if( lhs.string && rhs.string ) {
    return cdfval_t(0 != strcasecmp(lhs.string, rhs.string));
  }
  if( !lhs.string && !rhs.string ) {
    return cdfval_t(lhs.number != rhs.number);
  }
  cbl_internal_error("incommensurate operands");
  return false;
}

cdfval_t operator>=( const cdfval_base_t& lhs, const cdfval_base_t& rhs ) {
  gcc_assert( !lhs.string && !rhs.string );
  return cdfval_t(lhs.number >= rhs.number);
}

cdfval_t operator>( const cdfval_base_t& lhs, const cdfval_base_t& rhs ) {
  gcc_assert( !lhs.string && !rhs.string );
  return cdfval_t(lhs.number > rhs.number);
}

cdfval_t operator+( const cdfval_base_t& lhs, const cdfval_base_t& rhs ) {
  gcc_assert( !lhs.string && !rhs.string );
  return cdfval_t(lhs.number + rhs.number);
}

cdfval_t operator-( const cdfval_base_t& lhs, const cdfval_base_t& rhs ) {
  gcc_assert( !lhs.string && !rhs.string );
  return cdfval_t(lhs.number - rhs.number);
}

cdfval_t operator*( const cdfval_base_t& lhs, const cdfval_base_t& rhs ) {
  gcc_assert( !lhs.string && !rhs.string );
  return cdfval_t(lhs.number * rhs.number);
}

cdfval_t operator/( const cdfval_base_t& lhs, const cdfval_base_t& rhs ) {
  gcc_assert( !lhs.string && !rhs.string );
  return cdfval_t(lhs.number / rhs.number);
}

cdfval_t negate( cdfval_base_t lhs ) {
  gcc_assert( !lhs.string );
  lhs.number = -lhs.number;
  return lhs;
}

#undef yylex
int yylex(void);

static int ydflex(void) {
  return yylex();
}

bool
cdf_value( const char name[], const cdfval_t& value ) {
  cdf_values_t& dictionary( cdf_dictionary() );
  auto p = dictionary.find(name);

  if( p != dictionary.end() ) return false;

  dictionary[name] = value;
  return true;
}

const cdfval_t *
cdf_value( const char name[] ) {
  cdf_values_t& dictionary( cdf_dictionary() );
  auto p = dictionary.find(name);

  if( p == dictionary.end() ) return NULL;

  return &p->second;
}

static bool
verify_integer( const YDFLTYPE& loc, const cdfval_base_t& val ) {
  if( val.string ) {
    error_msg(loc, "'%s' is not an integer", val.string);
    return false;
  }
  return true;
}

const cdfval_base_t&
cdfval_base_t::operator()( const YDFLTYPE& loc ) {
  static cdfval_t zero(0);
  // cppcheck-suppress returnTempReference
  return verify_integer(loc, *this) ? *this : zero;
}

  

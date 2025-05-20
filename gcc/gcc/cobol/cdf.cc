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
#include "coretypes.h"
#include "tree.h"
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
      gcc_location_set( location_set(Current) );			\
  } while (0)

#line 154 "cdf.y"

static char *display_msg;
const char * keyword_str( int token );

static class exception_turns_t {
  typedef std::list<size_t> filelist_t;
  typedef std::map<ec_type_t, filelist_t> ec_filemap_t;
  ec_filemap_t exceptions;
 public:
  bool enabled, location;

  exception_turns_t() : enabled(false), location(false) {};

  const ec_filemap_t& exception_files() const { return exceptions; }

  struct args_t {
    size_t nexception;
    cbl_exception_files_t *exceptions;
  };

  bool add_exception( ec_type_t type, const filelist_t files = filelist_t() ) {
    ec_disposition_t disposition = ec_type_disposition(type);
    if( disposition != ec_implemented(disposition) ) {
	cbl_unimplementedw("CDF: exception '%s'", ec_type_str(type));
    }
    auto elem = exceptions.find(type);
    if( elem != exceptions.end() ) return false; // cannot add twice

    exceptions[type] = files;
    return true;
  }

  args_t args() const {
    args_t args;
    args.nexception = exceptions.size();
    args.exceptions = NULL;
    if( args.nexception ) {
      args.exceptions = new cbl_exception_files_t[args.nexception];
    }
    std::transform( exceptions.begin(), exceptions.end(), args.exceptions,
                    []( auto& input ) {
                      cbl_exception_files_t output;
                      output.type = input.first;
                      output.nfile = input.second.size();
                      output.files = NULL;
                      if( output.nfile ) {
                        output.files = new size_t[output.nfile];
                        std::copy(input.second.begin(),
                                       input.second.end(),
                                       output.files );
                      }
                      return output;
                    } );
    return args;
  }

  void clear() {
    for( auto& ex : exceptions ) {
      ex.second.clear();
    }
    exceptions.clear();
    enabled = location = false;
  }

} exception_turns;


static bool
apply_cdf_turn( exception_turns_t& turns ) {
  for( auto elem : turns.exception_files() ) {
    std::set<size_t> files(elem.second.begin(), elem.second.end());
    enabled_exceptions.turn_on_off(turns.enabled,
                                   turns.location,
                                   elem.first, files);
  }
  if( getenv("GCOBOL_SHOW") ) enabled_exceptions.dump();
  return true;
}

#line 233 "cdf.cc"

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
  YYSYMBOL_AS = 28,                        /* AS  */
  YYSYMBOL_CONSTANT = 29,                  /* CONSTANT  */
  YYSYMBOL_DEFINED = 30,                   /* DEFINED  */
  YYSYMBOL_OTHER = 31,                     /* OTHER  */
  YYSYMBOL_PARAMETER_kw = 32,              /* "PARAMETER"  */
  YYSYMBOL_OFF = 33,                       /* OFF  */
  YYSYMBOL_OVERRIDE = 34,                  /* OVERRIDE  */
  YYSYMBOL_THRU = 35,                      /* THRU  */
  YYSYMBOL_TRUE_kw = 36,                   /* "True"  */
  YYSYMBOL_CALL_COBOL = 37,                /* "CALL"  */
  YYSYMBOL_CALL_VERBATIM = 38,             /* "CALL (as C)"  */
  YYSYMBOL_TURN = 39,                      /* TURN  */
  YYSYMBOL_CHECKING = 40,                  /* CHECKING  */
  YYSYMBOL_LOCATION = 41,                  /* LOCATION  */
  YYSYMBOL_ON = 42,                        /* ON  */
  YYSYMBOL_WITH = 43,                      /* WITH  */
  YYSYMBOL_OR = 44,                        /* OR  */
  YYSYMBOL_AND = 45,                       /* AND  */
  YYSYMBOL_NOT = 46,                       /* NOT  */
  YYSYMBOL_47_ = 47,                       /* '<'  */
  YYSYMBOL_48_ = 48,                       /* '>'  */
  YYSYMBOL_49_ = 49,                       /* '='  */
  YYSYMBOL_NE = 50,                        /* NE  */
  YYSYMBOL_LE = 51,                        /* LE  */
  YYSYMBOL_GE = 52,                        /* GE  */
  YYSYMBOL_53_ = 53,                       /* '-'  */
  YYSYMBOL_54_ = 54,                       /* '+'  */
  YYSYMBOL_55_ = 55,                       /* '*'  */
  YYSYMBOL_56_ = 56,                       /* '/'  */
  YYSYMBOL_NEG = 57,                       /* NEG  */
  YYSYMBOL_58_ = 58,                       /* '.'  */
  YYSYMBOL_59_ = 59,                       /* '('  */
  YYSYMBOL_60_ = 60,                       /* ')'  */
  YYSYMBOL_YYACCEPT = 61,                  /* $accept  */
  YYSYMBOL_top = 62,                       /* top  */
  YYSYMBOL_completes = 63,                 /* completes  */
  YYSYMBOL_complete = 64,                  /* complete  */
  YYSYMBOL_cdf_display = 65,               /* cdf_display  */
  YYSYMBOL_strings = 66,                   /* strings  */
  YYSYMBOL_partials = 67,                  /* partials  */
  YYSYMBOL_partial = 68,                   /* partial  */
  YYSYMBOL_cdf_define = 69,                /* cdf_define  */
  YYSYMBOL_cdf_constant = 70,              /* cdf_constant  */
  YYSYMBOL_override = 71,                  /* override  */
  YYSYMBOL_cdf_turn = 72,                  /* cdf_turn  */
  YYSYMBOL_cdf_call_convention = 73,       /* cdf_call_convention  */
  YYSYMBOL_except_names = 74,              /* except_names  */
  YYSYMBOL_except_name = 75,               /* except_name  */
  YYSYMBOL_except_check = 76,              /* except_check  */
  YYSYMBOL_filenames = 77,                 /* filenames  */
  YYSYMBOL_filename = 78,                  /* filename  */
  YYSYMBOL_cdf_if = 79,                    /* cdf_if  */
  YYSYMBOL_80_1 = 80,                      /* $@1  */
  YYSYMBOL_cdf_evaluate = 81,              /* cdf_evaluate  */
  YYSYMBOL_cdf_eval_when = 82,             /* cdf_eval_when  */
  YYSYMBOL_cdf_eval_obj = 83,              /* cdf_eval_obj  */
  YYSYMBOL_cdf_cond_expr = 84,             /* cdf_cond_expr  */
  YYSYMBOL_cdf_bool_expr = 85,             /* cdf_bool_expr  */
  YYSYMBOL_cdf_and = 86,                   /* cdf_and  */
  YYSYMBOL_cdf_reloper = 87,               /* cdf_reloper  */
  YYSYMBOL_cdf_relexpr = 88,               /* cdf_relexpr  */
  YYSYMBOL_cdf_expr = 89,                  /* cdf_expr  */
  YYSYMBOL_cdf_factor = 90,                /* cdf_factor  */
  YYSYMBOL_copy = 91,                      /* copy  */
  YYSYMBOL_copy_impl = 92,                 /* copy_impl  */
  YYSYMBOL_copybook_name = 93,             /* copybook_name  */
  YYSYMBOL_replace_bys = 94,               /* replace_bys  */
  YYSYMBOL_replace_by = 95,                /* replace_by  */
  YYSYMBOL_suppress = 96,                  /* suppress  */
  YYSYMBOL_name_any = 97,                  /* name_any  */
  YYSYMBOL_name_one = 98,                  /* name_one  */
  YYSYMBOL_namelit = 99,                   /* namelit  */
  YYSYMBOL_name = 100,                     /* name  */
  YYSYMBOL_inof = 101,                     /* inof  */
  YYSYMBOL_subscripts = 102,               /* subscripts  */
  YYSYMBOL_subscript = 103,                /* subscript  */
  YYSYMBOL_as = 104,                       /* as  */
  YYSYMBOL_on = 105,                       /* on  */
  YYSYMBOL_with = 106                      /* with  */
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
#define YYFINAL  65
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   190

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  61
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  46
/* YYNRULES -- Number of rules.  */
#define YYNRULES  117
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  163

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   939


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
      59,    60,    55,    54,     2,    53,    58,    56,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      47,    49,    48,     2,     2,     2,     2,     2,     2,     2,
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
       2,     2,     2,     2,     2,     2,     2,    16,     2,     2,
       2,     2,     5,     2,    12,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    29,
       8,    30,     2,     4,     2,    18,    32,    34,     2,     2,
      20,     2,     2,    19,    17,     2,     2,     2,     2,     2,
       2,    21,     9,    22,    23,    24,    25,    26,    27,    37,
      38,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    28,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     7,     2,     2,     2,
       2,     2,     2,     2,     2,     2,    40,     2,     2,     2,
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
       2,     2,     2,     2,     2,    10,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    41,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,    13,    33,     2,    42,
       2,     2,     2,     2,     2,     2,     2,     2,    31,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    14,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    15,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    36,     2,    39,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    43,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    35,
      44,    45,    46,    50,    51,    52,     2,    57,     2,     3
};

#if YDFDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,   315,   315,   316,   324,   328,   331,   332,   333,   335,
     336,   337,   338,   347,   355,   358,   365,   369,   374,   375,
     376,   377,   378,   379,   382,   400,   406,   410,   424,   430,
     437,   438,   440,   441,   444,   452,   455,   461,   462,   464,
     468,   477,   478,   479,   485,   489,   498,   509,   512,   512,
     519,   520,   523,   526,   527,   528,   531,   532,   547,   548,
     559,   560,   563,   564,   567,   568,   571,   572,   573,   586,
     600,   601,   602,   605,   606,   607,   608,   609,   610,   611,
     612,   615,   628,   629,   630,   641,   643,   644,   646,   654,
     665,   666,   669,   700,   701,   707,   708,   713,   723,   724,
     727,   737,   746,   747,   750,   751,   760,   761,   764,   765,
     774,   775,   785,   786,   789,   790,   793,   794
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
  "\">>END-EVALUATE\"", "AS", "CONSTANT", "DEFINED", "OTHER",
  "\"PARAMETER\"", "OFF", "OVERRIDE", "THRU", "\"True\"", "\"CALL\"",
  "\"CALL (as C)\"", "TURN", "CHECKING", "LOCATION", "ON", "WITH", "OR",
  "AND", "NOT", "'<'", "'>'", "'='", "NE", "LE", "GE", "'-'", "'+'", "'*'",
  "'/'", "NEG", "'.'", "'('", "')'", "$accept", "top", "completes",
  "complete", "cdf_display", "strings", "partials", "partial",
  "cdf_define", "cdf_constant", "override", "cdf_turn",
  "cdf_call_convention", "except_names", "except_name", "except_check",
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

#define YYPACT_NINF (-42)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-117)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     100,   159,    -1,     7,     1,   -42,   -42,    -2,    15,   -42,
     -42,   -42,    19,    21,   107,   -42,   -42,   125,   -42,   -42,
     -42,   -42,   -42,   -42,   -42,     6,   -42,    13,   -42,   -42,
     -42,    55,   -42,    75,    64,   -42,    24,   -42,   -42,    69,
     -42,    77,   -42,   -42,    61,    61,    61,    51,   -42,    73,
      68,   -42,   111,    87,   -42,   -42,   -42,    87,   -42,   -42,
     -42,    40,   108,     2,   -42,   -42,   -42,   -42,   -42,   -42,
     -42,   -42,   103,   159,   -42,   -42,   -10,   -12,   112,   -42,
     -42,   111,   -42,   -42,   -20,    51,    51,    61,    61,    61,
      61,    61,    61,    61,    61,    61,    61,    61,   -42,   108,
     -42,    11,   -42,   -42,   153,   -42,   -42,   -42,    61,    17,
     -42,   -42,    68,   -42,    87,    87,    87,    87,    87,    87,
       3,     3,   -42,   -42,    87,   -42,   -42,   -42,     0,   -42,
     -42,   -42,   -42,   153,   -42,   146,   -42,    93,   101,   132,
     -42,   101,   -42,   127,   -42,   153,   -42,   -42,    60,   -42,
     161,    60,   -42,   -42,   -42,   -42,   -42,   -42,   -42,   154,
     -42,   -42,   -42
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,     0,     0,    30,     0,    19,    20,     0,     0,    23,
      35,    36,     0,     0,     5,     6,    10,     2,    16,     9,
      11,    12,    18,    21,    22,     0,    85,    93,    97,    98,
      99,    88,    14,    13,   112,    31,     0,    48,    56,     0,
      82,    81,    84,    83,     0,     0,     0,     0,    47,    58,
      61,    63,    64,    72,    80,    81,    51,    50,    55,    52,
      53,    72,    39,     0,    37,     1,     7,     8,    17,     4,
       3,    94,    87,     0,    15,   113,     0,   112,     0,    59,
      57,    65,    78,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    46,    40,
      44,   114,    38,    34,     0,    89,    29,    28,     0,     0,
      49,    79,    60,    62,    66,    71,    68,    69,    67,    70,
      74,    73,    75,    76,    54,    45,    42,   115,    41,   104,
     102,    96,   103,    86,    90,     0,    95,   100,    32,    32,
      26,    32,   117,     0,    91,     0,   106,   107,     0,   110,
       0,   101,   108,    33,    25,    27,    24,    43,    92,     0,
     105,   109,   111
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -42,   -42,   -42,   163,   -42,   -42,   -42,    31,   -42,   -42,
     -41,   -42,   -42,   -42,   115,   -42,   -42,    80,   -42,   -42,
     -42,   -42,   -42,   172,   134,    97,    98,   139,    -7,   -42,
     -42,   -42,   -42,   -42,    52,   -42,    41,   114,   -42,   -42,
     -42,   -42,    25,   113,   -42,   -42
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,    13,    14,    15,    16,    33,    17,    18,    19,    36,
     154,    20,    21,    63,    64,   103,    99,   100,    22,    78,
      23,    24,    59,    48,    49,    50,    51,    52,    53,    54,
      25,    26,    27,   133,   134,    72,   135,    31,   136,   137,
     150,   151,   152,    76,   128,   143
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      57,    61,    37,    40,    38,    39,    40,    69,    62,    55,
      42,    34,    41,    42,    43,    32,    75,    43,    38,    39,
      40,    65,    40,   106,    85,    62,    41,    42,    55,    42,
      71,    43,   107,    43,    56,    77,    35,   108,    82,    83,
     111,  -116,   101,   142,   126,    67,    58,    44,    68,   139,
     140,    45,    46,   127,    45,    46,    40,    47,    95,    96,
      47,    44,    55,    42,    70,    73,    40,    43,    45,    46,
      45,    46,    55,    42,    47,    97,    47,    43,   148,   149,
     114,   115,   116,   117,   118,   119,   120,   121,   122,   123,
     124,    74,    75,    93,    94,    95,    96,    44,   155,    79,
     156,   138,   141,   146,    45,    46,   147,    80,     1,     2,
      47,   148,   149,    86,    45,    46,     2,    85,   104,    98,
      47,     3,     4,     5,     6,     7,     8,     9,     3,     4,
       5,     6,     7,     8,     9,   153,   110,    10,    11,    12,
      93,    94,    95,    96,    10,    11,    12,     4,     5,     6,
       7,     8,     9,   145,    93,    94,    95,    96,    87,    88,
      89,    90,    91,    92,   129,   130,   153,   131,   157,   132,
      28,    29,   160,   159,   162,    30,   161,    66,   102,   125,
      60,    84,   112,    81,   113,   144,   158,   105,     0,     0,
     109
};

static const yytype_int16 yycheck[] =
{
       7,     8,     1,     5,     3,     4,     5,     1,     6,    11,
      12,     4,    11,    12,    16,    16,    28,    16,     3,     4,
       5,     0,     5,    33,    44,     6,    11,    12,    11,    12,
      17,    16,    42,    16,    36,    11,    29,    49,    45,    46,
      60,    41,    40,    43,    33,    14,    31,    46,    17,    32,
      33,    53,    54,    42,    53,    54,     5,    59,    55,    56,
      59,    46,    11,    12,    58,    10,     5,    16,    53,    54,
      53,    54,    11,    12,    59,    35,    59,    16,    18,    19,
      87,    88,    89,    90,    91,    92,    93,    94,    95,    96,
      97,    16,    28,    53,    54,    55,    56,    46,   139,    30,
     141,   108,   109,    10,    53,    54,    13,    30,     8,     9,
      59,    18,    19,    45,    53,    54,     9,    44,    15,    11,
      59,    21,    22,    23,    24,    25,    26,    27,    21,    22,
      23,    24,    25,    26,    27,    34,    24,    37,    38,    39,
      53,    54,    55,    56,    37,    38,    39,    22,    23,    24,
      25,    26,    27,     7,    53,    54,    55,    56,    47,    48,
      49,    50,    51,    52,    11,    12,    34,    14,    41,    16,
      11,    12,    11,   148,    20,    16,   151,    14,    63,    99,
       8,    47,    85,    44,    86,   133,   145,    73,    -1,    -1,
      77
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     8,     9,    21,    22,    23,    24,    25,    26,    27,
      37,    38,    39,    62,    63,    64,    65,    67,    68,    69,
      72,    73,    79,    81,    82,    91,    92,    93,    11,    12,
      16,    98,    16,    66,     4,    29,    70,     1,     3,     4,
       5,    11,    12,    16,    46,    53,    54,    59,    84,    85,
      86,    87,    88,    89,    90,    11,    36,    89,    31,    83,
      84,    89,     6,    74,    75,     0,    64,    68,    68,     1,
      58,    17,    96,    10,    16,    28,   104,    11,    80,    30,
      30,    88,    89,    89,    85,    44,    45,    47,    48,    49,
      50,    51,    52,    53,    54,    55,    56,    35,    11,    77,
      78,    40,    75,    76,    15,    98,    33,    42,    49,   104,
      24,    60,    86,    87,    89,    89,    89,    89,    89,    89,
      89,    89,    89,    89,    89,    78,    33,    42,   105,    11,
      12,    14,    16,    94,    95,    97,    99,   100,    89,    32,
      33,    89,    43,   106,    95,     7,    10,    13,    18,    19,
     101,   102,   103,    34,    71,    71,    71,    41,    97,   103,
      11,   103,    20
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    61,    62,    62,    62,    62,    63,    63,    63,    64,
      64,    64,    64,    65,    66,    66,    67,    67,    68,    68,
      68,    68,    68,    68,    69,    69,    69,    69,    69,    69,
      70,    70,    71,    71,    72,    73,    73,    74,    74,    75,
      75,    76,    76,    76,    77,    77,    78,    79,    80,    79,
      81,    81,    82,    83,    83,    83,    84,    84,    84,    84,
      85,    85,    86,    86,    87,    87,    88,    88,    88,    88,
      88,    88,    88,    89,    89,    89,    89,    89,    89,    89,
      89,    90,    90,    90,    90,    91,    92,    92,    93,    93,
      94,    94,    95,    96,    96,    97,    97,    98,    98,    98,
      99,    99,    99,    99,   100,   100,   101,   101,   102,   102,
     103,   103,   104,   104,   105,   105,   106,   106
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     2,     1,     1,     2,     2,     1,
       1,     1,     1,     2,     1,     2,     1,     2,     1,     1,
       1,     1,     1,     1,     6,     6,     5,     6,     4,     4,
       0,     1,     0,     1,     3,     1,     1,     1,     2,     1,
       2,     2,     2,     4,     1,     2,     1,     2,     0,     4,
       2,     2,     2,     1,     3,     1,     1,     2,     1,     2,
       3,     1,     3,     1,     1,     2,     3,     3,     3,     3,
       3,     3,     1,     3,     3,     3,     3,     2,     2,     3,
       1,     1,     1,     1,     1,     1,     4,     2,     2,     4,
       1,     2,     3,     0,     1,     1,     1,     1,     1,     1,
       1,     2,     1,     1,     1,     3,     1,     1,     1,     2,
       1,     3,     0,     1,     0,     1,     0,     1
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
    case YYSYMBOL_NAME: /* NAME  */
#line 244 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1231 "cdf.cc"
        break;

    case YYSYMBOL_NUMSTR: /* "numeric literal"  */
#line 244 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1237 "cdf.cc"
        break;

    case YYSYMBOL_PSEUDOTEXT: /* PSEUDOTEXT  */
#line 244 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1243 "cdf.cc"
        break;

    case YYSYMBOL_LITERAL: /* LITERAL  */
#line 244 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1249 "cdf.cc"
        break;

    case YYSYMBOL_LSUB: /* "("  */
#line 244 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1255 "cdf.cc"
        break;

    case YYSYMBOL_SUBSCRIPT: /* SUBSCRIPT  */
#line 244 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1261 "cdf.cc"
        break;

    case YYSYMBOL_RSUB: /* ")"  */
#line 244 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1267 "cdf.cc"
        break;

    case YYSYMBOL_cdf_bool_expr: /* cdf_bool_expr  */
#line 248 "cdf.y"
         { fprintf(yyo, "%ld '%s'",
		   ((*yyvaluep).cdfval).number, ((*yyvaluep).cdfval).string? ((*yyvaluep).cdfval).string : "" ); }
#line 1274 "cdf.cc"
        break;

    case YYSYMBOL_cdf_and: /* cdf_and  */
#line 248 "cdf.y"
         { fprintf(yyo, "%ld '%s'",
		   ((*yyvaluep).cdfval).number, ((*yyvaluep).cdfval).string? ((*yyvaluep).cdfval).string : "" ); }
#line 1281 "cdf.cc"
        break;

    case YYSYMBOL_cdf_reloper: /* cdf_reloper  */
#line 248 "cdf.y"
         { fprintf(yyo, "%ld '%s'",
		   ((*yyvaluep).cdfval).number, ((*yyvaluep).cdfval).string? ((*yyvaluep).cdfval).string : "" ); }
#line 1288 "cdf.cc"
        break;

    case YYSYMBOL_cdf_relexpr: /* cdf_relexpr  */
#line 248 "cdf.y"
         { fprintf(yyo, "%ld '%s'",
		   ((*yyvaluep).cdfval).number, ((*yyvaluep).cdfval).string? ((*yyvaluep).cdfval).string : "" ); }
#line 1295 "cdf.cc"
        break;

    case YYSYMBOL_cdf_expr: /* cdf_expr  */
#line 248 "cdf.y"
         { fprintf(yyo, "%ld '%s'",
		   ((*yyvaluep).cdfval).number, ((*yyvaluep).cdfval).string? ((*yyvaluep).cdfval).string : "" ); }
#line 1302 "cdf.cc"
        break;

    case YYSYMBOL_cdf_factor: /* cdf_factor  */
#line 248 "cdf.y"
         { fprintf(yyo, "%ld '%s'",
		   ((*yyvaluep).cdfval).number, ((*yyvaluep).cdfval).string? ((*yyvaluep).cdfval).string : "" ); }
#line 1309 "cdf.cc"
        break;

    case YYSYMBOL_name_any: /* name_any  */
#line 245 "cdf.y"
         { fprintf(yyo, "%s '%s'",
		   keyword_str(((*yyvaluep).cdfarg).token),
		   ((*yyvaluep).cdfarg).string? ((*yyvaluep).cdfarg).string : "<nil>" ); }
#line 1317 "cdf.cc"
        break;

    case YYSYMBOL_name_one: /* name_one  */
#line 245 "cdf.y"
         { fprintf(yyo, "%s '%s'",
		   keyword_str(((*yyvaluep).cdfarg).token),
		   ((*yyvaluep).cdfarg).string? ((*yyvaluep).cdfarg).string : "<nil>" ); }
#line 1325 "cdf.cc"
        break;

    case YYSYMBOL_namelit: /* namelit  */
#line 245 "cdf.y"
         { fprintf(yyo, "%s '%s'",
		   keyword_str(((*yyvaluep).cdfarg).token),
		   ((*yyvaluep).cdfarg).string? ((*yyvaluep).cdfarg).string : "<nil>" ); }
#line 1333 "cdf.cc"
        break;

    case YYSYMBOL_name: /* name  */
#line 244 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1339 "cdf.cc"
        break;

    case YYSYMBOL_inof: /* inof  */
#line 244 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1345 "cdf.cc"
        break;

    case YYSYMBOL_subscripts: /* subscripts  */
#line 244 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1351 "cdf.cc"
        break;

    case YYSYMBOL_subscript: /* subscript  */
#line 244 "cdf.y"
         { fprintf(yyo, "'%s'", ((*yyvaluep).string) ); }
#line 1357 "cdf.cc"
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
#line 315 "cdf.y"
                         { YYACCEPT; }
#line 2047 "cdf.cc"
    break;

  case 3: /* top: copy '.'  */
#line 317 "cdf.y"
                {
		  const char *library = copybook.library();
		  if( !library ) library = "SYSLIB";
		  const char *source = copybook.source();
		  dbgmsg("COPY %s from %s", source, library);
		  YYACCEPT;
		}
#line 2059 "cdf.cc"
    break;

  case 4: /* top: copy error  */
#line 324 "cdf.y"
                           {
		  error_msg((yylsp[0]), "COPY directive must end in a '.'");
		  YYACCEPT;
		}
#line 2068 "cdf.cc"
    break;

  case 5: /* top: completes  */
#line 328 "cdf.y"
                          { YYACCEPT; }
#line 2074 "cdf.cc"
    break;

  case 13: /* cdf_display: ">>DISPLAY" strings  */
#line 347 "cdf.y"
                                    {
		  if( scanner_parsing() ) {
		    fprintf(stderr, "%s\n", display_msg);
		    free(display_msg);
		    display_msg = NULL;
		  }
		}
#line 2086 "cdf.cc"
    break;

  case 14: /* strings: LITERAL  */
#line 355 "cdf.y"
                        {
		  display_msg = xstrdup((yyvsp[0].string));
		}
#line 2094 "cdf.cc"
    break;

  case 15: /* strings: strings LITERAL  */
#line 358 "cdf.y"
                                {
		  char *p = display_msg;
		  display_msg = xasprintf("%s %s", p, (yyvsp[0].string));
		  free(p);
		}
#line 2104 "cdf.cc"
    break;

  case 16: /* partials: partial  */
#line 366 "cdf.y"
                {
		  if( ! scanner_parsing() ) YYACCEPT;
		}
#line 2112 "cdf.cc"
    break;

  case 17: /* partials: partials partial  */
#line 370 "cdf.y"
                {
		  if( ! scanner_parsing() ) YYACCEPT;
		}
#line 2120 "cdf.cc"
    break;

  case 19: /* partial: ">>ELSE"  */
#line 375 "cdf.y"
                                  { scanner_parsing_toggle(); }
#line 2126 "cdf.cc"
    break;

  case 20: /* partial: ">>END-IF"  */
#line 376 "cdf.y"
                                  { scanner_parsing_pop(); }
#line 2132 "cdf.cc"
    break;

  case 23: /* partial: ">>END-EVALUATE"  */
#line 379 "cdf.y"
                                  { scanner_parsing_pop(); }
#line 2138 "cdf.cc"
    break;

  case 24: /* cdf_define: ">>DEFINE" cdf_constant NAME as cdf_expr override  */
#line 383 "cdf.y"
                {
		  if( keyword_tok((yyvsp[-3].string)) ) {
		    error_msg((yylsp[-3]), "%s is a COBOL keyword", (yyvsp[-3].string));
		    YYERROR;
		  }
		  if( !cdfval_add( (yyvsp[-3].string), cdfval_t((yyvsp[-1].cdfval)), (yyvsp[0].boolean)) ) {
		    error_msg((yylsp[-3]), "name already in dictionary: %s", (yyvsp[-3].string));
		    const cdfval_t& entry = dictionary[(yyvsp[-3].string)];
		    if( entry.filename ) {
		      error_msg((yylsp[-3]), "%s previously defined in %s:%d",
				(yyvsp[-3].string), entry.filename, entry.lineno);
		    } else {
		      error_msg((yylsp[-3]), "%s was defined on the command line", (yyvsp[-3].string));
		    }
		    YYERROR;
		  }
		}
#line 2160 "cdf.cc"
    break;

  case 25: /* cdf_define: ">>DEFINE" cdf_constant NAME '=' cdf_expr override  */
#line 401 "cdf.y"
                {  /* accept, but as error */
		  if( scanner_parsing() ) {
		    error_msg((yylsp[-3]), "CDF error: %s = value invalid", (yyvsp[-3].string));
		  }
		}
#line 2170 "cdf.cc"
    break;

  case 26: /* cdf_define: ">>DEFINE" cdf_constant NAME as OFF  */
#line 407 "cdf.y"
                {
		  cdfval_off( (yyvsp[-2].string));
		}
#line 2178 "cdf.cc"
    break;

  case 27: /* cdf_define: ">>DEFINE" cdf_constant NAME as "PARAMETER" override  */
#line 418 "cdf.y"
                {
		  if( 0 == dictionary.count((yyvsp[-3].string)) ) {
		    yywarn("CDF: '%s' is defined AS PARAMETER "
			    "but was not defined", (yyvsp[-3].string));
		  }
		}
#line 2189 "cdf.cc"
    break;

  case 28: /* cdf_define: ">>DEFINE" FEATURE as ON  */
#line 424 "cdf.y"
                                         {
		  auto feature = cbl_gcobol_feature_t((yyvsp[-2].number));
		  if( ! cobol_gcobol_feature_set(feature, true) ) {
		    error_msg((yylsp[-2]), ">>DEFINE %EBCDIC-MODE is invalid within program body");
		  }
		}
#line 2200 "cdf.cc"
    break;

  case 29: /* cdf_define: ">>DEFINE" FEATURE as OFF  */
#line 430 "cdf.y"
                                          {
		  auto feature = cbl_gcobol_feature_t((yyvsp[-2].number));
		  if( ! cobol_gcobol_feature_set(feature, false) ) {
		    error_msg((yylsp[-2]), ">>DEFINE %EBCDIC-MODE is invalid within program body");
		  }
		}
#line 2211 "cdf.cc"
    break;

  case 32: /* override: %empty  */
#line 440 "cdf.y"
                         { (yyval.boolean) = false; }
#line 2217 "cdf.cc"
    break;

  case 33: /* override: OVERRIDE  */
#line 441 "cdf.y"
                         { (yyval.boolean) = true; }
#line 2223 "cdf.cc"
    break;

  case 34: /* cdf_turn: TURN except_names except_check  */
#line 445 "cdf.y"
                {
		  apply_cdf_turn(exception_turns);
		  exception_turns.clear();
		}
#line 2232 "cdf.cc"
    break;

  case 35: /* cdf_call_convention: "CALL"  */
#line 452 "cdf.y"
                           {
                  current_call_convention(cbl_call_cobol_e);
                }
#line 2240 "cdf.cc"
    break;

  case 36: /* cdf_call_convention: "CALL (as C)"  */
#line 455 "cdf.y"
                              {
                  current_call_convention(cbl_call_verbatim_e);
                }
#line 2248 "cdf.cc"
    break;

  case 39: /* except_name: "EXCEPTION NAME"  */
#line 464 "cdf.y"
                                   {
		  assert((yyvsp[0].number) != ec_none_e);
		  exception_turns.add_exception(ec_type_t((yyvsp[0].number)));
		}
#line 2257 "cdf.cc"
    break;

  case 40: /* except_name: "EXCEPTION NAME" filenames  */
#line 468 "cdf.y"
                                             {
		  assert((yyvsp[-1].number) != ec_none_e);
		  std::list<size_t> files;
		  std::copy( (yyvsp[0].files)->begin(), (yyvsp[0].files)->end(),
		                  std::back_inserter(files) );
		  exception_turns.add_exception(ec_type_t((yyvsp[-1].number)), files);
		}
#line 2269 "cdf.cc"
    break;

  case 41: /* except_check: CHECKING on  */
#line 477 "cdf.y"
                             { exception_turns.enabled = true; }
#line 2275 "cdf.cc"
    break;

  case 42: /* except_check: CHECKING OFF  */
#line 478 "cdf.y"
                             { exception_turns.enabled = false; }
#line 2281 "cdf.cc"
    break;

  case 43: /* except_check: CHECKING on with LOCATION  */
#line 480 "cdf.y"
                {
		  exception_turns.enabled = exception_turns.location = true;
		}
#line 2289 "cdf.cc"
    break;

  case 44: /* filenames: filename  */
#line 485 "cdf.y"
                         {
		  (yyval.files) = new std::set<size_t>;
		  (yyval.files)->insert(symbol_index(symbol_elem_of((yyvsp[0].file))));
		}
#line 2298 "cdf.cc"
    break;

  case 45: /* filenames: filenames filename  */
#line 489 "cdf.y"
                                   {
		  (yyval.files) = (yyvsp[-1].files);
		  auto inserted = (yyval.files)->insert(symbol_index(symbol_elem_of((yyvsp[0].file))));
		  if( ! inserted.second ) {
		    error_msg((yylsp[0]), "%s: No file-name shall be specified more than "
			      " once for one exception condition", (yyvsp[0].file)->name);
		  }
		}
#line 2311 "cdf.cc"
    break;

  case 46: /* filename: NAME  */
#line 499 "cdf.y"
                {
                  struct symbol_elem_t *e = symbol_file(PROGRAM, (yyvsp[0].string));
                  if( !(e && e->type == SymFile) ) {
		    error_msg((yylsp[0]), "invalid file name '%s'", (yyvsp[0].string));
		    YYERROR;
                  }
                  (yyval.file) = cbl_file_of(e);
                }
#line 2324 "cdf.cc"
    break;

  case 47: /* cdf_if: ">>IF" cdf_cond_expr  */
#line 509 "cdf.y"
                                     {
		  scanner_parsing(YDF_CDF_IF, (yyvsp[0].boolean));
		}
#line 2332 "cdf.cc"
    break;

  case 48: /* $@1: %empty  */
#line 512 "cdf.y"
                             {
		  ////if( scanner_parsing() ) yyerrok;
		}
#line 2340 "cdf.cc"
    break;

  case 49: /* cdf_if: ">>IF" error $@1 ">>END-IF"  */
#line 514 "cdf.y"
                             { // not pushed, don't pop
		  if( ! scanner_parsing() ) YYACCEPT;
		}
#line 2348 "cdf.cc"
    break;

  case 57: /* cdf_cond_expr: NAME DEFINED  */
#line 533 "cdf.y"
                {
		  auto p = dictionary.find((yyvsp[-1].string));
		  bool found = p != dictionary.end();
		  if( !(yyvsp[0].boolean) ) found = ! found;
		  if( ! found ) {
		    (yyval.boolean) = !(yyvsp[0].boolean);
		    dbgmsg("CDF: %s not found in dictionary (result %s)",
			   (yyvsp[-1].string), (yyval.boolean)? "true" : "false");
		  } else {
		    (yyval.boolean) = (yyvsp[0].boolean);
		    dbgmsg("CDF: %s found in dictionary (result %s)",
			   (yyvsp[-1].string), (yyval.boolean)? "true" : "false");
		  }
		}
#line 2367 "cdf.cc"
    break;

  case 58: /* cdf_cond_expr: cdf_bool_expr  */
#line 547 "cdf.y"
                              { (yyval.boolean) = (yyvsp[0].cdfval)((yylsp[0])) == 0? false : true; }
#line 2373 "cdf.cc"
    break;

  case 59: /* cdf_cond_expr: FEATURE DEFINED  */
#line 548 "cdf.y"
                                {
		  const auto& feature((yyvsp[-1].number));
		  (yyval.boolean) = (feature == int(feature & cbl_gcobol_features));
		  dbgmsg("CDF: feature 0x%02x is %s", (yyvsp[-1].number), (yyval.boolean)? "ON" : "OFF");
		}
#line 2383 "cdf.cc"
    break;

  case 60: /* cdf_bool_expr: cdf_bool_expr OR cdf_and  */
#line 559 "cdf.y"
                                         { (yyval.cdfval) = cdfval_t((yyvsp[-2].cdfval)((yylsp[-2])) || (yyvsp[0].cdfval)((yylsp[0]))); }
#line 2389 "cdf.cc"
    break;

  case 62: /* cdf_and: cdf_and AND cdf_reloper  */
#line 563 "cdf.y"
                                        { (yyval.cdfval) = cdfval_t((yyvsp[-2].cdfval)((yylsp[-2])) && (yyvsp[0].cdfval)((yylsp[0]))); }
#line 2395 "cdf.cc"
    break;

  case 65: /* cdf_reloper: NOT cdf_relexpr  */
#line 568 "cdf.y"
                                { (yyval.cdfval) = cdfval_t((yyvsp[0].cdfval).number? 1 : 0); }
#line 2401 "cdf.cc"
    break;

  case 66: /* cdf_relexpr: cdf_relexpr '<' cdf_expr  */
#line 571 "cdf.y"
                                         { (yyval.cdfval) = (yyvsp[-2].cdfval)((yylsp[-2])) <  (yyvsp[0].cdfval)((yylsp[0])); }
#line 2407 "cdf.cc"
    break;

  case 67: /* cdf_relexpr: cdf_relexpr LE cdf_expr  */
#line 572 "cdf.y"
                                         { (yyval.cdfval) = (yyvsp[-2].cdfval)((yylsp[-2])) <= (yyvsp[0].cdfval)((yylsp[0])); }
#line 2413 "cdf.cc"
    break;

  case 68: /* cdf_relexpr: cdf_relexpr '=' cdf_expr  */
#line 573 "cdf.y"
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
		    error_msg((yylsp[-2]), msg);
		  }
		}
#line 2431 "cdf.cc"
    break;

  case 69: /* cdf_relexpr: cdf_relexpr NE cdf_expr  */
#line 587 "cdf.y"
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
		    error_msg((yylsp[-2]), msg);
		  }
		}
#line 2449 "cdf.cc"
    break;

  case 70: /* cdf_relexpr: cdf_relexpr GE cdf_expr  */
#line 600 "cdf.y"
                                         { (yyval.cdfval) = (yyvsp[-2].cdfval)((yylsp[-2])) >= (yyvsp[0].cdfval)((yylsp[0])); }
#line 2455 "cdf.cc"
    break;

  case 71: /* cdf_relexpr: cdf_relexpr '>' cdf_expr  */
#line 601 "cdf.y"
                                         { (yyval.cdfval) = (yyvsp[-2].cdfval)((yylsp[-2])) >  (yyvsp[0].cdfval)((yylsp[0])); }
#line 2461 "cdf.cc"
    break;

  case 73: /* cdf_expr: cdf_expr '+' cdf_expr  */
#line 605 "cdf.y"
                                      { (yyval.cdfval) = (yyvsp[-2].cdfval)((yylsp[-2])) + (yyvsp[0].cdfval)((yylsp[0])); }
#line 2467 "cdf.cc"
    break;

  case 74: /* cdf_expr: cdf_expr '-' cdf_expr  */
#line 606 "cdf.y"
                                      { (yyval.cdfval) = (yyvsp[-2].cdfval)((yylsp[-2])) - (yyvsp[0].cdfval)((yylsp[0])); }
#line 2473 "cdf.cc"
    break;

  case 75: /* cdf_expr: cdf_expr '*' cdf_expr  */
#line 607 "cdf.y"
                                      { (yyval.cdfval) = (yyvsp[-2].cdfval)((yylsp[-2])) * (yyvsp[0].cdfval)((yylsp[0])); }
#line 2479 "cdf.cc"
    break;

  case 76: /* cdf_expr: cdf_expr '/' cdf_expr  */
#line 608 "cdf.y"
                                      { (yyval.cdfval) = (yyvsp[-2].cdfval)((yylsp[-2])) / (yyvsp[0].cdfval)((yylsp[0])); }
#line 2485 "cdf.cc"
    break;

  case 77: /* cdf_expr: '+' cdf_expr  */
#line 609 "cdf.y"
                                                { (yyval.cdfval) = (yyvsp[0].cdfval)((yylsp[0])); }
#line 2491 "cdf.cc"
    break;

  case 78: /* cdf_expr: '-' cdf_expr  */
#line 610 "cdf.y"
                                                { (yyval.cdfval) = negate((yyvsp[0].cdfval)((yylsp[0]))); }
#line 2497 "cdf.cc"
    break;

  case 79: /* cdf_expr: '(' cdf_bool_expr ')'  */
#line 611 "cdf.y"
                                                { (yyval.cdfval) = (yyvsp[-1].cdfval)((yylsp[-1])); }
#line 2503 "cdf.cc"
    break;

  case 81: /* cdf_factor: NAME  */
#line 615 "cdf.y"
                     {
		  auto that = dictionary.find((yyvsp[0].string));
		  if( that != dictionary.end() ) {
		    (yyval.cdfval) = that->second;
		  } else {
		    if( ! scanner_parsing() ) {
		      yywarn("CDF skipping: no such variable '%s' (ignored)", (yyvsp[0].string));
		    } else {
		      error_msg((yylsp[0]), "CDF error: no such variable '%s'", (yyvsp[0].string));
		    }
		    (yyval.cdfval) = cdfval_t();
		  }
		}
#line 2521 "cdf.cc"
    break;

  case 82: /* cdf_factor: NUMBER  */
#line 628 "cdf.y"
                       { (yyval.cdfval) = cdfval_t((yyvsp[0].number)); }
#line 2527 "cdf.cc"
    break;

  case 83: /* cdf_factor: LITERAL  */
#line 629 "cdf.y"
                        { (yyval.cdfval) = cdfval_t((yyvsp[0].string)); }
#line 2533 "cdf.cc"
    break;

  case 84: /* cdf_factor: "numeric literal"  */
#line 630 "cdf.y"
                       {
		  auto value = integer_literal((yyvsp[0].string));
		  if( !value.second ) {
		    error_msg((yylsp[0]), "CDF error: parsed %s as %ld",
		             (yyvsp[0].string), value.first);
		    YYERROR;
		  }
		  (yyval.cdfval) = cdfval_t(value.first);
		}
#line 2547 "cdf.cc"
    break;

  case 88: /* copybook_name: COPY name_one  */
#line 647 "cdf.y"
                {
		  if( -1 == copybook.open((yylsp[0]), (yyvsp[0].cdfarg).string) ) {
		    error_msg((yylsp[0]), "could not open copybook file "
		             "for '%s'", (yyvsp[0].cdfarg).string);
		    YYERROR;
		  }
		}
#line 2559 "cdf.cc"
    break;

  case 89: /* copybook_name: COPY name_one IN name_one  */
#line 655 "cdf.y"
                {
		  copybook.library((yylsp[0]), (yyvsp[0].cdfarg).string);
		  if( -1 == copybook.open((yylsp[-2]), (yyvsp[-2].cdfarg).string) ) {
		    error_msg((yylsp[-2]), "could not open copybook file "
		             "for '%s' in '%'s'", (yyvsp[-2].cdfarg).string, (yyvsp[0].cdfarg).string);
		    YYERROR;
		  }
		}
#line 2572 "cdf.cc"
    break;

  case 92: /* replace_by: name_any BY name_any  */
#line 670 "cdf.y"
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
#line 2605 "cdf.cc"
    break;

  case 94: /* suppress: SUPPRESS  */
#line 702 "cdf.y"
                {
		  copybook.suppress();
		}
#line 2613 "cdf.cc"
    break;

  case 96: /* name_any: PSEUDOTEXT  */
#line 708 "cdf.y"
                           {
		  (yyval.cdfarg) = cdf_arg_t{YDF_PSEUDOTEXT, (yyvsp[0].string)};
		}
#line 2621 "cdf.cc"
    break;

  case 97: /* name_one: NAME  */
#line 714 "cdf.y"
                {
		  cdf_arg_t arg = { YDF_NAME, (yyvsp[0].string) };
		  auto p = dictionary.find((yyvsp[0].string));

		  if( p != dictionary.end() ) {
		    arg.string = p->second.string;
		  }
		  (yyval.cdfarg) = arg;
		}
#line 2635 "cdf.cc"
    break;

  case 98: /* name_one: "numeric literal"  */
#line 723 "cdf.y"
                        { (yyval.cdfarg) = cdf_arg_t{YDF_NUMSTR, (yyvsp[0].string)}; }
#line 2641 "cdf.cc"
    break;

  case 99: /* name_one: LITERAL  */
#line 724 "cdf.y"
                        { (yyval.cdfarg) = cdf_arg_t{YDF_LITERAL, (yyvsp[0].string)}; }
#line 2647 "cdf.cc"
    break;

  case 100: /* namelit: name  */
#line 728 "cdf.y"
                {
		  cdf_arg_t arg = { YDF_NAME, (yyvsp[0].string) };
		  auto p = dictionary.find((yyvsp[0].string));

		  if( p != dictionary.end() ) {
		    arg.string = p->second.string;
		  }
		  (yyval.cdfarg) = arg;
		}
#line 2661 "cdf.cc"
    break;

  case 101: /* namelit: name subscripts  */
#line 738 "cdf.y"
                {
		  char *s = xasprintf( "%s%s", (yyvsp[-1].string), (yyvsp[0].string) );
		  free(const_cast<char*>((yyvsp[-1].string)));
		  free(const_cast<char*>((yyvsp[0].string)));

		  cdf_arg_t arg = { YDF_NAME, s };
		  (yyval.cdfarg) = arg;
		}
#line 2674 "cdf.cc"
    break;

  case 102: /* namelit: "numeric literal"  */
#line 746 "cdf.y"
                        { (yyval.cdfarg) = cdf_arg_t{YDF_NUMSTR, (yyvsp[0].string)}; }
#line 2680 "cdf.cc"
    break;

  case 103: /* namelit: LITERAL  */
#line 747 "cdf.y"
                        { (yyval.cdfarg) = cdf_arg_t{YDF_LITERAL, (yyvsp[0].string)}; }
#line 2686 "cdf.cc"
    break;

  case 105: /* name: name inof NAME  */
#line 752 "cdf.y"
                {
		  char *s = xasprintf( "%s %s %s", (yyvsp[-2].string), (yyvsp[-1].string), (yyvsp[0].string) );
		  assert((yyval.string) == (yyvsp[-2].string));
		  free(const_cast<char*>((yyvsp[-2].string)));
		  free(const_cast<char*>((yyvsp[0].string)));
		  (yyval.string) = s;
		}
#line 2698 "cdf.cc"
    break;

  case 106: /* inof: IN  */
#line 760 "cdf.y"
                   { static const char in[] = "IN"; (yyval.string) = in; }
#line 2704 "cdf.cc"
    break;

  case 107: /* inof: OF  */
#line 761 "cdf.y"
                   { static const char of[] = "OF"; (yyval.string) = of; }
#line 2710 "cdf.cc"
    break;

  case 109: /* subscripts: subscripts subscript  */
#line 766 "cdf.y"
                {
		  char *s = xasprintf("%s%s", (yyvsp[-1].string), (yyvsp[0].string) );
		  if( (yyval.string) != (yyvsp[-1].string) ) free(const_cast<char*>((yyval.string)));
		  free(const_cast<char*>((yyvsp[-1].string)));
		  free(const_cast<char*>((yyvsp[0].string)));
		  (yyval.string) = s;
		}
#line 2722 "cdf.cc"
    break;

  case 111: /* subscript: "(" subscript ")"  */
#line 776 "cdf.y"
                {
		  char *s = xasprintf( "%s%s%s", (yyvsp[-2].string), (yyvsp[-1].string), (yyvsp[0].string) );
		  free(const_cast<char*>((yyvsp[-2].string)));
		  free(const_cast<char*>((yyvsp[-1].string)));
		  free(const_cast<char*>((yyvsp[0].string)));
		  (yyval.string) = s;
		}
#line 2734 "cdf.cc"
    break;


#line 2738 "cdf.cc"

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
      dbgmsg("%s: added -D %s = %ld", __func__, name, cdf_name->second.as_number());
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
cdf_value( const char name[], cdfval_t value ) {
  auto p = dictionary.find(name);

  if( p != dictionary.end() ) return false;

  dictionary[name] = value;
  return true;
}

const cdfval_t *
cdf_value( const char name[] ) {
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
  return verify_integer(loc, *this) ? *this : zero;
}

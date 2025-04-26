/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YDF_COBOL_CDF_H_INCLUDED
# define YY_YDF_COBOL_CDF_H_INCLUDED
/* Debug traces.  */
#ifndef YDFDEBUG
# if defined YYDEBUG
#if YYDEBUG
#   define YDFDEBUG 1
#  else
#   define YDFDEBUG 0
#  endif
# else /* ! defined YYDEBUG */
#  define YDFDEBUG 1
# endif /* ! defined YYDEBUG */
#endif  /* ! defined YDFDEBUG */
#if YDFDEBUG
extern int ydfdebug;
#endif
/* "%code requires" blocks.  */
#line 103 "cdf.y"

  #include "cdfval.h"

  using std::map;

  static map<std::string, cdfval_t> dictionary;

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-function"
  static bool
  cdfval_add( const char name[],
	       const cdfval_t& value, bool override = false )
  {
    if( scanner_parsing() ) {
      if( ! override ) {
	if( dictionary.find(name) != dictionary.end() ) return false;
      }
      dictionary[name] = value;
    }
    return true;
  }
  static void
  cdfval_off( const char name[] ) {
    if( scanner_parsing() ) {
      auto p = dictionary.find(name);
      if( p == dictionary.end() ) {
        dictionary[name] = cdfval_t();
      }
      dictionary[name].off = true;
    }
  }
#pragma GCC diagnostic pop

  bool operator==( const cdfval_base_t& lhs, int rhs );
  bool operator||( const cdfval_base_t& lhs, const cdfval_base_t& rhs );
  bool operator&&( const cdfval_base_t& lhs, const cdfval_base_t& rhs );

  cdfval_t operator<( const cdfval_base_t& lhs, const cdfval_base_t& rhs );
  cdfval_t operator<=( const cdfval_base_t& lhs, const cdfval_base_t& rhs );
  cdfval_t operator==( const cdfval_base_t& lhs, const cdfval_base_t& rhs );
  cdfval_t operator!=( const cdfval_base_t& lhs, const cdfval_base_t& rhs );
  cdfval_t operator>=( const cdfval_base_t& lhs, const cdfval_base_t& rhs );
  cdfval_t operator>( const cdfval_base_t& lhs, const cdfval_base_t& rhs );
  cdfval_t operator+( const cdfval_base_t& lhs, const cdfval_base_t& rhs );
  cdfval_t operator-( const cdfval_base_t& lhs, const cdfval_base_t& rhs );
  cdfval_t operator*( const cdfval_base_t& lhs, const cdfval_base_t& rhs );
  cdfval_t operator/( const cdfval_base_t& lhs, const cdfval_base_t& rhs );
  cdfval_t negate( cdfval_base_t lhs );


#line 108 "cdf.h"

/* Token kinds.  */
#ifndef YDFTOKENTYPE
# define YDFTOKENTYPE
  enum ydftokentype
  {
    YDF_YDFEMPTY = -2,
    YDF_YYEOF = 0,                 /* "end of file"  */
    YDF_YDFerror = 256,            /* error  */
    YDF_YDFUNDEF = 938,            /* "invalid token"  */
    YDF_BOOL = 939,                /* BOOL  */
    YDF_FEATURE = 363,             /* FEATURE  */
    YDF_NUMBER = 302,              /* NUMBER  */
    YDF_EXCEPTION_NAME = 280,      /* "EXCEPTION NAME"  */
    YDF_BY = 476,                  /* BY  */
    YDF_COPY = 360,                /* COPY  */
    YDF_CDF_DISPLAY = 382,         /* ">>DISPLAY"  */
    YDF_IN = 595,                  /* IN  */
    YDF_NAME = 286,                /* NAME  */
    YDF_NUMSTR = 304,              /* "numeric literal"  */
    YDF_OF = 676,                  /* OF  */
    YDF_PSEUDOTEXT = 711,          /* PSEUDOTEXT  */
    YDF_REPLACING = 733,           /* REPLACING  */
    YDF_LITERAL = 297,             /* LITERAL  */
    YDF_SUPPRESS = 374,            /* SUPPRESS  */
    YDF_LSUB = 365,                /* "("  */
    YDF_SUBSCRIPT = 373,           /* SUBSCRIPT  */
    YDF_RSUB = 370,                /* ")"  */
    YDF_CDF_DEFINE = 381,          /* ">>DEFINE"  */
    YDF_CDF_IF = 383,              /* ">>IF"  */
    YDF_CDF_ELSE = 384,            /* ">>ELSE"  */
    YDF_CDF_END_IF = 385,          /* ">>END-IF"  */
    YDF_CDF_EVALUATE = 386,        /* ">>EVALUATE"  */
    YDF_CDF_WHEN = 387,            /* ">>WHEN"  */
    YDF_CDF_END_EVALUATE = 388,    /* ">>END-EVALUATE"  */
    YDF_AS = 458,                  /* AS  */
    YDF_CONSTANT = 359,            /* CONSTANT  */
    YDF_DEFINED = 361,             /* DEFINED  */
    YDF_OTHER = 688,               /* OTHER  */
    YDF_PARAMETER_kw = 366,        /* "PARAMETER"  */
    YDF_OFF = 677,                 /* OFF  */
    YDF_OVERRIDE = 367,            /* OVERRIDE  */
    YDF_THRU = 929,                /* THRU  */
    YDF_TRUE_kw = 803,             /* "True"  */
    YDF_CALL_COBOL = 389,          /* "CALL"  */
    YDF_CALL_VERBATIM = 390,       /* "CALL (as C)"  */
    YDF_TURN = 805,                /* TURN  */
    YDF_CHECKING = 486,            /* CHECKING  */
    YDF_LOCATION = 639,            /* LOCATION  */
    YDF_ON = 679,                  /* ON  */
    YDF_WITH = 831,                /* WITH  */
    YDF_OR = 930,                  /* OR  */
    YDF_AND = 931,                 /* AND  */
    YDF_NOT = 932,                 /* NOT  */
    YDF_NE = 933,                  /* NE  */
    YDF_LE = 934,                  /* LE  */
    YDF_GE = 935,                  /* GE  */
    YDF_NEG = 937                  /* NEG  */
  };
  typedef enum ydftokentype ydftoken_kind_t;
#endif

/* Value type.  */
#if ! defined YDFSTYPE && ! defined YDFSTYPE_IS_DECLARED
union YDFSTYPE
{
#line 234 "cdf.y"

    bool boolean;
    int number;
    const char *string;
    cdf_arg_t     cdfarg;
    cdfval_base_t cdfval;
    cbl_file_t *file;
    std::set<size_t> *files;

#line 185 "cdf.h"

};
typedef union YDFSTYPE YDFSTYPE;
# define YDFSTYPE_IS_TRIVIAL 1
# define YDFSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YDFLTYPE && ! defined YDFLTYPE_IS_DECLARED
typedef struct YDFLTYPE YDFLTYPE;
struct YDFLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YDFLTYPE_IS_DECLARED 1
# define YDFLTYPE_IS_TRIVIAL 1
#endif


extern YDFSTYPE ydflval;
extern YDFLTYPE ydflloc;

int ydfparse (void);


#endif /* !YY_YDF_COBOL_CDF_H_INCLUDED  */

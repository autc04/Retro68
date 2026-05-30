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

#ifndef YY_YY_COBOL_PARSE_H_INCLUDED
# define YY_YY_COBOL_PARSE_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 30 "parse.y"

  #include "config.h"
  #include <fstream>  // Before cobol-system because it uses poisoned functions
  #include "cobol-system.h"
  #include "coretypes.h"
  #include "../../libgcobol/io.h"
  #include "../../libgcobol/ec.h"
  #include "tree.h"

#pragma GCC diagnostic ignored "-Wmissing-field-initializers"

  enum radix_t {
    decimal_e = 10,
    hexadecimal_e = 16,
    boolean_e = 2,
  };

  enum accept_func_t {
    accept_e,
    accept_done_e,
    accept_command_line_e,
    accept_envar_e,
  };

  struct coll_alphanat_t {
    const char *alpha, *national; 
  };

  struct label_pair_t {
    cbl_label_t *from, *to;
  };
  
class locale_tgt_t {
  char user_system_default;
  std::vector<int> categories;
 public:
  locale_tgt_t() : user_system_default('\0') {}
  locale_tgt_t( int category )
    : user_system_default('\0')
    , categories(1, category)
    {}
  locale_tgt_t operator=( int ch ) {
    assert(categories.empty());
    switch(ch) {
    case 'S': case 'U':
      user_system_default = ch;
      return *this;
    }
    gcc_unreachable();
  }
  locale_tgt_t push_back( int token ) {
    categories.push_back(token);
    return *this;
  }
  
  bool is_default() const { return 0 < user_system_default; }
  char default_of() const {
    assert(categories.empty());
    return user_system_default;
  }
  const std::vector<int>& lc_categories() const { return categories; }
};

  class literal_t {
    size_t isym;
  public:
    cbl_encoding_t encoding;
    char prefix[3];
    size_t len;
    char *data;

    bool empty() const { return data == NULL; }
    size_t isymbol() const { return isym; }
    const char * symbol_name() const;

    literal_t&
    set( size_t len, char *data, const char prefix[] ) {
      set_prefix(prefix, strlen(prefix));
      set_data(len, data);
      return *this;
    }

    literal_t& set( const cbl_field_t * field );

    literal_t&
    set_data( size_t len, char *data, size_t isym = 0 ) {
      this->isym = isym;
      this->len = len;
      this->data = data;
      if( this->prefix[0] == 'Z' ) {
        this->data = new char[++this->len];
        auto p = std::copy(data, data + len, this->data);
        *p = '\0';
      }
      return *this;
    }
    literal_t& set_prefix( const char *input, size_t len );

    bool
    compatible_prefix( const literal_t& that ) const {
      if( prefix[0] != that.prefix[0] ) {
        return prefix[0] != 'N' && that.prefix[0] != 'N';
      }
      return true;
    }
    cbl_encoding_t encode_as() const {
      switch(prefix[0]) {
      case '\0':
      case 'X': 
      case 'Z': 
        return current_encoding('A');
      case 'N': 
        return current_encoding('N');
      default:
        dbgmsg("no such prefix '%s'", prefix);
        if( prefix[0] != ftoupper(prefix[0]) ) {
          gcc_unreachable();
        }
        break;
      }
      gcc_unreachable();
    }
  };

  struct acrc_t { // Abbreviated combined relation condition
    cbl_refer_t *term;
    relop_t op;
    bool invert;
    acrc_t& init( cbl_refer_t *term = NULL,
                  relop_t op = relop_t(-1),
                  bool invert = false )
    {
      this->term = term;
      this->op = op;
      this->invert = invert;
      return *this;
    }
    static acrc_t make( cbl_refer_t *term = NULL,
                        relop_t op = relop_t(-1),
                        bool invert = false )
    {
      acrc_t output;
      return output.init( term, op, invert );
    }
    relop_t relop_from( relop_t ante_op ) const {
      assert(ante_op != -1);
      return op != -1? op : ante_op;
    }
    bool is_relation_condition() const { return term && term->field; }
  };
  typedef std::list<acrc_t> acrcs_t;

  enum data_category_t { data_category_none,
                         data_category_all,
                         data_alphabetic_e,
                         data_alphanumeric_e,
                         data_alphanumeric_edited_e,
                         data_boolean_e,
                         data_data_pointer_e,
                         data_function_pointer_e,
                         data_msg_tag_e,
                         data_dbcs_e,
                         data_egcs_e,
                         data_national_e,
                         data_national_edited_e,
                         data_numeric_e,
                         data_numeric_edited_e,
                         data_object_referenc_e,
                         data_program_pointer_e,
                       };

  const char * data_category_str( data_category_t category );

  typedef std::map<data_category_t, struct cbl_refer_t*> category_map_t;

  struct substitution_t {
    enum subst_fl_t { subst_all_e, subst_first_e = 'F', subst_last_e = 'L' };
    bool anycase;
    subst_fl_t first_last;
    cbl_refer_t *orig, *replacement;

    substitution_t& init( bool anycase, char first_last,
                            cbl_refer_t *orig, cbl_refer_t *replacement ) {
      this->anycase = anycase;
      switch(first_last) {
      case 'F': this->first_last = subst_first_e; break;
      case 'L': this->first_last = subst_last_e;  break;
      default:
        this->first_last = subst_all_e;
        break;
      }
      this->orig = orig;
      this->replacement = replacement;
      return *this;
    }
  };
  typedef std::list<substitution_t> substitutions_t;

  struct init_statement_t {
    bool to_value;
    data_category_t category;
    category_map_t replacement;

    explicit init_statement_t( const category_map_t& replacement )
      : to_value(false)
      , category(data_category_none)
      , replacement(replacement)

    {}

    explicit init_statement_t( bool to_value = false )
      : to_value(to_value)
      , category(data_category_none)
      , replacement(category_map_t())
    {}

  };

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-function"
  static data_category_t
  data_category_of( const cbl_refer_t& refer );

  static REAL_VALUE_TYPE
  numstr2i( const char input[], radix_t radix );

  struct cbl_field_t;
  static inline cbl_field_t *
  new_literal( const cbl_loc_t loc, const char initial[], enum radix_t radix );
#pragma GCC diagnostic pop

  enum select_clause_t {
    access_clause_e        = 0x0001,
    alt_key_clause_e       = 0x0002,
    assign_clause_e        = 0x0004,
    collating_clause_e     = 0x0008,
    file_status_clause_e   = 0x0010,
    lock_mode_clause_e     = 0x0020,
    organization_clause_e  = 0x0040,
    padding_clause_e       = 0x0080,
    record_delim_clause_e  = 0x0100,
    record_key_clause_e    = 0x0200,
    relative_key_clause_e  = 0x0400,
    reserve_clause_e       = 0x0800,
    sharing_clause_e       = 0x1000,
  };

  struct symbol_elem_t;
  struct symbol_elem_t * symbols_begin( size_t first );
  struct symbol_elem_t * symbols_end();

  void field_done();

  template <typename E>
  struct Elem_list_t {
    std::list<E> elems;
    Elem_list_t() {}
    explicit Elem_list_t( E elem ) {
      elems.push_back(elem);
    }
    Elem_list_t * push_back( E elem ) {
      elems.push_back(elem);
      return this;
    }
    void clear() {
      for( auto p = elems.begin(); p != elems.end(); p++ ) {
        assert( !(symbols_begin(0) <= *p && *p < symbols_end()) );
        delete *p;
      }
      elems.clear();
    }
  };

  struct file_list_t;
  struct cbl_label_t;
  typedef struct Elem_list_t<cbl_label_t*> Label_list_t;

  struct cbl_file_key_t;
  typedef struct Elem_list_t<cbl_file_key_t*> key_list_t;

  struct cbl_declarative_t;
  typedef struct Elem_list_t<cbl_declarative_t*> declarative_list_t;
  typedef struct Elem_list_t<ec_type_t> ec_list_t;
  typedef struct Elem_list_t<size_t> isym_list_t;

  struct rel_part_t;

  bool set_debug(bool);

#include "../../libgcobol/ec.h"
#include "../../libgcobol/common-defs.h"
#include "inspect.h"

#line 343 "parse.h"

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    IDENTIFICATION_DIV = 258,      /* "IDENTIFICATION DIVISION"  */
    ENVIRONMENT_DIV = 259,         /* "ENVIRONMENT DIVISION"  */
    PROCEDURE_DIV = 260,           /* "PROCEDURE DIVISION"  */
    DATA_DIV = 261,                /* "DATA DIVISION"  */
    FILE_SECT = 262,               /* "FILE SECTION"  */
    INPUT_OUTPUT_SECT = 263,       /* "INPUT-OUTPUT SECTION"  */
    LINKAGE_SECT = 264,            /* "LINKAGE SECTION"  */
    LOCAL_STORAGE_SECT = 265,      /* "LOCAL-STORAGE SECTION"  */
    WORKING_STORAGE_SECT = 266,    /* "WORKING-STORAGE SECTION"  */
    OBJECT_COMPUTER = 267,         /* "OBJECT COMPUTER"  */
    DISPLAY_OF = 268,              /* "DISPLAY OF"  */
    END_FUNCTION = 269,            /* "END FUNCTION"  */
    END_PROGRAM = 270,             /* "END PROGRAM"  */
    END_SUBPROGRAM = 271,          /* "END PROGRAM <contained program>"  */
    JUSTIFIED = 272,               /* JUSTIFIED  */
    RETURNING = 273,               /* RETURNING  */
    NO_CONDITION = 274,            /* "invalid token"  */
    ALNUM = 275,                   /* ALNUM  */
    ALPHED = 276,                  /* ALPHED  */
    ERROR = 277,                   /* ERROR  */
    EXCEPTION = 278,               /* EXCEPTION  */
    SIZE_ERROR = 279,              /* "SIZE ERROR"  */
    EXCEPTION_NAME = 280,          /* "EXCEPTION NAME"  */
    LEVEL = 281,                   /* LEVEL  */
    LEVEL66 = 282,                 /* "66"  */
    LEVEL78 = 283,                 /* "78"  */
    LEVEL88 = 284,                 /* "88"  */
    CLASS_NAME = 285,              /* "class name"  */
    NAME = 286,                    /* NAME  */
    NAME88 = 287,                  /* "Level 88 NAME"  */
    NUME = 288,                    /* "Name"  */
    NUMED = 289,                   /* "NUMERIC-EDITED picture"  */
    NUMED_CR = 290,                /* "NUMERIC-EDITED CR picture"  */
    NUMED_DB = 291,                /* "NUMERIC-EDITED DB picture"  */
    NINEDOT = 292,                 /* NINEDOT  */
    NINES = 293,                   /* NINES  */
    NINEV = 294,                   /* NINEV  */
    PIC_P = 295,                   /* PIC_P  */
    ONES = 296,                    /* ONES  */
    SPACES = 297,                  /* SPACES  */
    EQ = 298,                      /* "EQUAL"  */
    LITERAL = 299,                 /* LITERAL  */
    END = 300,                     /* END  */
    EOP = 301,                     /* EOP  */
    FILENAME = 302,                /* FILENAME  */
    INVALID = 303,                 /* INVALID  */
    NUMBER = 304,                  /* NUMBER  */
    NEGATIVE = 305,                /* NEGATIVE  */
    NUMSTR = 306,                  /* "numeric literal"  */
    OVERFLOW_kw = 307,             /* "OVERFLOW"  */
    BINARY_INTEGER = 308,          /* BINARY_INTEGER  */
    COMPUTATIONAL = 309,           /* COMPUTATIONAL  */
    PERFORM = 310,                 /* PERFORM  */
    BACKWARD = 311,                /* BACKWARD  */
    POSITIVE = 312,                /* POSITIVE  */
    POINTER = 313,                 /* POINTER  */
    SECTION = 314,                 /* SECTION  */
    STANDARD_ALPHABET = 315,       /* "STANDARD ALPHABET"  */
    SWITCH = 316,                  /* SWITCH  */
    UPSI = 317,                    /* UPSI  */
    ZERO = 318,                    /* ZERO  */
    SYSIN = 319,                   /* SYSIN  */
    SYSIPT = 320,                  /* SYSIPT  */
    SYSOUT = 321,                  /* SYSOUT  */
    SYSLIST = 322,                 /* SYSLIST  */
    SYSLST = 323,                  /* SYSLST  */
    SYSPUNCH = 324,                /* SYSPUNCH  */
    SYSPCH = 325,                  /* SYSPCH  */
    CONSOLE = 326,                 /* CONSOLE  */
    C01 = 327,                     /* C01  */
    C02 = 328,                     /* C02  */
    C03 = 329,                     /* C03  */
    C04 = 330,                     /* C04  */
    C05 = 331,                     /* C05  */
    C06 = 332,                     /* C06  */
    C07 = 333,                     /* C07  */
    C08 = 334,                     /* C08  */
    C09 = 335,                     /* C09  */
    C10 = 336,                     /* C10  */
    C11 = 337,                     /* C11  */
    C12 = 338,                     /* C12  */
    CSP = 339,                     /* CSP  */
    S01 = 340,                     /* S01  */
    S02 = 341,                     /* S02  */
    S03 = 342,                     /* S03  */
    S04 = 343,                     /* S04  */
    S05 = 344,                     /* S05  */
    AFP_5A = 345,                  /* "AFP 5A"  */
    STDIN = 346,                   /* STDIN  */
    STDOUT = 347,                  /* STDOUT  */
    STDERR = 348,                  /* STDERR  */
    LIST = 349,                    /* LIST  */
    MAP = 350,                     /* MAP  */
    NOLIST = 351,                  /* NOLIST  */
    NOMAP = 352,                   /* NOMAP  */
    NOSOURCE = 353,                /* NOSOURCE  */
    MIGHT_BE = 354,                /* "IS or IS NOT"  */
    FUNCTION_UDF = 355,            /* "UDF name"  */
    FUNCTION_UDF_0 = 356,          /* "UDF"  */
    DEFAULT = 357,                 /* DEFAULT  */
    DATE_FMT = 358,                /* "date format"  */
    TIME_FMT = 359,                /* "time format"  */
    DATETIME_FMT = 360,            /* "datetime format"  */
    BASIS = 361,                   /* BASIS  */
    CBL = 362,                     /* CBL  */
    CONSTANT = 363,                /* CONSTANT  */
    COPY = 364,                    /* COPY  */
    DEFINED = 365,                 /* DEFINED  */
    ENTER = 366,                   /* ENTER  */
    FEATURE = 367,                 /* FEATURE  */
    INSERTT = 368,                 /* INSERTT  */
    LSUB = 369,                    /* "("  */
    PARAMETER_kw = 370,            /* "PARAMETER"  */
    OVERRIDE = 371,                /* OVERRIDE  */
    READY = 372,                   /* READY  */
    RESET = 373,                   /* RESET  */
    RSUB = 374,                    /* ")"  */
    SERVICE_RELOAD = 375,          /* "SERVICE RELOAD"  */
    STAR_CBL = 376,                /* "*CBL"  */
    SUBSCRIPT = 377,               /* SUBSCRIPT  */
    SUPPRESS = 378,                /* SUPPRESS  */
    TITLE = 379,                   /* TITLE  */
    TRACE = 380,                   /* TRACE  */
    USE = 381,                     /* USE  */
    COBOL_WORDS = 382,             /* ">>COBOL-WORDS"  */
    EQUATE = 383,                  /* EQUATE  */
    UNDEFINE = 384,                /* UNDEFINE  */
    CDF_DEFINE = 385,              /* ">>DEFINE"  */
    CDF_DISPLAY = 386,             /* ">>DISPLAY"  */
    CDF_IF = 387,                  /* ">>IF"  */
    CDF_ELSE = 388,                /* ">>ELSE"  */
    CDF_END_IF = 389,              /* ">>END-IF"  */
    CDF_EVALUATE = 390,            /* ">>EVALUATE"  */
    CDF_WHEN = 391,                /* ">>WHEN"  */
    CDF_END_EVALUATE = 392,        /* ">>END-EVALUATE"  */
    CALL_CONVENTION = 393,         /* ">>CALL-CONVENTION"  */
    CALL_COBOL = 394,              /* "CALL"  */
    CALL_VERBATIM = 395,           /* "CALL (as C)"  */
    CDF_PUSH = 396,                /* ">>PUSH"  */
    CDF_POP = 397,                 /* ">>POP"  */
    SOURCE_FORMAT = 398,           /* ">>SOURCE FORMAT"  */
    IF = 399,                      /* IF  */
    THEN = 400,                    /* THEN  */
    ELSE = 401,                    /* ELSE  */
    SENTENCE = 402,                /* SENTENCE  */
    ACCEPT = 403,                  /* ACCEPT  */
    ADD = 404,                     /* ADD  */
    ALTER = 405,                   /* ALTER  */
    CALL = 406,                    /* CALL  */
    CANCEL = 407,                  /* CANCEL  */
    CLOSE = 408,                   /* CLOSE  */
    COMPUTE = 409,                 /* COMPUTE  */
    CONTINUE = 410,                /* CONTINUE  */
    DELETE = 411,                  /* DELETE  */
    DISPLAY = 412,                 /* DISPLAY  */
    DIVIDE = 413,                  /* DIVIDE  */
    EVALUATE = 414,                /* EVALUATE  */
    EXIT = 415,                    /* EXIT  */
    FILLER_kw = 416,               /* "FILLER"  */
    GOBACK = 417,                  /* GOBACK  */
    GOTO = 418,                    /* GOTO  */
    INITIALIZE = 419,              /* INITIALIZE  */
    INSPECT = 420,                 /* INSPECT  */
    MERGE = 421,                   /* MERGE  */
    MOVE = 422,                    /* MOVE  */
    MULTIPLY = 423,                /* MULTIPLY  */
    OPEN = 424,                    /* OPEN  */
    PARAGRAPH = 425,               /* PARAGRAPH  */
    READ = 426,                    /* READ  */
    RELEASE = 427,                 /* RELEASE  */
    RETURN = 428,                  /* RETURN  */
    REWRITE = 429,                 /* REWRITE  */
    SEARCH = 430,                  /* SEARCH  */
    SET = 431,                     /* SET  */
    SELECT = 432,                  /* SELECT  */
    SORT = 433,                    /* SORT  */
    SORT_MERGE = 434,              /* "SORT-MERGE"  */
    STRING_kw = 435,               /* "STRING"  */
    STOP = 436,                    /* STOP  */
    SUBTRACT = 437,                /* SUBTRACT  */
    START = 438,                   /* START  */
    UNSTRING = 439,                /* UNSTRING  */
    WRITE = 440,                   /* WRITE  */
    WHEN = 441,                    /* WHEN  */
    ARGUMENT_NUMBER = 442,         /* ARGUMENT_NUMBER  */
    ARGUMENT_VALUE = 443,          /* ARGUMENT_VALUE  */
    ENVIRONMENT_NAME = 444,        /* ENVIRONMENT_NAME  */
    ENVIRONMENT_VALUE = 445,       /* ENVIRONMENT_VALUE  */
    ABS = 446,                     /* ABS  */
    ACCESS = 447,                  /* ACCESS  */
    ACOS = 448,                    /* ACOS  */
    ACTUAL = 449,                  /* ACTUAL  */
    ADVANCING = 450,               /* ADVANCING  */
    AFTER = 451,                   /* AFTER  */
    ALL = 452,                     /* ALL  */
    ALLOCATE = 453,                /* ALLOCATE  */
    ALPHABET = 454,                /* ALPHABET  */
    ALPHABETIC = 455,              /* ALPHABETIC  */
    ALPHABETIC_LOWER = 456,        /* "ALPHABETIC-LOWER"  */
    ALPHABETIC_UPPER = 457,        /* "ALPHABETIC-UPPER"  */
    ALPHANUMERIC = 458,            /* ALPHANUMERIC  */
    ALPHANUMERIC_EDITED = 459,     /* "ALPHANUMERIC-EDITED"  */
    ALSO = 460,                    /* ALSO  */
    ALTERNATE = 461,               /* ALTERNATE  */
    ANNUITY = 462,                 /* ANNUITY  */
    ANUM = 463,                    /* ANUM  */
    ANY = 464,                     /* ANY  */
    ANYCASE = 465,                 /* ANYCASE  */
    APPLY = 466,                   /* APPLY  */
    ARE = 467,                     /* ARE  */
    AREA = 468,                    /* AREA  */
    AREAS = 469,                   /* AREAS  */
    AS = 470,                      /* AS  */
    ASCENDING = 471,               /* ASCENDING  */
    ACTIVATING = 472,              /* ACTIVATING  */
    ASIN = 473,                    /* ASIN  */
    ASSIGN = 474,                  /* ASSIGN  */
    AT = 475,                      /* AT  */
    ATAN = 476,                    /* ATAN  */
    BASED = 477,                   /* BASED  */
    BASECONVERT = 478,             /* BASECONVERT  */
    BEFORE = 479,                  /* BEFORE  */
    BINARY = 480,                  /* BINARY  */
    BIT = 481,                     /* BIT  */
    BIT_OF = 482,                  /* "BIT-OF"  */
    BIT_TO_CHAR = 483,             /* "BIT-TO-CHAR"  */
    BLANK = 484,                   /* BLANK  */
    BLOCK_kw = 485,                /* BLOCK_kw  */
    BOOLEAN_OF_INTEGER = 486,      /* "BOOLEAN-OF-INTEGER"  */
    BOTTOM = 487,                  /* BOTTOM  */
    BY = 488,                      /* BY  */
    BYTE = 489,                    /* BYTE  */
    BYTE_LENGTH = 490,             /* "BYTE-LENGTH"  */
    CF = 491,                      /* CF  */
    CH = 492,                      /* CH  */
    CHANGED = 493,                 /* CHANGED  */
    CHAR = 494,                    /* CHAR  */
    CHAR_NATIONAL = 495,           /* "CHAR-NATIONAL"  */
    CHARACTER = 496,               /* CHARACTER  */
    CHARACTERS = 497,              /* CHARACTERS  */
    CHECKING = 498,                /* CHECKING  */
    CLASS = 499,                   /* CLASS  */
    COBOL = 500,                   /* COBOL  */
    CODE = 501,                    /* CODE  */
    CODESET = 502,                 /* "CODE-SET"  */
    COLLATING = 503,               /* COLLATING  */
    COLUMN = 504,                  /* COLUMN  */
    COMBINED_DATETIME = 505,       /* "COMBINED-DATETIME"  */
    COMMA = 506,                   /* COMMA  */
    COMMAND_LINE = 507,            /* "COMMAND-LINE"  */
    COMMAND_LINE_COUNT = 508,      /* "COMMAND-LINE-COUNT"  */
    COMMIT = 509,                  /* COMMIT  */
    COMMON = 510,                  /* COMMON  */
    CONCAT = 511,                  /* CONCAT  */
    CONDITION = 512,               /* CONDITION  */
    CONFIGURATION_SECT = 513,      /* "CONFIGURATION SECTION"  */
    CONTAINS = 514,                /* CONTAINS  */
    CONTENT = 515,                 /* CONTENT  */
    CONTROL = 516,                 /* CONTROL  */
    CONTROLS = 517,                /* CONTROLS  */
    CONVERT = 518,                 /* CONVERT  */
    CONVERTING = 519,              /* CONVERTING  */
    CORRESPONDING = 520,           /* CORRESPONDING  */
    COS = 521,                     /* COS  */
    COUNT = 522,                   /* COUNT  */
    CURRENCY = 523,                /* CURRENCY  */
    CURRENT = 524,                 /* CURRENT  */
    CURRENT_DATE = 525,            /* CURRENT_DATE  */
    DATA = 526,                    /* DATA  */
    DATE = 527,                    /* DATE  */
    DATE_COMPILED = 528,           /* DATE_COMPILED  */
    DATE_OF_INTEGER = 529,         /* "DATE-OF-INTEGER"  */
    DATE_TO_YYYYMMDD = 530,        /* "DATE-TO-YYYYMMDD"  */
    DATE_WRITTEN = 531,            /* "DATE-WRITTEN"  */
    DAY = 532,                     /* DAY  */
    DAY_OF_INTEGER = 533,          /* "DAY-OF-INTEGER"  */
    DAY_OF_WEEK = 534,             /* "DAY-OF-WEEK"  */
    DAY_TO_YYYYDDD = 535,          /* "DAY-TO-YYYYDDD"  */
    DBCS = 536,                    /* DBCS  */
    DE = 537,                      /* DE  */
    DEBUGGING = 538,               /* DEBUGGING  */
    DECIMAL_POINT = 539,           /* DECIMAL_POINT  */
    DECLARATIVES = 540,            /* DECLARATIVES  */
    DELIMITED = 541,               /* DELIMITED  */
    DELIMITER = 542,               /* DELIMITER  */
    DEPENDING = 543,               /* DEPENDING  */
    DESCENDING = 544,              /* DESCENDING  */
    DETAIL = 545,                  /* DETAIL  */
    DIRECT = 546,                  /* DIRECT  */
    DIRECT_ACCESS = 547,           /* "DIRECT-ACCESS"  */
    DOWN = 548,                    /* DOWN  */
    DUPLICATES = 549,              /* DUPLICATES  */
    DYNAMIC = 550,                 /* DYNAMIC  */
    E = 551,                       /* E  */
    EBCDIC = 552,                  /* EBCDIC  */
    EC = 553,                      /* EC  */
    EGCS = 554,                    /* EGCS  */
    ENCODING = 555,                /* ENCODING  */
    ENTRY = 556,                   /* ENTRY  */
    ENVIRONMENT = 557,             /* ENVIRONMENT  */
    EVERY = 558,                   /* EVERY  */
    EXAMINE = 559,                 /* EXAMINE  */
    EXHIBIT = 560,                 /* EXHIBIT  */
    EXP = 561,                     /* EXP  */
    EXP10 = 562,                   /* EXP10  */
    EXTEND = 563,                  /* EXTEND  */
    EXTERNAL = 564,                /* EXTERNAL  */
    EXCEPTION_FILE = 565,          /* "EXCEPTION-FILE"  */
    EXCEPTION_FILE_N = 566,        /* "EXCEPTION-FILE-N"  */
    EXCEPTION_LOCATION = 567,      /* "EXCEPTION-LOCATION"  */
    EXCEPTION_LOCATION_N = 568,    /* "EXCEPTION-LOCATION-N"  */
    EXCEPTION_STATEMENT = 569,     /* "EXCEPTION-STATEMENT"  */
    EXCEPTION_STATUS = 570,        /* "EXCEPTION-STATUS"  */
    FACTORIAL = 571,               /* FACTORIAL  */
    FALSE_kw = 572,                /* "False"  */
    FD = 573,                      /* FD  */
    FILE_CONTROL = 574,            /* "FILE-CONTROL"  */
    FILE_KW = 575,                 /* "File"  */
    FILE_LIMIT = 576,              /* "FILE-LIMIT"  */
    FINAL = 577,                   /* FINAL  */
    FINALLY = 578,                 /* FINALLY  */
    FIND_STRING = 579,             /* "FIND-STRING"  */
    FIRST = 580,                   /* FIRST  */
    FIXED = 581,                   /* FIXED  */
    FOOTING = 582,                 /* FOOTING  */
    FOR = 583,                     /* FOR  */
    FORMATTED_CURRENT_DATE = 584,  /* "FORMATTED-CURRENT-DATE"  */
    FORMATTED_DATE = 585,          /* "FORMATTED-DATE"  */
    FORMATTED_DATETIME = 586,      /* "FORMATTED-DATETIME"  */
    FORMATTED_TIME = 587,          /* "FORMATTED-TIME"  */
    FORM_OVERFLOW = 588,           /* "FORM-OVERFLOW"  */
    FREE = 589,                    /* FREE  */
    FRACTION_PART = 590,           /* "FRACTION-PART"  */
    FROM = 591,                    /* FROM  */
    FUNCTION = 592,                /* FUNCTION  */
    GENERATE = 593,                /* GENERATE  */
    GIVING = 594,                  /* GIVING  */
    GLOBAL = 595,                  /* GLOBAL  */
    GO = 596,                      /* GO  */
    GROUP = 597,                   /* GROUP  */
    HEADING = 598,                 /* HEADING  */
    HEX = 599,                     /* HEX  */
    HEX_OF = 600,                  /* "HEX-OF"  */
    HEX_TO_CHAR = 601,             /* "HEX-TO-CHAR"  */
    HIGH_VALUES = 602,             /* "HIGH-VALUES"  */
    HIGHEST_ALGEBRAIC = 603,       /* "HIGHEST-ALGEBRAIC"  */
    HOLD = 604,                    /* HOLD  */
    IBM_360 = 605,                 /* IBM_360  */
    IN = 606,                      /* IN  */
    INCLUDE = 607,                 /* INCLUDE  */
    INDEX = 608,                   /* INDEX  */
    INDEXED = 609,                 /* INDEXED  */
    INDICATE = 610,                /* INDICATE  */
    INITIAL_kw = 611,              /* "INITIAL"  */
    INITIATE = 612,                /* INITIATE  */
    INPUT = 613,                   /* INPUT  */
    INSTALLATION = 614,            /* INSTALLATION  */
    INTERFACE = 615,               /* INTERFACE  */
    INTEGER = 616,                 /* INTEGER  */
    INTEGER_OF_BOOLEAN = 617,      /* "INTEGER-OF-BOOLEAN"  */
    INTEGER_OF_DATE = 618,         /* "INTEGER-OF-DATE"  */
    INTEGER_OF_DAY = 619,          /* "INTEGER-OF-DAY"  */
    INTEGER_OF_FORMATTED_DATE = 620, /* "INTEGER-OF-FORMATTED-DATE"  */
    INTEGER_PART = 621,            /* "INTEGER-PART"  */
    INTO = 622,                    /* INTO  */
    INTRINSIC = 623,               /* INTRINSIC  */
    INVOKE = 624,                  /* INVOKE  */
    IO = 625,                      /* "I-O"  */
    IO_CONTROL = 626,              /* "I-O-CONTROL"  */
    IS = 627,                      /* IS  */
    ISNT = 628,                    /* "IS NOT"  */
    KANJI = 629,                   /* KANJI  */
    KEY = 630,                     /* KEY  */
    LABEL = 631,                   /* LABEL  */
    LAST = 632,                    /* LAST  */
    LEADING = 633,                 /* LEADING  */
    LEFT = 634,                    /* LEFT  */
    LENGTH = 635,                  /* LENGTH  */
    LENGTH_OF = 636,               /* "LENGTH-OF"  */
    LIMIT = 637,                   /* LIMIT  */
    LIMITS = 638,                  /* LIMITS  */
    LINE = 639,                    /* LINE  */
    LINES = 640,                   /* LINES  */
    LINE_COUNTER = 641,            /* "LINE-COUNTER"  */
    LINAGE = 642,                  /* LINAGE  */
    LINKAGE = 643,                 /* LINKAGE  */
    LOCALE = 644,                  /* LOCALE  */
    LOCALE_COMPARE = 645,          /* "LOCALE-COMPARE"  */
    LOCALE_DATE = 646,             /* "LOCALE-DATE"  */
    LOCALE_TIME = 647,             /* "LOCALE-TIME"  */
    LOCALE_TIME_FROM_SECONDS = 648, /* "LOCALE-TIME-FROM-SECONDS"  */
    LOCAL_STORAGE = 649,           /* "LOCAL-STORAGE"  */
    LOCATION = 650,                /* LOCATION  */
    LOCK = 651,                    /* LOCK  */
    LOCK_ON = 652,                 /* LOCK_ON  */
    LOG = 653,                     /* LOG  */
    LOG10 = 654,                   /* LOG10  */
    LOWER_CASE = 655,              /* "LOWER-CASE"  */
    LOW_VALUES = 656,              /* "LOW-VALUES"  */
    LOWEST_ALGEBRAIC = 657,        /* "LOWEST-ALGEBRAIC"  */
    LPAREN = 658,                  /* " )"  */
    MANUAL = 659,                  /* MANUAL  */
    MAXX = 660,                    /* "Max"  */
    MEAN = 661,                    /* MEAN  */
    MEDIAN = 662,                  /* MEDIAN  */
    MIDRANGE = 663,                /* MIDRANGE  */
    MINN = 664,                    /* "Min"  */
    MULTIPLE = 665,                /* MULTIPLE  */
    MOD = 666,                     /* MOD  */
    MODE = 667,                    /* MODE  */
    MODULE_NAME = 668,             /* "MODULE-NAME "  */
    NAMED = 669,                   /* NAMED  */
    NAT = 670,                     /* NAT  */
    NATIONAL = 671,                /* NATIONAL  */
    NATIONAL_EDITED = 672,         /* "NATIONAL-EDITED"  */
    NATIONAL_OF = 673,             /* "NATIONAL-OF"  */
    NATIVE = 674,                  /* NATIVE  */
    NESTED = 675,                  /* NESTED  */
    NEXT = 676,                    /* NEXT  */
    NO = 677,                      /* NO  */
    NOTE = 678,                    /* NOTE  */
    NULLS = 679,                   /* NULLS  */
    NULLPTR = 680,                 /* NULLPTR  */
    NUMERIC = 681,                 /* NUMERIC  */
    NUMERIC_EDITED = 682,          /* NUMERIC_EDITED  */
    NUMVAL = 683,                  /* NUMVAL  */
    NUMVAL_C = 684,                /* "NUMVAL-C"  */
    NUMVAL_F = 685,                /* "NUMVAL-F"  */
    OCCURS = 686,                  /* OCCURS  */
    OF = 687,                      /* OF  */
    OFF = 688,                     /* OFF  */
    OMITTED = 689,                 /* OMITTED  */
    ON = 690,                      /* ON  */
    ONLY = 691,                    /* ONLY  */
    OPTIONAL = 692,                /* OPTIONAL  */
    OPTIONS = 693,                 /* OPTIONS  */
    ORD = 694,                     /* ORD  */
    ORDER = 695,                   /* ORDER  */
    ORD_MAX = 696,                 /* "ORD-MAX"  */
    ORD_MIN = 697,                 /* "ORD-MIN"  */
    ORGANIZATION = 698,            /* ORGANIZATION  */
    OTHER = 699,                   /* OTHER  */
    OTHERWISE = 700,               /* OTHERWISE  */
    OUTPUT = 701,                  /* OUTPUT  */
    PACKED_DECIMAL = 702,          /* PACKED_DECIMAL  */
    PADDING = 703,                 /* PADDING  */
    PAGE = 704,                    /* PAGE  */
    PAGE_COUNTER = 705,            /* "PAGE-COUNTER"  */
    PF = 706,                      /* PF  */
    PH = 707,                      /* PH  */
    PI = 708,                      /* PI  */
    PIC = 709,                     /* PIC  */
    PICTURE = 710,                 /* PICTURE  */
    PLUS = 711,                    /* PLUS  */
    PRESENT_VALUE = 712,           /* PRESENT_VALUE  */
    PRINT_SWITCH = 713,            /* PRINT_SWITCH  */
    PROCEDURE = 714,               /* PROCEDURE  */
    PROCEDURES = 715,              /* PROCEDURES  */
    PROCEED = 716,                 /* PROCEED  */
    PROCESS = 717,                 /* PROCESS  */
    PROCESSING = 718,              /* PROCESSING  */
    PROGRAM_ID = 719,              /* "PROGRAM-ID"  */
    PROGRAM_kw = 720,              /* "Program"  */
    PROPERTY = 721,                /* PROPERTY  */
    PROTOTYPE = 722,               /* PROTOTYPE  */
    PSEUDOTEXT = 723,              /* PSEUDOTEXT  */
    QUOTES = 724,                  /* "QUOTE"  */
    RANDOM = 725,                  /* RANDOM  */
    RANDOM_SEED = 726,             /* RANDOM_SEED  */
    RANGE = 727,                   /* RANGE  */
    RAISE = 728,                   /* RAISE  */
    RAISING = 729,                 /* RAISING  */
    RD = 730,                      /* RD  */
    RECORD = 731,                  /* RECORD  */
    RECORDING = 732,               /* RECORDING  */
    RECORDS = 733,                 /* RECORDS  */
    RECURSIVE = 734,               /* RECURSIVE  */
    REDEFINES = 735,               /* REDEFINES  */
    REEL = 736,                    /* REEL  */
    REFERENCE = 737,               /* REFERENCE  */
    RELATIVE = 738,                /* RELATIVE  */
    REM = 739,                     /* REM  */
    REMAINDER = 740,               /* REMAINDER  */
    REMARKS = 741,                 /* REMARKS  */
    REMOVAL = 742,                 /* REMOVAL  */
    RENAMES = 743,                 /* RENAMES  */
    REPLACE = 744,                 /* REPLACE  */
    REPLACING = 745,               /* REPLACING  */
    REPORT = 746,                  /* REPORT  */
    REPORTING = 747,               /* REPORTING  */
    REPORTS = 748,                 /* REPORTS  */
    REPOSITORY = 749,              /* REPOSITORY  */
    RERUN = 750,                   /* RERUN  */
    RESERVE = 751,                 /* RESERVE  */
    RESTRICTED = 752,              /* RESTRICTED  */
    RESUME = 753,                  /* RESUME  */
    RETRY = 754,                   /* RETRY  */
    REVERSE = 755,                 /* REVERSE  */
    REVERSED = 756,                /* REVERSED  */
    REWIND = 757,                  /* REWIND  */
    RF = 758,                      /* RF  */
    RH = 759,                      /* RH  */
    RIGHT = 760,                   /* RIGHT  */
    ROUNDED = 761,                 /* ROUNDED  */
    RUN = 762,                     /* RUN  */
    SAME = 763,                    /* SAME  */
    SCREEN = 764,                  /* SCREEN  */
    SD = 765,                      /* SD  */
    SECONDS_FROM_FORMATTED_TIME = 766, /* "SECONDS-FROM-FORMATTED-TIME"  */
    SECONDS_PAST_MIDNIGHT = 767,   /* "SECONDS-PAST-MIDNIGHT"  */
    SECURITY = 768,                /* SECURITY  */
    SEPARATE = 769,                /* SEPARATE  */
    SEQUENCE = 770,                /* SEQUENCE  */
    SEQUENTIAL = 771,              /* SEQUENTIAL  */
    SHARING = 772,                 /* SHARING  */
    SIMPLE_EXIT = 773,             /* "(simple) EXIT"  */
    SIGN = 774,                    /* SIGN  */
    SIN = 775,                     /* SIN  */
    SIZE = 776,                    /* SIZE  */
    SMALLEST_ALGEBRAIC = 777,      /* "SMALLEST-ALGEBRAIC"  */
    SOURCE = 778,                  /* SOURCE  */
    SOURCE_COMPUTER = 779,         /* "SOURCE-COMPUTER"  */
    SPECIAL_NAMES = 780,           /* SPECIAL_NAMES  */
    SQRT = 781,                    /* SQRT  */
    STACK = 782,                   /* STACK  */
    STANDARD = 783,                /* STANDARD  */
    STANDARD_1 = 784,              /* "STANDARD-1"  */
    STANDARD_DEVIATION = 785,      /* "STANDARD-DEVIATION "  */
    STANDARD_COMPARE = 786,        /* "STANDARD-COMPARE"  */
    STATUS = 787,                  /* STATUS  */
    STRONG = 788,                  /* STRONG  */
    SUBSTITUTE = 789,              /* SUBSTITUTE  */
    SUM = 790,                     /* SUM  */
    SYMBOL = 791,                  /* SYMBOL  */
    SYMBOLIC = 792,                /* SYMBOLIC  */
    SYNCHRONIZED = 793,            /* SYNCHRONIZED  */
    TALLYING = 794,                /* TALLYING  */
    TAN = 795,                     /* TAN  */
    TERMINATE = 796,               /* TERMINATE  */
    TEST = 797,                    /* TEST  */
    TEST_DATE_YYYYMMDD = 798,      /* "TEST-DATE-YYYYMMDD"  */
    TEST_DAY_YYYYDDD = 799,        /* "TEST-DAY-YYYYDDD"  */
    TEST_FORMATTED_DATETIME = 800, /* "TEST-FORMATTED-DATETIME"  */
    TEST_NUMVAL = 801,             /* "TEST-NUMVAL"  */
    TEST_NUMVAL_C = 802,           /* "TEST-NUMVAL-C"  */
    TEST_NUMVAL_F = 803,           /* "TEST-NUMVAL-F"  */
    THAN = 804,                    /* THAN  */
    TIME = 805,                    /* TIME  */
    TIMES = 806,                   /* TIMES  */
    TO = 807,                      /* TO  */
    TOP = 808,                     /* TOP  */
    TOP_LEVEL = 809,               /* TOP_LEVEL  */
    TRACKS = 810,                  /* TRACKS  */
    TRACK_AREA = 811,              /* TRACK_AREA  */
    TRAILING = 812,                /* TRAILING  */
    TRANSFORM = 813,               /* TRANSFORM  */
    TRIM = 814,                    /* TRIM  */
    TRUE_kw = 815,                 /* "True"  */
    TRY = 816,                     /* TRY  */
    TURN = 817,                    /* TURN  */
    TYPE = 818,                    /* TYPE  */
    TYPEDEF = 819,                 /* TYPEDEF  */
    ULENGTH = 820,                 /* ULENGTH  */
    UNBOUNDED = 821,               /* UNBOUNDED  */
    UNIT = 822,                    /* UNIT  */
    UNITS = 823,                   /* UNITS  */
    UNIT_RECORD = 824,             /* UNIT_RECORD  */
    UNTIL = 825,                   /* UNTIL  */
    UP = 826,                      /* UP  */
    UPON = 827,                    /* UPON  */
    UPOS = 828,                    /* UPOS  */
    UPPER_CASE = 829,              /* UPPER_CASE  */
    USAGE = 830,                   /* USAGE  */
    USING = 831,                   /* USING  */
    USUBSTR = 832,                 /* USUBSTR  */
    USUPPLEMENTARY = 833,          /* USUPPLEMENTARY  */
    UTILITY = 834,                 /* UTILITY  */
    UUID4 = 835,                   /* UUID4  */
    UVALID = 836,                  /* UVALID  */
    UWIDTH = 837,                  /* UWIDTH  */
    VALIDATING = 838,              /* VALIDATING  */
    VALUE = 839,                   /* VALUE  */
    VARIANCE = 840,                /* VARIANCE  */
    VARYING = 841,                 /* VARYING  */
    VOLATILE = 842,                /* VOLATILE  */
    WHEN_COMPILED = 843,           /* WHEN_COMPILED  */
    WITH = 844,                    /* WITH  */
    WORKING_STORAGE = 845,         /* WORKING_STORAGE  */
    YEAR_TO_YYYY = 846,            /* YEAR_TO_YYYY  */
    YYYYDDD = 847,                 /* YYYYDDD  */
    YYYYMMDD = 848,                /* YYYYMMDD  */
    ARITHMETIC = 849,              /* ARITHMETIC  */
    ATTRIBUTE = 850,               /* ATTRIBUTE  */
    AUTO = 851,                    /* AUTO  */
    AUTOMATIC = 852,               /* AUTOMATIC  */
    AWAY_FROM_ZERO = 853,          /* "AWAY-FROM-ZERO"  */
    BACKGROUND_COLOR = 854,        /* "BACKGROUND-COLOR"  */
    BELL = 855,                    /* BELL  */
    BINARY_ENCODING = 856,         /* "BINARY-ENCODING"  */
    BLINK = 857,                   /* BLINK  */
    CAPACITY = 858,                /* CAPACITY  */
    CENTER = 859,                  /* CENTER  */
    CLASSIFICATION = 860,          /* CLASSIFICATION  */
    CYCLE = 861,                   /* CYCLE  */
    DECIMAL_ENCODING = 862,        /* "DECIMAL-ENCODING"  */
    ENTRY_CONVENTION = 863,        /* ENTRY_CONVENTION  */
    EOL = 864,                     /* EOL  */
    EOS = 865,                     /* EOS  */
    ERASE = 866,                   /* ERASE  */
    EXPANDS = 867,                 /* EXPANDS  */
    FLOAT_BINARY = 868,            /* "FLOAT-BINARY"  */
    FLOAT_DECIMAL = 869,           /* "FLOAT-DECIMAL"  */
    FOREGROUND_COLOR = 870,        /* FOREGROUND_COLOR  */
    FOREVER = 871,                 /* FOREVER  */
    FULL = 872,                    /* FULL  */
    HIGHLIGHT = 873,               /* HIGHLIGHT  */
    HIGH_ORDER_LEFT = 874,         /* "HIGH-ORDER-LEFT"  */
    HIGH_ORDER_RIGHT = 875,        /* "HIGH-ORDER-RIGHT"  */
    IGNORING = 876,                /* IGNORING  */
    IMPLEMENTS = 877,              /* IMPLEMENTS  */
    INITIALIZED = 878,             /* INITIALIZED  */
    INTERMEDIATE = 879,            /* INTERMEDIATE  */
    LC_ALL_kw = 880,               /* "LC-ALL"  */
    LC_COLLATE_kw = 881,           /* "LC-COLLATE"  */
    LC_CTYPE_kw = 882,             /* "LC-CTYPE"  */
    LC_MESSAGES_kw = 883,          /* "LC-MESSAGES"  */
    LC_MONETARY_kw = 884,          /* "LC-MONETARY"  */
    LC_NUMERIC_kw = 885,           /* "LC-NUMERIC"  */
    LC_TIME_kw = 886,              /* "LC-TIME"  */
    LOWLIGHT = 887,                /* LOWLIGHT  */
    NEAREST_AWAY_FROM_ZERO = 888,  /* "NEAREST-AWAY-FROM-ZERO"  */
    NEAREST_EVEN = 889,            /* NEAREST_EVEN  */
    NEAREST_TOWARD_ZERO = 890,     /* "NEAREST-EVEN NEAREST-TOWARD-ZERO"  */
    NONE = 891,                    /* NONE  */
    NORMAL = 892,                  /* NORMAL  */
    NUMBERS = 893,                 /* NUMBERS  */
    PREFIXED = 894,                /* PREFIXED  */
    PREVIOUS = 895,                /* PREVIOUS  */
    PROHIBITED = 896,              /* PROHIBITED  */
    RELATION = 897,                /* RELATION  */
    REQUIRED = 898,                /* REQUIRED  */
    REVERSE_VIDEO = 899,           /* REVERSE_VIDEO  */
    ROUNDING = 900,                /* ROUNDING  */
    SECONDS = 901,                 /* SECONDS  */
    SECURE = 902,                  /* SECURE  */
    SHORT = 903,                   /* SHORT  */
    SIGNED_kw = 904,               /* SIGNED_kw  */
    STANDARD_BINARY = 905,         /* "STANDARD-BINARY"  */
    STANDARD_DECIMAL = 906,        /* "STANDARD-DECIMAL"  */
    STATEMENT = 907,               /* STATEMENT  */
    STEP = 908,                    /* STEP  */
    STRUCTURE = 909,               /* STRUCTURE  */
    TOWARD_GREATER = 910,          /* "TOWARD-GREATER"  */
    TOWARD_LESSER = 911,           /* "TOWARD-LESSER"  */
    TRUNCATION = 912,              /* TRUNCATION  */
    UCS_4 = 913,                   /* "UCS-4"  */
    UNDERLINE = 914,               /* UNDERLINE  */
    UNSIGNED_kw = 915,             /* UNSIGNED_kw  */
    UTF_16 = 916,                  /* "UTF-16"  */
    UTF_8 = 917,                   /* "UTF-8"  */
    XMLGENERATE = 918,             /* "XML GENERATE"  */
    XMLPARSE = 919,                /* "XML PARSE"  */
    ADDRESS = 920,                 /* ADDRESS  */
    END_ACCEPT = 921,              /* "END-ACCEPT"  */
    END_ADD = 922,                 /* "END-ADD"  */
    END_CALL = 923,                /* "END-CALL"  */
    END_COMPUTE = 924,             /* "END-COMPUTE"  */
    END_DELETE = 925,              /* "END-DELETE"  */
    END_DISPLAY = 926,             /* "END-DISPLAY"  */
    END_DIVIDE = 927,              /* "END-DIVIDE"  */
    END_EVALUATE = 928,            /* "END-EVALUATE"  */
    END_MULTIPLY = 929,            /* "END-MULTIPLY"  */
    END_PERFORM = 930,             /* "END-PERFORM"  */
    END_READ = 931,                /* "END-READ"  */
    END_RETURN = 932,              /* "END-RETURN"  */
    END_REWRITE = 933,             /* "END-REWRITE"  */
    END_SEARCH = 934,              /* "END-SEARCH"  */
    END_START = 935,               /* "END-START"  */
    END_STRING = 936,              /* "END-STRING"  */
    END_SUBTRACT = 937,            /* "END-SUBTRACT"  */
    END_UNSTRING = 938,            /* "END-UNSTRING"  */
    END_WRITE = 939,               /* "END-WRITE"  */
    END_XML = 940,                 /* "END-XML"  */
    END_IF = 941,                  /* "END-IF"  */
    ATTRIBUTES = 942,              /* ATTRIBUTES  */
    ELEMENT = 943,                 /* ELEMENT  */
    NAMESPACE = 944,               /* NAMESPACE  */
    NAMESPACE_PREFIX = 945,        /* NAMESPACE_PREFIX  */
    NONNUMERIC = 947,              /* NONNUMERIC  */
    XML_DECLARATION = 948,         /* XML_DECLARATION  */
    THRU = 950,                    /* THRU  */
    OR = 951,                      /* OR  */
    AND = 952,                     /* AND  */
    NOT = 953,                     /* NOT  */
    NE = 954,                      /* NE  */
    LE = 955,                      /* LE  */
    GE = 956,                      /* GE  */
    POW = 957,                     /* POW  */
    NEG = 958                      /* NEG  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 912 "parse.y"

    bool boolean;
    int number;
    char *string;
    struct { REAL_VALUE_TYPE r; char *s; } cce_type;
    literal_t literal;
    cbl_field_attr_t field_attr;
    ec_type_t ec_type;
    ec_list_t* ec_list;
    cbl_nameloc_t  *nameloc;
    cbl_namelocs_t *namelocs;
           declarative_list_t* dcl_list_t;
           isym_list_t* isym_list;
    struct { bool is_float; radix_t radix; char *string; } numstr;
    struct { YYLTYPE loc; int token; literal_t name; } prog_end;
    struct { int token; special_name_t id; } special_type;
    struct { char locale_type; const char * name; } locale_phrase;
             coll_alphanat_t char_class_locales;
    struct collating_name_t { int token; const char *name; } collating_name;
    struct { size_t isym; cbl_encoding_t encoding; } codeset;
    struct { cbl_field_type_t type;
             uint32_t capacity; bool signable; } computational;
    struct cbl_special_name_t *special;
    struct cbl_alphabet_t *alphasym;
    struct tgt_list_t *targets;
    struct cbl_file_t *file;
    struct { bool varying; size_t min, max; } min_max;
    struct { cbl_file_t *file; cbl_field_t *buffer; } rewrite_t;
    struct { cbl_file_t *file; file_status_t handled; } file_op;
    struct cbl_label_t *label;
    struct { cbl_label_t *label; int token; } exception;
    struct { cbl_encoding_t encoding; cbl_field_data_t *data; } field_data;
    struct cbl_field_t *field;
    struct { bool tf; cbl_field_t *field; } bool_field;
    struct { int token; cbl_field_t *cond; } cond_field;
    struct cbl_refer_t *refer;

    struct rel_term_type { bool invert; cbl_refer_t *term; } rel_term_t;
    struct log_expr_t *log_expr_t;
    struct vargs_t* vargs;
    struct perform_t *perf;
    struct cbl_perform_tgt_t *tgt;
           Label_list_t *labels;
           key_list_t *file_keys;
           cbl_file_mode_t io_mode;
    struct cbl_file_key_t *file_key;
    struct file_list_t *files;
    struct field_list_t *fields;
    struct refer_list_t *refers;
    struct sort_key_t *sort_key;
    struct sort_keys_t *sort_keys;
    struct file_sort_io_t *sort_io;
    struct arith_t *arith;
    struct { size_t ntgt; cbl_num_result_t *tgts;
             cbl_refer_t *expr; } compute_body_t;
    struct cbl_inspect_t *insp_one;
           cbl_inspect_opers_t *insp_all;
    struct cbl_inspect_oper_t *insp_oper;
    struct { bool before; cbl_inspect_qual_t *qual; } insp_qual;
           cbl_inspect_t *inspect;
           cbl_inspect_match_t *insp_match;
           cbl_inspect_replace_t *insp_replace;

    struct { cbl_refer_t *delimited; refer_list_t *inputs; } delimited;
    struct { cbl_refer_t *input, *delimiter; } delimited_1;
    struct { cbl_refer_t *from, *len; } refmod_parts;
    struct refer_collection_t *delimiteds;

    struct { cbl_label_t *on_error, *not_error; } error;
           label_pair_t label_pair;
    struct { unsigned int nclause; bool tf; } error_clauses;
    struct refer_pair_t { cbl_refer_t *first, *second; } refer2;
    struct { refer_collection_t *inputs; refer_pair_t into; } str_body;

    struct { accept_func_t func; cbl_refer_t *into, *from; special_name_t special;} accept_func;
    struct unstring_into_t *uns_into;
    struct unstring_tgt_list_t *uns_tgts;
    struct unstring_tgt_t *uns_tgt;
    struct { cbl_refer_t *input;
             refer_list_t *delimited; unstring_into_t *into; } uns_body;

    struct cbl_ffi_arg_t *ffi_arg;
    struct ffi_args_t *ffi_args;
    struct { YYLTYPE loc; cbl_refer_t *ffi_name, *ffi_returning;
             ffi_args_t *using_params; } ffi_impl;

    struct { bool common, initial, recursive; } comminit;
    struct { enum select_clause_t clause; cbl_file_t *file; } select_clause;
    struct { size_t clauses; cbl_file_t *file; } select_clauses;
    struct { YYLTYPE loc; char *on, *off; } switches;
    struct { cbl_encoding_t encoding; cbl_domain_t *domain; } false_domain;
    struct { size_t also; unsigned char *low, *high; } colseq;
    struct { cbl_field_attr_t attr; int nbyte; } pic_part;

           data_category_t data_category;
    struct { data_category_t category; cbl_refer_t* replacement; } replacement;
           category_map_t *replacements;
           init_statement_t *init_stmt;
    struct { cbl_special_name_t *special; vargs_t *vargs; } display;
           substitution_t substitution;
           substitutions_t  *substitutions;
    struct { bool is_locale; cbl_refer_t *arg2; } numval_locale_t;
           locale_tgt_t *token_list;

    struct xml_decl_attr_t { bool with_decl, with_attr; } xml_decl_attr;

    cbl_options_t::arith_t opt_arith;
    cbl_round_t opt_round;
    cbl_section_type_t opt_init_sect;
    struct { bool local, working; } opt_init_sects;
    module_type_t module_type;

#line 1174 "parse.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


extern YYSTYPE yylval;
extern YYLTYPE yylloc;

int yyparse (void);


#endif /* !YY_YY_COBOL_PARSE_H_INCLUDED  */

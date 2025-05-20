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
    accept_done_e,
    accept_command_line_e,
    accept_envar_e,
  };

  class literal_t {
    size_t isym;
  public:
    char prefix[3];
    size_t len;
    char *data;

    bool empty() const { return data == NULL; }
    size_t isymbol() const { return isym; }
    const char * symbol_name() const {
      return isym? cbl_field_of(symbol_at(isym))->name : "";
    }

    literal_t&
    set( size_t len, char *data, const char prefix[] ) {
      set_prefix(prefix, strlen(prefix));
      set_data(len, data);
      return *this;
    }

    literal_t&
    set( const cbl_field_t * field ) {
      assert(field->has_attr(constant_e));
      assert(is_literal(field));

      set_prefix( "", 0 );
      set_data( field->data.capacity,
                const_cast<char*>(field->data.initial),
                field_index(field) );
      return *this;
    }
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
    literal_t&
    set_prefix( const char *input, size_t len ) {
      assert(len < sizeof(prefix));
      std::fill(prefix, prefix + sizeof(prefix), '\0');
      std::transform(input, input + len, prefix, toupper);
      return *this;
    }
    bool
    compatible_prefix( const literal_t& that ) const {
      if( prefix[0] != that.prefix[0] ) {
        return prefix[0] != 'N' && that.prefix[0] != 'N';
      }
      return true;
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

    init_statement_t( category_map_t replacement )
      : to_value(false)
      , category(data_category_none)
      , replacement(replacement)

    {}

    init_statement_t( bool to_value = false )
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
  new_literal( const char initial[], enum radix_t radix );
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
    Elem_list_t( E elem ) {
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

#line 300 "parse.h"

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
    SPACES = 296,                  /* SPACES  */
    LITERAL = 297,                 /* LITERAL  */
    END = 298,                     /* END  */
    EOP = 299,                     /* EOP  */
    FILENAME = 300,                /* FILENAME  */
    INVALID = 301,                 /* INVALID  */
    NUMBER = 302,                  /* NUMBER  */
    NEGATIVE = 303,                /* NEGATIVE  */
    NUMSTR = 304,                  /* "numeric literal"  */
    OVERFLOW_kw = 305,             /* "OVERFLOW"  */
    COMPUTATIONAL = 306,           /* COMPUTATIONAL  */
    PERFORM = 307,                 /* PERFORM  */
    BACKWARD = 308,                /* BACKWARD  */
    POSITIVE = 309,                /* POSITIVE  */
    POINTER = 310,                 /* POINTER  */
    SECTION = 311,                 /* SECTION  */
    STANDARD_ALPHABET = 312,       /* "STANDARD ALPHABET"  */
    SWITCH = 313,                  /* SWITCH  */
    UPSI = 314,                    /* UPSI  */
    ZERO = 315,                    /* ZERO  */
    SYSIN = 316,                   /* SYSIN  */
    SYSIPT = 317,                  /* SYSIPT  */
    SYSOUT = 318,                  /* SYSOUT  */
    SYSLIST = 319,                 /* SYSLIST  */
    SYSLST = 320,                  /* SYSLST  */
    SYSPUNCH = 321,                /* SYSPUNCH  */
    SYSPCH = 322,                  /* SYSPCH  */
    CONSOLE = 323,                 /* CONSOLE  */
    C01 = 324,                     /* C01  */
    C02 = 325,                     /* C02  */
    C03 = 326,                     /* C03  */
    C04 = 327,                     /* C04  */
    C05 = 328,                     /* C05  */
    C06 = 329,                     /* C06  */
    C07 = 330,                     /* C07  */
    C08 = 331,                     /* C08  */
    C09 = 332,                     /* C09  */
    C10 = 333,                     /* C10  */
    C11 = 334,                     /* C11  */
    C12 = 335,                     /* C12  */
    CSP = 336,                     /* CSP  */
    S01 = 337,                     /* S01  */
    S02 = 338,                     /* S02  */
    S03 = 339,                     /* S03  */
    S04 = 340,                     /* S04  */
    S05 = 341,                     /* S05  */
    AFP_5A = 342,                  /* "AFP 5A"  */
    STDIN = 343,                   /* STDIN  */
    STDOUT = 344,                  /* STDOUT  */
    STDERR = 345,                  /* STDERR  */
    LIST = 346,                    /* LIST  */
    MAP = 347,                     /* MAP  */
    NOLIST = 348,                  /* NOLIST  */
    NOMAP = 349,                   /* NOMAP  */
    NOSOURCE = 350,                /* NOSOURCE  */
    MIGHT_BE = 351,                /* "IS or IS NOT"  */
    FUNCTION_UDF = 352,            /* "UDF name"  */
    FUNCTION_UDF_0 = 353,          /* "UDF"  */
    DATE_FMT = 354,                /* "date format"  */
    TIME_FMT = 355,                /* "time format"  */
    DATETIME_FMT = 356,            /* "datetime format"  */
    BASIS = 357,                   /* BASIS  */
    CBL = 358,                     /* CBL  */
    CONSTANT = 359,                /* CONSTANT  */
    COPY = 360,                    /* COPY  */
    DEFINED = 361,                 /* DEFINED  */
    ENTER = 362,                   /* ENTER  */
    FEATURE = 363,                 /* FEATURE  */
    INSERTT = 364,                 /* INSERTT  */
    LSUB = 365,                    /* "("  */
    PARAMETER_kw = 366,            /* "PARAMETER"  */
    OVERRIDE = 367,                /* OVERRIDE  */
    READY = 368,                   /* READY  */
    RESET = 369,                   /* RESET  */
    RSUB = 370,                    /* ")"  */
    SERVICE_RELOAD = 371,          /* "SERVICE RELOAD"  */
    STAR_CBL = 372,                /* "*CBL"  */
    SUBSCRIPT = 373,               /* SUBSCRIPT  */
    SUPPRESS = 374,                /* SUPPRESS  */
    TITLE = 375,                   /* TITLE  */
    TRACE = 376,                   /* TRACE  */
    USE = 377,                     /* USE  */
    COBOL_WORDS = 378,             /* ">>COBOL-WORDS"  */
    EQUATE = 379,                  /* EQUATE  */
    UNDEFINE = 380,                /* UNDEFINE  */
    CDF_DEFINE = 381,              /* ">>DEFINE"  */
    CDF_DISPLAY = 382,             /* ">>DISPLAY"  */
    CDF_IF = 383,                  /* ">>IF"  */
    CDF_ELSE = 384,                /* ">>ELSE"  */
    CDF_END_IF = 385,              /* ">>END-IF"  */
    CDF_EVALUATE = 386,            /* ">>EVALUATE"  */
    CDF_WHEN = 387,                /* ">>WHEN"  */
    CDF_END_EVALUATE = 388,        /* ">>END-EVALUATE"  */
    CALL_COBOL = 389,              /* "CALL"  */
    CALL_VERBATIM = 390,           /* "CALL (as C)"  */
    IF = 391,                      /* IF  */
    THEN = 392,                    /* THEN  */
    ELSE = 393,                    /* ELSE  */
    SENTENCE = 394,                /* SENTENCE  */
    ACCEPT = 395,                  /* ACCEPT  */
    ADD = 396,                     /* ADD  */
    ALTER = 397,                   /* ALTER  */
    CALL = 398,                    /* CALL  */
    CANCEL = 399,                  /* CANCEL  */
    CLOSE = 400,                   /* CLOSE  */
    COMPUTE = 401,                 /* COMPUTE  */
    CONTINUE = 402,                /* CONTINUE  */
    DELETE = 403,                  /* DELETE  */
    DISPLAY = 404,                 /* DISPLAY  */
    DIVIDE = 405,                  /* DIVIDE  */
    EVALUATE = 406,                /* EVALUATE  */
    EXIT = 407,                    /* EXIT  */
    FILLER_kw = 408,               /* "FILLER"  */
    GOBACK = 409,                  /* GOBACK  */
    GOTO = 410,                    /* GOTO  */
    INITIALIZE = 411,              /* INITIALIZE  */
    INSPECT = 412,                 /* INSPECT  */
    MERGE = 413,                   /* MERGE  */
    MOVE = 414,                    /* MOVE  */
    MULTIPLY = 415,                /* MULTIPLY  */
    OPEN = 416,                    /* OPEN  */
    PARAGRAPH = 417,               /* PARAGRAPH  */
    READ = 418,                    /* READ  */
    RELEASE = 419,                 /* RELEASE  */
    RETURN = 420,                  /* RETURN  */
    REWRITE = 421,                 /* REWRITE  */
    SEARCH = 422,                  /* SEARCH  */
    SET = 423,                     /* SET  */
    SELECT = 424,                  /* SELECT  */
    SORT = 425,                    /* SORT  */
    SORT_MERGE = 426,              /* "SORT-MERGE"  */
    STRING_kw = 427,               /* "STRING"  */
    STOP = 428,                    /* STOP  */
    SUBTRACT = 429,                /* SUBTRACT  */
    START = 430,                   /* START  */
    UNSTRING = 431,                /* UNSTRING  */
    WRITE = 432,                   /* WRITE  */
    WHEN = 433,                    /* WHEN  */
    ABS = 434,                     /* ABS  */
    ACCESS = 435,                  /* ACCESS  */
    ACOS = 436,                    /* ACOS  */
    ACTUAL = 437,                  /* ACTUAL  */
    ADVANCING = 438,               /* ADVANCING  */
    AFTER = 439,                   /* AFTER  */
    ALL = 440,                     /* ALL  */
    ALLOCATE = 441,                /* ALLOCATE  */
    ALPHABET = 442,                /* ALPHABET  */
    ALPHABETIC = 443,              /* ALPHABETIC  */
    ALPHABETIC_LOWER = 444,        /* "ALPHABETIC-LOWER"  */
    ALPHABETIC_UPPER = 445,        /* "ALPHABETIC-UPPER"  */
    ALPHANUMERIC = 446,            /* ALPHANUMERIC  */
    ALPHANUMERIC_EDITED = 447,     /* "ALPHANUMERIC-EDITED"  */
    ALSO = 448,                    /* ALSO  */
    ALTERNATE = 449,               /* ALTERNATE  */
    ANNUITY = 450,                 /* ANNUITY  */
    ANUM = 451,                    /* ANUM  */
    ANY = 452,                     /* ANY  */
    ANYCASE = 453,                 /* ANYCASE  */
    APPLY = 454,                   /* APPLY  */
    ARE = 455,                     /* ARE  */
    AREA = 456,                    /* AREA  */
    AREAS = 457,                   /* AREAS  */
    AS = 458,                      /* AS  */
    ASCENDING = 459,               /* ASCENDING  */
    ACTIVATING = 460,              /* ACTIVATING  */
    ASIN = 461,                    /* ASIN  */
    ASSIGN = 462,                  /* ASSIGN  */
    AT = 463,                      /* AT  */
    ATAN = 464,                    /* ATAN  */
    BASED = 465,                   /* BASED  */
    BASECONVERT = 466,             /* BASECONVERT  */
    BEFORE = 467,                  /* BEFORE  */
    BINARY = 468,                  /* BINARY  */
    BIT = 469,                     /* BIT  */
    BIT_OF = 470,                  /* "BIT-OF"  */
    BIT_TO_CHAR = 471,             /* "BIT-TO-CHAR"  */
    BLANK = 472,                   /* BLANK  */
    BLOCK_kw = 473,                /* BLOCK_kw  */
    BOOLEAN_OF_INTEGER = 474,      /* "BOOLEAN-OF-INTEGER"  */
    BOTTOM = 475,                  /* BOTTOM  */
    BY = 476,                      /* BY  */
    BYTE = 477,                    /* BYTE  */
    BYTE_LENGTH = 478,             /* "BYTE-LENGTH"  */
    CF = 479,                      /* CF  */
    CH = 480,                      /* CH  */
    CHANGED = 481,                 /* CHANGED  */
    CHAR = 482,                    /* CHAR  */
    CHAR_NATIONAL = 483,           /* "CHAR-NATIONAL"  */
    CHARACTER = 484,               /* CHARACTER  */
    CHARACTERS = 485,              /* CHARACTERS  */
    CHECKING = 486,                /* CHECKING  */
    CLASS = 487,                   /* CLASS  */
    COBOL = 488,                   /* COBOL  */
    CODE = 489,                    /* CODE  */
    CODESET = 490,                 /* CODESET  */
    COLLATING = 491,               /* COLLATING  */
    COLUMN = 492,                  /* COLUMN  */
    COMBINED_DATETIME = 493,       /* "COMBINED-DATETIME"  */
    COMMA = 494,                   /* COMMA  */
    COMMAND_LINE = 495,            /* "COMMAND-LINE"  */
    COMMAND_LINE_COUNT = 496,      /* "COMMAND-LINE-COUNT"  */
    COMMIT = 497,                  /* COMMIT  */
    COMMON = 498,                  /* COMMON  */
    CONCAT = 499,                  /* CONCAT  */
    CONDITION = 500,               /* CONDITION  */
    CONFIGURATION_SECT = 501,      /* "CONFIGURATION SECTION"  */
    CONTAINS = 502,                /* CONTAINS  */
    CONTENT = 503,                 /* CONTENT  */
    CONTROL = 504,                 /* CONTROL  */
    CONTROLS = 505,                /* CONTROLS  */
    CONVERT = 506,                 /* CONVERT  */
    CONVERTING = 507,              /* CONVERTING  */
    CORRESPONDING = 508,           /* CORRESPONDING  */
    COS = 509,                     /* COS  */
    COUNT = 510,                   /* COUNT  */
    CURRENCY = 511,                /* CURRENCY  */
    CURRENT = 512,                 /* CURRENT  */
    CURRENT_DATE = 513,            /* CURRENT_DATE  */
    DATA = 514,                    /* DATA  */
    DATE = 515,                    /* DATE  */
    DATE_COMPILED = 516,           /* DATE_COMPILED  */
    DATE_OF_INTEGER = 517,         /* "DATE-OF-INTEGER"  */
    DATE_TO_YYYYMMDD = 518,        /* "DATE-TO-YYYYMMDD"  */
    DATE_WRITTEN = 519,            /* "DATE-WRITTEN"  */
    DAY = 520,                     /* DAY  */
    DAY_OF_INTEGER = 521,          /* "DAY-OF-INTEGER"  */
    DAY_OF_WEEK = 522,             /* "DAY-OF-WEEK"  */
    DAY_TO_YYYYDDD = 523,          /* "DAY-TO-YYYYDDD"  */
    DBCS = 524,                    /* DBCS  */
    DE = 525,                      /* DE  */
    DEBUGGING = 526,               /* DEBUGGING  */
    DECIMAL_POINT = 527,           /* DECIMAL_POINT  */
    DECLARATIVES = 528,            /* DECLARATIVES  */
    DEFAULT = 529,                 /* DEFAULT  */
    DELIMITED = 530,               /* DELIMITED  */
    DELIMITER = 531,               /* DELIMITER  */
    DEPENDING = 532,               /* DEPENDING  */
    DESCENDING = 533,              /* DESCENDING  */
    DETAIL = 534,                  /* DETAIL  */
    DIRECT = 535,                  /* DIRECT  */
    DIRECT_ACCESS = 536,           /* "DIRECT-ACCESS"  */
    DOWN = 537,                    /* DOWN  */
    DUPLICATES = 538,              /* DUPLICATES  */
    DYNAMIC = 539,                 /* DYNAMIC  */
    E = 540,                       /* E  */
    EBCDIC = 541,                  /* EBCDIC  */
    EC = 542,                      /* EC  */
    EGCS = 543,                    /* EGCS  */
    ENTRY = 544,                   /* ENTRY  */
    ENVIRONMENT = 545,             /* ENVIRONMENT  */
    EQUAL = 546,                   /* EQUAL  */
    EVERY = 547,                   /* EVERY  */
    EXAMINE = 548,                 /* EXAMINE  */
    EXHIBIT = 549,                 /* EXHIBIT  */
    EXP = 550,                     /* EXP  */
    EXP10 = 551,                   /* EXP10  */
    EXTEND = 552,                  /* EXTEND  */
    EXTERNAL = 553,                /* EXTERNAL  */
    EXCEPTION_FILE = 554,          /* "EXCEPTION-FILE"  */
    EXCEPTION_FILE_N = 555,        /* "EXCEPTION-FILE-N"  */
    EXCEPTION_LOCATION = 556,      /* "EXCEPTION-LOCATION"  */
    EXCEPTION_LOCATION_N = 557,    /* "EXCEPTION-LOCATION-N"  */
    EXCEPTION_STATEMENT = 558,     /* "EXCEPTION-STATEMENT"  */
    EXCEPTION_STATUS = 559,        /* "EXCEPTION-STATUS"  */
    FACTORIAL = 560,               /* FACTORIAL  */
    FALSE_kw = 561,                /* "False"  */
    FD = 562,                      /* FD  */
    FILE_CONTROL = 563,            /* "FILE-CONTROL"  */
    FILE_KW = 564,                 /* "File"  */
    FILE_LIMIT = 565,              /* "FILE-LIMIT"  */
    FINAL = 566,                   /* FINAL  */
    FINALLY = 567,                 /* FINALLY  */
    FIND_STRING = 568,             /* "FIND-STRING"  */
    FIRST = 569,                   /* FIRST  */
    FIXED = 570,                   /* FIXED  */
    FOOTING = 571,                 /* FOOTING  */
    FOR = 572,                     /* FOR  */
    FORMATTED_CURRENT_DATE = 573,  /* "FORMATTED-CURRENT-DATE"  */
    FORMATTED_DATE = 574,          /* "FORMATTED-DATE"  */
    FORMATTED_DATETIME = 575,      /* "FORMATTED-DATETIME"  */
    FORMATTED_TIME = 576,          /* "FORMATTED-TIME"  */
    FORM_OVERFLOW = 577,           /* "FORM-OVERFLOW"  */
    FREE = 578,                    /* FREE  */
    FRACTION_PART = 579,           /* "FRACTION-PART"  */
    FROM = 580,                    /* FROM  */
    FUNCTION = 581,                /* FUNCTION  */
    GENERATE = 582,                /* GENERATE  */
    GIVING = 583,                  /* GIVING  */
    GLOBAL = 584,                  /* GLOBAL  */
    GO = 585,                      /* GO  */
    GROUP = 586,                   /* GROUP  */
    HEADING = 587,                 /* HEADING  */
    HEX = 588,                     /* HEX  */
    HEX_OF = 589,                  /* "HEX-OF"  */
    HEX_TO_CHAR = 590,             /* "HEX-TO-CHAR"  */
    HIGH_VALUES = 591,             /* "HIGH-VALUES"  */
    HIGHEST_ALGEBRAIC = 592,       /* "HIGHEST-ALGEBRAIC"  */
    HOLD = 593,                    /* HOLD  */
    IBM_360 = 594,                 /* IBM_360  */
    IN = 595,                      /* IN  */
    INCLUDE = 596,                 /* INCLUDE  */
    INDEX = 597,                   /* INDEX  */
    INDEXED = 598,                 /* INDEXED  */
    INDICATE = 599,                /* INDICATE  */
    INITIAL_kw = 600,              /* "INITIAL"  */
    INITIATE = 601,                /* INITIATE  */
    INPUT = 602,                   /* INPUT  */
    INSTALLATION = 603,            /* INSTALLATION  */
    INTERFACE = 604,               /* INTERFACE  */
    INTEGER = 605,                 /* INTEGER  */
    INTEGER_OF_BOOLEAN = 606,      /* "INTEGER-OF-BOOLEAN"  */
    INTEGER_OF_DATE = 607,         /* "INTEGER-OF-DATE"  */
    INTEGER_OF_DAY = 608,          /* "INTEGER-OF-DAY"  */
    INTEGER_OF_FORMATTED_DATE = 609, /* "INTEGER-OF-FORMATTED-DATE"  */
    INTEGER_PART = 610,            /* "INTEGER-PART"  */
    INTO = 611,                    /* INTO  */
    INTRINSIC = 612,               /* INTRINSIC  */
    INVOKE = 613,                  /* INVOKE  */
    IO = 614,                      /* IO  */
    IO_CONTROL = 615,              /* "IO-CONTROL"  */
    IS = 616,                      /* IS  */
    ISNT = 617,                    /* "IS NOT"  */
    KANJI = 618,                   /* KANJI  */
    KEY = 619,                     /* KEY  */
    LABEL = 620,                   /* LABEL  */
    LAST = 621,                    /* LAST  */
    LEADING = 622,                 /* LEADING  */
    LEFT = 623,                    /* LEFT  */
    LENGTH = 624,                  /* LENGTH  */
    LENGTH_OF = 625,               /* "LENGTH-OF"  */
    LIMIT = 626,                   /* LIMIT  */
    LIMITS = 627,                  /* LIMITS  */
    LINE = 628,                    /* LINE  */
    LINES = 629,                   /* LINES  */
    LINE_COUNTER = 630,            /* "LINE-COUNTER"  */
    LINAGE = 631,                  /* LINAGE  */
    LINKAGE = 632,                 /* LINKAGE  */
    LOCALE = 633,                  /* LOCALE  */
    LOCALE_COMPARE = 634,          /* "LOCALE-COMPARE"  */
    LOCALE_DATE = 635,             /* "LOCALE-DATE"  */
    LOCALE_TIME = 636,             /* "LOCALE-TIME"  */
    LOCALE_TIME_FROM_SECONDS = 637, /* "LOCALE-TIME-FROM-SECONDS"  */
    LOCAL_STORAGE = 638,           /* "LOCAL-STORAGE"  */
    LOCATION = 639,                /* LOCATION  */
    LOCK = 640,                    /* LOCK  */
    LOCK_ON = 641,                 /* LOCK_ON  */
    LOG = 642,                     /* LOG  */
    LOG10 = 643,                   /* LOG10  */
    LOWER_CASE = 644,              /* "LOWER-CASE"  */
    LOW_VALUES = 645,              /* "LOW-VALUES"  */
    LOWEST_ALGEBRAIC = 646,        /* "LOWEST-ALGEBRAIC"  */
    LPAREN = 647,                  /* " )"  */
    MANUAL = 648,                  /* MANUAL  */
    MAXX = 649,                    /* "Max"  */
    MEAN = 650,                    /* MEAN  */
    MEDIAN = 651,                  /* MEDIAN  */
    MIDRANGE = 652,                /* MIDRANGE  */
    MINN = 653,                    /* "Min"  */
    MULTIPLE = 654,                /* MULTIPLE  */
    MOD = 655,                     /* MOD  */
    MODE = 656,                    /* MODE  */
    MODULE_NAME = 657,             /* "MODULE-NAME "  */
    NAMED = 658,                   /* NAMED  */
    NAT = 659,                     /* NAT  */
    NATIONAL = 660,                /* NATIONAL  */
    NATIONAL_EDITED = 661,         /* "NATIONAL-EDITED"  */
    NATIONAL_OF = 662,             /* "NATIONAL-OF"  */
    NATIVE = 663,                  /* NATIVE  */
    NESTED = 664,                  /* NESTED  */
    NEXT = 665,                    /* NEXT  */
    NO = 666,                      /* NO  */
    NOTE = 667,                    /* NOTE  */
    NULLS = 668,                   /* NULLS  */
    NULLPTR = 669,                 /* NULLPTR  */
    NUMERIC = 670,                 /* NUMERIC  */
    NUMERIC_EDITED = 671,          /* NUMERIC_EDITED  */
    NUMVAL = 672,                  /* NUMVAL  */
    NUMVAL_C = 673,                /* "NUMVAL-C"  */
    NUMVAL_F = 674,                /* "NUMVAL-F"  */
    OCCURS = 675,                  /* OCCURS  */
    OF = 676,                      /* OF  */
    OFF = 677,                     /* OFF  */
    OMITTED = 678,                 /* OMITTED  */
    ON = 679,                      /* ON  */
    ONLY = 680,                    /* ONLY  */
    OPTIONAL = 681,                /* OPTIONAL  */
    OPTIONS = 682,                 /* OPTIONS  */
    ORD = 683,                     /* ORD  */
    ORDER = 684,                   /* ORDER  */
    ORD_MAX = 685,                 /* "ORD-MAX"  */
    ORD_MIN = 686,                 /* "ORD-MIN"  */
    ORGANIZATION = 687,            /* ORGANIZATION  */
    OTHER = 688,                   /* OTHER  */
    OTHERWISE = 689,               /* OTHERWISE  */
    OUTPUT = 690,                  /* OUTPUT  */
    PACKED_DECIMAL = 691,          /* PACKED_DECIMAL  */
    PADDING = 692,                 /* PADDING  */
    PAGE = 693,                    /* PAGE  */
    PAGE_COUNTER = 694,            /* "PAGE-COUNTER"  */
    PF = 695,                      /* PF  */
    PH = 696,                      /* PH  */
    PI = 697,                      /* PI  */
    PIC = 698,                     /* PIC  */
    PICTURE = 699,                 /* PICTURE  */
    PLUS = 700,                    /* PLUS  */
    PRESENT_VALUE = 701,           /* PRESENT_VALUE  */
    PRINT_SWITCH = 702,            /* PRINT_SWITCH  */
    PROCEDURE = 703,               /* PROCEDURE  */
    PROCEDURES = 704,              /* PROCEDURES  */
    PROCEED = 705,                 /* PROCEED  */
    PROCESS = 706,                 /* PROCESS  */
    PROGRAM_ID = 707,              /* "PROGRAM-ID"  */
    PROGRAM_kw = 708,              /* "Program"  */
    PROPERTY = 709,                /* PROPERTY  */
    PROTOTYPE = 710,               /* PROTOTYPE  */
    PSEUDOTEXT = 711,              /* PSEUDOTEXT  */
    QUOTES = 712,                  /* "QUOTE"  */
    RANDOM = 713,                  /* RANDOM  */
    RANDOM_SEED = 714,             /* RANDOM_SEED  */
    RANGE = 715,                   /* RANGE  */
    RAISE = 716,                   /* RAISE  */
    RAISING = 717,                 /* RAISING  */
    RD = 718,                      /* RD  */
    RECORD = 719,                  /* RECORD  */
    RECORDING = 720,               /* RECORDING  */
    RECORDS = 721,                 /* RECORDS  */
    RECURSIVE = 722,               /* RECURSIVE  */
    REDEFINES = 723,               /* REDEFINES  */
    REEL = 724,                    /* REEL  */
    REFERENCE = 725,               /* REFERENCE  */
    RELATIVE = 726,                /* RELATIVE  */
    REM = 727,                     /* REM  */
    REMAINDER = 728,               /* REMAINDER  */
    REMARKS = 729,                 /* REMARKS  */
    REMOVAL = 730,                 /* REMOVAL  */
    RENAMES = 731,                 /* RENAMES  */
    REPLACE = 732,                 /* REPLACE  */
    REPLACING = 733,               /* REPLACING  */
    REPORT = 734,                  /* REPORT  */
    REPORTING = 735,               /* REPORTING  */
    REPORTS = 736,                 /* REPORTS  */
    REPOSITORY = 737,              /* REPOSITORY  */
    RERUN = 738,                   /* RERUN  */
    RESERVE = 739,                 /* RESERVE  */
    RESTRICTED = 740,              /* RESTRICTED  */
    RESUME = 741,                  /* RESUME  */
    REVERSE = 742,                 /* REVERSE  */
    REVERSED = 743,                /* REVERSED  */
    REWIND = 744,                  /* REWIND  */
    RF = 745,                      /* RF  */
    RH = 746,                      /* RH  */
    RIGHT = 747,                   /* RIGHT  */
    ROUNDED = 748,                 /* ROUNDED  */
    RUN = 749,                     /* RUN  */
    SAME = 750,                    /* SAME  */
    SCREEN = 751,                  /* SCREEN  */
    SD = 752,                      /* SD  */
    SECONDS_FROM_FORMATTED_TIME = 753, /* "SECONDS-FROM-FORMATTED-TIME"  */
    SECONDS_PAST_MIDNIGHT = 754,   /* "SECONDS-PAST-MIDNIGHT"  */
    SECURITY = 755,                /* SECURITY  */
    SEPARATE = 756,                /* SEPARATE  */
    SEQUENCE = 757,                /* SEQUENCE  */
    SEQUENTIAL = 758,              /* SEQUENTIAL  */
    SHARING = 759,                 /* SHARING  */
    SIMPLE_EXIT = 760,             /* "(simple) EXIT"  */
    SIGN = 761,                    /* SIGN  */
    SIN = 762,                     /* SIN  */
    SIZE = 763,                    /* SIZE  */
    SMALLEST_ALGEBRAIC = 764,      /* "SMALLEST-ALGEBRAIC"  */
    SOURCE = 765,                  /* SOURCE  */
    SOURCE_COMPUTER = 766,         /* "SOURCE-COMPUTER"  */
    SPECIAL_NAMES = 767,           /* SPECIAL_NAMES  */
    SQRT = 768,                    /* SQRT  */
    STACK = 769,                   /* STACK  */
    STANDARD = 770,                /* STANDARD  */
    STANDARD_1 = 771,              /* "STANDARD-1"  */
    STANDARD_DEVIATION = 772,      /* "STANDARD-DEVIATION "  */
    STANDARD_COMPARE = 773,        /* "STANDARD-COMPARE"  */
    STATUS = 774,                  /* STATUS  */
    STRONG = 775,                  /* STRONG  */
    SUBSTITUTE = 776,              /* SUBSTITUTE  */
    SUM = 777,                     /* SUM  */
    SYMBOL = 778,                  /* SYMBOL  */
    SYMBOLIC = 779,                /* SYMBOLIC  */
    SYNCHRONIZED = 780,            /* SYNCHRONIZED  */
    TALLY = 781,                   /* TALLY  */
    TALLYING = 782,                /* TALLYING  */
    TAN = 783,                     /* TAN  */
    TERMINATE = 784,               /* TERMINATE  */
    TEST = 785,                    /* TEST  */
    TEST_DATE_YYYYMMDD = 786,      /* "TEST-DATE-YYYYMMDD"  */
    TEST_DAY_YYYYDDD = 787,        /* "TEST-DAY-YYYYDDD"  */
    TEST_FORMATTED_DATETIME = 788, /* "TEST-FORMATTED-DATETIME"  */
    TEST_NUMVAL = 789,             /* "TEST-NUMVAL"  */
    TEST_NUMVAL_C = 790,           /* "TEST-NUMVAL-C"  */
    TEST_NUMVAL_F = 791,           /* "TEST-NUMVAL-F"  */
    THAN = 792,                    /* THAN  */
    TIME = 793,                    /* TIME  */
    TIMES = 794,                   /* TIMES  */
    TO = 795,                      /* TO  */
    TOP = 796,                     /* TOP  */
    TOP_LEVEL = 797,               /* TOP_LEVEL  */
    TRACKS = 798,                  /* TRACKS  */
    TRACK_AREA = 799,              /* TRACK_AREA  */
    TRAILING = 800,                /* TRAILING  */
    TRANSFORM = 801,               /* TRANSFORM  */
    TRIM = 802,                    /* TRIM  */
    TRUE_kw = 803,                 /* "True"  */
    TRY = 804,                     /* TRY  */
    TURN = 805,                    /* TURN  */
    TYPE = 806,                    /* TYPE  */
    TYPEDEF = 807,                 /* TYPEDEF  */
    ULENGTH = 808,                 /* ULENGTH  */
    UNBOUNDED = 809,               /* UNBOUNDED  */
    UNIT = 810,                    /* UNIT  */
    UNITS = 811,                   /* UNITS  */
    UNIT_RECORD = 812,             /* UNIT_RECORD  */
    UNTIL = 813,                   /* UNTIL  */
    UP = 814,                      /* UP  */
    UPON = 815,                    /* UPON  */
    UPOS = 816,                    /* UPOS  */
    UPPER_CASE = 817,              /* UPPER_CASE  */
    USAGE = 818,                   /* USAGE  */
    USING = 819,                   /* USING  */
    USUBSTR = 820,                 /* USUBSTR  */
    USUPPLEMENTARY = 821,          /* USUPPLEMENTARY  */
    UTILITY = 822,                 /* UTILITY  */
    UUID4 = 823,                   /* UUID4  */
    UVALID = 824,                  /* UVALID  */
    UWIDTH = 825,                  /* UWIDTH  */
    VALUE = 826,                   /* VALUE  */
    VARIANCE = 827,                /* VARIANCE  */
    VARYING = 828,                 /* VARYING  */
    VOLATILE = 829,                /* VOLATILE  */
    WHEN_COMPILED = 830,           /* WHEN_COMPILED  */
    WITH = 831,                    /* WITH  */
    WORKING_STORAGE = 832,         /* WORKING_STORAGE  */
    XML = 833,                     /* XML  */
    XMLGENERATE = 834,             /* XMLGENERATE  */
    XMLPARSE = 835,                /* XMLPARSE  */
    YEAR_TO_YYYY = 836,            /* YEAR_TO_YYYY  */
    YYYYDDD = 837,                 /* YYYYDDD  */
    YYYYMMDD = 838,                /* YYYYMMDD  */
    ARITHMETIC = 839,              /* ARITHMETIC  */
    ATTRIBUTE = 840,               /* ATTRIBUTE  */
    AUTO = 841,                    /* AUTO  */
    AUTOMATIC = 842,               /* AUTOMATIC  */
    AWAY_FROM_ZERO = 843,          /* "AWAY-FROM-ZERO"  */
    BACKGROUND_COLOR = 844,        /* "BACKGROUND-COLOR"  */
    BELL = 845,                    /* BELL  */
    BINARY_ENCODING = 846,         /* "BINARY-ENCODING"  */
    BLINK = 847,                   /* BLINK  */
    CAPACITY = 848,                /* CAPACITY  */
    CENTER = 849,                  /* CENTER  */
    CLASSIFICATION = 850,          /* CLASSIFICATION  */
    CYCLE = 851,                   /* CYCLE  */
    DECIMAL_ENCODING = 852,        /* "DECIMAL-ENCODING"  */
    ENTRY_CONVENTION = 853,        /* ENTRY_CONVENTION  */
    EOL = 854,                     /* EOL  */
    EOS = 855,                     /* EOS  */
    ERASE = 856,                   /* ERASE  */
    EXPANDS = 857,                 /* EXPANDS  */
    FLOAT_BINARY = 858,            /* "FLOAT-BINARY"  */
    FLOAT_DECIMAL = 859,           /* "FLOAT-DECIMAL"  */
    FOREGROUND_COLOR = 860,        /* FOREGROUND_COLOR  */
    FOREVER = 861,                 /* FOREVER  */
    FULL = 862,                    /* FULL  */
    HIGHLIGHT = 863,               /* HIGHLIGHT  */
    HIGH_ORDER_LEFT = 864,         /* "HIGH-ORDER-LEFT"  */
    HIGH_ORDER_RIGHT = 865,        /* "HIGH-ORDER-RIGHT"  */
    IGNORING = 866,                /* IGNORING  */
    IMPLEMENTS = 867,              /* IMPLEMENTS  */
    INITIALIZED = 868,             /* INITIALIZED  */
    INTERMEDIATE = 869,            /* INTERMEDIATE  */
    LC_ALL_kw = 870,               /* "LC-ALL"  */
    LC_COLLATE_kw = 871,           /* "LC-COLLATE"  */
    LC_CTYPE_kw = 872,             /* "LC-CTYPE"  */
    LC_MESSAGES_kw = 873,          /* "LC-MESSAGES"  */
    LC_MONETARY_kw = 874,          /* "LC-MONETARY"  */
    LC_NUMERIC_kw = 875,           /* "LC-NUMERIC"  */
    LC_TIME_kw = 876,              /* "LC-TIME"  */
    LOWLIGHT = 877,                /* LOWLIGHT  */
    NEAREST_AWAY_FROM_ZERO = 878,  /* "NEAREST-AWAY-FROM-ZERO"  */
    NEAREST_EVEN = 879,            /* NEAREST_EVEN  */
    NEAREST_TOWARD_ZERO = 880,     /* "NEAREST-EVEN NEAREST-TOWARD-ZERO"  */
    NONE = 881,                    /* NONE  */
    NORMAL = 882,                  /* NORMAL  */
    NUMBERS = 883,                 /* NUMBERS  */
    PREFIXED = 884,                /* PREFIXED  */
    PREVIOUS = 885,                /* PREVIOUS  */
    PROHIBITED = 886,              /* PROHIBITED  */
    RELATION = 887,                /* RELATION  */
    REQUIRED = 888,                /* REQUIRED  */
    REVERSE_VIDEO = 889,           /* REVERSE_VIDEO  */
    ROUNDING = 890,                /* ROUNDING  */
    SECONDS = 891,                 /* SECONDS  */
    SECURE = 892,                  /* SECURE  */
    SHORT = 893,                   /* SHORT  */
    SIGNED_kw = 894,               /* SIGNED_kw  */
    STANDARD_BINARY = 895,         /* "STANDARD-BINARY"  */
    STANDARD_DECIMAL = 896,        /* "STANDARD-DECIMAL"  */
    STATEMENT = 897,               /* STATEMENT  */
    STEP = 898,                    /* STEP  */
    STRUCTURE = 899,               /* STRUCTURE  */
    TOWARD_GREATER = 900,          /* "TOWARD-GREATER"  */
    TOWARD_LESSER = 901,           /* "TOWARD-LESSER"  */
    TRUNCATION = 902,              /* TRUNCATION  */
    UCS_4 = 903,                   /* "UCS-4"  */
    UNDERLINE = 904,               /* UNDERLINE  */
    UNSIGNED_kw = 905,             /* UNSIGNED_kw  */
    UTF_16 = 906,                  /* "UTF-16"  */
    UTF_8 = 907,                   /* "UTF-8"  */
    ADDRESS = 908,                 /* ADDRESS  */
    END_ACCEPT = 909,              /* "END-ACCEPT"  */
    END_ADD = 910,                 /* "END-ADD"  */
    END_CALL = 911,                /* "END-CALL"  */
    END_COMPUTE = 912,             /* "END-COMPUTE"  */
    END_DELETE = 913,              /* "END-DELETE"  */
    END_DISPLAY = 914,             /* "END-DISPLAY"  */
    END_DIVIDE = 915,              /* "END-DIVIDE"  */
    END_EVALUATE = 916,            /* "END-EVALUATE"  */
    END_MULTIPLY = 917,            /* "END-MULTIPLY"  */
    END_PERFORM = 918,             /* "END-PERFORM"  */
    END_READ = 919,                /* "END-READ"  */
    END_RETURN = 920,              /* "END-RETURN"  */
    END_REWRITE = 921,             /* "END-REWRITE"  */
    END_SEARCH = 922,              /* "END-SEARCH"  */
    END_START = 923,               /* "END-START"  */
    END_STRING = 924,              /* "END-STRING"  */
    END_SUBTRACT = 925,            /* "END-SUBTRACT"  */
    END_UNSTRING = 926,            /* "END-UNSTRING"  */
    END_WRITE = 927,               /* "END-WRITE"  */
    END_IF = 928,                  /* "END-IF"  */
    THRU = 929,                    /* THRU  */
    OR = 930,                      /* OR  */
    AND = 931,                     /* AND  */
    NOT = 932,                     /* NOT  */
    NE = 933,                      /* NE  */
    LE = 934,                      /* LE  */
    GE = 935,                      /* GE  */
    POW = 936,                     /* POW  */
    NEG = 937                      /* NEG  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 831 "parse.y"

    bool boolean;
    int number;
    char *string;
    REAL_VALUE_TYPE float128;
    literal_t literal;
    cbl_field_attr_t field_attr;
    ec_type_t ec_type;
    ec_list_t* ec_list;
           declarative_list_t* dcl_list_t;
           isym_list_t* isym_list;
    struct { radix_t radix; char *string; } numstr;
    struct { int token; literal_t name; } prog_end;
    struct { int token; special_name_t id; } special_type;
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
    struct cbl_field_data_t *field_data;
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
    struct ast_inspect_t *insp_one;
    struct ast_inspect_list_t *insp_all;
    struct ast_inspect_oper_t *insp_oper;
    struct { bool before; cbl_inspect_qual_t *qual; } insp_qual;
           cbl_inspect_t *inspect;
           cbl_inspect_match_t *insp_match;
           cbl_inspect_replace_t *insp_replace;

    struct { cbl_refer_t *delimited; refer_list_t *inputs; } delimited;
    struct { cbl_refer_t *input, *delimiter; } delimited_1;
    struct { cbl_refer_t *from, *len; } refmod_parts;
    struct refer_collection_t *delimiteds;
    struct { cbl_label_t *on_error, *not_error; } error;
    struct { unsigned int nclause; bool tf; } error_clauses;
    struct refer_pair_t { cbl_refer_t *first, *second; } refer2;
    struct { refer_collection_t *inputs; refer_pair_t into; } str_body;

    struct { accept_func_t func; cbl_refer_t *into, *from; } accept_func;
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
    struct cbl_domain_t *false_domain;
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

    cbl_options_t::arith_t opt_arith;
    cbl_round_t opt_round;
    cbl_section_type_t opt_init_sect;
    struct { bool local, working; } opt_init_sects;
    module_type_t module_type;

#line 1101 "parse.h"

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

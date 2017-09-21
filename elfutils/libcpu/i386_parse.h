/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

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
#line 217 "i386_parse.y" /* yacc.c:1909  */

  unsigned long int num;
  char *str;
  char ch;
  struct known_bitfield *field;
  struct bitvalue *bit;
  struct argname *name;
  struct argument *arg;

#line 88 "i386_parse.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE i386_lval;

int i386_parse (void);

#endif /* !YY_I386_I_PARSE_H_INCLUDED  */

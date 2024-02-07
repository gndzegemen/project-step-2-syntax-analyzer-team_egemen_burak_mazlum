/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
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
    PRINT = 258,
    DOUBLE = 259,
    INT = 260,
    IF = 261,
    ELSE = 262,
    FOR = 263,
    WHILE = 264,
    BOOLEAN = 265,
    TRUE = 266,
    FALSE = 267,
    RETURN = 268,
    VOID = 269,
    STRING = 270,
    LIST = 271,
    EXIT = 272,
    FUNCTION = 273,
    AND = 274,
    OR = 275,
    BREAK = 276,
    NE = 277,
    ISEQ = 278,
    GE = 279,
    LE = 280,
    G = 281,
    L = 282,
    EQ = 283,
    N = 284,
    INC = 285,
    DEC = 286,
    DOUBLEVALUE = 287,
    IDENTIFIER = 288,
    STRINGVALUE = 289,
    INTEGERVALUE = 290
  };
#endif
/* Tokens.  */
#define PRINT 258
#define DOUBLE 259
#define INT 260
#define IF 261
#define ELSE 262
#define FOR 263
#define WHILE 264
#define BOOLEAN 265
#define TRUE 266
#define FALSE 267
#define RETURN 268
#define VOID 269
#define STRING 270
#define LIST 271
#define EXIT 272
#define FUNCTION 273
#define AND 274
#define OR 275
#define BREAK 276
#define NE 277
#define ISEQ 278
#define GE 279
#define LE 280
#define G 281
#define L 282
#define EQ 283
#define N 284
#define INC 285
#define DEC 286
#define DOUBLEVALUE 287
#define IDENTIFIER 288
#define STRINGVALUE 289
#define INTEGERVALUE 290

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 18 "col.y"
int num; char id; double dble; char* pr;

#line 130 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */

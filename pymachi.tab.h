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

#ifndef YY_YY_PYMACHI_TAB_H_INCLUDED
# define YY_YY_PYMACHI_TAB_H_INCLUDED
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
    DECIMAL = 259,
    STRING = 260,
    ASSIGNMENTOP = 261,
    EOL = 262,
    OBRACEOP = 263,
    CBRACEOP = 264,
    COLONOP = 265,
    PLUSOP = 266,
    MINUSOP = 267,
    MULTOP = 268,
    DIVOP = 269,
    POWOP = 270,
    DOUBLEEQOP = 271,
    LESSTHANOP = 272,
    GREATERTHANOP = 273,
    LESSTHANOREQOP = 274,
    GREATERTHANOREQOP = 275,
    IFTOK = 276,
    ELIFTOK = 277,
    ELSETOK = 278,
    COMMENTOP = 279,
    WHILETOK = 280,
    DEFTOK = 281,
    IDENTIFIER = 282,
    INDENTTOK = 283,
    COMMAOP = 284,
    OUTDENTOP = 285,
    RANGETOK = 286,
    CLASSTOK = 287,
    SELFTOK = 288,
    INPUTTOK = 289,
    PRINTTOK = 290,
    IOFORMATTOK = 291,
    LISTTOK = 292,
    SETTOK = 293,
    TUPLETOK = 294,
    INTTOK = 295,
    FLOATTOK = 296,
    FROMTOK = 297,
    FORTOK = 298,
    IMPORTTOK = 299,
    TRYTOK = 300,
    EXCEPTIONTOK = 301,
    EXITTOK = 302,
    DOTOP = 303,
    OSQBRACEOP = 304,
    CSQBRACEOP = 305,
    LOGICANDOP = 306,
    LOGICOROP = 307,
    LOGICNOTOP = 308,
    LOGICNANDOP = 309,
    LOGICNOROP = 310,
    LOGICXOROP = 311,
    INTOK = 312,
    TRUEOP = 313,
    FALSEOP = 314
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 12 "pymachi.y" /* yacc.c:1909  */

	int ival;
	float fval;
	char *sval;

#line 120 "pymachi.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PYMACHI_TAB_H_INCLUDED  */

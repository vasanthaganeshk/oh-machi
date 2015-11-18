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

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
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
    IDENTIFIER = 261,
    INDENTTOK = 262,
    IF = 263,
    PASS = 264,
    COLON = 265,
    OBRACE = 266,
    EBRACE = 267,
    RANGE = 268,
    COMMA = 269,
    DEF = 270,
    ASSIGNMENT = 271,
    LAMBDA = 272,
    OR = 273,
    AND = 274,
    NOT = 275,
    IN = 276,
    NOTIN = 277,
    IS = 278,
    ISNOT = 279,
    LESSTHAN = 280,
    GREATERTHAN = 281,
    DOUBLEEQUAL = 282,
    NOTEQUAL = 283,
    LESSTHOREQ = 284,
    GREATTHOREQ = 285,
    BITWISEOR = 286,
    BITWISEXOR = 287,
    BITWISEAND = 288,
    LEFTSHIFT = 289,
    RIGHTSHIFT = 290,
    PLUS = 291,
    MINUS = 292,
    STAR = 293,
    DIVISION = 294,
    FLOOR = 295,
    REMAINDER = 296,
    POWER = 297,
    BITWISEINV = 298
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 32 "parser.y" /* yacc.c:1909  */

	int ival;
	float fval;
	char *sval;

#line 104 "parser.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */

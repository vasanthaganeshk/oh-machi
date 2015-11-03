%{
    #include <bits/stdc++.h>
    using namespace std;
    #include "parser.tab.h"
    extern "C" int yylex();
    int line_no = 1;
%}

%%
		/*--------newline, spaces, intendation --------*/
[\n][    ]+			 		   		{	++line_no; return INDENTTOK;}
\n 									{	++line_no;}
[-]?[0-9]+\.[0-9]+  				{   yylval.fval = atof(yytext); return DECIMAL;}
[-]?[0-9]+          				{   yylval.ival = atoi(yytext); return INT;}

		/*--------Block stmt--------*/
pass 								return PASS;

		/*--------if-elif-else--------*/
if 									return IF;

		/*--------Operators--------*/
\( 									return OBRACE;
\)									return EBRACE;
or 									return OR;
and 								return AND;
not 								return NOT;
in 									return IN;
not[ ]in 							return NOTIN;
is 									return IS;
is[ ]not 							return ISNOT;
lambda 								return LAMBDA;
\~									return BITWISEINV;
\&									return BITWISEAND;
\^									return BITWISEXOR;
\|									return BITWISEOR;
:									return COLON;
\*\*								return POWER;
\*									return STAR;
\/\/								return FLOOR;
\/									return DIVISION;
\%									return REMAINDER;
\+									return PLUS;
-									return MINUS;
\<									return LESSTHAN;
\>									return GREATERTHAN;
\<\<								return LEFTSHIFT;
\>\>								return RIGHTSHIFT;
==									return DOUBLEEQUAL;
!=									return NOTEQUAL;
\<=									return LESSTHOREQ;
\>=									return GREATTHOREQ;
=									return ASSIGNMENT;

		/*--------Iterables--------*/
range								return RANGE;

		/*--------Comment--------*/
[#][_a-zA-z0-9 ]*					;
[ ]									;
\"[_a-zA-z0-9 ]*\"			        {   yylval.sval = yytext; return STRING;}
\'[_a-zA-z0-9 ]*\'				    {   yylval.sval = yytext; return STRING;}
[_a-zA-Z]?[_a-zA-z0-9]*             {   yylval.sval = yytext; return IDENTIFIER;}
%%
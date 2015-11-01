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
[ ]									;

[-]?[0-9]+\.[0-9]+  				{   yylval.fval = atof(yytext); return DECIMAL;}
[-]?[0-9]+          				{   yylval.ival = atoi(yytext); return INT;}

		/*--------if-elif-else--------*/
if 									return IF;

		/*--------Operators--------*/
\( 									return OBRACE;
\)									return EBRACE;
:									return COLON;
\*\*								return POWER;
\*									return STAR;
\/									return DIVISION;
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

		/*--------Comment--------*/
[#][_a-zA-z0-9 ]*					;

\"[_a-zA-z0-9 ]*\"			        {   yylval.sval = yytext; return STRING;}
\'[_a-zA-z0-9 ]*\'				    {   yylval.sval = yytext; return STRING;}
[_a-zA-Z]?[_a-zA-z0-9]*             {   yylval.sval = yytext; return IDENTIFIER;}

.									;
%%
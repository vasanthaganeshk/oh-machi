%{
    #include <bits/stdc++.h>
    using namespace std;
    #include "parser.tab.h"
    extern "C" int yylex();
    int line_no = 1;
%}

%%
		/*--------newline, spaces, intendation --------*/
[\n][    ]+ 	            		{	++line_no; return INDENTTOK;}
\n 									{	++line_no;}
[ ]									;

		/*--------if-elif-else--------*/
if 									return IFTOK;
elif								return ELIFTOK;
else								return ELSETOK;

		/*--------Loops--------*/
while								return WHILETOK;

		/*--------Operators--------*/
\+									return PLUSOP;
=									return ASSIGNMENTOP;
:									return COLONOP;

		/*--------Comment--------*/
[#][_a-zA-z0-9 ]*					;


[0-9]+\.[0-9]+  					{   yylval.fval = atof(yytext); return DECIMAL;}
[0-9]+          					{   yylval.ival = atoi(yytext); return INT;}
\"[_a-zA-z0-9 ]*\"			        {   yylval.sval = yytext; return STRING;}
\'[_a-zA-z0-9 ]*\'				    {   yylval.sval = yytext; return STRING;}
[_a-zA-Z]?[_a-zA-z0-9]*             {   yylval.sval = yytext; return IDENTIFIER;}
.									;
%%
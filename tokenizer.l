%{
    #include <bits/stdc++.h>
    using namespace std;
    #include "pymachi.tab.h"
    extern "C" int yylex();
    int line_no = 1;
%}

%%
		/*--------newline, spaces, intendation --------*/
\n 	            					{	++line_no; return EOL;}
[ ]+            					;
\t 									return INDENTTOK;


		/*--------function--------*/
def 								return DEFTOK;

		/*--------class*--------*/
class 								return CLASSTOK;
self								return SELFTOK;


		/*--------if-elif-else--------*/
if 									return IFTOK;
elif								return ELIFTOK;
else								return ELSETOK;


		/*--------Input and output--------*/
input								return INPUTTOK;
print 								return PRINTTOK;
format								return IOFORMATTOK;


		/*--------Type conversions--------*/
list								return LISTTOK;
set									return SETTOK;
tuple								return TUPLETOK;
float 								return FLOATTOK;
int 								return INTTOK;


		/*--------Loops--------*/
for 								return FORTOK;
while								return WHILETOK;


		/*--------Import--------*/
from 								return FROMTOK;
Import								return IMPORTTOK;

		/*--------Error handling--------*/
try 								return TRYTOK;
exception							return EXCEPTIONTOK;
exit 								return EXITTOK;


		/*--------Operators--------*/
\+									return PLUSOP;
\-									return MINUSOP;
\.									return DOTOP;
\[									return OSQBRACEOP;
\]									return CSQBRACEOP;
\(									return OBRACEOP;
\)									return CBRACEOP;
\*									return MULTOP;
\**									return POWOP;
\#									return COMMENTOP;
\=									return ASSIGNMENTOP;
\==									return DOUBLEEQOP;
\/									return DIVOP;
\<									return LESSTHANOP;
\<=									return LESSTHANOREQOP;
\>=									return GREATERTHANOREQOP;
\>									return GREATERTHANOP;
\:									return COLONOP;


		/*--------Logical operators--------*/
and									return LOGICANDOP;
or 									return LOGICOROP;
not									return LOGICNOTOP;
nand								return LOGICNANDOP;
nor									return LOGICNOROP;
xor									return LOGICXOROP;
in 									return INTOK;
True								return TRUEOP;
False								return FALSEOP;


		/**/
range								return RANGETOK;


[0-9]+\.[0-9]+  					{   yylval.fval = atof(yytext); return DECIMAL;}
[0-9]+          					{   yylval.ival = atoi(yytext); return INT;}
\"[_a-zA-z0-9 ]*\"			        {   yylval.sval = yytext; return STRING;}
\'[_a-zA-z0-9 ]*\'				    {   yylval.sval = yytext; return STRING;}
[_a-zA-Z}?[_a-zA-z0-9]*             {   yylval.sval = yytext; return IDENTIFIER;}
%%
%{
    #include <bits/stdc++.h>
    using namespace std;
    #define YY_DECL extern "C" int yylex()
    #include "ohmachi.tab.h"
%}

%%
\n 	            					;
[ ]+            					;
[0-9]+\.[0-9]+  					{   yylval.fval = atof(yytext); return FLOAT;}
[0-9]+          					{   yylval.ival = atoi(yytext); return INT;}
['][a-zA-Z0-9 ]+[']                 {   yylval.sval = yytext; return STRING;}
["][a-zA-Z0-9 ]+["]                 {   yylval.sval = yytext; return STRING;}
[a-zA-Z0-9]+                        {   yylval.nval = yytext; return NSTRING;}
[a-zA-Z0-9]+[-][a-zA-Z0-9]+         {   yylval.nval = yytext; return NSTRING;}
%%
%{
	#include <bits/stdc++.h>
	using namespace std;
	extern "C" int yylex();
	extern "C" int yyparse();
	extern "C" FILE *yyin;

	void yyerror(char const *s);
%}

%union {
	int ival;
	float fval;
	char *sval;
}

%token <ival> INT
%token <fval> FLOAT
%token <sval> STRING
%token <sval> IDENTTIFIER

%%
lines: /* empty */
	| lines line EOL
	;

line:
	assignment EOL
	| block COLONOP EOL
	| COMMENTOP STRING EOL
	;

assignment:
	TOK ASSIGNMENTOP expression

expression:
	TOK
	| expression
	| OBRACEOP expression CBRACEOP
	| expression PLUSOP expression
	| expression MINUSOP expression
	| expression MULTOP expression
	| expression DIVOP expression
	| expression POWOP expression
	| expression DOUBLEEQOP expression
	| expression LESSTHANOP expression
	| expression GREATERTHANOP expression
	| expression GREATERTHANOREQOP expression
	| expression LESSTHANOREQOP expression
	;

block:
	IFTOK expression
	| ELIFTOK expression
	| ELSETOK 
	| DEFTOK IDENTTIFIER OBRACEOP parameters CBRACEOP
	| WHILETOK expression
	;
%%

int main(int argc, char *argv[])
{
	FILE *myfile = fopen(argv[1], "r");
	if(!myfile){
		cout<< "Error in opening the file";
		return 1;
	}
	yyin = myfile;

	do{
		yyparse();

	}while(!feof(yyin));
	return 0;
}

void yyerror(char const *s){
	cout<< "Py-machi parse error!" << endl << "Message: " << s << endl;
	exit(1);
}

int yywrap(void)
{
    return 0;
}

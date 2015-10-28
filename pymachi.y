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
%token <fval> DECIMAL
%token <sval> STRING

%token ASSIGNMENTOP
%token EOL
%token OBRACEOP
%token CBRACEOP
%token COLONOP
%token PLUSOP
%token MINUSOP
%token MULTOP
%token DIVOP
%token POWOP
%token DOUBLEEQOP
%token LESSTHANOP
%token GREATERTHANOP
%token LESSTHANOREQOP
%token GREATERTHANOREQOP
%token IFTOK
%token ELIFTOK
%token ELSETOK
%token COMMENTOP
%token WHILETOK
%token DEFTOK
%token IDENTIFIER
%token INDENTTOK
%token COMMAOP
%token OUTDENTOP


%%
lines: /* empty */
	| lines line EOL
	;

line:
	COMMENTOP STRING EOL
	| EOL
	| assignment EOL
	| block COLONOP EOL INDENTTOK lines OUTDENTOP
	;

assignment:
	IDENTIFIER ASSIGNMENTOP expression
	;

block:
	IFTOK expression
	| ELIFTOK expression
	| ELSETOK 
	| DEFTOK IDENTIFIER OBRACEOP parameters CBRACEOP
	| WHILETOK expression
	;

expression:
	IDENTIFIER
	| INT
	| DECIMAL
	| STRING
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

parameters:
	IDENTIFIER
	| IDENTIFIER COMMAOP
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

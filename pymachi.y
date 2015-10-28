%{
	#include <bits/stdc++.h>
	using namespace std;
	extern "C" int yylex();
	extern "C" int yyparse();
	extern "C" FILE *yyin;
	extern int line_no;

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
%token RANGETOK
%token CLASSTOK
%token SELFTOK
%token INPUTTOK
%token PRINTTOK
%token IOFORMATTOK
%token LISTTOK
%token SETTOK
%token TUPLETOK
%token INTTOK
%token FLOATTOK
%token FROMTOK
%token FORTOK
%token IMPORTTOK
%token TRYTOK
%token EXCEPTIONTOK
%token EXITTOK
%token DOTOP
%token OSQBRACEOP
%token CSQBRACEOP
%token LOGICANDOP
%token LOGICOROP
%token LOGICNOTOP
%token LOGICNANDOP
%token LOGICNOROP
%token LOGICXOROP
%token INTOK
%token TRUEOP
%token FALSEOP


%%
lines:
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
	| TRUEOP
	| FALSEOP
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
	printf("\033[1;31mError in line %d \033[0m\n", line_no);
	cout<< "Message: " << s << endl;
	exit(1);
}

int yywrap(void)
{
    return 0;
}

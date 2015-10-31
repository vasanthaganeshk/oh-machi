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
%token IDENTIFIER

%token INDENTTOK;
%token OUTDENTOP;
%token IFTOK;
%token ELIFTOK;
%token ELSETOK;
%token WHILETOK;
%token PLUSOP;
%token COMMENTOP;
%token COLONOP;
%token ASSIGNMENTOP;

%%
template:
	typelines
	;

typelines:
	typelines typeline
	| typeline
	;

typeline:
	assignment
	| block COLONOP blockstmt
	;

assignment:
	IDENTIFIER ASSIGNMENTOP expression
	;

block:
	IFTOK expression
	;

blockstmt:
	blockstmt INDENTTOK typeline
	| INDENTTOK typeline
	;

expression:
	expression PLUSOP expression
	| IDENTIFIER
	| INT
	| STRING
	| DECIMAL
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
	cout<< "Message: " << s << endl;
	printf("\033[1;31mError in line %d \033[0m\n", line_no);
	exit(1);
}

int yywrap(void)
{
    return 0;
}

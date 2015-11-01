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

%token INDENTTOK
%token IF
%token COLON
%token OBRACE
%token EBRACE
%right ASSIGNMENT
%left LESSTHAN GREATERTHAN DOUBLEEQUAL NOTEQUAL LESSTHOREQ GREATTHOREQ 
%left LEFTSHIFT RIGHTSHIFT
%left PLUS MINUS
%left STAR DIVISION
%right POWER

%%
template:
	typelines
	;

typelines:
	typelines typeline
	| typeline
	;

typeline:
	expression
	| block COLON blockstmt
	;

block:
	IF expression
	;

blockstmt:
	blockstmt INDENTTOK typeline
	| INDENTTOK typeline
	;

expression:
	IDENTIFIER ASSIGNMENT expression
	| OBRACE expression EBRACE
	| expression POWER expression
	| expression STAR expression
	| expression DIVISION expression
	| expression PLUS expression
	| expression MINUS expression
	| expression LEFTSHIFT expression
	| expression RIGHTSHIFT expression
	| expression LESSTHAN expression
	| expression GREATERTHAN expression
	| expression DOUBLEEQUAL expression
	| expression NOTEQUAL expression
	| expression LESSTHOREQ expression
	| expression GREATTHOREQ expression
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

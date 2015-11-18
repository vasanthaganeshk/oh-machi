/*
Yacc parser for Pymirchi. 
Copyright (C) 2015 Vasantha Ganesh K <vasanthaganesh.k@tuta.io>.

This file is part of Pymirchi.

Pymirchi is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Pymirchi is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Pymirchi.  If not, see <http://www.gnu.org/licenses/>.
*/

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
%token PASS
%token COLON
%token OBRACE
%token EBRACE
%token RANGE
%token COMMA
%token DEF

%right ASSIGNMENT
%left LAMBDA
%left OR
%left AND
%left NOT
%left IN NOTIN IS ISNOT LESSTHAN GREATERTHAN DOUBLEEQUAL NOTEQUAL LESSTHOREQ GREATTHOREQ
%left BITWISEOR
%left BITWISEXOR
%left BITWISEAND
%left LEFTSHIFT RIGHTSHIFT
%left PLUS MINUS
%left STAR DIVISION FLOOR REMAINDER
%right POWER
%left BITWISEINV
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
	| PASS
	;


block:
	IF expression
	| DEF IDENTIFIER OBRACE argsdefinition EBRACE
	;


argsdefinition:
	argsdefinition COMMA IDENTIFIER
	| IDENTIFIER
	|
	;


argscall:
	argscall COMMA expression
	| expression
	|
	;


blockstmt:
	blockstmt INDENTTOK typeline
	| INDENTTOK typeline
	;


expression:
	IDENTIFIER ASSIGNMENT expression
	| OBRACE expression EBRACE
	| BITWISEINV expression
	| expression POWER expression
	| expression STAR expression
	| expression DIVISION expression
	| expression FLOOR expression
	| expression REMAINDER expression
	| expression PLUS expression
	| expression MINUS expression
	| expression LEFTSHIFT expression
	| expression RIGHTSHIFT expression
	| expression BITWISEAND expression
	| expression BITWISEXOR expression
	| expression BITWISEOR expression
	| expression IN iterable
	| expression NOTIN iterable
	| expression IS expression
	| expression ISNOT expression
	| expression LESSTHAN expression
	| expression GREATERTHAN expression
	| expression DOUBLEEQUAL expression
	| expression NOTEQUAL expression
	| expression LESSTHOREQ expression
	| expression GREATTHOREQ expression
	| NOT expression
	| expression AND expression
	| expression OR expression
	| IDENTIFIER
	| INT
	| STRING
	| DECIMAL
	| IDENTIFIER OBRACE argscall EBRACE
	;

		/*---------Iterables---------*/
iterable:
	IDENTIFIER
	| RANGE OBRACE expression EBRACE
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

class RePrint{
	public:
		RePrint(){			
		}
		~RePrint(){			
		}
		void reprint(char a, int n){
			for(int i = 0; i<n; ++i){
				cout<<a;
			}
		}
};

class NumDigits{
	public:
		NumDigits(){
		}
		~NumDigits(){
		}
		int num_digits(int x)  
		{  
		    x = abs(x);  
		    return (x < 10 ? 1 :   
		    	(x < 100 ? 2 :   
		    	(x < 1000 ? 3 :   
		    	(x < 10000 ? 4 :   
		    	(x < 100000 ? 5 :   
		    	(x < 1000000 ? 6 :   
		    	(x < 10000000 ? 7 :  
		    	(x < 100000000 ? 8 :  
		    	(x < 1000000000 ? 9 :  
		    	10)))))))));  
		}
};

class pretty_print: public RePrint, public NumDigits{
	public:
		pretty_print(){
		}
		~pretty_print(){			
		}
};


// wild hack for pretty printing
void yyerror(char const *s){
	pretty_print e1;

	cout<<"+";
	e1.RePrint::reprint('-', 78);
	cout<<"+"<<endl;
	cout<<"|  "<< "Message: " << s;
	e1.RePrint::reprint(' ', 80 -13-strlen(s));
	cout<<"|"<<endl;
	cout<<"|  ";
	e1.RePrint::reprint('=', strlen(s)+9);
	e1.RePrint::reprint(' ', 80 -13-strlen(s));
	cout<<"|";
	cout<<endl;
	cout<<"|  ";
	printf("\033[1;31mError in line %d \033[0m", line_no);
	e1.RePrint::reprint(' ', 61- e1.NumDigits::num_digits(line_no) );
	cout<<"|";
	cout<<endl;
	cout<<"+";
	e1.RePrint::reprint('-', 78);
	cout<<"+"<<endl;
	exit(1);
}

int yywrap(void)
{
    return 0;
}

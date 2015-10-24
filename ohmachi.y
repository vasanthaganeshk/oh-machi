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
	char *nval;
}

%token <ival> INT;
%token <fval> FLOAT
%token <sval> STRING
%token <nval> NSTRING

%%
snazzle:
		INT snazzle		 	{cout<<"bison found an int"<< $1 <<endl;}
		| FLOAT snazzle		{cout<<"bison found a float"<< $1 <<endl;}
		| STRING snazzle	{cout<<"bison found a string"<< $1 <<endl;}
		| INT 				{cout<<"bison found an int"<< $1 <<endl;}
		| FLOAT 			{cout<<"bison found a float"<< $1 <<endl;}
		| STRING 			{cout<<"bison found a string"<< $1 <<endl;}
		| NSTRING			{cout<<"bison found a string"<<$1<<endl;}
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
	//myfile.close();
	return 0;
}

void yyerror(char const *s){
	cout<< "Oh-Machi parse error!"<<endl<<"Message: "<<endl;
	exit(1);
}

int yywrap(void)
{
    return 0;
}

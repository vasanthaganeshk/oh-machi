%{
    #include <iostream>
    using namespace std;
    #define YY_DECL extern "C" int yylex()
%}

%%
[\n]            ;
[ ]+            ;
[0-9]+\.[0-9]+  {   cout<<"found a decimal: "<<yytext<<endl;}
[0-9]+          {   cout<<"found an integer: "<<yytext<<endl;}

['][a-zA-Z0-9 ]+[']                 {   cout<<"found a string: "<<yytext<<endl;}
["][a-zA-Z0-9 ]+["]                 {   cout<<"found a string: "<<yytext<<endl;}
[a-zA-Z0-9]+                        {   cout<<"found a token: "<<yytext<<endl;}
[a-zA-Z0-9]+[-][a-zA-Z0-9]+         {   cout<<"found a token: "<<yytext<<endl;}
%%

int main(int argn, char *argc[]){
	FILE *myfile = fopen(argc[1], "r");
	if(!myfile){
		cout<<"Opening file failed!"<<endl;
		return 1;
	}
	yyin = myfile;
    yylex();
    return 0;
}

int yywrap(void)
{
    return 0;
}

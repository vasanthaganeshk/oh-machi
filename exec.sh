bison -d parser.y
flex tokenizer.l
g++ lex.yy.c parser.tab.c -std=c++14 -lfl -o pymachi

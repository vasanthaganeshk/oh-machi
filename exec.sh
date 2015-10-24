bison -d ohmachi.y
flex translator1.l
g++ lex.yy.c ohmachi.tab.c -std=c++14 -lfl -o snaz

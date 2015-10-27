bison -d pymachi.y
flex translator1.l
g++ lex.yy.c pymachi.tab.c -std=c++14 -lfl -o pymachi_comp

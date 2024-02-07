col : col.l col.y
		yacc -d col.y
		lex col.l
		gcc lex.yy.c y.tab.c -o col 

run : 	col 
			./col <config.imp

clear :
			rm -f y.tab.c y.tab.h lex.yy.c col 

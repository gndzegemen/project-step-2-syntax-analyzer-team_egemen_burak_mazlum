#!/bin/bash
echo "Compiling"
yacc -d col.y
lex col.l
gcc -g lex.yy.c y.tab.c -o col




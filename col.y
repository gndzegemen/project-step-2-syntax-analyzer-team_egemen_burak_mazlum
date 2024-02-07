%{
void yyerror (char *s);
int yylex();
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
int symbols[52];
int symbolVal(char symbol);
void updateSymbolVal(char symbol, int val);
int val_1 = 0;
int ifval = 1;
int whileval = 1;
int funcval = 0;

%}


%union {int num; char id; double dble; char* pr;}         /* Yacc definitions */

%start program 

%token PRINT DOUBLE INT IF ELSE FOR WHILE BOOLEAN TRUE FALSE RETURN VOID STRING LIST EXIT FUNCTION  AND OR BREAK
%token NE ISEQ GE LE G L EQ N INC DEC
%token <dble> DOUBLEVALUE 
%token <id> IDENTIFIER 
%token <pr> STRINGVALUE 
%token <num> INTEGERVALUE 

%type <num> program stmts stmt exp term 
%type <num> printStmt exitStmt assignmentStmt
%type <num> ifHeader ifElseStatement ifStatement elseStatement 
%type <num>	whileHeader whileBody whileStatements whilests 
%type <num> logicalExpressions arithmeticExpression bool sts elseBody ifBody
%type <num> inDecStatements DEC INC
%type <id> assignment
	
%%

/* descriptions of expected inputs     corresponding actions (in C) */

program : stmts			{;}
		| stmts	program {;}
		;

stmts	: stmt		{;}
		| stmt stmts 	{;}
		;

stmt	: printStmt	
		| exitStmt	
		| assignmentStmt
		| ifElseStatement
		| whileStatements
		| inDecStatements
		| logicalExpressions
		|arithmeticExpression
		;

inDecStatements	:	IDENTIFIER	INC ';'	{updateSymbolVal($2,symbolVal($2)+1);}
				|	IDENTIFIER	DEC ';' {updateSymbolVal($2,symbolVal($2)-1);}
				;
ifElseStatement	:	ifStatement{;}
				| 	ifStatement elseStatement{;}
      			;

ifStatement	:	ifHeader '{' ifBody '}' {if(ifval==1)$$=val_1;	}
			;

ifHeader	:	IF '(' logicalExpressions ')' {ifval=$3;		}
			|	IF  '(' IDENTIFIER ')' {ifval=symbolVal($3);	}
			;

ifBody		:	sts{;}
			|	ifsts {;}
			|	ifBody sts{;}
			|	ifBody ifsts{;}
			;
ifsts		:	IDENTIFIER '=' sts	{if(ifval==1)updateSymbolVal($1,val_1);}
			|	PRINT sts 	{if(ifval==1)printf("%d\n",val_1);}
			|	ifElseStatement{;}
			|	whileStatements{;}
			|	inDecStatements{;}
			|	funcStatements{;}
			;


elseStatement:ELSE '{' elseBody'}' {if(ifval==0)$$=val_1;			};

elseBody	:	IDENTIFIER '=' sts	{if(ifval==0)updateSymbolVal($1,val_1);}
			|	PRINT sts 	{if(ifval==0)printf("%d\n",val_1);}
			|	ifElseStatement{;}
			|	whileStatements{;}
			|	inDecStatements{;}
			|	funcStatements{;}
			;

whileStatements	:	whileHeader '{' whileBody '}' {while(whileval==1)$$=val_1;}	
				;


whileHeader	:	WHILE '(' logicalExpressions ')' {whileval=$3;}
			|	WHILE	'(' IDENTIFIER	')'		 {whileval=symbolVal($3);}
			;

whileBody	:	sts			{;}
			|	whileBody sts	{;}	
			|	whileBody whilests {;}
			;



whilests	: IDENTIFIER '='	sts  {while(whileval == 1){updateSymbolVal($1,val_1);}}
			| PRINT sts 			 {while(whileval == 1)printf("Printing %d\n",val_1);}
			| ifElseStatement			{;}
			| whileStatements			{;}
			| inDecStatements			{;}
			| funcStatements			{;}
			| BREAK	';'					{whileval=0;} 		
		;
		


funcStatements:;

sts:{;};


logicalExpressions	: logicalExpressions OR bool			{$$ = $1 && $3;}
       				| logicalExpressions AND bool			{$$ = $1 || $3;}  
					| arithmeticExpression G arithmeticExpression		{$$ = $1 > $3 ? 1 : 0;}    	
       				| arithmeticExpression L arithmeticExpression		{$$ = $1 < $3 ? 1 : 0;}
       				| arithmeticExpression GE arithmeticExpression		{$$ = $1 >= $3 ? 1 : 0;}
       				| arithmeticExpression LE arithmeticExpression		{$$ = $1 <= $3 ? 1 : 0;}
       				| logicalExpressions EQ bool			{$$ = $1 == $3 ? 1 : 0;}
       				| logicalExpressions NE bool			{$$ = $1 != $3 ? 1 : 0;}
       				| arithmeticExpression EQ term			{$$ = $1 == $3 ? 1 : 0;}
       				| arithmeticExpression NE term			{$$ = $1 != $3 ? 1 : 0;}
       				| N bool					{$$ = !$2;} 
       				| bool                			{$$ = $1;}
       ; 


arithmeticExpression	:	arithmeticExpression '+' term {$$=$1+$3;}
						|	arithmeticExpression '-' term {$$=$1-$3;}
						|	arithmeticExpression '*' term {$$=$1*$3;}
						|	arithmeticExpression '/' term {$$=$1/$3;}
						|	arithmeticExpression '*' term {$$=$1%$3;}
						|	term {$$=$1;}
;

bool	: TRUE			{$$ = 1;}
		| FALSE			{$$ = 0;}
        ;

sts		: term '+' term ';' 		{val_1 = $1 + $3;}
		| term '-' term ';' 		{val_1 = $1 - $3;}
		| term '*' term ';' 	{val_1 = $1 * $3;} 
		| term '/' term ';' 	{val_1 = $1 / $3;}
		| term '%' term ';' 		{val_1 = $1 % $3;}
		| bool AND bool ';' 	{val_1 = $1 && $3;}
		| bool OR bool ';' 	{val_1 = $1 || $3;}
		| term G term ';' 		{val_1 = $1 > $3 ? 1 : 0;}
		| term L term ';' 		{val_1 = $1 < $3 ? 1 : 0;}	
		| term GE term ';' 		{val_1 = $1 >= $3 ? 1 : 0;}	
		| term LE term ';' 		{val_1 = $1 <= $3 ? 1 : 0;}
		| term EQ term ';' 		{val_1 = $1 == $3 ? 1 : 0;}
		| term NE term ';' 		{val_1 = $1 != $3 ? 1 : 0;}
		| bool EQ bool ';' 	{val_1 = $1 == $3 ? 1 : 0;}
		| bool NE bool ';' 	{val_1 = $1 != $3 ? 1 : 0;}
		| INC IDENTIFIER ';'		{val_1 = symbolVal($2) + 1;}
		| DEC IDENTIFIER ';' 		{val_1 = symbolVal($2) - 1;}
		| N bool ';' 		{val_1 = !$2;}
		| bool ';' 			{val_1 = $1;}
		| term ';' 			{val_1 = $1;}
	;     





assignmentStmt	:	assignment ';'		
				;

printStmt	:	 PRINT exp	';'		{printf("%d\n", $2);}
			| 	 printStmt PRINT exp ';' {printf("%d\n", $3);}

exitStmt	:	EXIT	';'		{exit(EXIT_SUCCESS);} 	       
			;

assignment :  IDENTIFIER '=' exp  { updateSymbolVal($1,$3); }
			; 

exp    	: term                  {$$ = $1;}
       	| exp '+' term          {$$ = $1 + $3;}
       	| exp '-' term          {$$ = $1 - $3;}
       	| exp '*' term          {$$ = $1 * $3;}
       	| exp '/' term          {$$ = $1 / $3;}
       	| exp '%' term          {$$ = $1 % $3;}
       	; 

term   	:  INTEGERVALUE                {$$ = $1;}
		|  IDENTIFIER			{$$ = symbolVal($1);} 
        ;

%%                     /* C code */

int computeSymbolIndex(char token)
{
	int idx = -1;
	if(islower(token)) {
		idx = token - 'a' + 26;
	} else if(isupper(token)) {
		idx = token - 'A';
	}
	return idx;
} 

/* returns the value of a given symbol */
int symbolVal(char symbol)
{
	int bucket = computeSymbolIndex(symbol);
	return symbols[bucket];
}

/* updates the value of a given symbol */
void updateSymbolVal(char symbol, int val)
{
	int bucket = computeSymbolIndex(symbol);
	symbols[bucket] = val;
}

int main (void) {
	/* init symbol table */
	int i;
	for(i=0; i<52; i++) {
		symbols[i] = 0;
	}

	return yyparse ( );
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 


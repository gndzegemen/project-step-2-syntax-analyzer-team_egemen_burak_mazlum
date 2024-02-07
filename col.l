%{

#include "y.tab.h"
void yyerror (char *s);
int yylex();
%}

%%
"double"                {return DOUBLE;}
"int"					{return INT;}
"if"					{return IF;}
"else"					{return ELSE;}
"for"					{return FOR;}
"while"					{return WHILE;}
"print"					{return PRINT;}
"boolean" 				{return BOOLEAN;}
"true"					{return TRUE;}
"false"			 		{return FALSE;}
"function"			 	{return FUNCTION;}
"return"			 	{return RETURN;}
"void"			 	    {return VOID;}
"string"			 	{return STRING;}
"list"                  {return LIST;}
"exit"                  {return EXIT;}


"++"         {return INC;}
"--"         {return DEC;}
">="         {return GE;}
"<="         {return LE;}
"<"          {return L;}
">"          {return G;}
"!="         {return NE;}
"!"          {return N;}
"=="         {return ISEQ;}

\&						{return AND;}
\|\|					{return OR;}

[a-zA-Z]			    {yylval.id = yytext[0]; return IDENTIFIER;}

[-]?[0-9]+              {yylval.num = atoi(yytext); return INTEGERVALUE;}
[-]?[0-9]*\.[0-9]+      {yylval.num = atoi(yytext); return DOUBLEVALUE;}

\".*\"                  {yylval.pr = strdup(yytext); return STRINGVALUE ;}


[ \t]                   ;
"\n"                    {yylineno++;}
"\t\n"                  {yylineno++;}
"\r\n"                  {yylineno++;}

[%-+/*;(){}=]           {return yytext[0];}

.                      {ECHO; yyerror ("unexpected character");}

%%

int yywrap (void) {return 1;}
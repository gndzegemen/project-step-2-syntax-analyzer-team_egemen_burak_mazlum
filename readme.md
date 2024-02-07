 
# Akdeniz University
# Department of Computer Engineering

#Project Part 2: Syntax analyzer/Parser with yacc
# Programming Language Collective

# Student name: 
- Burak ERÇIKTI - 20180808082
- Egemen GÜNDÜZ - 20180808073
- Muhammed Mazlum ORHAN - 20190808015

# Course: Programming Languages (CSE 334)
# Professor: Asst. Prof. Dr. MURAT AK
# Due date: May 26th, 2022

# Abstract: This interpreter is a new programming language that is a functional programming language. The programming language is called Collective. Our goal is to bring together different functions in all programming languages. It is a language that beginners can easily program. Simple programming language functions such as comments, conditional statements such as if-else, loops such as for, while, do-while, ability to write functions, and exception handling can be made with Expression-based execution. It has readability and ease of writability. Its syntax is similar to object-oriented programming languages ​​such as Java, c#. Programs are written here come with the .col extension. There are 2 types of expressions. The first are expressions such as integers that do not need a body to be executed. The second is conditional statements that have a body to execute. As shown above, in col is the data type and text type. The data type is an integer, float, and boolean, while the text type uses String and char. Code blocks are separated by curly braces. As in most programming languages, curly braces must be used for the body. This software can read the language through the input file. The print function is used to print expressions. Finally, the input file can be shown here. col also allows you to print the text you want to the file. There are two types of comments. “#” is used for only one line and “##” is used for multi-line. You can run the program using the instructions in the "run.ssh" file. For this, you can run the commands “yacc -d col.y” and “lex col.l” in the terminal. You can use the command “gcc -g lex.yy.c y.tab.c -o col” to delete col. While typing in the terminal If you make a mistake, the program will stop and show you where the error is. You can write a comment in the compiler.
- make collective<br/>
- ./collective < example.nms

## Syntax
- < program> ::= < stmts> |  < stmts> < program> <br/> 

- <stmts> ::= <stmt> | <stmt> <stmts> 

- <stmt> ::= < printStmt> | < exitStmt> | < assignmentStmt> | < ifElseStatement> | <whileStatements> | < inDecStatements> <br/>

- < exp > ::= < term> | < exp '+' term >  | < exp '-' term >  | < exp '*' term>  | < exp '/' term> | < exp '%' term><br/>

- < term > ::= < INTEGERVALUE> | < IDENTIFIER> <br/>


- < INTEGERVALUE> ::= [-]?[0-9]+<br/>
- < IDENTIFIER> ::= [ a-zA-Z] <br/>
- < BOOLEAN> ::= TRUE | FALSE <br/>

- < arithmeticexp > ::= < IDENTIFIER> ( ); <br/>

- < logicalExpressions> ::= < logicalExpressions> AND < bool> <br/>
	| < logicalExpressions> OR < bool> <br/>
	| < logicalExpressions> EQ< bool> <br/>
	| < logicalExpressions> NE< bool> <br/>
	| < arithmeticexp > gt < arithmeticexp > <br/>
	| < arithmeticexp > lt < arithmeticexp > <br/>
	| < arithmeticexp > gte < arithmeticexp > <br/>
	| < arithmeticexp > lte < arithmeticexp > <br/>
	| < arithmeticexp > eq < term > <br/>
	| < arithmeticexp > neq < term > <br/>
	| N< bool> <br/>
	| < bool> <br/>
	
### Statements
- < printStmt> ::= PRINT < exp > | printStmt PRINT exp ; <br/>

- < exitStmt> ::= EXIT ; <br/>

- < assignmentstatement > ::= < assignment > <br/>
- < assignment > ::= < IDENTIFIER> = < exp > <br/>

- < whileStatements> ::= < whileHeader> { < whileBody> } <br/>
- < whileHeader> ::= WHILE ( < logicalExpressions> ) | WHILE ( < IDENTIFIER> ) <br/>
- < whileBody> ::= < sts > | < whileBody> < sts > | < whileBody> < whilests > <br/>
- < whilests > ::= < IDENTIFIER> = < sts > <br/>
	| PRINT < sts > <br/>
	| < ifElseStatement> <br/>
	| < whileStatements> <br/>
	| < inDecStatements> <br/>
	| < funcStatements> <br/>
	| BREAK

- < ifElseStatement> ::= < ifStatement> | < ifStatement> < elseStatement> <br/>

- < ifstatement > ::= < ifHeader> { < ifBody> } <br/>
- < ifHeader > ::= IF ( < logicalExpressions> ) | IF ( < IDENTIFIER> ) <br/>
- < ifBody> ::= < sts > | < ifsts > | < ifBody> < sts > | < ifBody> < ifsts > <br/>
- < ifsts > ::= < IDENTIFIER> = < sts > <br/>
	| PRINT < sts > <br/>
	| < ifElseStatement> <br/>
	| < whileStatements> <br/>
	| < inDecStatements> <br/>
	| < funcStatements> <br/>

- < elsestatement > ::= ELSE { < elseBody> } <br/>
- < elseBody> ::= < IDENTIFIER> = < sts > <br/>
	| PRINT < sts > <br/>
	| < ifElseStatement> <br/>
	| < whileStatements> <br/>
	| < inDecStatements> <br/>
	| < funcStatements> <br/>

- < inDecStatements> ::= <IDENTIFIER> INC  ; | <IDENTIFIER> DEC  ; <br/>

- < funcStatements> ::= <IDENTIFIER> ( ) ; <br/>

- < sts > ::= < term > PLUS < term > <br/>

	| INC< IDENTIFIER> <br/>
	| DEC< IDENTIFIER> <br/>
	| < term > - < term > <br/>
	| < term > * < term > <br/>
	| < term > / < term > <br/>
	| < term > % < term > <br/>
	| < term > G< term > <br/>
	| < term > L< term > <br/>
	| < term > GE< term > <br/>
	| < term > LE< term > <br/>
	| < term > EQ< term > <br/>
	| < term > NE< term > <br/>
	| < bool> AND < bool> <br/>
	| < bool> OR < bool> <br/>
	| < bool> EQ< bool> <br/>
	| < bool> NE< bool> <br/>
	| N < bool> <br/>
	| < bool> <br/>
	| < term > <br/>

	
### Words

- < words > ::=   AND | OR | N| G <br/>
       | GE | L | LE | EQ | NE| TRUE | FALSE <br/>
       | IF | ELSE | WHILE | PRINT | EXIT | INC | DEC| FUNC 
	   
## Explanations about the language

- '=' .is a word for assigning an integer to an identifier.
- '+' is a word for adding two integers.
- '-' is a word for. subtracting two integers.
- '/' is a word for dividing two integers.
- '*' -> MULTIPLY is a word for multiplying two integers.
- '%' is a word for making a mod operation.
- AND is a word for logical and. 
- OR is a word for logical or.
- N is a word for logical not.
- G is a word for comparing two integers if one of them is greater than the other one.
- GE is a word for comparing two integers if one of them is greater than or equal to another one.

- EQ is a word for comparing two integers or bool if they are equal.
- NE is a word for comparing two integers or bool if they are equal.
- L is a word for comparing two integers if one of them is less than the other one.
- LE is a word for comparing two integers if one of them is less than or equal to another one.
- N is a word to revert boolean value 


- DOUBLE: double
- INT: int
- IF: if
- ELSE: else
- WHILE: while
- PRINT: print
- BOOLEAN: boolean
- TRUE: true
- FALSE: false
- FUNCTION: function
- RETURN: return
- VOID: void
- STRING: string
- LIST: list
- EXIT: exit

 


%{
	#include <ctype.h>
	#include <stdio.h>
	#define YYSTYPE int /* int type for Yacc stack */
	
	extern int yylex();
	void yyerror(char *msg);
%}

%token BOOL
%token AND
%token OR
%token NOT

%left BOOL
%left AND
%left OR
%left NOT


%%
lines	: lines bexpr '\n' { if($2==1){ printf("true (1)\n"); }else{ printf("false (0)\n"); } ;}
		| lines '\n'
		| /* empty */
		;
		
bexpr	: bexpr OR bterm	{ if($1==1 || $3==1){$$ = 1;}else{$$ = 0;}; }
		| bterm	{$$ = $1}
		;
		
bterm	: bterm AND bfactor	{ $$ = $1 * $3; }
		| bfactor {$$ = $1}
		;
		
bfactor	: NOT bfactor	{if($2==1){$$ = 0;}else{$$ = 1;}; }
		| '(' bexpr ')'	{$$ = $2;}
		| BOOL;
		
%%

#include "lex.yy.c";

void yyerror(char *msg){
	printf("Error de sintaxis");
	exit(0);
}

int main(){
	yyparse();
	return 0;
}
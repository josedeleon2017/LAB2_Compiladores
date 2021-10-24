Boolean	[true|false]+
And	[and]+
Or	[or]+
Not	[not]+

%%
[ \t]		; { /* Espacios en blanco */ }
{Boolean}	{ 		
				//Conversion manual de tipo bool a int
				if(yytext[0] == 116){yytext="1";}else{yytext="0";};
				sscanf(yytext, "%d", &yylval);
				return BOOL; 
			}
			
{And}		{ return AND;}			
{Or}		{ return OR;}		
{Not}		{ return NOT;}
[()\n]	return yytext[0];
.		{printf("Error de sintaxis"); exit(0);}
%%

int yywrap(void)
{
	return 0;
}
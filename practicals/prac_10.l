%{
	//Name: Ayush Shrikhande,	PRN: 22070521054 // Practical 10
	#include <stdio.h>
	#include "prac_10.tab.h"
%}

%%
[0-9]+          { yylval.num = atoi(yytext); return NUMBER; }
[-+*/()]        { return yytext[0]; }
[ \t\n]         {}
.               { printf("Invalid character: %s\n", yytext); }
%%

int yywrap(void){
	return 1;
}

%{
// Ayush Shrikhande | PRN : 22070521054 | Practical 03 
#include <stdio.h>
int count = 0;
%}

%%
[Aa][a-zA-Z]* {count++;}
[a-zA-Z]+
.|\n
%%

int main(){
    yylex();
    printf("Number of words starting with 'A' or 'a': %d\n",count);
    return 0;
}

int yywrap() {
    return 1;
}

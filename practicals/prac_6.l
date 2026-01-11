%{
// Ayush Shrikhande | PRN : 22070521054 | Practical 06
#include<stdio.h>
int line_number=0;
%}

%%
^.*com$ {
    line_number++;
    printf("Line %d ends with 'com': %s\n",line_number,yytext);
}
^.*$    {line_number++;}
\n      {/*ignore newlines*/}
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

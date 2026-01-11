%{
// Ayush Shrikhande | PRN : 22070521054 | Practical 04 
#include <stdio.h>

char convert(char c) {
    if (c >= 'a' && c <= 'z') {
        return c - 32;
    } else if (c >= 'A' && c <= 'Z') {
        return c + 32;
    } else {
        return c;
    }
}
%}

%%
[a-zA-Z]    { putchar(convert(yytext[0])); }
.           { putchar(yytext[0]); }
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

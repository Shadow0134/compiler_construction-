%{
// Ayush Shrikhande | PRN : 22070521054 | Practical 06

#include <stdio.h>
#include <string.h>

int comment = 0, keyword = 0, identifier = 0, word = 0;
int line = 0, space = 0;

char *keywords[] = {"int", "float", "if", "else", "while", "return", "char", "double", "for", "void"};

int isKeyword(char *str) {
    for(int i = 0; i < sizeof(keywords)/sizeof(char*); i++) {
        if(strcmp(str, keywords[i]) == 0)
            return 1;
    }
    return 0;
}
%}

%%
"//".* { comment++; }
"/*"([^*]|"*"+[^*/])*"*"+"/" { comment++; }
[ \t]+          { space += yyleng; }
\n            { line++; }
[a-zA-Z_][a-zA-Z0-9_]* {
    word++;
    if(isKeyword(yytext)) keyword++;
    else identifier++;
}
. ;               // ignore everything else
%%

int main() {
    yylex();
    printf("Comments : %d\n", comment);
    printf("Keywords : %d\n", keyword);
    printf("Identifiers: %d\n", identifier);
    printf("Words    : %d\n", word);
    printf("Lines    : %d\n", line);
    printf("Spaces   : %d\n", space);
    return 0;
}

int yywrap() {
    return 1;
}

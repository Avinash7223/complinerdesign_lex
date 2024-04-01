/*  
8_2) check whether given identifier is array or variable or function or structure 

*/


%{
#include <stdio.h>
#include <string.h>
%}

%option noyywrap

%%
[a-zA-Z_][a-zA-Z0-9_]*\s*\[\s*[0-9]*\s*\] {
    printf("%s is an array.\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]*\s*\(\s*\) {
    printf("%s is a function.\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]*\s*\{\s*\} {
    printf("%s is a structure.\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("%s is a variable.\n", yytext);
}

.|\n        ;

%%

int main() {
    printf("Enter an identifier: \n");
    yylex();

    return 0;
}

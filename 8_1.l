/* 

8_1)write a program or lex specification to checknwhether given string is indetifier or  constant or keyword 


%{
#include <stdio.h>
%}

%%
if|else|while|int|float { printf("Keyword: %s\n", yytext); }

[a-zA-Z][a-zA-Z0-9]* { printf("Identifier: %s\n", yytext); }

[0-9]+(\.[0-9]+)? { printf("Constant: %s\n", yytext); }

.|\n { /* Ignore other characters */ }

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
return 0;
}



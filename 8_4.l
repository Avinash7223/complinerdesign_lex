/*

8_4)take a program as input and find all tokens of program

*/


%{
#include <stdio.h>
#include <stdlib.h>
%}

%option noyywrap

%%
"int"|"float"|"if"|"else"|"while"|"for" { printf("Keyword: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }
"+"|"-"|"*"|"/"|"="|"=="|"!="|"<"|">" { printf("Operator: %s\n", yytext); }
[0-9]+ { printf("Number: %s\n", yytext); }
"(" { printf("Left Parenthesis\n"); }
")" { printf("Right Parenthesis\n"); }
"{" { printf("Left Brace\n"); }
"}" { printf("Right Brace\n"); }
";" { printf("Semicolon\n"); }
" " { printf("space\n"); }
"\n" { printf("nextline\n"); }
. { printf("Invalid Character: %s\n", yytext); }
%%

int main() {
    FILE *fp;
    int ret;

    // Open the input file
    fp = fopen("input_program.txt", "r");
    if (fp == NULL) {
        perror("Error opening file");
        return 1;
    }

    // Redirect input to the file
    yyin = fp;

    // Call yylex to start parsing
    ret = yylex();

    // Close the file
    fclose(fp);

    return ret;
}

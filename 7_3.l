/*

7_3)write lex specification to find no.of how many no.of words ,no.of lines ,no.of characters enterd.

*/

%{
#include <stdio.h>
int words = 0, lines = 0, chars = 0;
%}

%%
[a-zA-Z]+    { words++; chars += yyleng; }
\n           { lines++; chars++; }
.            { chars++; }
%%

int main()
{
    printf("Enter the input string: \n");
    yylex();
    printf("Number of words: %d\n", words);
    printf("Number of lines: %d\n", lines);
    printf("Number of characters: %d\n", chars);
    return 0;
}

int yywrap()
{
    return 1;
}

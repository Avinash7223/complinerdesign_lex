/*
7_2)write lex specification to find no.of vowels,uppercase,lowercase letter consonent

*/
%{
#include<stdio.h>
int v = 0, c = 0, l = 0, u = 0;
%}

%%
[ \t\n]+;
[aeiouAEIOU] { v++; }
[a-z] { l++; }
[A-Z] { u++; }
[^aeiouAEIOU] { c++; }

%%

int main()
{
    printf("Enter the input string: \n");
    yylex();
    printf("Number of vowels: %d\n", v);
    printf("Number of consonants: %d\n", c);
    printf("Number of lowercase alphabets: %d\n", l);
    printf("Number of uppercase alphabets: %d\n", u);
    return 0;
}

int yywrap()
{
    return 1;
}
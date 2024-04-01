/*

8_3) find all tokens in given arithmetic statement 

*/


%{
#include <stdio.h>
#include <stdlib.h>
%}
%%
"+"|"*"|"/"|"%"|"-" { printf("Operator\n"); }
"<"|">"|"<="|">=" { printf("Relational Operator\n"); }
"int"|"float"|"double"|"char"|"do"|"while" { printf("Keyword\n"); }  

"&"|"|"|"^"|"~" { printf("Bitwise Operator\n"); } 

[a-zA-Z][a-zA-Z0-9_]* { printf("Variable\n"); }   

[0-9]+ { printf("Digit\n"); }  

. { printf("Invalid Character\n"); }  


%%

int main()
{
  printf("Enter an arithmetic expression: \n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
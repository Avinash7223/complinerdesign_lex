/* 
7_1) write lex specification to print whatever you type and find how many characters you typed.
*/


%{/Auxiliary Declarations/
#include<stdio.h>
int count = 0;
%}
%%
. {ECHO;count++;}
%%
int yywrap()
{
return 1;
}
int main()
{
printf("\nEnter text: ");
yylex();
printf("\n The no. of chars you typed : %d", count);
}
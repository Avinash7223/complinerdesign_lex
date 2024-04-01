/* 
7_4)write lex specification to read one sentences and display all the words in ascending order


*/

%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_WORDS 100
#define MAX_WORD_LENGTH 50

char words[MAX_WORDS][MAX_WORD_LENGTH];
int num_words = 0;
%}

%option noyywrap

%%
[a-zA-Z]+ {
    if (num_words < MAX_WORDS) {
        strncpy(words[num_words], yytext, MAX_WORD_LENGTH);
        num_words++;
    }
}

.|\n        ;

%%

void sort_words() {
    int i, j;
    char temp[MAX_WORD_LENGTH];

    for (i = 0; i < num_words; i++) {
        for (j = i + 1; j < num_words; j++) {
            if (strcmp(words[i], words[j]) > 0) {
                strncpy(temp, words[i], MAX_WORD_LENGTH);
                strncpy(words[i], words[j], MAX_WORD_LENGTH);
                strncpy(words[j], temp, MAX_WORD_LENGTH);
            }
        }
    }
}

int main() {
    printf("Enter a sentence: \n");
    yylex();

    sort_words();

    printf("\nWords in ascending order:\n");
    for (int i = 0; i < num_words; i++) {
        printf("%s\n", words[i]);
    }

    return 0;
}

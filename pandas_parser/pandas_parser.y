%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(const char *s);

#define MAX_SIZE 10000

char *strings[MAX_SIZE];
int numStrings = 0;

void appendToResult(const char *str) {
    if (numStrings < MAX_SIZE) {
        strings[numStrings] = malloc((strlen(str) + 1) * sizeof(char));
        strcpy(strings[numStrings], str);
        numStrings++;
    }
}

void appendToString(const char *str, int index) {
    if (numStrings < MAX_SIZE && index >= 0 && index <= numStrings) {
        // Move the subsequent elements one space to the right
        for (int i = numStrings; i > index; i--) {
            strings[i] = strings[i - 1];
        }
        // Allocate memory for the new string and insert it at the specified index
        strings[index] = malloc((strlen(str) + 1) * sizeof(char));
        strcpy(strings[index], str);
        numStrings++;
    }
}

%}

%start query

%union {
    char *str;
}

%token <str> USING THE FILEE FILENAME FIND ALL ROWS THAT MEET EQUAL LESS MORE THAN AND OR NUMBER COLUMN ENDOFFILE TO
%type <str> query filename condition column endoffile

%%

query: USING THE FILEE filename FIND ALL ROWS THAT MEET condition endoffile {
    appendToResult("print(df[");
    appendToResult("')\n");
    appendToResult($4);
    appendToResult("df = pd.read_csv('");
    appendToResult("import pandas as pd\n");
}
;

filename: FILENAME                          { $$ = $1; }
;

condition: MORE THAN NUMBER column          { appendToResult(")"); appendToResult($3); appendToResult("'] > "); appendToResult($4); appendToResult("(df['");  }
 | LESS THAN NUMBER column                  { appendToResult(")"); appendToResult($3); appendToResult("'] < "); appendToResult($4); appendToResult("(df['");  }
 | EQUAL TO NUMBER column                   { appendToResult(")"); appendToResult($3); appendToResult("'] == "); appendToResult($4); appendToResult("(df['"); }
 | MORE THAN OR EQUAL TO NUMBER column      { appendToResult(")"); appendToResult($6); appendToResult("'] >= "); appendToResult($7); appendToResult("(df['"); }
 | LESS THAN OR EQUAL TO NUMBER column      { appendToResult(")"); appendToResult($6); appendToResult("'] <= "); appendToResult($7); appendToResult("(df['"); }
 | condition OR condition                   { appendToString(" || ", numStrings - 5); }
 | condition AND condition                  { appendToString(" && ", numStrings - 5); }
 ;

column: COLUMN                              { $$ = $1; }
;

endoffile: ENDOFFILE                        { $$ = "])"; }
;

%%

void printFinal() {
    for (int i = numStrings - 1; i >= 0; i--) {
        printf("%s", strings[i]);
    }
    printf("])\n");
    
    // Free the allocated memory for the strings
    for (int i = 0; i < numStrings; i++) {
        free(strings[i]);
    }
}

int main() {
    yyparse();

    printFinal();
    
    return 0;
}

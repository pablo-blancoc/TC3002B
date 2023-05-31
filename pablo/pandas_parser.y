%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(const char *s);

char result_string[10000];      // Global string variable
int result_index = 0;           // Index to track the current position in the string

void appendToResult(const char *str) {
    strcpy(result_string + result_index, str);
    result_index += strlen(str);
}

%}

%start query

%union {
    char *str;
}

%token <str> USING THE FILEE FILENAME FIND ALL ROWS THAT MEET EQUAL LESS MORE THAN AND OR NUMBER COLUMN ENDOFFILE
%type <str> query filename condition column endoffile

%%

query: USING THE FILEE filename FIND ALL ROWS THAT MEET condition endoffile {
    appendToResult("import pandas as pd\n");
    appendToResult("df = pd.read_csv('");
    appendToResult($4);
    appendToResult("')\n");
    appendToResult("print(df[");
}
;

filename: FILENAME                          { $$ = $1; }
;

condition: MORE THAN NUMBER column          { appendToResult("(df[')"); appendToResult($4); appendToResult("'] > "); appendToResult($3); }
;

column: COLUMN                              { $$ = $1; }
;

endoffile: ENDOFFILE                        { appendToResult("])"); }
;

%%

int main() {
    yyparse();

    // Print the result_string at the end
    printf("%s\n", result_string);
    
    return 0;
}

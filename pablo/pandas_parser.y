/* 
%token NAME NUMBER
%%

statement: NAME '=' expression		{printf("= %d\n", $3);}
 | expression 						{printf("= %d\n", $1);}
 ;
expression: expression '+' NUMBER   { $$ = $1 + $3;}
 | expression '-' NUMBER            { $$ = $1 - $3;}
 | expression '*' NUMBER            { $$ = $1 * $3;}
 | '(' expression ')'				{$$ = $2;}
 | NUMBER                           {$$ = $1;}
 ; 
*/


%{
#include <stdio.h>
int yylex();
void yyerror(const char *s);
%}

%start query

%union {
    char *str;
}

%token <str> USING THE FILEE FILENAME FIND ALL ROWS THAT MEET EQUAL LESS MORE THAN AND OR INTEGER COLUMN
%type <str> query filename

%%

query: USING THE FILEE filename FIND ALL ROWS THAT MEET                    {printf("import pandas as pd\ndf = pd.read_csv('%s')\n", $4);}
;

filename: FILENAME                                                          { $$ = $1; }
;

condition: column MORE THAN INTEGER                                         {printf("(df['%s'] > %s)", $1);} // $$ = f"(df['points'] > $3) & (df['laps'] <= $7)"
;

column: COLUMN                                                              { $$ = $1; }
;

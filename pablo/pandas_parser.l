%{
#include "y.tab.h"
%}

%%

"using"                         { return USING; }
"the"                           { return THE; }
"file"                          { return FILEE; }
"find"                          { return FIND; }
"all"                           { return ALL; }
"rows"                          { return ROWS; }
"that"                          { return THAT; }
"meet"                          { return MEET; }
"more"                          { return MORE; }
"than"                          { return THAN; }
"and"                           { return AND; }
"or"                            { return OR; }
"less"                          { return LESS; }
[0-9]+                          { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z_0-9_-]*.csv     { yylval.str = strdup(yytext); return FILENAME; }

resultId|raceId|driverId|constructorId|number|grid|position|positionText|positionOrder|points|laps|time|milliseconds|fastestLap|rank|fastestLapTime|fastestLapSpeed|statusId { yylval.str = strdup(yytext); return COLUMN; }

\n return 0; 		            /* logical EOF */
[ \t]+                          /* ignore whitespace */
":"                             /* ignore semicolon */

%%

// [a-zA-Z][a-zA-Z_0-9_-]*.csv     { yylval = yytext[0, yyleng]; return FILENAME; }
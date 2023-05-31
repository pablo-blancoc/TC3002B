%{
#include "y.tab.h"
#include <string.h>
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
"equal"                         { return EQUAL; }
"to"                            { return TO; }
"or"                            { return OR; }
"less"                          { return LESS; }
"."                             { return ENDOFFILE; }

[0-9]+                          { yylval.str = strdup(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z_0-9_-]*.csv     { yylval.str = strdup(yytext); return FILENAME; }

resultId|raceId|driverId|constructorId|number|grid|position|positionText|positionOrder|points|laps|time|milliseconds|fastestLap|rank|fastestLapTime|fastestLapSpeed|statusId { yylval.str = strdup(yytext); return COLUMN; }

[ \t]+                          /* ignore whitespace */
":"                             /* ignore colon */
\n return 0;                    /* logical EOF */

%%

// [a-zA-Z][a-zA-Z_0-9_-]*.csv     { yylval = yytext[0, yyleng]; return FILENAME; }
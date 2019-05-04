%{
#include <stdio.h>
#include "y.tab.h"
void extern yyerror(char*);
int extern tokenCounter;
%}

whitespace  [ \t\r\v\f]
newline     [\n]                     
digits      [0-9]+                                          
id          [a-zA-Z][a-zA-Z0-9]*    
tokenCounter = 0;

%%

{digits}                    {yylval.number = atoi(yytext); tokenCounter++; ECHO; return NUM;}
{id}                        {yylval.id = strdup(yytext); tokenCounter++; ECHO; return IDENTIFIER;}                                      

" + "                                             {ECHO; tokenCounter++; return OPERATION;}
" - "                                             {ECHO; tokenCounter++; return OPERATION;}
" * "                                             {ECHO; tokenCounter++; return OPERATION;}
" / "                                             {ECHO; tokenCounter++; return OPERATION;}
" % "                                             {ECHO; tokenCounter++; return OPERATION;}
" ; "                                             {ECHO; tokenCounter++; return SEMI_COLON;}
" = "                                             {ECHO; tokenCounter++; return EQUALS;}
"("                                               {ECHO; tokenCounter++; return BRACKET_OPEN;}
")"                                               {ECHO; tokenCounter++; return BRACKET_CLOSE;}

{newline}                                         {yylineno++; return NEWLINE;}
{whitespace}                                      ;
.                                                 {ECHO; yyerror("INVALID TOKEN");}

%%
void yyerror(char *reason) {
    printf(" <LINE %d", yylineno);
    printf(" FAILED: %s>\n", reason);
}

int yywrap(void){
    return 1;
}

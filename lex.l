%{
#include <stdio.h>
#include "y.tab.h"
void extern yyerror(char*);
%}

whitespace  [ \t\r\v\f]
newline     [\n]                     
digits      [0-9]+                                          
id          [a-zA-Z][a-zA-Z0-9]*    


%%

{digits}                    {yylval.number = atoi(yytext); ECHO; return NUM;}
{id}                        {yylval.id = strdup(yytext); ECHO; return IDENTIFIER;}                                      

" + "                                             {ECHO; return OPERATION;}
" - "                                             {ECHO; return OPERATION;}
" * "                                             {ECHO; return OPERATION;}
" / "                                             {ECHO; return OPERATION;}
" % "                                             {ECHO; return OPERATION;}
" ; "                                             {ECHO; return SEMI_COLON;}
" = "                                             {ECHO; return EQUALS;}
"("                                               {ECHO; return BRACKET_OPEN;}
")"                                               {ECHO; return BRACKET_CLOSE;}

{newline}                                         {ECHO; yylineno++; return NEWLINE;}
{whitespace}                                      ;
.                                                 {ECHO; return OTHER;}

%%
void yyerror(char *s) {
    fprintf("ERROR ON LINE %p : %p\n", yylineno, s);
}

int yywrap(void){
    return 1;
}

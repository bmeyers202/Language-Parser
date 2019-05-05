%{
#include <stdio.h>
#include "y.tab.h"
void extern yyerror(char*);
void extern invalidToken();
int invalidTokenFlag = 0;
int errorFlag = 0;
char temp;
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

{newline}                                         {return NEWLINE;}
{whitespace}                                      ;
.                                                 {ECHO; invalidTokenFlag = 1;}

%%
void yyerror(char *reason) {
    errorFlag = 1;
    temp = yytext;
}

void invalidToken(){
    printf("   <LINE %d", yylineno);
    printf(" FAILED: Invalid Token>\n");
    invalidTokenFlag = 0;
}

int yywrap(void){
    return 1;
}

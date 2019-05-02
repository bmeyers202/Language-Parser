%{
#include <stdio.h>
#include "y.tab.h"
%}

whitespace  [ \t\r\v\f]
newline     [\n]                     
digits      [0-9]+                                          
id          [a-zA-Z][a-zA-Z0-9]*    


%%

{digits}                    {yylval.number = atoi(yytext);  return NUM;}
{id}                        {yylval.id = strdup(yytext); return IDENTIFIER;}                                      

" + "                                             {return OPERATION;}
" - "                                             {return OPERATION;}
" * "                                             {return OPERATION;}
" / "                                             {return OPERATION;}
" % "                                             {return OPERATION;}
" ; "                                             {return SEMI_COLON;}
" = "                                             {return EQUALS;}
"("                                               {return BRACKET_OPEN;}
")"                                               {return BRACKET_CLOSE;}
"<<EOF>>"                                         {return -1;}

{newline}                                         {yylineno++; return NEWLINE;}
{whitespace}                                      ;
.                                                 {return OTHER;}

%%

int yywrap(void){
    return 1;
}

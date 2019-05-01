%{
#include <stdio.h>
#include "y.tab.h"
void gracefulExit();
void invalidToken();

%}

whitespace  [ \t\r\v\f]
newline      \n                     
digits      [0-9]+                                          
id          [a-zA-Z][_a-zA-Z0-9]*    

%%

{digits}                    {yylval.number = atoi(yytext);  return NUM;}
{id}                        {yylval.id = yytext; return IDENTIFIER;}                                      

" + "                                             {return ADDITION;}
" - "                                             {return SUBTRACTION;}
" * "                                             {return MULTIPLICATION;}
" / "                                             {return DIVISION;}
" % "                                             {return MODULO;}
" ; "                                             {return SEMI_COLON;}
" = "                                             {return EQUALS;}
" ("                                              {return BRACKET_OPEN;}
") "                                              {return BRACKET_CLOSE;}

{newline}                                         {yylineno++;}
{whitespace}                                      ;
.                                                 {invalidToken(); return OTHER;}

%%
void gracefulExit(){
    printf("Your a bitch");
    exit(0);
}

void invalidToken(){
    printf("ERROR: Invalid Token");
    exit(0);
}

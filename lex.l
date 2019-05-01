%{
#include <stdio.h>
#include "y.tab.h"
void extern yyerror(char*);
void InvalidToken();
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
"<<EOF>>"                                         {return -2;}

{newline}                                         {yylineno++; return -1;}
{whitespace}                                      ;
.                                                 {InvalidToken(); return OTHER;}

%%
void yyerror(char *s) {
    fprintf(stderr, "\nERROR ON LINE %d : %s\n", yylineno, s);
    printf("\"%s\" is invalid\n", yytext);
    exit(0);
}

void InvalidToken(){
    printf("ERROR ON LINE %d : \n Invalid Token %s\n", yylineno,yytext);
    exit(0);
}

int yywrap(void){
    return 1;
}

/*************************************************************
 Name: Blake Meyers(cssc0430, Red id: 819557369)
 Project: CS530 Assignment 3
 File: semantics.l
 Notes: The file contains the semantic rules for the file inputs. 
 This file will print each token and also indicate which tokens are valid 
 and which are not. It will set a flag if the token entered is invalid 
 for the syntax.y file to handle in it's messages.
 *************************************************************/
 
 /*************************************************************
 Funcion, library, and variable declarations
 *************************************************************/
%{
#include <stdio.h>
#include "y.tab.h"
void extern yyerror(char*);
void extern invalidToken();
int invalidTokenFlag = 0;
int errorFlag = 0;
%}

 /*************************************************************
 Defines valid input, prints tokens, and returns variable
 name for token for use in syntax.y file
 *************************************************************/
whitespace  [ \t\r\v\f]
newline     [\n]                                                             
id          [a-zA-Z][a-zA-Z0-9]*   
%%

{id}                                              {ECHO; return IDENTIFIER;}                                                                          

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
 /*************************************************************
 Custon error handling functions
 *************************************************************/
void yyerror(char *reason) {
    errorFlag = 1;
}

void invalidToken(){
    printf("   <LINE %d", yylineno);
    printf(" FAILED: Invalid Token>\n");
    invalidTokenFlag = 0;
}

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
#include <string.h>
#include "syntax.tab.h"
void extern yyerror(char*);
void extern printPassed(char*);
int sz;
char *errorMessage;
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
.                                                 {ECHO;}

%%

void printPassed(char *stmtType) {
    printf("\n<LINE %d PASSED: Valid %s>\n\n", yylineno, stmtType);
    printf("********************************************************************************\n\n");
}


/*************************************************************
 FUNCTION: yyerror()
 DESCRIPTION: Called from syntax.y if syntax error existed while parsing.
 Stores error message in dynamically sized variable, errorMessage, so that \
 it can be saved to be printed after entire input statement is done printing.
 I/O:
    input parameters: Char pointer
    output: none
 Note: Function overloading
 *************************************************************/
 
void yyerror(char *reason) {
    sz = snprintf(NULL, 0, "     <LINE %d FAILED: %s>\n", yylineno, reason);
    errorMessage = (char *)malloc(sz + 1);
    snprintf(errorMessage, sz+1, "<LINE %d FAILED: %s>\n\n", yylineno, reason);
}

/*************************************************************
 Name: Blake Meyers(cssc0430, Red id: 819557369)
 Project: CS530 Assignment 3
 File: syntax.y
 Notes: The file contains the grammer rules for the different acceptable
 statments in the input. This file will print a statment indicating whether each line 
 passed or failed and provide a reason if it failed.
 *************************************************************/


/*************************************************************
 Function, linrary, and variable declarations
 *************************************************************/
%{
    #include <stdio.h>
    extern int yylex();
    extern char* yytext;
    extern int yylineno;
    extern void yyerror();
    extern FILE* yyin;
    extern char* errorMessage;
%}

%define parse.error verbose

/*************************************************************
 Indicate the tokens that will be used in the grammer rules
 *************************************************************/
%token OPERATION SEMI_COLON  EQUALS 
%token BRACKET_OPEN  BRACKET_CLOSE 
%token IDENTIFIER NUM OTHER NEWLINE END_OF_FILE

/*************************************************************
 Grammer rule definitions. Displays a message of whether each line
 passed and if there was an error.
 *************************************************************/
%%
INPUT: ASSIGNMENT NEWLINE                   {printf("     <LINE %d PASSED: Valid Assignment>\n", yylineno);yylineno++;}
     | EXPRESSION NEWLINE                   {printf("     <LINE %d PASSED: VALID Expression>\n", yylineno);yylineno++;}
     | INPUT ASSIGNMENT NEWLINE             {printf("     <LINE %d PASSED: Valid Assignment>\n", yylineno);yylineno++;}
     | INPUT EXPRESSION NEWLINE             {printf("     <LINE %d PASSED: Valid Expression>\n", yylineno);yylineno++;}
     | INPUT error NEWLINE                  {printf(errorMessage); yylineno++;}
     | error NEWLINE                        {printf(errorMessage); yylineno++;}
     | INPUT NEWLINE                        {printf("\n"); yylineno++;}
     | NEWLINE                              {printf("\n"); yylineno++;}
;
ASSIGNMENT: IDENTIFIER EQUALS EXPRESSION SEMI_COLON
;
EXPRESSION: IDENTIFIER OPERATION IDENTIFIER
           | BRACKET_OPEN EXPRESSION BRACKET_CLOSE
           | EXPRESSION OPERATION IDENTIFIER
           | IDENTIFIER OPERATION BRACKET_OPEN EXPRESSION BRACKET_CLOSE
;
%%
int main(int argc, char *argv[]){
  yyin = fopen(argv[1], "r");
  yyparse();
  return 0;
}

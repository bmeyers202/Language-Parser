%{
    #include <stdio.h>
    extern int yylex();
    extern char* yytext;
    extern int yylineno;
    extern void yyerror();
    extern void invalidToken();
    extern int invalidTokenFlag;
%}
%token OPERATION SEMI_COLON  EQUALS 
%token BRACKET_OPEN  BRACKET_CLOSE 
%token IDENTIFIER NUM OTHER NEWLINE END_OF_FILE
%type <op> OPERATION
%union{
    int number;
    char* id;
    char* other;
}

%%
INPUT: ASSIGNMENT NEWLINE                   {if(invalidTokenFlag == 1){InvalidToken()};else {printf("   <LINE %d", yylineno); printf(" PASSED: VALID ASSIGNMENT>\n")};yylineno++;}
     | EXPRESSION NEWLINE                   {if(invalidTokenFlag == 1){InvalidToken()};else {printf("   <LINE %d", yylineno); printf(" PASSED: VALID EXPRESSION>\n")};yylineno++;}
     | INPUT ASSIGNMENT NEWLINE             {if(invalidTokenFlag == 1){InvalidToken()};else {printf("   <LINE %d", yylineno); printf(" PASSED: VALID ASSIGNMENT>\n")};yylineno++;}
     | INPUT EXPRESSION NEWLINE             {if(invalidTokenFlag == 1){InvalidToken()};else {printf("   <LINE %d", yylineno); printf(" PASSED: VALID EXPRESSION>\n")};yylineno++;}
     | INPUT error NEWLINE                  {printf("   <LINE %d", yylineno); printf(" FAILED: syntax error>\n"); yylineno++;}
     | INPUT NEWLINE                        {printf("\n"); yylineno++;}
;
ASSIGNMENT: IDENTIFIER EQUALS EXPRESSION SEMI_COLON
;
EXPRESSION: IDENTIFIER OPERATION IDENTIFIER
           | BRACKET_OPEN EXPRESSION BRACKET_CLOSE
           | EXPRESSION OPERATION IDENTIFIER
           | IDENTIFIER OPERATION BRACKET_OPEN EXPRESSION BRACKET_CLOSE
;
%%
int main(){
  yyparse();
  printf("Reached End of File\n");
  return 0;
}

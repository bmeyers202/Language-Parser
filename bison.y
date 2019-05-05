%{
    #include <stdio.h>
    extern int yylex();
    extern char* yytext;
    extern int yylineno;
    extern void yyerror();
    extern void invalidToken();
    extern int invalidTokenFlag;
    extern int errorFlag;
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
INPUT: ASSIGNMENT NEWLINE                   {if(invalidTokenFlag == 1)invalidToken();else printf("   <LINE %d PASSED: Valid Assignment>\n", yylineno);yylineno++;}
     | EXPRESSION NEWLINE                   {if(invalidTokenFlag == 1)invalidToken();else printf("   <LINE %d PASSED: VALID Expression>\n", yylineno);yylineno++;}
     | INPUT ASSIGNMENT NEWLINE             {if(invalidTokenFlag == 1)invalidToken();else printf("   <LINE %d PASSED: Valid Assignment>\n", yylineno);yylineno++;}
     | INPUT EXPRESSION NEWLINE             {if(invalidTokenFlag == 1)invalidToken();else printf("   <LINE %d PASSED: Valid Expression>\n", yylineno);yylineno++;}
     | INPUT error NEWLINE                  {if(invalidTokenFlag == 1)invalidToken();else printf("   <LINE %d FAILED: Syntax Error>\n", yylineno); yylineno++;}
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
  printf("\n");
  yyparse();
  printf("\n");
  return 0;
}

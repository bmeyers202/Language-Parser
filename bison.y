%{
    #include <stdio.h>
    extern int yylex();
    extern char* yytext;
    extern int yylineno;
    extern void yyerror();
    extern void invalidToken();
    extern int invalidTokenFlag;
    extern int errorFlag;
    extern string temp;
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
INPUT: ASSIGNMENT NEWLINE                   {if(invalidTokenFlag == 1)invalidToken();else printf("   <LINE %d PASSED: VALID ASSIGNMENT>\n", yylineno);yylineno++;}
     | EXPRESSION NEWLINE                   {if(invalidTokenFlag == 1)invalidToken();else printf("   <LINE %d PASSED: VALID EXPRESSION>\n", yylineno);yylineno++;}
     | INPUT ASSIGNMENT NEWLINE             {if(invalidTokenFlag == 1)invalidToken();else printf("   <LINE %d PASSED: VALID ASSIGNMENT>\n", yylineno);yylineno++;}
     | INPUT EXPRESSION NEWLINE             {if(invalidTokenFlag == 1)invalidToken();else printf("   <LINE %d PASSED: VALID EXPRESSION>\n", yylineno);yylineno++;}
     | INPUT error NEWLINE                  {printf("   <LINE %d FAILED: syntax error from \'%s\'>\n", yylineno, temp); yylineno++;}
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

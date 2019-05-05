%{
    #include <stdio.h>
    extern int yylex();
    extern char* yytext;
    extern int yylineno;
    extern void yyerror();
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
INPUT: ASSIGNMENT NEWLINE                   {printf("   <LINE %d", yylineno-1); printf(" PASSED: VALID ASSIGNMENT>\n");}
     | EXPRESSION NEWLINE                   {printf("   <LINE %d", yylineno-1); printf(" PASSED: VALID EXPRESSION>\n");}  
     | INPUT ASSIGNMENT NEWLINE             {printf("   <LINE %d", yylineno-1); printf(" PASSED: VALID ASSIGNMENT>\n");}
     | INPUT EXPRESSION NEWLINE             {printf("   <LINE %d", yylineno-1); printf(" PASSED: VALID EXPRESSION>\n");}
     | INPUT error NEWLINE                  {"\n";}
     | INPUT NEWLINE                        {"\n\n";}
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

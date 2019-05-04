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
INPUT: ASSIGNMENT NEWLINE                   {printf("   <VALID ASSIGNMENT>");}
     | EXPRESSION NEWLINE                   {printf("   <VALID EXPRESSION>");}  
     | INPUT ASSIGNMENT NEWLINE             {printf("   <VALID ASSIGNMENT>");}
     | INPUT EXPRESSION NEWLINE             {printf("   <VALID EXPRESSION>");}
     | INPUT error NEWLINE                  {yyerror("Invalid Statement");}
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

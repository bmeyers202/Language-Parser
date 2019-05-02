%{
    #include <stdio.h>
    extern int yylex();
    extern char* yytext;
    extern int yylineno;  
%}

%token OPERATION SEMI_COLON  EQUALS 
%token BRACKET_OPEN  BRACKET_CLOSE 
%token IDENTIFIER NUM OTHER NEWLINE

%type <op> OPERATION

%union{
    int number;
    char* id;
    char* other;
}

%%
INPUT:
     | INPUT ASSIGNMENT NEWLINE
     | INPUT EXPRESSION NEWLINE
     | INPUT error NEWLINE                  {yyerrok; printf(" On line %s: \'%s\' is invalid", yylineno, yytext);}
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

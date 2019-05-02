%{
    #include <stdio.h>
    extern void yyerror(char* s);
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
     | ASSIGNMENT NEWLINE
     | EXPRESSION NEWLINE
     | error NEWLINE                  {yyerrorok;}
;

ASSIGNMENT: IDENTIFIER EQUALS EXPRESSION SEMI_COLON
;

EXPRESSION: IDENTIFIER OPERATION IDENTIFIER
           | BRACKET_OPEN EXPRESSION BRACKET_CLOSE
           | EXPRESSION OPERATION IDENTIFIER
           | IDENTIFIER OPERATION EXPRESSION
;

%%

int main(){
  yyparse();
  printf("No Errors in Provided Input\n");
  return 0;
}

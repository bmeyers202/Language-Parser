%{
    #include <stdio.h>

    int yylex();
    int yyerror(char *s);
%}

%define parse.lac full
%define parse.error verbose

%token ADDITION  SUBTRACTION  MULTIPLICATION  DIVISION  MODULO  SEMI_COLON  EQUALS 
%token BRACKET_OPEN  BRACKET_CLOSE 
%token IDENTIFIER NUM

%type <op> ADDITION SUBTRACTION MULTIPLICATION DIVISION MODULO EQUALS

%union{
    int number;
    char* id;
    char* other;
}

%%
ASSIGNMENT: IDENTIFIER EQUALS EXPRESSIONS SEMI_COLON
;

EXPRESSIONS:  IDENTIFIER
            | IDENTIFIER ADDITION EXPRESSIONS
            | IDENTIFIER SUBTRACTION EXPRESSIONS
            | IDENTIFIER MULTIPLICATION EXPRESSIONS
            | IDENTIFIER DIVISION EXPRESSIONS
            | IDENTIFIER MODULO EXPRESSIONS
            | BRACKET_OPEN IDENTIFIER ADDITION EXPRESSIONS BRACKET_CLOSE
            | BRACKET_OPEN IDENTIFIER SUBTRACTION EXPRESSIONS BRACKET_CLOSE
            | BRACKET_OPEN IDENTIFIER MULTIPLICATION EXPRESSIONS BRACKET_CLOSE
            | BRACKET_OPEN IDENTIFIER DIVISION EXPRESSIONS BRACKET_CLOSE
            | BRACKET_OPEN IDENTIFIER MODULO EXPRESSIONS BRACKET_CLOSE
;

%%
int yyerror(char *s){
    printf("Syntax Error on Line %s/n", s);
    return 0;
}

int main(){

  yyparse();
  printf("No Errors in Provided Input\n");
  return 0;
}
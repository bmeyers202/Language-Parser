%{
    #include <stdio.h>
    extern void yyerror(char* s);
    extern int yylex();
    extern char* yytext;
    extern int yylineno;  
%}

%token OPERATION SEMI_COLON  EQUALS 
%token BRACKET_OPEN  BRACKET_CLOSE 
%token IDENTIFIER NUM OTHER

%type <op> OPERATION

%union{
    int number;
    char* id;
    char* other;
}

%%

ASSIGNMENT: IDENTIFIER EQUALS EXPRESSIONS SEMI_COLON
;

EXPRESSIONS:  IDENTIFIER OPERATION IDENTIFIER
            | IDENTIFIER OPERATION EXPRESSIONS
            | EXPRESSIONS OPERATION IDENTIFIER
            | BRACKET_OPEN EXPRESSIONS BRACKET_CLOSE
;
%%

int main(){
  while(yyparse() != -2){
    yyparse();
  }
  printf("No Errors in Provided Input\n");
  return 0;
}

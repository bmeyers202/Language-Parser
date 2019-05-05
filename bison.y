%{
    #include <stdio.h>
    extern int yylex();
    extern char* yytext;
    extern int yylineno;
    extern void yyerror();
%}

%token OPERATION SEMI_COLON  EQUALS 
%token BRACKET_OPEN  BRACKET_CLOSE 
%token IDENTIFIER NUM OTHER NEWLINE

%type <op> OPERATION EQUALS SEMI_COLON BRACKET_OPEN BRACKET_CLOSE NEWLINE
%type <id> IDENTIFIER ASSIGNMENT EXPRESSION

%union{
    int number;
    char* id;
    char* other;
}

%%
INPUT: ASSIGNMENT NEWLINE                   {printf("%s\n", $1); printf("   <LINE %d", yylineno-1); printf(" PASSED: VALID ASSIGNMENT>\n");}
     | EXPRESSION NEWLINE                   {printf("%s\n", $1);printf("   <LINE %d", yylineno-1); printf(" PASSED: VALID EXPRESSION>\n");}  
     | INPUT ASSIGNMENT NEWLINE             {printf("%s\n", $2); printf("   <LINE %d", yylineno-1); printf(" PASSED: VALID ASSIGNMENT>\n");}
     | INPUT EXPRESSION NEWLINE             {printf("%s\n", $2); printf("   <LINE %d", yylineno-1); printf(" PASSED: VALID EXPRESSION>\n");}
     | INPUT error NEWLINE   
;


ASSIGNMENT: IDENTIFIER EQUALS EXPRESSION SEMI_COLON                 {$$;}
;
EXPRESSION: IDENTIFIER OPERATION IDENTIFIER                             {$$;}
           | BRACKET_OPEN EXPRESSION BRACKET_CLOSE                         {$$;}
           | EXPRESSION OPERATION IDENTIFIER                        {$$;}
           | IDENTIFIER OPERATION BRACKET_OPEN EXPRESSION BRACKET_CLOSE     {$$;}
;
%%

int main(){
  yyparse();
  printf("Reached End of File\n");
  return 0;
}

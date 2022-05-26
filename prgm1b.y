%{
#include<stdio.h>
#include<stdlib.h>
int yyerror();
%}
%token NUM ENTER
%left '+''-'
%left '*''/'
%%
input: expr ENTER {printf("Result is %d \n",$$);exit(0);}
expr: expr '+' expr { $$ = $1+$3;}
    | expr '-' expr { $$ = $1-$3;}
    | expr '*' expr { $$ = $1*$3;}
    | expr '('expr')' expr { $$=-$2;}
    | expr '-' expr { $$=$2;}
    |NUM{$$=$1;}
    ;
%%
void main()
{
printf("Enter the expression \n");
yyparse();
}
int yyerror()
{
printf("Invalid Expression \n");
return 0;
}



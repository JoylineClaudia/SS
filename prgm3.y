%{
#include<stdio.h>
int id=0,op=0,digit=0,keyword=0;
extern FILE * yyin;
int yyerror();
%}
%token ID OP DIGIT KEYWORD
%%
input : KEYWORD input {keyword++;}
      | KEYWORD {keyword++;}
      | ID input{id++;}
      | ID {id++;}
      | OP input {op++;}
      | OP {op++;}
      | DIGIT input {digit++;}
      | DIGIT {digit++;}
      
      ;
%%
void main()
{
yyin=fopen("sample.txt","r");
yyparse();
printf("Identifier count is %d \n",id);
printf("Operator count is %d \n",op);
printf("Digits count is %d \n",digit);
printf("Keyword count is %d \n",keyword);
}
int yyerror()
{
printf("Invalid Input \n");
return 0;
}


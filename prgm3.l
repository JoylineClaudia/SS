%{
#include"y.tab.h"
#include<stdio.h>
extern int yylval;
%}
%%
"int"|"float"|"printf"|"void" { printf("Keyword is %s \n",yytext); return KEYWORD;}
[a-zA-Z]* { printf("Identifier is %s \n", yytext);return ID;}
[+\-\*\/] { printf("Operator is %s \n", yytext);return OP;}
[0-9]+ { yylval=atoi(yytext); printf("Number is %d \n",yylval); return DIGIT;}
. ;
%%


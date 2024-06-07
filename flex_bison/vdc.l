%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.h"
char* yyval;
%}

%option yylineno
%option noyywrap


%%

[ \t]                       ; /* Ignora espaços em branco e tabulações */

"sessao"                    { yyval = strdup(yytext); return sessao; }
"certo"                     { yyval = strdup(yytext); return certo; }
"errado"                    { yyval = strdup(yytext); return errado; }

"npc"                       { yyval = strdup(yytext); return npc; }
"npc_fala"                  { yyval = strdup(yytext); return npc_fala; }

"jogador"                   { yyval = strdup(yytext); return jogador; }
"jogador_fala"              { yyval = strdup(yytext); return jogador_fala; }
"jogador_responde"          { yyval = strdup(yytext); return jogador_responde; }


"mestre"                    { yyval = strdup(yytext); return mestre; }
"mestre_fala"                    { yyval = strdup(yytext); return mestre_fala; }


"round"                     { yyval = strdup(yytext); return round; }

"charada"                   { yyval = strdup(yytext); return charada; }
"combate"                   { yyval = strdup(yytext); return combate; }
"combate_on"                { yyval = strdup(yytext); return combate_on; }


"monstro"                   { yyval = strdup(yytext); return monstro; }

"criar_jogador"             { yyval = strdup(yytext); return criar_jogador; }
"nome"                      { yyval = strdup(yytext); return nome; }
"vida"                      { yyval = strdup(yytext); return vida; }
"arma"                      { yyval = strdup(yytext); return arma; }
"dano"                      { yyval = strdup(yytext); return dano; }




";"                         { yyval = strdup(yytext); return semicolon; }

":"                         { yyval = strdup(yytext); return colon; }

"("                         { yyval = strdup(yytext); return start_parentheses; }
")"                         { yyval = strdup(yytext); return end_parentheses; }
"{"                         { yyval = strdup(yytext); return start_bracket; }
"}"                         { yyval = strdup(yytext); return end_bracket; }

[0-9]+                      { yyval = strdup(yytext); return DIGIT; }
[a-zA-Z_][a-zA-Z0-9_]*      { yyval = strdup(yytext); return IDENTIFIER; }
\"([^\\\"]|\\.)*\"          { yyval = strdup(yytext); return STRING; }

\n                          { yyval = strdup(yytext); return enter; }
"//".*                      ; 
"\\\n"                      ; 

.                           { yyval = strdup(yytext); printf("%s",yyval); }
%%
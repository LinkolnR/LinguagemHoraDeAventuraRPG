%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "rpgzin.tab.h"
char* yyval;
%}

%option yylineno
%option noyywrap


%%

[ \t]                       ; /* Ignora espaços em branco e tabulações */

"sessao"                    { yyval = strdup(yytext); return sessao; }

"usar_item"                 { yyval = strdup(yytext); return usar_item; }
"ataque"                    { yyval = strdup(yytext); return ataque; }

"personagem"                { yyval = strdup(yytext); return personagem; }
"nome"                      { yyval = strdup(yytext); return nome; }
"vida"                      { yyval = strdup(yytext); return vida; }
"talento"                   { yyval = strdup(yytext); return talento; }
"defeito"                   { yyval = strdup(yytext); return defeito; }
"conceito"                  { yyval = strdup(yytext); return conceito; }
"historia"                  { yyval = strdup(yytext); return historia; }

"mestre_narra"             { yyval = strdup(yytext); return mestre_narra; }

"jogadores_encontram"      { yyval = strdup(yytext); return jogadores_encontram; }
"encontrar_npc"             { yyval = strdup(yytext); return encontrar_npc; }
"jogador_fala"              { yyval = strdup(yytext); return jogador_fala; }
"npc_fala"                  { yyval = strdup(yytext); return npc_fala; }

"encontrar_monstro"         { yyval = strdup(yytext); return encontrar_monstro; }
"tentando"                  { yyval = strdup(yytext); return tentando; }
"pergunta"                  { yyval = strdup(yytext); return pergunta; }

"AND"                       { yyval = strdup(yytext); return AND; }
"OR"                        { yyval = strdup(yytext); return OR; }
"NOT"                       { yyval = strdup(yytext); return NOT; }

"jogadores_estiverem_vivos"     { yyval = strdup(yytext); return jogadores_estiverem_vivos; }
"resposta_da_charada_errada"    { yyval = strdup(yytext); return resposta_da_charada_errada; }
"monstros_vivos"                { yyval = strdup(yytext); return monstros_vivos; }





"("                         { yyval = strdup(yytext); return start_parentheses; }
")"                         { yyval = strdup(yytext); return end_parentheses; }
"{"                         { yyval = strdup(yytext); return start_bracket; }
"}"                         { yyval = strdup(yytext); return end_bracket; }
","                         { yyval = strdup(yytext); return comma; }

[0-9]+                      { yyval = strdup(yytext); return DIGIT; }
\"([^\\\"]|\\.)*\"          { yyval = strdup(yytext); return STRING; }

\n                          { yyval = strdup(yytext); return enter; }
"//".*                      ; 
"\\\n"                      ; 

.                           { yyval = strdup(yytext); printf("%s",yyval); }
%%
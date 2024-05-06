%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "campcode.tab.h"

extern int yylineno;

void yyerror(const char *s);

// Definições de tipos e structs, se necessário
%}

%option noyywrap

%{
// Declaração das variáveis globais ou inclusão de cabeçalhos
%}


%s STRING

%{
// Regras de inicialização e funções auxiliares, se necessário
%}

%%
"sessao"                { return sessao; }
"("                     { return start_parentheses; }
")"                     { return end_parentheses; }
"{"                     { return start_brackets; }
"}"                     { return end_brackets; }
":"                     { return colon; }
"pergunta:"             { return pergunta; }
"usar_item"             { return usar_item; }
"ataque"                { return ataque; }
"personagem"            { return personagem; }
"nome"                  { return nome; }
"vida:"                 { return vida; }
"talento:"              { return talento; }
"defeito:"              { return defeito; }
"conceito:"             { return conceito; }
"historia"              { return historia; }
"mestre_narra:"         { return mestre_narra; }
"jogadores_encontram:"  { return jogadores_encontram; }
"encontrar_npc"         { return encontrar_npc; }
"encontrar_monstro"     { return encontrar_monstro; }
"tentando"              { return tentando; }
"AND"                   { return AND; }
"OR"                    { return OR; }
"NOT"                   { return NOT; }
"jogadores_estiverem_vivos" { return jogadores_estiverem_vivos; }
"resposta_da_charada_errada" { return resposta_da_charada_errada; }
"monstros_vivos"        { return monstros_vivos; }
[0-9]+                  { yylval.string = strdup(yytext); return NUMERO; }
[a-zA-Z_][a-zA-Z0-9_]*  { yylval.string = strdup(yytext); return IDENTIFIER; }
\"([^\\\"]|\\.)*\"      { yylval.string = strdup(yytext); BEGIN(STRING); return STRING; }
.                       { yyerror("Caractere não reconhecido"); }

\n                          { yyval = strdup(yytext); return enter; }
"//".*                      ; 
"\\\n"                      ; 

%%
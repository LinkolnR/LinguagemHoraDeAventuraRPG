%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(const char *s);

// Definições de tipos e structs, se necessário
%}

%union {
    char* string;
    int number;
}

// Definição dos tokens
%token <string> TEXTO
%token <number> NUMERO

%token <string> NOME
%token <string> ITEM
%token <string> ORIGEM
%token <string> DESTINO
%token <string> HISTORIA
%token <number> DANO

%token mestre_narra
%token jogador_fala
%token personagem
%token nome
%token vida
%token talento
%token defeito
%token conceito
%token historia
%token jogadores_encontram
%token encontrar_npc
%token encontrar_monstro
%token usar_item
%token ataque
%token tentando
%token sessao
%token pergunta

%token NOT
%token AND
%token OR

%token jogadores_estiverem_vivos
%token resposta_da_charada_errada
%token monstros_vivos

%token start_parentheses
%token end_parentheses
%token start_brackets
%token end_brackets
%token colon
%token comma
%token quote

%start CAMPANHA

%%

// Definição das regras gramaticais
CAMPANHA: /* empty */ | CAMPANHA SESSAO | CAMPANHA CRIAR_PERSONAGEM;

SESSAO: sessao start_parentheses NUMERO_SESSAO end_parentheses JOGO;

JOGO: NARRACAO | ENCONTRO | PERGUNTA_JOGADOR | ACAO_JOGADOR;

ACAO_JOGADOR: ATAQUE | USAR_ITEM | ATUACAO;

USAR_ITEM: usar_item start_parentheses ITEM start_comma (ORIGEM | (ORIGEM, DESTINO)) end_parentheses;

ATAQUE: ataque start_parentheses DANO start_comma (ORIGEM | (ORIGEM, DESTINO)) end_parentheses;

CRIAR_PERSONAGEM: personagem start_brackets ATRIBUTOS end_brackets;

ATRIBUTOS: nome TEXTO vida start_comma NUMERO start_comma talento TEXTO start_comma defeito TEXTO start_comma conceito TEXTO start_comma historia TEXTO;

NARRACAO: mestre_narra start_colon TEXTO;

ENCONTRO: jogadores_encontram start_colon (NPC | COMBATE | CHARADA);

NPC: encontrar_npc start_parentheses NOME end_parentheses ACAO_NPC;

ACAO_NPC: DIALOGO | DIALOGO_JOGADOR;

DIALOGO_JOGADOR: jogador_fala start_parentheses NOME end_parentheses start_colon TEXTO;

COMBATE: encontrar_monstro start_parentheses NOME end_parentheses start_colon TENTAR;

TENTAR: tentando BOOLEXPRESSION ACAO;

CHARADA: DIALOGO DIALOGO_JOGADOR;

PERGUNTA_JOGADOR: pergunta start_colon TEXTO;

TEXTO: quote (LETRA | NUMERO | ESPECIAL) quote;

BOOLEXPRESSION: TERM | BOOLEXPRESSION (AND | OR) TERM;

TERM: start_parentheses BOOLEXPRESSION end_parentheses | NOT TERM | CONDITION;

CONDITION: jogadores_estiverem_vivos | resposta_da_charada_errada | monstros_vivos;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Erro de sintaxe: %s\n", s);
    exit(1);
}

int main() {
    yyparse();
    return 0;
}

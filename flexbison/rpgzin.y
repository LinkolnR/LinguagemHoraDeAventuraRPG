%{
#include <stdio.h>
int yylex();
void yyerror(const char *s);
%}


%union {
    char* str_value;
    int int_value;
}

%token sessao

%token usar_item
%token ataque

%token personagem
%token nome
%token vida
%token talento
%token defeito
%token conceito
%token historia

%token mestre_narra


%token jogadores_encontram
%token encontrar_npc
%token jogador_fala
%token npc_fala

%token encontrar_monstro
%token tentando
%token pergunta



%token enter
%token start_parentheses
%token end_parentheses
%token start_bracket
%token end_bracket

%token AND
%token OR
%token NOT


%token jogadores_estiverem_vivos
%token resposta_da_charada_errada 
%token monstros_vivos             


%token DIGIT
%token STRING
%token comma


%start CAMPANHA

%%

CAMPANHA:  SESSAO enter |  CRIAR_PERSONAGEM;

SESSAO: sessao start_parentheses DIGIT end_parentheses start_bracket enter JOGO end_bracket;

JOGO: NARRACAO | ENCONTRO | PERGUNTA_JOGADOR | ACAO_JOGADOR;

ACAO_JOGADOR: ATAQUE | USAR_ITEM | STRING; // Alterei TEXTO para STRING

USAR_ITEM: usar_item start_parentheses STRING comma  STRING end_parentheses;

ATAQUE: ataque start_parentheses DIGIT comma STRING end_parentheses;

CRIAR_PERSONAGEM: personagem start_bracket enter ATRIBUTOS end_bracket;

ATRIBUTOS: nome STRING comma enter vida DIGIT comma enter talento STRING comma enter defeito STRING comma enter conceito STRING comma enter historia STRING;

NARRACAO: mestre_narra start_bracket enter STRING end_bracket;

ENCONTRO: jogadores_encontram enter NPC | COMBATE | CHARADA ;

NPC: encontrar_npc start_parentheses STRING end_parentheses ACAO_NPC;

ACAO_NPC: DIALOGO | DIALOGO_JOGADOR;

DIALOGO_JOGADOR: jogador_fala start_parentheses STRING end_parentheses  STRING;

DIALOGO: npc_fala start_parentheses STRING end_parentheses  STRING;

COMBATE: encontrar_monstro start_parentheses STRING end_parentheses  TENTAR;

TENTAR: tentando  BOOLEXPRESSION  ACAO_JOGADOR;

CHARADA: DIALOGO | DIALOGO_JOGADOR;

PERGUNTA_JOGADOR: pergunta  STRING;

BOOLEXPRESSION: TERM | BOOLEXPRESSION start_parentheses AND | OR end_parentheses TERM;

TERM: start_parentheses BOOLEXPRESSION end_parentheses | NOT TERM | CONDITION;

CONDITION: jogadores_estiverem_vivos | resposta_da_charada_errada | monstros_vivos;

%%

void yyerror(const char *s) {
    extern int yylineno;
    extern char *yytext;

    printf("\nError in (%s): symbol \"%s\" (linha %d)\n", s, yytext, yylineno);
}

int main() {
    yyparse();
    return 0;
}
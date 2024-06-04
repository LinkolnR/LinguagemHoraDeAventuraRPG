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

%token npc
%token npc_fala

%token jogador
%token jogador_fala
%token jogador_responde

%token mestre
%token mestre_fala

%token round

%token charada
%token combate
%token combate_on

%token monstro

%token criar_jogador
%token nome
%token vida
%token arma

%token certo
%token errado


%token colon
%token semicolon
%token start_parentheses
%token end_parentheses
%token start_bracket
%token end_bracket

%token DIGIT
%token IDENTIFIER
%token STRING

%token enter

%start SESSAO

%%

SESSAO: sessao start_bracket enter PRE_SET ROUNDS end_bracket;

PRE_SET: CRIAR_JOGADOR  | /* empty */;

CRIAR_JOGADOR: criar_jogador start_parentheses end_parentheses start_bracket enter nome colon STRING enter vida colon DIGIT enter arma colon STRING enter end_bracket enter PRE_SET;

ROUNDS: ROUND |  /* empty */; 

ROUND: round start_parentheses POSSIBILIDADES end_bracket enter ROUNDS;

POSSIBILIDADES :  npc end_parentheses start_bracket enter NPC | jogador end_parentheses start_bracket enter JOGADOR | charada end_parentheses start_bracket enter CHARADA | combate end_parentheses start_bracket enter COMBATE ;

NPC: npc_fala start_parentheses STRING end_parentheses enter jogador_fala start_parentheses STRING end_parentheses enter;

JOGADOR: jogador_fala start_parentheses STRING end_parentheses enter npc_fala start_parentheses STRING end_parentheses enter;
 
CHARADA: charada start_parentheses STRING colon STRING end_parentheses enter jogador_responde start_parentheses STRING end_parentheses enter CHECK;

CHECK: certo start_parentheses BOOLEXPRESSION end_parentheses start_bracket enter ROUND end_bracket enter CHECKAUX ;

CHECKAUX: errado ROUND | /* empty */;

COMBATE: monstro start_parentheses DIGIT semicolon DIGIT end_parentheses enter LOOP_COMBAT; 

LOOP_COMBAT: combate_on start_parentheses end_parentheses start_bracket enter JOGADOR_COMBATE MONSTRO_COMBATE end_bracket enter;

JOGADOR_COMBATE: jogador start_parentheses DIGIT semicolon DIGIT semicolon DIGIT end_parentheses enter JOGADOR_COMBATE | /* empty */;

MONSTRO_COMBATE: monstro start_parentheses DIGIT semicolon DIGIT end_parentheses enter MONSTRO_COMBATE | /* empty */;

BOOLEXPRESSION: DIGIT | IDENTIFIER;

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
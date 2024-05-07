# LinguagemHoraDeAventuraRPG
Linguagem feita para jogar o sistema de RPG de Hora de Aventura



```ebnf
CAMPANHA             =   { λ | SESSAO | CRIAR_PERSONAGEM }
SESSAO               =   { "sessao" , "(" , NUMERO_SESSAO , ")" , "{" , JOGO, "}"  }
JOGO                 =   { NARRACAO | ENCONTRO | PERGUNTA_JOGADOR | ACAO_JOGADOR }
ACAO_JOGADOR         =   { ATAQUE | USAR_ITEM | ATUACAO }
USAR_ITEM            =   { "usar_item" , "(" , { ITEM, ORIGEM | (ORIGEM, DESTINO) }, ")"}
ATAQUE               =   { "ataque" ,  "(" , { DANO, ORIGEM | (ORIGEM, DESTINO) }, ")"}
CRIAR_PERSONAGEM     =   { "personagem", "{" , ATRIBUTOS, "}" }
ATRIBUTOS            =   { "nome", TEXTO,"vida", NUMERO, "talento" , TEXTO , "defeito", TEXTO, "conceito" , TEXTO, "historia" , TEXTO }
NARRACAO             =   { "mestre_narra", "{", TEXTO, "}" }
ENCONTRO             =   { "jogadores_encontram" , NPC | COMBATE | CHARADA }
NPC                  =   { "encontrar_npc", "(", NOME, ")", ACAO_NPC}
ACAO_NPC             =   { DIALOGO | DIALOGO_JOGADOR }
DIALOGO_JOGADOR      =   { "jogador_fala", "(", NOME, ")" , TEXTO }
DIALOGO              =   { "npc_fala", "(", NOME, ")" , TEXTO }
COMBATE              =   { "encontrar_monstro", "(" , NOME, ")", TENTAR}
TENTAR               =   { "tentando" , BOOLEXPRESSION, ACAO }
CHARADA              =   { DIALOGO , DIALOGO_JOGADOR }
PERGUNTA_JOGADOR     =   { "pergunta", TEXTO }
TEXTO                =   { '"', { LETRA | NUMERO | ESPECIAL }, '"' }
BOOLEXPRESSION      =   { TERM, { ("AND" | "OR"), TERM } }
TERM                =   { "(" , BOOLEXPRESSION , ")" | "NOT", TERM | CONDITION }
CONDITION           = { "jogadores_estiverem_vivos" | "resposta_da_charada_errada" | "monstros_vivos}


ORIGEM               =   TEXTO
DESTINO              =   TEXTO
ATUACAO              =   TEXTO
HISTORIA             =   TEXTO
DANO                 =   NUMERO


LETRA                =   [a-zA-Z]
NUMERO               =   "0" | "1" | "2" | ... | "9"
ESPECIAL             =   [!@#$%^&*()]

```


### Exemplo de criação de personagem:
```c
personagem {
    nome "string",
    vida 100,
    talento "teste",
    defeito "medroso",
    conceito "de agua",
    historia "sandnsann" }
```

### Exemplo de criação de sessão:
```c
sessao(1) {
    pergunta "Qual é o seu nome?"}

```

### Exemplo de mestre_narra:
```c
sessao(1) {
    mestre_narra {
        "o que é isso?"}}
        
```


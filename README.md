# LinguagemHoraDeAventuraRPG
Linguagem feita para jogar o sistema de RPG de Hora de Aventura

<!-- 
```ebnf
CAMPANHA            =   { λ | SESSAO | CRIAR_PERSONAGEM }
SESSAO              =   { "sessao" , "(" NUMERO_SESSAO ")" , JOGO  }
JOGO                =   { NARRACAO | ENCONTRO | PERGUNTA_JOGADOR | ACAO_JOGADOR }
ACAO        =   { ATAQUE | USAR_ITEM | ATUACAO }
ATUACAO             =   TEXTO
USAR_ITEM           =   { "usar_item" , "(" , { ITEM, ORIGEM | (ORIGEM, DESTINO) }, ")"}
ATAQUE              =   { "ataque" ,  "(" , { DANO, ORIGEM | (ORIGEM, DESTINO) }, ")"}
DANO                =   NUMERO
CRIAR_PERSONAGEM    =   { "personagem", "{" , ATRIBUTOS, "}" }
ATRIBUTOS           =   { "vida:", NUMERO, "talento:" , TALENTO , "defeito:", DEFEITO, "pontos_de_vida:", PONTOS_DE_VIDA, "conceito:" , CONCEITO, "historia" , HISTORIA }
HISTORIA            =   TEXTO
NARRACAO            =   { "mestre_narra:", TEXTO }
ENCONTRO            =   { "jogadores_encontram:" ,NPC | COMBATE | CHARADA }
NPC                 =   { "encontrar_npc", "(", NOME, ")", ACAO_NPC}
ACAO_NPC            =   { DIALOGO | DIALOGO_JOGADOR }
DIALOGO_JOGADOR     =   { "jogador_fala", "(", NOME, "):" , TEXTO }
COMBATE             =   { "encontrar_monstro", "(" NOME, "):", TENTAR}
TENTAR              =   { "tentando" , BOOLEXPRESSION, ACAO }
CHARADA             =   { DIALOGO , DIALOGO JOGADOR }
PERGUNTA_JOGADOR    =   { "pergunta: ", TEXTO }

ORIGEM              =   TEXTO
DESTINO             =   TEXTO

TEXTO               =   { '"', {λ | LETRA | NUMERO | ESPECIAL }, '"' }
``` -->

```ebnf
CAMPANHA             =   { λ | SESSAO | CRIAR_PERSONAGEM }
SESSAO               =   { "sessao" , "(" , NUMERO_SESSAO , ")" , JOGO  }
JOGO                 =   { NARRACAO | ENCONTRO | PERGUNTA_JOGADOR | ACAO_JOGADOR }
ACAO_JOGADOR         =   { ATAQUE | USAR_ITEM | ATUACAO }
USAR_ITEM            =   { "usar_item" , "(" , { ITEM, ORIGEM | (ORIGEM, DESTINO) }, ")"}
ATAQUE               =   { "ataque" ,  "(" , { DANO, ORIGEM | (ORIGEM, DESTINO) }, ")"}
CRIAR_PERSONAGEM     =   { "personagem", "{" , ATRIBUTOS, "}" }
ATRIBUTOS            =   { "nome", TEXTO,"vida:", NUMERO, "talento:" , TEXTO , "defeito:", TEXTO, "conceito:" , TEXTO, "historia" , TEXTO }
NARRACAO             =   { "mestre_narra:", TEXTO }
ENCONTRO             =   { "jogadores_encontram:" ,NPC | COMBATE | CHARADA }
NPC                  =   { "encontrar_npc", "(", NOME, ")", ACAO_NPC}
ACAO_NPC             =   { DIALOGO | DIALOGO_JOGADOR }
DIALOGO_JOGADOR      =   { "jogador_fala", "(", NOME, "):" , TEXTO }
COMBATE              =   { "encontrar_monstro", "(" , NOME, "):", TENTAR}
TENTAR               =   { "tentando" , BOOLEXPRESSION, ACAO }
CHARADA              =   { DIALOGO , DIALOGO_JOGADOR }
PERGUNTA_JOGADOR     =   { "pergunta: ", TEXTO }
TEXTO                =   { '"', { LETRA | NUMERO | ESPECIAL }, '"' }
BOOLEXPRESSION      =   { TERM, { ("AND" | "OR"), TERM } }
TERM                =   { "(" , BOOLEXPRESSION , ")" | "NOT", TERM | CONDITION }
CONDITION           = { "jogadores_estiverem_vivos" | "resposta_da_charada_errada" | "monstros_vivos}


ORIGEM               =   TEXTO
DESTINO              =   TEXTO
ATUACAO              =   TEXTO
HISTORIA             =   TEXTO
DANO                 =   NUMERO


LETRA                =   "a" | "b" | "c" | ... | "z" | "A" | "B" | "C" | ... | "Z"
NUMERO               =   "0" | "1" | "2" | ... | "9"
ESPECIAL             =   "!" | "@" | "#" | ... | "+" | "-" | "*" | ... | "."

```


### Exemplo de criação de personagem:
```c
personagem {
    nome: "Aldarion"
    vida: 150
    talento: "Magia Elemental"
    defeito: "Fobia de Aranhas"
    conceito: "Mago Viajante"
    historia "Um mago errante em busca de conhecimento perdido."
}
```



### Exemplo de criação de sessão:
```c
sessao(1):
mestre_narra : "Vocês encontram um baú dentro de uma masmorra, o que vocês fazem?"
```

### Exemplo de criação de loop:
```c
sessao(1):
mestre_narra : "Vocês encontram um baú dentro de uma masmorra, o que vocês fazem?"
mestre_narra : "Vocês vão em direção a um baú e ao tentar abrir descobrem que ele é um mímico e entram em combate"
jogadores_encontram: encontrar_monstro("goblin")
tentando(monstros_vivos) {
    
}
tentando(jogadores_estiverem_vivos) {
    mestre_narra: "Vocês continuam explorando a masmorra."
    jogadores_encontram: encontrar_monstro(Goblin): ataque(5, jogador1)
}

```

# LinguagemHoraDeAventuraRPG
Linguagem feita para jogar o sistema de RPG de Hora de Aventura


```ebnf
CAMPANHA            =   { λ | SESSAO, LISTA_PERSONAGEM }
SESSAO              =   { NARRACAO, ENCONTRO, PERGUNTA_JOGADOR }
LISTA_PERSONAGEM    =   { λ | CRIAR_PERSONAGEM | VER_PERSONAGEM }
CRIAR_PERSONAGEM    =   { ATRIBUTOS, HISTORIA }
ATRIBUTOS           =   { "talento" , TALENTO , "defeito", DEFEITO, "pontos de vida", PONTOS_DE_VIDA, "conceito" , CONCEITO}
HISTORIA            =   <string>
NARRACAO            =   <string>
ENCONTRO            =   { NPC | COMBATE | CHARADA }
NPC                 =   { DIALOGO | DIALOGO_JOGADOR }
COMBATE             =   { while VIVOS ACAO QUEBRA  }
CHARADA             =   { DIALOGO , DIALOGO JOGADOR }
PERGUNTA_JOGADOR    =   <string>
```

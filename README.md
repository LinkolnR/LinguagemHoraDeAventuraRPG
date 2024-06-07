# LinguagemHoraDeAventuraRPG
Linguagem feita para jogar o sistema de RPG de Hora de Aventura



```ebnf
SESSAO = "sessao" "{" PRE_SET ROUNDS "}" ;

PRE_SET = CRIAR_JOGADOR | /* empty */ ;

CRIAR_JOGADOR = "criar_jogador" "(" ")" "{" 
                "nome" ":" STRING 
                "vida" ":" DIGIT 
                "arma" ":" STRING 
                "dano" ":" DIGIT 
                "}" PRE_SET ;

ROUNDS = ROUND | /* empty */ ;

ROUND = "round" "(" POSSIBILIDADES ")" "{" ROUNDS "}" ;

POSSIBILIDADES = "npc" ")" "{" NPC "}" 
               | "jogador" ")" "{" JOGADOR "}" 
               | "charada" ")" "{" CHARADA "}" 
               | "combate" ")" "{" MONSTER_LIST "}" ;

NPC = "npc_fala" "(" STRING ")" 
    "jogador_fala" "(" STRING ")" ;

JOGADOR = "jogador_fala" "(" STRING ")" 
         "npc_fala" "(" STRING ")" ;

CHARADA = "charada" "(" STRING ":" STRING ")" 
          "jogador_responde" "(" STRING ")" 
          CHECK ;

CHECK = "certo" "(" BOOLEXPRESSION ")" "{" ROUND "}" CHECKAUX ;

CHECKAUX = "errado" ROUND | /* empty */ ;

MONSTER_LIST = MONSTER | LOOP_COMBAT ;

MONSTER = "monstro" "(" DIGIT ";" DIGIT ")" MONSTER_LIST ;

LOOP_COMBAT = "combate_on" "(" ")" "{" JOGADOR_COMBATE MONSTRO_COMBATE "}" ;

JOGADOR_COMBATE = "jogador" "(" DIGIT ";" DIGIT ")" JOGADOR_COMBATE | /* empty */ ;

MONSTRO_COMBATE = "monstro" "(" DIGIT ";" DIGIT ")" MONSTRO_COMBATE | /* empty */ ;

BOOLEXPRESSION = DIGIT | IDENTIFIER ;

IDENTIFIER = LETTER , { LETTER | DIGIT }* ;

LETTER = "a" | "b" | "c" | ... | "z" 
       | "A" | "B" | "C" | ... | "Z" ;

DIGIT = "0" | "1" | "2" | ... | "9" ;

STRING = '"' , { LETTER | DIGIT } , '"' ;
```


### Exemplo de criação de personagem:
```c
criar_jogador() {
        nome: "Jogador1"
        vida: 100
        arma: "Espada"
        dano: 10
    }
```

### Exemplo de criação de sessão:
```c
sessao {

}
```

### Exemplo de conversa:
```c
sessao{
    criar_jogador(){
        nome: "Jogador 1"
        vida: 100
        arma: "Espada"
        dano: 10
    } 
    round(npc){
        npc_fala("Ola, aventureiro!")
        jogador_fala("Olá, quem e voce?")
    } 
    round(npc){
        npc_fala("Sou o ferreiro dessa vila, buscando alguma arma?")
        jogador_fala("Que demais! Estou buscando uma nova espada")
    }
}
```

### Exemplo de condicional (se na resposta do jogador tiver a resposta ele vai pelo caminho "certo" se não, vai pelo "errado")
```c
    round(charada){
        charada("O que é, o que é? Quanto mais se tira, maior ele fica." : "Buraco" )
        jogador_responde("É o suor!")
        certo(correto){
            round(npc){
                npc_fala("Boa aventureito, pode passar")
                jogador_fala("Ufa, mais uma ponte superada")
            } 
        }
        errado round(npc){
                npc_fala("Você errou, não pode passar")
                jogador_fala("Droga, vou ter que tentar de novo")
            } 
    }

```


### Exemplo de loop (ele repetirá os ataques enquanto tiver monstros vivos ou jogadores vivos, no exemplo o monstro tem 30 de vida e 5 de ataque. O jogador tem 10 de ataque e 100 de vida, então o loop ocorre 6 vezes com a saida do jogador vivo e ambos monstros mortos)
```c
    round(combate){
        monstro(30;5)
        monstro(30;5)
        combate_on(){
            jogador(0;10)
            monstro(0;5)
        }
    }
```
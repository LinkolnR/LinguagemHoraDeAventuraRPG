/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_RPGZIN_TAB_H_INCLUDED
# define YY_YY_RPGZIN_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    sessao = 258,                  /* sessao  */
    usar_item = 259,               /* usar_item  */
    ataque = 260,                  /* ataque  */
    personagem = 261,              /* personagem  */
    nome = 262,                    /* nome  */
    vida = 263,                    /* vida  */
    talento = 264,                 /* talento  */
    defeito = 265,                 /* defeito  */
    conceito = 266,                /* conceito  */
    historia = 267,                /* historia  */
    mestre_narra = 268,            /* mestre_narra  */
    jogadores_encontram = 269,     /* jogadores_encontram  */
    encontrar_npc = 270,           /* encontrar_npc  */
    jogador_fala = 271,            /* jogador_fala  */
    npc_fala = 272,                /* npc_fala  */
    encontrar_monstro = 273,       /* encontrar_monstro  */
    tentando = 274,                /* tentando  */
    pergunta = 275,                /* pergunta  */
    enter = 276,                   /* enter  */
    start_parentheses = 277,       /* start_parentheses  */
    end_parentheses = 278,         /* end_parentheses  */
    start_bracket = 279,           /* start_bracket  */
    end_bracket = 280,             /* end_bracket  */
    AND = 281,                     /* AND  */
    OR = 282,                      /* OR  */
    NOT = 283,                     /* NOT  */
    jogadores_estiverem_vivos = 284, /* jogadores_estiverem_vivos  */
    resposta_da_charada_errada = 285, /* resposta_da_charada_errada  */
    monstros_vivos = 286,          /* monstros_vivos  */
    DIGIT = 287,                   /* DIGIT  */
    STRING = 288,                  /* STRING  */
    comma = 289                    /* comma  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 8 "rpgzin.y"

    char* str_value;
    int int_value;

#line 103 "rpgzin.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_RPGZIN_TAB_H_INCLUDED  */

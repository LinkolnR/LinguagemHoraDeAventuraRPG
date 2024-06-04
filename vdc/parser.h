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

#ifndef YY_YY_PARSER_H_INCLUDED
# define YY_YY_PARSER_H_INCLUDED
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
    npc = 259,                     /* npc  */
    npc_fala = 260,                /* npc_fala  */
    jogador = 261,                 /* jogador  */
    jogador_fala = 262,            /* jogador_fala  */
    jogador_responde = 263,        /* jogador_responde  */
    mestre = 264,                  /* mestre  */
    mestre_fala = 265,             /* mestre_fala  */
    round = 266,                   /* round  */
    charada = 267,                 /* charada  */
    combate = 268,                 /* combate  */
    combate_on = 269,              /* combate_on  */
    monstro = 270,                 /* monstro  */
    criar_jogador = 271,           /* criar_jogador  */
    nome = 272,                    /* nome  */
    vida = 273,                    /* vida  */
    arma = 274,                    /* arma  */
    certo = 275,                   /* certo  */
    errado = 276,                  /* errado  */
    colon = 277,                   /* colon  */
    semicolon = 278,               /* semicolon  */
    start_parentheses = 279,       /* start_parentheses  */
    end_parentheses = 280,         /* end_parentheses  */
    start_bracket = 281,           /* start_bracket  */
    end_bracket = 282,             /* end_bracket  */
    DIGIT = 283,                   /* DIGIT  */
    IDENTIFIER = 284,              /* IDENTIFIER  */
    STRING = 285,                  /* STRING  */
    enter = 286                    /* enter  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 8 "vdc.y"

    char* str_value;
    int int_value;

#line 100 "parser.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_H_INCLUDED  */

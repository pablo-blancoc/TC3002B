/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     USING = 258,
     THE = 259,
     FILEE = 260,
     FILENAME = 261,
     FIND = 262,
     ALL = 263,
     ROWS = 264,
     THAT = 265,
     MEET = 266,
     EQUAL = 267,
     LESS = 268,
     MORE = 269,
     THAN = 270,
     AND = 271,
     OR = 272,
     NUMBER = 273,
     COLUMN = 274,
     ENDOFFILE = 275
   };
#endif
/* Tokens.  */
#define USING 258
#define THE 259
#define FILEE 260
#define FILENAME 261
#define FIND 262
#define ALL 263
#define ROWS 264
#define THAT 265
#define MEET 266
#define EQUAL 267
#define LESS 268
#define MORE 269
#define THAN 270
#define AND 271
#define OR 272
#define NUMBER 273
#define COLUMN 274
#define ENDOFFILE 275




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 21 "pandas_parser.y"
{
    char *str;
}
/* Line 1529 of yacc.c.  */
#line 93 "y.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;


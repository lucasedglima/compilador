%{
#ifdef _WIN32
#define YY_NO_UNISTD_H
#endif

#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern FILE *logFile;
extern YYSTYPE yylval;
%}

digit      [0-9]
letter     [a-zA-Z]
id         {letter}({letter}|{digit}|_)* 
intnum     -?{digit}+
floatnum   -?{digit}+"."{digit}+
caracter   \'({letter}|{digit})\'

%%

"main"              { fprintf(logFile, "TOKEN: MAIN\n"); return MAIN; }
"final"               { fprintf(logFile, "TOKEN: FINAL\n"); return FINAL; }

"int"               { fprintf(logFile, "TOKEN: INT\n"); return INT; }
"char"              { fprintf(logFile, "TOKEN: CHAR\n"); return CHAR; }
"float"             { fprintf(logFile, "TOKEN: FLOAT\n"); return FLOAT; }
"boolean"           { fprintf(logFile, "TOKEN: BOOLEAN\n"); return BOOLEAN; }

"sepa"              { fprintf(logFile, "TOKEN: SEPA\n"); return SEPA; }
"senao"             { fprintf(logFile, "TOKEN: SENAO\n"); return SENAO; }
"while"             { fprintf(logFile, "TOKEN: WHILE\n"); return WHILE; }
"for"               { fprintf(logFile, "TOKEN: FOR\n"); return FOR; }

"receba"            { fprintf(logFile, "TOKEN: RECEBA\n"); return RECEBA; }
"devolva"           { fprintf(logFile, "TOKEN: DEVOLVA\n"); return DEVOLVA; }

":="                { fprintf(logFile, "TOKEN: ATRIB\n"); return ATRIB; }

"=="                { fprintf(logFile, "TOKEN: EQ\n"); return EQ; }
"!="                { fprintf(logFile, "TOKEN: NEQ\n"); return NEQ; }
"<="                { fprintf(logFile, "TOKEN: LE\n"); return LE; }
">="                { fprintf(logFile, "TOKEN: GE\n"); return GE; }
"<"                 { fprintf(logFile, "TOKEN: LT\n"); return LT; }
">"                 { fprintf(logFile, "TOKEN: GT\n"); return GT; }

"&&"                { fprintf(logFile, "TOKEN: AND\n"); return AND; }
"||"                { fprintf(logFile, "TOKEN: OR\n"); return OR; }
"!"                 { fprintf(logFile, "TOKEN: NOT\n"); return NOT; }

"+"                 { fprintf(logFile, "TOKEN: PLUS\n"); return PLUS; }
"-"                 { fprintf(logFile, "TOKEN: MINUS\n"); return MINUS; }
"*"                 { fprintf(logFile, "TOKEN: MULT\n"); return MULT; }
"/"                 { fprintf(logFile, "TOKEN: DIV\n"); return DIV; }
"%"                 { fprintf(logFile, "TOKEN: MOD\n"); return MOD; }

","                 { fprintf(logFile, "TOKEN: COMMA\n"); return COMMA; }
";"                 { fprintf(logFile, "TOKEN: PONTOVIRGULA\n"); return PONTOVIRGULA; }
"("                 { fprintf(logFile, "TOKEN: LPAREN\n"); return LPAREN; }
")"                 { fprintf(logFile, "TOKEN: RPAREN\n"); return RPAREN; }
"{"                 { fprintf(logFile, "TOKEN: LBRACE\n"); return LBRACE; }
"}"                 { fprintf(logFile, "TOKEN: RBRACE\n"); return RBRACE; }

{floatnum}          { yylval.val = atof(yytext); fprintf(logFile, "TOKEN: FLOATNUM (%s)\n", yytext); return FLOATNUM; }
{intnum}            { yylval.val = atoi(yytext); fprintf(logFile, "TOKEN: INTNUM (%s)\n", yytext); return INTNUM; }
{caracter}          { fprintf(logFile, "TOKEN: CHARVAL (%s)\n", yytext); return CHARVAL; }
{id}                { yylval.nome = strdup(yytext); fprintf(logFile, "TOKEN: ID (%s)\n", yytext); return ID; }

[ \t\n\r]+          { /* ignora espaços */ }

.                   { fprintf(stderr, "Caractere inválido: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}

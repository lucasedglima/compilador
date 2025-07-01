%{
#ifdef _WIN32
#define YY_NO_UNISTD_H
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "linguagem.h"

FILE *logFile;

int yylex();
void yyerror(const char *msg) {
    fprintf(stderr, "Erro: %s\n", msg);
}
%}

%union {
  int token;
  double val;
  char *nome;
}

%token MAIN END
%token INT CHAR BOOLEAN FLOAT
%token IF ELSE WHILE FOR
%token INPUT OUTPUT
%token ATRIB
%token EQ NEQ LE GE LT GT
%token AND OR NOT
%token PLUS MINUS MULT DIV MOD
%token COMMA SEMICOLON
%token LPAREN RPAREN LBRACE RBRACE
%token <nome> ID
%token <val> INTNUM FLOATNUM
%token CHARVAL

%type <nome> declaracao atribuicao entrada tipo

%left OR
%left AND
%left EQ NEQ
%left LT GT LE GE
%left PLUS MINUS
%left MULT DIV MOD

%%

programa 
    : MAIN bloco END  { 
        fprintf(logFile, "Programa reconhecido com sucesso!\n");
        printf("Programa reconhecido com sucesso!\n");
      }
    ;

bloco 
    : lista_comandos
    ;

lista_comandos 
    : /* vazio */
    | lista_comandos comando
    ;

comando 
    : declaracao SEMICOLON {
        fprintf(logFile, "Comando: declaracao tipo %s\n", $1);
      }
    | atribuicao SEMICOLON {
        fprintf(logFile, "Comando: atribuicao para ID %s\n", $1);
      }
    | entrada SEMICOLON {
        fprintf(logFile, "Comando: entrada para ID %s\n", $1);
      }
    | saida SEMICOLON {
        fprintf(logFile, "Comando: saida\n");
      }
    | condicional
    | repeticao
    ;

declaracao 
    : tipo ID {
        $$ = $2;  // retorna o nome do identificador
      }
    ;

tipo 
    : INT    { $$ = strdup("int"); }
    | CHAR   { $$ = strdup("char"); }
    | BOOLEAN{ $$ = strdup("boolean"); }
    | FLOAT  { $$ = strdup("float"); }
    ;

atribuicao 
    : ID ATRIB expressao {
        $$ = $1;
      }
    ;

entrada 
    : ID ATRIB INPUT LPAREN RPAREN {
        $$ = $1;
      }
    ;

saida 
    : OUTPUT LPAREN expressao RPAREN
    ;

condicional 
    : IF LPAREN expressao RPAREN LBRACE bloco RBRACE
    | IF LPAREN expressao RPAREN LBRACE bloco RBRACE ELSE LBRACE bloco RBRACE
    ;

repeticao 
    : WHILE LPAREN expressao RPAREN LBRACE bloco RBRACE
    ;

expressao 
    : expressao PLUS expressao
    | expressao MINUS expressao
    | expressao MULT expressao
    | expressao DIV expressao
    | expressao MOD expressao
    | expressao EQ expressao
    | expressao NEQ expressao
    | expressao LE expressao
    | expressao GE expressao
    | expressao LT expressao
    | expressao GT expressao
    | expressao AND expressao
    | expressao OR expressao
    | LPAREN expressao RPAREN
    | ID
    | INTNUM
    | FLOATNUM
    | CHARVAL
    ;

%%

int main() {
    logFile = fopen("log_tokens.txt", "w");
    if (!logFile) {
        fprintf(stderr, "Erro ao abrir arquivo de log.\n");
        return 1;
    }

    int res = yyparse();

    fprintf(logFile, "Fim do parse. Resultado: %d\n", res);
    fclose(logFile);
    return res;
}

Compilador simples com analisador léxico e sintático para uma linguagem própria, utilizando **Flex** e **Bison**, como parte do trabalho da disciplina ECOM06A – Compiladores (UNIFEI).

Linguagem Implementada

A linguagem possui as seguintes características:

- Tipos: `int`, `real`, `caractere`
- Operadores: `+`, `-`, `*`, `/`, `=`, `==`, `!=`, `<`, `>`, `<=`, `>=`
- Comandos:
  - Atribuição
  - Estrutura condicional: `sepa (...) { ... } senao { ... }`
  - Estrutura de repetição: `enquanto (...) { ... }`
- Literais:
  - Inteiros: `10`, `0`, `-3`
  - Reais: `3.14`, `-2.7`
  - Caracteres: `'a'`, `'z'`


Compilação

Requisitos:

- MSYS2 com os pacotes:
  - `gcc`
  - `flex`
  - `bison`

Comandos

```bash
flex scanner.l
bison -d parser.y
gcc -o compilador lex.yy.c parser.tab.c lista_var.c

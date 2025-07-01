Compilador simples com analisador léxico e sintático para uma linguagem própria, utilizando **Flex** e **Bison**, como parte do trabalho da disciplina ECOM06A – Compiladores (UNIFEI).

##  Autores

- Lucas Eduardo Gomes de Lima – 2023002037
- João Paulo Motta Travalini - 202300

O projeto tem a seguinte estrutura:

`├── scanner.l
├── parser.y
├── lista_var.c
├── teste.txt
├── README.md`

## Linguagem Implementada

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


## Compilação

Requisitos:

- MSYS2 com os pacotes:
  - `gcc`
  - `flex`
  - `bison`

## Comandos
No terminal MSYS2, execute:
`
flex scanner.l
bison -d parser.y
gcc -o compilador lex.yy.c parser.tab.c lista_var.c
`
## Como Executar
Você pode analisar um programa da linguagem criada executando o compilador com:
`
./compilador teste.txt
`



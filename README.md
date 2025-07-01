Compilador simples com analisador léxico e sintático para uma linguagem própria, utilizando **Flex** e **Bison**, como parte do trabalho da disciplina ECOM06A – Compiladores (UNIFEI).

##  Autores

- Lucas Eduardo Gomes de Lima – 2023002037
- João Paulo Motta Travalini - 202300

##  Estrutura do Projeto

```
.
├── README.md        # Documentação do projeto
├── compilador.exe   # Executável gerado (pode ser recriado)
├── lex.yy.c         # Código gerado pelo Flex (scanner)
├── lista_var.c      # Controle de variáveis declaradas
├── parser.y         # Analisador sintático (gramática Bison)
├── scanner.l        # Analisador léxico (tokens via Flex)
├── teste.txt        # Exemplo de programa com expressão aritmética
└── teste2.txt       # Exemplo de programa com condicional 'sepa'
```

## Descrição dos arquivos:
| Arquivo          | Descrição                                                                                                                                                |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `README.md`      | Arquivo de documentação do projeto, contendo instruções de uso, compilação, exemplos e informações sobre a linguagem implementada.                       |
| `compilador.exe` | Executável gerado após a compilação do projeto (pode ser ignorado ou recriado em outras máquinas).                                                       |
| `lex.yy.c`       | Arquivo gerado automaticamente pelo Flex a partir do `scanner.l`. Contém o código C responsável pelo reconhecimento dos tokens léxicos.                  |
| `lista_var.c`    | Arquivo auxiliar contendo a implementação da estrutura de controle de variáveis. Ele verifica se identificadores foram declarados antes de serem usados. |
| `parser.y`       | Arquivo principal do analisador sintático. Define a gramática da linguagem com as regras de produção e as ações semânticas que produzem a saída.         |
| `scanner.l`      | Define o analisador léxico. Contém as expressões regulares usadas para identificar palavras-chave, operadores, identificadores, números, símbolos, etc.  |
| `teste.txt`      | Programa de exemplo da linguagem criada. Usado para testar a análise léxica e sintática.                                                                 |
| `teste2.txt`     | Outro exemplo de código válido na linguagem, com testes de estruturas condicionais e expressões.                                                         |

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
Para analisar um programa da linguagem criada executando o compilador com:
`
./compilador teste.txt
`



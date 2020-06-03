## Semantic Analysis

For Compiling YACC Program:

Write lex program in a file parser.l and yacc in a file parser.y
Open Terminal and Navigate to the Directory where you have saved the files.

Steps to Compile & Run:
```shell
    1) lex parser.l
    2) yacc -d parser.y
    3) gcc y.tab.c lex.yy.c -w
    4) ./a.out tests/test_number.c
```
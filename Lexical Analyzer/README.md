# Lexical Analyzer for C-language Compiler
Lexical Analysis is the first phase out of the six main phases of a compiler.<br/>
A lexical analyzer works to identify all the tokens present in the source language code, based on the rules and the grammar of the source language and then stores the identified tokens in a data structure known as the Symbol Table.<br/> 
The lexical analyzer scans the source programs to fish out ‘Lexemes’ and categorizes them into various ‘Token’ categories.<br/>

The command used for executing testcases and saving results:</br>
> for i in ./tests/*.c; do rm "$i"_results.out; ./a.out "$i" >> "$i"_results.out; done; 
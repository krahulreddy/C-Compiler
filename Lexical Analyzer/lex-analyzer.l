%{
	#include <stdio.h>
	#include <string.h>
	

	struct symbolTable
	{
		char name[100];
		char type[100];
		int length;
	}ST[1001];

	struct constantTable
	{
		char name[100];
		char type[100];
		int length;
	}CT[1001];

	int hash(char *str)
	{
		int value = 0;
		for(int i = 0 ; i < strlen(str) ; i++)
		{
			value = 10*value + (str[i] - 'A');
			value = value % 1001;
			while(value < 0)
				value = value + 1001;
		}
		return value;
	}

	int lookup(char *str , int lookupMode)
	{
		if(lookupMode == 0)
		{
			int value = hash(str);
			if(ST[value].length == 0)
			{
				return 0;
			}
			else if(strcmp(ST[value].name,str)==0)
			{
				return 1;
			}
			else
			{
				for(int i = value + 1 ; i!=value ; i = (i+1)%1001)
				{
					if(strcmp(ST[i].name,str)==0)
					{
						return 1;
					}
				}
				return 0;
			}
		}
		else
		{
			int value = hash(str);
			if(CT[value].length == 0)
				return 0;
			else if(strcmp(CT[value].name,str)==0)
				return 1;
			else
			{
				for(int i = value + 1 ; i!=value ; i = (i+1)%1001)
				{
					if(strcmp(CT[i].name,str)==0)
					{
						return 1;
					}
				}
				return 0;
			}
		}
	}

	void insert(char *str1, char *str2, int insertMode)
	{
		if(insertMode == 0)
		{
			if(lookup(str1, 0))
			{
				return;
			}
			else
			{
				int value = hash(str1);
				if(ST[value].length == 0)
				{
					strcpy(ST[value].name,str1);
					strcpy(ST[value].type,str2);
					ST[value].length = strlen(str1);
					return;
				}

				int pos = 0;

				for (int i = value + 1 ; i!=value ; i = (i+1)%1001)
				{
					if(ST[i].length == 0)
					{
						pos = i;
						break;
					}
				}

				strcpy(ST[pos].name,str1);
				strcpy(ST[pos].type,str2);
				ST[pos].length = strlen(str1);
			}
		}
		else
		{
			if(lookup(str1, 1))
				return;
			else
			{
				int value = hash(str1);
				if(CT[value].length == 0)
				{
					strcpy(CT[value].name,str1);
					strcpy(CT[value].type,str2);
					CT[value].length = strlen(str1);
					return;
				}

				int pos = 0;

				for (int i = value + 1 ; i!=value ; i = (i+1)%1001)
				{
					if(CT[i].length == 0)
					{
						pos = i;
						break;
					}
				}

				strcpy(CT[pos].name,str1);
				strcpy(CT[pos].type,str2);
				CT[pos].length = strlen(str1);
			}
		}
	}

	void printTable(int printMode)
	{
		if(printMode == 0)
		{
			for(int i = 0 ; i < 1001 ; i++)
			{
				if(ST[i].length == 0)
				{
					continue;
				}

				printf("\t%s\t\t%s\n",ST[i].name, ST[i].type);
			}
		}
		else
		{
			for(int i = 0 ; i < 1001 ; i++)
			{
				if(CT[i].length == 0)
					continue;

				printf("\t%s\t\t%s\n",CT[i].name, CT[i].type);
			}
		}
	}
%}


operator [[<][=]|[>][=]|[=][=]|[!][=]|[>]|[<]|[\|][\|]|[&][&]|[\!]|[=]|[\^]|[\+][=]|[\-][=]|[\*][=]|[\/][=]|[\%][=]|[\+][\+]|[\-][\-]|[\+]|[\-]|[\*]|[\/]|[\%]|[&]|[\|]|[~]|[<][<]|[>][>]]
floatNumber ([0-9]*)\.([0-9]+)
intNumber [1-9][0-9]*|0
postNumber [;|,|" "|\)|<|>|=|\!|\||&|\+|\-|\*|\/|\%|~|\]|\}|:|\n|\t|\^]
postIdentifier [" "|;|,|\(|\)|<|>|=|\!|\||&|\+|\-|\*|\/|\%|~|\n|\.|\{|\^|\t|\]]

%%

\n  {yylineno++; printf("\n%d", yylineno);}
([#][" "]*(include)[ ]*([<]?)([A-Za-z]+)[.]?([A-Za-z]*)([>]?))/["\n"|\/|" "|"\t"] {printf("\t\t%s \t\tPre Processor directive\n",yytext);}
([#][" "]*(define)[" "]*([A-Za-z]+)(" ")*({floatNumber}|{intNumber}))/["\n"|\/|" "|"\t"] {printf("\t\t%s \t\tMacro\n",yytext);}
\/\/(.*) {printf("\t\t\t%s \t\t\t- SINGLE LINE COMMENT\n", yytext);}				
\/\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+\/ {printf("\t\t\t%s \t\t\tMULTI LINE COMMENT\n", yytext);}
[ \n\t] ;
; {printf("\t\t\t%s \t\t\tSEMICOLON DELIMITER\n", yytext);}
, {printf("\t\t\t%s \t\t\tCOMMA DELIMITER\n", yytext);}
\{ {printf("\t\t\t%s \t\t\tOPENING BRACES\n", yytext);}
\} {printf("\t\t\t%s \t\t\tCLOSING BRACES\n", yytext);}
\( {printf("\t\t\t%s \t\t\tOPENING BRACKETS\n", yytext);}
\) {printf("\t\t\t%s \t\t\tCLOSING BRACKETS\n", yytext);}
\[ {printf("\t\t\t%s \t\t\tSQUARE OPENING BRACKETS\n", yytext);}
\] {printf("\t\t\t%s \t\t\tSQUARE CLOSING BRACKETS\n", yytext);}
\: {printf("\t\t\t%s \t\t\tCOLON DELIMITER\n", yytext);}
\\ {printf("\t\t\t%s \t\t\tFSLASH\n", yytext);}
\. {printf("\t\t\t%s \t\t\tDOT DELIMITER\n", yytext);}

auto|double|int|struct|break|else|long|switch|case|enum|register|typedef|char|extern|return|union|continue|for|signed|void|do|if|static|while|default|goto|sizeof|volatile|const|float|short|unsigned|main/[\(|" "|\{|;|:|"\n"|"\t"] {printf("\t\t\t%s \t\t\tKEYWORD\n", yytext); insert(yytext, "KEYWORD", 0);}
\"[^\n]*\"/[;|,|\)|\}] {printf("\t\t\t%s \t\t\tSTRING CONSTANT\n", yytext); insert(yytext,"STRING CONSTANT", 1);}
\'[A-Z|a-z]\'/[;|,|\)|:|\}] {printf("\t\t\t%s \t\t\tCharacter CONSTANT\n", yytext); insert(yytext,"Character CONSTANT", 1);}
[a-z|A-Z]([a-z|A-Z]|[0-9])*/\[ {printf("\t\t\t%s \t\t\tARRAY IDENTIFIER\n", yytext); insert(yytext, "IDENTIFIER", 0);}

{operator}/[a-z]|[0-9]|;|" "|[A-Z]|\(|\"|\'|\)|\n|\t {printf("\t\t\t%s \t\t\tOPERATOR\n", yytext);} 

{intNumber}/{postNumber} {printf("\t\t\t%s \t\t\tNUMBER CONSTANT\n", yytext); insert(yytext, "NUMBER CONSTANT", 1);}
{floatNumber}/{postNumber} {printf("\t\t\t%s \t\t\tFloating CONSTANT\n", yytext); insert(yytext, "Floating CONSTANT", 1);}
[A-Za-z_][A-Za-z_0-9]*/{postIdentifier} {printf("\t\t\t%s \t\t\tIDENTIFIER\n", yytext); insert(yytext, "IDENTIFIER", 0);}


(.?) {
	printf("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n");
	if(yytext[0]=='#')
	{
		printf("ERROR: Error in Pre-Processor directive at line no. %d\n",yylineno);
	}
	else if(yytext[0]=='/')
	{
		printf("ERROR: UNMATCHED_COMMENT at line no. %d\n",yylineno);
	}
	else if(yytext[0]=='"')
	{
		printf("ERROR: INCOMPLETE_STRING at line no. %d\n",yylineno);
	}
	else
	{
		printf("ERROR: at line no. %d\n",yylineno);
	}
	printf("\t%s\n", yytext);
	printf("\t^^\nXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n");
	return 0;
}

%%


int main(int argc , char **argv){

	int i;
	for (i=0;i<1001;i++)
	{
		ST[i].length=0;
		CT[i].length=0;
	}

	yyin = fopen(argv[1],"r");
	printf("Line\t\t\tLexeme\t\t\tToken Class\n1"); 
	yylex();
	
	printf("\n\nSYMBOL TABLE\n\n");
	printTable(0);
	printf("\n\nCONSTANT TABLE\n\n");
	printTable(1);
}

int yywrap(){
    return 1;
}

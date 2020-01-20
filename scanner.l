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
			if(lookupST(str1))
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
			if(lookupCT(str1))
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

				printf("%s\t%s\n",ST[i].name, ST[i].type);
			}
		}
		else
		{
			for(int i = 0 ; i < 1001 ; i++)
			{
				if(CT[i].length == 0)
					continue;

				printf("%s\t%s\n",CT[i].name, CT[i].type);
			}
		}
	}

%}
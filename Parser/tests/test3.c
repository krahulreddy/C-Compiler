#include<stdio.h>

int main(){
    char s[10]="Welcome!!";
    char s[]="Welcome!!";
    int a[2] = {1, 2}, i = 0;
    char S[20];

    int p;
    if(s[0]=='W'){
        if(s[1]=='e'){
            if(s[2]=='l'){
                for(i = 0; i < 10; i++)
                {
                    printf("A");
                }
            }
            else
            {
                while(i < 10)
                {
                    i++;
                    printf("B");
                }
            }
        }
    }

}

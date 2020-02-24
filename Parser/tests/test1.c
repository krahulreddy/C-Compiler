#include<stdio.h>

int square(int a)
{
    return(a*a);
}

struct abc
{
   int a;
   char b;
};

int main(){
    int n,i;
    char ch;//Character Datatype

    for (i=0;i<n;i++){
        if(i<10){
            int x;
            while(x<10){
                x++;
            }
        }
        int a = 2;
        printf("%d",a);
        a++;
        int b = 4;
        int c = 3; 
        
        int b = 8;
        int c = 3;
        int d = c*(a+b);
        a--;
    }
    struct abc A;
    A.a = 2;
    int num = 2;
    int num2 = square(num);
    
    printf("Square of %d is %d", num, num2);

    return 0;
    /*
    This File Contains Test cases about Datatypes,Keyword,Identifier,Nested For and while loop,
    Conditional Statement,Single line Comment,MultiLine Comment etc.*/
    
}
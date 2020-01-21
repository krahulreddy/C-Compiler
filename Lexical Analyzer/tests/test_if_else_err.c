#include <stdio.h>

int main()
{
    int num;
    
    printf("Enter any number : \n");
    scanf("%d", &num);

    if(num % 2 == 0)
    {
        printf("Number is even\n");
        if(num % 5 == 0)
        {
            printf("Number is divisible by 10\n");
        }
        else if(num % 3)
        {
            printf("Number is divisible by 6\n");
        }
    }
    else
    {
        printf("Number is odd");
    }

    int !!dat = num;
    
    return(0);
    
}
#include <stdio.h>
#define max 10

void main()
{
    int a;
    float b;
    char ch = 'Y';

    printf("Enter two numbers : \n");
    scanf("%d %f", &a, &b);

    while(ch == 95)
    {
        a++;
        b++;

        for(float i = a; i <= b; i++)
        {
            printf("%f | ",i);
        }
        printf("END_LINE\n");
        
        printf("Do you wish to continue : (Y / N)\n");
        scanf("%s", &ch);
    }
}
#include <stdio.h>
#define max 10;

void main()
{
    int a;
    float b;
    char ch;

    printf("Enter two numbers : \n");
    scanf("%d %f", &a, &b);

    while(1)
    {
        for(float i = a; i <= b; i++)
        {
            printf("%f | ",i);
        }
        printf("END_LINE\n");
        
        printf("Do you wish to continue : (Y / N / M)\n");
        scanf("%s", &ch);
        
        if(ch == 'Y'){
            a++;
            b++;
        }
        else if(ch == 'M')
        {
            if(a % 2 != 0 && (int)b % 2 != 0)
            {
                a *= 2;
                b *= 2;
            }
            else if(a % 2 == 0)
                a /= 2;
            else if((int)b % 2 == 0)
                b -= 2;
            else
            {
                while(a<b)
                {
                    a++;
                }
            }
        }
        else if(ch == 'N')
        {
            printf("\nEND_OF_LOOP\n");
            break;
        }
        else
        {
            printf("\nError\n");
            exit(0);
        }
        
    }
    printf("\nFinal values : \na -> %d\nb ->%f\n", a, b);
}
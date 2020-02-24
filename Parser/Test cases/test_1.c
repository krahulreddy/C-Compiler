#include <stdio.h>

//This is a structure
struct duo{
    int first;
    float second;
    double third;
}M;

/*
This is a function
It takes three inputs
*/
void func(int a, float b, double c)
{
    printf("Integer value : %d\n", a);
    printf("Float value : %f\n", b);
    printf("Double value : %lf\n",c);

}
int main()
{
    int a, b, sum, diff, prod, divs, amp, orr;
    float x;
    double c;
    a = 10; b = 6; x = 0.1;

    sum = a + b;    diff = a - b;
    prod = a * b;    divs = a / b;
    amp = a & b;    orr = a | b;

    M.first = a;
    M.second = x;
    M.third = c;

    func(M.first, M.second, M.third);
    
    int count = 0, j, i;
    printf("Enter two numbers between 10 and 20:\n");
    scanf("%d %d", &i, &a);
    
    for(; i < a; i++)
    {
        if(i % 2 == 0)
        {
            count++;
            if(count < 3)
            {
                j = i / 2;
                while(i >= j)
                    i--;
            }
        }
        else if(i == 9)
        {
            printf("\tThis is the last run\n");
        }
        else
        {
            printf("%d -- %d\n", (i-1), i);
        }
    }

    return(0);

}
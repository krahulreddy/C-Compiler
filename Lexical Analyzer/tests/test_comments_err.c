#include <stdio.h>

int sum(int a, int b)
{
    int sum = a + b;
    /*
    This is an example of a function
        /*
        The function here is used to add two numbers
    */

    return(sum);
}

int main()
{
    int a = 10, b = 6; //Declaring Vairables
    /*
    INT - Keyword
    a & b - Identifiers
    */

   //Getting the sum of the numbers
    int ans = sum(a,b);

    //Printing the answer
    printf("Sum : %d", ans);

    return(0);
}
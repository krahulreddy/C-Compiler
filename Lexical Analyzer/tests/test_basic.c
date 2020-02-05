#include <stdio.h>

union duo{
    int first;
    float second;
}X;

void func(int a, float b)
{
    printf("Integer value : %d\n", a);
    printf("Float value : %f\n", b);

}
int main()
{
    int a, b, sum, diff, prod, div, amp, orr;
    a = 10; b = 6;

    sum = a + b;
    diff = a - b;
    prod = a * b;
    div = a / b;
    amp = a & b;
    orr = a | b;

    X.first = a;
    X.second = b;

    func(X.first, X.second);

    return(0);

}
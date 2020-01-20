#include <stdio.h>

//Program to verify various comment structures in C-language. 

void main()
{
    int num;
    /*
    Here 'int' is a Keyword
    'num' is an Identifier
    This is a multi-line comment
    */
    
    num = 10;
    /*
    The Identifier 'num' is initializer the value 10
    /*
        We can increase the value of 'num' by 10
        That is : num = num + 10
    /*
    This is a nested multi-line comment
    */
    
    num = num + 10;
    
    printf("num : %d", num); 
    //Printing the value stored in the Identifier 'num'. This is a single-line comment
}
#include <stdio.h>
void main()
{
    int rec[10][10];
    int att = 0, cls = 0;
    int name = "Ram";                           //Error in structure
    flat rat;                                   //Misspelled keywords
    
    while(cls <= 40)
    {
        cls++;
        rec[cls][0]] = 0;                       //Unbalanced paranthesis
        rat = (float)att / cls * 100;
        if(rat < 80)
        {
            att+;                               //Missing operator
            rec[cls] = 1;
        }
    };                                          //Error in structure
    cls = 0;
    while(cls <= 40)
    {
        printf("%d - ", rec[cls]);             
        cls++;
    }
}

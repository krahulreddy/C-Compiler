#include <stdio.h>

int binarySearch(int arr[], int f, int l, int x)
{
    if(l >= f)
    {
        int m = f + (l - f)/2;
        
        if(arr[ m ] == x)
            return(m);
        else if(arr[ m ] > x)
            return(binarySearch(arr, f, m - 1, x));
        else
            return(binarySearch(arr, m + 1, l, x));
    }
    
    return(-1);
}
int main()
{
    int num, x, i, j;
    
    printf("Enter the size of the array : \n");
    scanf("%d", &num);
    
    int arr[ num ];
    
    printf("Enter the elements of the array in ascending order : \n");
    for(i = 0; i < num; i++)
    {
        scanf("%d", &arr[ i ]);
    }
    
    printf("Enter the element to be searched for : \n");
    scanf("%d", &x);
    
    i = binarySearch(arr, 0, num, x);
    
    if(i == -1)
        printf("%d does not exist in the array\n", x);
    else
        printf("%d exists at the location %d in the array\n", x, i + 1);
        
    return(0);
    
    
}
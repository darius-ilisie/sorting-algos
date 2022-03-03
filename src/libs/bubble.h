#ifndef BUBBLE_H_INCLUDED
#define BUBBLE_H_INCLUDED

void _swap(int *xp, int *yp)
{
    int temp = *xp;
    *xp = *yp;
    *yp = temp;
}
  
void sort(int arr[], int n)
{
   int i, j;
   for (i = 0; i < n-1; i++)      
  
       for (j = 0; j < n-i-1; j++) 
           if (arr[j] > arr[j+1])
              _swap(&arr[j], &arr[j+1]);
}

#endif
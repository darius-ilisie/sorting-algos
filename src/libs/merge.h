#ifndef MERGE_H_INCLUDED
#define MERGE_H_INCLUDED

#include <stdlib.h>

static void _merge(int arr[], int l, int m, int r)
{
    int i, j, k;
    int n1 = m - l + 1;
    int n2 = r - m;
  
    int* L = malloc(n1*sizeof(int));
    int* R = malloc(n2*sizeof(int));
  
    for (i = 0; i < n1; i++)
        L[i] = arr[l + i];
    for (j = 0; j < n2; j++)
        R[j] = arr[m + 1 + j];
  
    i = 0;
    j = 0;
    k = l;
    while (i < n1 && j < n2) {
        if (L[i] <= R[j]) {
            arr[k] = L[i];
            i++;
        }
        else {
            arr[k] = R[j];
            j++;
        }
        k++;
    }

    while (i < n1) {
        arr[k] = L[i];
        i++;
        k++;
    }

    while (j < n2) {
        arr[k] = R[j];
        j++;
        k++;
    }

    free(L);
    free(R);
}
  
static void _mergeSort(int arr[], int l, int r)
{
    if (l < r) {
        int m = l + (r - l) / 2;

        _mergeSort(arr, l, m);
        _mergeSort(arr, m + 1, r);
  
        _merge(arr, l, m, r);
    }
}

static void sort(int arr[], int n) {
    _mergeSort(arr, 0, n-1);
}

#endif
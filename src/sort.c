#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <limits.h>

#ifdef RADIX

#include "libs/radix.h"
#define SORTING_ALGO "Radix "

#endif
#ifdef BUCKET

#include "libs/bucket.h"
#define SORTING_ALGO "Bucket "

#endif
#ifdef MERGE

#include "libs/merge.h"
#define SORTING_ALGO "Merge"

#endif
#ifdef HEAP

#include "libs/heap.h"
#define SORTING_ALGO "Heap"

#endif
#ifdef QUICK

int __cmpfunc (const void * a, const void * b) {
   return ( *(int*)a - *(int*)b );
}

void sort(int arr[], int len) {
    qsort(arr, len, sizeof(int), __cmpfunc);
}
#define SORTING_ALGO "Quicker "

#endif

int main() {
    FILE* fp = fopen("tmp", "r"); //Hmm

    int ARR_SIZE;
    fscanf(fp, "%d", &ARR_SIZE);

    int arr[ARR_SIZE];
    for(int i = 0; i < ARR_SIZE; i++) {
        fscanf(fp, "%d", &arr[i]);
    }

    clock_t start, end, total;
    printf("STARTING SORTING... (%s sort)\n", SORTING_ALGO);
    start = clock();
    sort(arr, ARR_SIZE);
    end = clock();

    total = end - start;
    printf("CYCLES: %ld\n", total);
}
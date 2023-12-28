// Merge Sort Algorithm(Sequential)
// C program for Merge Sort

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

    // Merges two subarrays of arr[].
    // First subarray is arr[l..m]
    // Second subarray is arr[m+1..r]
    void merge(long int arr[], long int l, long int m, long int r)
{
    int i, j, k;
    int n1 = m - l + 1;
    int n2 = r - m;

    // Create temp arrays
    long int L[n1], R[n2];

    // Copy data to temp arrays
    // L[] and R[]
    for (i = 0; i < n1; i++)
        L[i] = arr[l + i];
    for (j = 0; j < n2; j++)
        R[j] = arr[m + 1 + j];

    // Merge the temp arrays back
    // into arr[l..r]
    // Initial index of first subarray
    i = 0;

    // Initial index of second subarray
    j = 0;

    // Initial index of merged subarray
    k = l;
    while (i < n1 && j < n2)
    {
        if (L[i] <= R[j])
        {
            arr[k] = L[i];
            i++;
        }
        else
        {
            arr[k] = R[j];
            j++;
        }
        k++;
    }

    // Copy the remaining elements
    // of L[], if there are any
    while (i < n1)
    {
        arr[k] = L[i];
        i++;
        k++;
    }

    // Copy the remaining elements of
    // R[], if there are any
    while (j < n2)
    {
        arr[k] = R[j];
        j++;
        k++;
    }
}

// l is for left index and r is
// right index of the sub-array
// of arr to be sorted
void mergeSort(long int arr[], long int l, long int r)
{
    if (l < r)
    {
        // Same as (l+r)/2, but avoids
        // overflow for large l and r
        long int m = l + (r - l) / 2;

        // Sort first and second halves
        mergeSort(arr, l, m);
        mergeSort(arr, m + 1, r);

        merge(arr, l, m, r);
    }
}

// UTILITY FUNCTIONS
// Function to print an array
void printArray(long int A[], long int size)
{
    long int i;
    for (i = 0; i < size; i++)
        printf("%d ", A[i]);
    printf("\n");
}

// Driver code
int main()
{

    time_t t;
    long int arr_size;
    clock_t start, elapsedExecution;
    srand((unsigned)time(&t));

    printf("Enter Arr Size: ");
    if (scanf("%ld" , &arr_size) != 1 || arr_size < 0)
    {
        printf("Invalid Size Input!!!");
        return 1;
    }
    
    long int arr[arr_size];
    for (long int i = 0; i < arr_size; i++)
    {
        arr[i] = rand() ;
    }
    

    // printf("Given array is \n");
    // printArray(arr, arr_size);

    start = clock();
    mergeSort(arr, 0, arr_size - 1);
    elapsedExecution = clock() - start;

    // printf("\nSorted array is \n");
    // printArray(arr, arr_size);

    printf("The Algorithm Elapsed Time is: %12.3f\n", (double)elapsedExecution * 1000.0 / CLOCKS_PER_SEC);
    return 0;
}
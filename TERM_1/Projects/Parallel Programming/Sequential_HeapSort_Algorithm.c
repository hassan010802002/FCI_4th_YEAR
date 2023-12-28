//*** Heap Sort Algorithm(Sequential)
// Heap Sort in C

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Function to swap the position of two elements

void swap(int *a, int *b)
{

    int temp = *a;
    *a = *b;
    *b = temp;
}

// To heapify a subtree rooted with node i
// which is an index in arr[].
// n is size of heap
void heapify(int arr[], int N, int i)
{
    // Find largest among root,
    // left child and right child

    // Initialize largest as root
    int largest = i;

    // left = 2*i + 1
    int left = 2 * i + 1;

    // right = 2*i + 2
    int right = 2 * i + 2;

    // If left child is larger than root
    if (left < N && arr[left] > arr[largest])

        largest = left;

    // If right child is larger than largest
    // so far
    if (right < N && arr[right] > arr[largest])

        largest = right;

    // Swap and continue heapifying
    // if root is not largest
    // If largest is not root
    if (largest != i)
    {

        swap(&arr[i], &arr[largest]);

        // Recursively heapify the affected
        // sub-tree
        heapify(arr, N, largest);
    }
}

// Main function to do heap sort
void heapSort(int arr[], int N)
{

    // Build max heap
    for (int i = N / 2 - 1; i >= 0; i--)

        heapify(arr, N, i);

    // Heap sort
    for (int i = N - 1; i >= 0; i--)
    {

        swap(&arr[0], &arr[i]);

        heapify(arr, i, 0);
    }
}

void printArray(int arr[], int N)
{
    for (int i = 0; i < N; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

// Driver's code
int main()
{
    time_t t;
    int arr_size;
    clock_t start, elapsedExecution;
    srand((unsigned)time(&t));

    printf("Enter Arr Size: ");
    if (scanf("%d", &arr_size) != 1 || arr_size < 0)
    {
        printf("Invalid Size Input!!!");
        return 1;
    }

    int arr[arr_size];
    for (int i = 0; i < arr_size; i++)
    {
        arr[i] = rand();
    }

    start = clock();
    heapSort(arr, arr_size);
    elapsedExecution = clock() - start;
    printf("The Algorithm Elapsed Time is: %12.3f\n", (double)elapsedExecution * 1000.0 / CLOCKS_PER_SEC);

    return 0;
}
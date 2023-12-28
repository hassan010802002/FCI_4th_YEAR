#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define MAX_THREADS 10

// Structure to hold thread arguments
typedef struct
{
    int *arr;
    int size;
    int thread_id;
} ThreadArgs;

// Function to swap two elements in an array
void swap(int *a, int *b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
}

// Function to heapify a subtree rooted at index i
void heapify(int *arr, int n, int i)
{
    int smallest = i;
    int left_child = 2 * i + 1;
    int right_child = 2 * i + 2;

    if (left_child < n && arr[left_child] < arr[smallest])
        smallest = left_child;

    if (right_child < n && arr[right_child] < arr[smallest])
        smallest = right_child;

    if (smallest != i)
    {
        swap(&arr[i], &arr[smallest]);
        heapify(arr, n, smallest);
    }
}

// Function to build a min-heap
void buildHeap(int *arr, int n)
{
    for (int i = n / 2 - 1; i >= 0; i--)
    {
        heapify(arr, n, i);
    }
}

// Thread function to perform heap sort on a specific portion of the array
void *heapSortThread(void *arg)
{
    ThreadArgs *args = (ThreadArgs *)arg;

    int start = args->thread_id * (args->size / MAX_THREADS);
    int end = (args->thread_id == MAX_THREADS - 1) ? args->size : start + (args->size / MAX_THREADS);

    // Build a min-heap for the assigned portion of the array
    buildHeap(args->arr + start, end - start);

    pthread_exit(NULL);
}

// Function to merge two sorted halves of an array
void merge(int *arr, int left, int middle, int right)
{
    int n1 = middle - left + 1;
    int n2 = right - middle;

    int leftArr[n1], rightArr[n2];

    for (int i = 0; i < n1; i++)
        leftArr[i] = arr[left + i];

    for (int j = 0; j < n2; j++)
        rightArr[j] = arr[middle + 1 + j];

    int i = 0, j = 0, k = left;

    while (i < n1 && j < n2)
    {
        if (leftArr[i] <= rightArr[j])
        {
            arr[k] = leftArr[i];
            i++;
        }
        else
        {
            arr[k] = rightArr[j];
            j++;
        }
        k++;
    }

    while (i < n1)
    {
        arr[k] = leftArr[i];
        i++;
        k++;
    }

    while (j < n2)
    {
        arr[k] = rightArr[j];
        j++;
        k++;
    }
}

int main()
{
    int n;

    printf("Enter the number of elements: ");
    scanf("%d", &n);

    if (n <= 0)
    {
        printf("Invalid input size.\n");
        return 1;
    }

    int arr[n];

    printf("Enter the elements:\n");
    for (int i = 0; i < n; i++)
    {
        scanf("%d", &arr[i]);
    }

    // Create threads
    pthread_t threads[MAX_THREADS];
    ThreadArgs thread_args[MAX_THREADS];

    for (int i = 0; i < MAX_THREADS; i++)
    {
        thread_args[i].arr = arr;
        thread_args[i].size = n;
        thread_args[i].thread_id = i;
        pthread_create(&threads[i], NULL, heapSortThread, (void *)&thread_args[i]);
    }

    // Wait for threads to finish
    for (int i = 0; i < MAX_THREADS; i++)
    {
        pthread_join(threads[i], NULL);
    }

    // Merge the sorted halves
    for (int size = MAX_THREADS; size < n; size *= 2)
    {
        for (int left = 0; left < n - 1; left += 2 * size)
        {
            int middle = left + size - 1;
            int right = (left + 2 * size - 1 < n - 1) ? left + 2 * size - 1 : n - 1;
            merge(arr, left, middle, right);
        }
    }

    // Print the sorted array
    printf("Sorted array: ");
    for (int i = 0; i < n; i++)
    {
        printf("%d ", arr[i]);
    }
    printf("\n");

    return 0;
}

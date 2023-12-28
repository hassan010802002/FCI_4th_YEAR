#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <sys/time.h>

#define MAX_ARR_SIZE 100
#define NUM_THREADS 4

typedef struct {
    int *arr;
    int size;
} ThreadArgs;

void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

void heapify(int arr[], int n, int i) {
    int max = i;
    int left = (2 * i) + 1;
    int right = (2 * i) + 2;

    if (left < n && arr[left] > arr[max])
        max = left;

    if (right < n && arr[right] > arr[max])
        max = right;

    if (max != i) {
        swap(&arr[i], &arr[max]);
        heapify(arr, n, max);
    }
}

void* buildHeap(void* args) {
    ThreadArgs* myArgs = (ThreadArgs*)args;
    int* arr = myArgs->arr;
    int size = myArgs->size;

    for (int i = size / 2 - 1; i >= 0; i--)
        heapify(arr, size, i);

    return NULL;
}

void parallelHeapSort(int arr[], int size) {
    pthread_t threads[NUM_THREADS];
    ThreadArgs args[NUM_THREADS];

    for (int i = 0; i < NUM_THREADS; i++) {
        args[i].arr = arr + (i * (size / NUM_THREADS));
        args[i].size = size / NUM_THREADS;
        pthread_create(&threads[i], NULL, buildHeap, &args[i]);
    }

    for (int i = 0; i < NUM_THREADS; i++) {
        pthread_join(threads[i], NULL);
    }

    // Build heap for the entire array
    ThreadArgs mainArgs = {arr, size};
    buildHeap(&mainArgs);

    // Perform heap sort
    for (int i = size - 1; i > 0; i--) {
        swap(&arr[0], &arr[i]);
        heapify(arr, i, 0);
    }
}

int main() {
    int n;

    time_t t;
    // int arr_size;
    clock_t start, elapsedExecution;
    srand((unsigned)time(&t));

    printf("Enter Arr Size: ");
    if (scanf("%d", &n) != 1 || n < 0)
    {
        printf("Invalid Size Input!!!");
        return 1;
    }

    int data[n];
    // int arr[n];
    for (int i = 0; i < n; i++)
    {
        data[i] = rand();
    }

    // printf("Enter the number of elements: ");
    // scanf("%d", &n);
    // if (n > MAX_ARR_SIZE) {
    //     printf("Maximum array size exceeded.\n");
    //     return 0;
    // }

    // printf("Enter the elements: ");
    // for (int i = 0; i < n; i++) {
    //     scanf("%d", &data[i]);
    // }

    // struct timeval start_time, end_time;
    // gettimeofday(&start_time, NULL);

    start = clock();
    parallelHeapSort(data, n);
    elapsedExecution = clock() - start;

    // gettimeofday(&end_time, NULL);
    // long execution_time = ((end_time.tv_sec - start_time.tv_sec) + (end_time.tv_usec - start_time.tv_usec)) * 1000;

    // printf("Sorted elements: ");
    // for (int i = 0; i < n; i++) {
    //     printf("%d ", data[i]);
    // }
    printf("\n");

    printf("The Algorithm Elapsed Time is: %12.3f\n", (double)elapsedExecution * 1000.0 / CLOCKS_PER_SEC);

    return 0;
}

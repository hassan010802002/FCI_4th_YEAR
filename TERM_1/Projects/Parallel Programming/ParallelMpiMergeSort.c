#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <sys/time.h>

void merge(int arr[], int l, int m, int r)
{
    int i, j, k;
    int n1 = m - l + 1;
    int n2 = r - m;

    int L[n1], R[n2];

    for (i = 0; i < n1; i++)
        L[i] = arr[l + i];
    for (j = 0; j < n2; j++)
        R[j] = arr[m + 1 + j];

    i = 0;
    j = 0;
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

    while (i < n1)
    {
        arr[k] = L[i];
        i++;
        k++;
    }

    while (j < n2)
    {
        arr[k] = R[j];
        j++;
        k++;
    }
}

void mergeSort(int arr[], int l, int r)
{
    if (l < r)
    {
        int m = l + (r - l) / 2;

        mergeSort(arr, l, m);
        mergeSort(arr, m + 1, r);

        merge(arr, l, m, r);
    }
}

void parallelMerge(int arr[], int localArr[], int localSize, int rank, int p)
{
    int *temp;
    int step, i;

    for (step = 1; step < p; step = 2 * step)
    {
        if (rank % (2 * step) == 0)
        {
            if (rank + step < p)
            {
                MPI_Recv(localArr + localSize, localSize * step, MPI_INT, rank + step, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

                temp = (int *)malloc((localSize + localSize * step) * sizeof(int));
                merge(localArr, 0, localSize - 1, localSize + localSize * step - 1);
                merge(localArr, 0, localSize - 1 + localSize * step, localSize + localSize * step - 1);
                free(temp);
            }
        }
        else
        {
            int tempSize = localSize * step;
            MPI_Send(localArr + localSize, tempSize, MPI_INT, rank - step, 0, MPI_COMM_WORLD);
        }

        MPI_Barrier(MPI_COMM_WORLD);

        if (rank == 0)
        {
            MPI_Gather(MPI_IN_PLACE, localSize, MPI_INT, arr, localSize, MPI_INT, 0, MPI_COMM_WORLD);
        }
        else
        {
            MPI_Gather(localArr, localSize, MPI_INT, arr, localSize, MPI_INT, 0, MPI_COMM_WORLD);
        }

        if (rank == 0)
        {
            merge(arr, 0, (p / 2) * localSize - 1, p * localSize - 1);
        }

        MPI_Bcast(arr, p * localSize, MPI_INT, 0, MPI_COMM_WORLD);
    }
}

double getCurrentTime()
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return (double)tv.tv_sec + (double)tv.tv_usec / 1000000.0;
}

int main(int argc, char **argv)
{
    MPI_Init(&argc, &argv);

    int rank, p;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &p);

    // Assuming a large random array for demonstration
    int n = 1000000;
    int *arr = NULL;
    int *localArr = NULL;

    if (rank == 0)
    {
        arr = (int *)malloc(n * sizeof(int));
        for (int i = 0; i < n; i++)
        {
            arr[i] = rand() % 1000; // Fill with random values
        }
    }

    int localSize = n / p;
    localArr = (int *)malloc(localSize * sizeof(int));

    MPI_Scatter(arr, localSize, MPI_INT, localArr, localSize, MPI_INT, 0, MPI_COMM_WORLD);

    double startTime = getCurrentTime();

    mergeSort(localArr, 0, localSize - 1);

    parallelMerge(arr, localArr, localSize, rank, p);

    double endTime = getCurrentTime();

    if (rank == 0)
    {
        printf("Sorted array: ");
        for (int i = 0; i < n; i++)
        {
            printf("%d ", arr[i]);
        }
        printf("\n");

        printf("Execution Time: %.6f seconds\n", endTime - startTime);
    }

    free(arr);
    free(localArr);

    MPI_Finalize();

    return 0;
}

#include "mpi.h"
#include <stdio.h>

#define BIGSIZE 10000 
#define LITSIZE     1

main( argc, argv )
int argc;
char *argv[];
{
    int myrank, numprocs;
    int i, tag = 50;
    double bigdata[BIGSIZE];
    double litdata[LITSIZE];
    MPI_Status status;
    MPI_Request request;

    MPI_Init( &argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD,&myrank);
    MPI_Comm_size(MPI_COMM_WORLD,&numprocs);

    if (numprocs != 3) {
	fprintf(stderr, "%s must be run with %d processes\n",
		argv[0], 3);
	MPI_Finalize();
	exit(-1);
    }

    for (i = 0; i < BIGSIZE; i++)
	bigdata[i] = 1000;
    for (i = 0; i < LITSIZE; i++)
	litdata[i] =    1;
   
    MPI_Barrier(MPI_COMM_WORLD);

    if (myrank == 0) {
	MPI_Send( bigdata, BIGSIZE, MPI_DOUBLE, 1, tag, MPI_COMM_WORLD);
	MPI_Recv( litdata, LITSIZE, MPI_DOUBLE, 2, tag, MPI_COMM_WORLD, &status);
    }
    else if (myrank == 1) {
	MPI_Irecv(litdata, LITSIZE, MPI_DOUBLE, 2, tag, MPI_COMM_WORLD, &request);
	MPI_Send (litdata, LITSIZE, MPI_DOUBLE, 2, tag, MPI_COMM_WORLD);
	MPI_Recv( bigdata, BIGSIZE, MPI_DOUBLE, 0, tag, MPI_COMM_WORLD, &status);
	MPI_Wait( &request, &status );
    }
    else /* myrank == 2 */ {
	MPI_Recv( litdata, LITSIZE, MPI_DOUBLE, 1, tag, MPI_COMM_WORLD, &status);
	MPI_Send( litdata, LITSIZE, MPI_DOUBLE, 1, tag, MPI_COMM_WORLD);
	MPI_Send( litdata, LITSIZE, MPI_DOUBLE, 0, tag, MPI_COMM_WORLD);
    }

    MPI_Finalize();
}

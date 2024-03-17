/* This program illustrates what can happen when overlapping computation and communication 
   */

#include "mpi.h"
#include "mpe.h"
#include <stdio.h>

/* #define BIGSIZE 10000 */
#define BIGSIZE 20000
#define LITSIZE     1
#define COMPUTE     1

double bigdata[BIGSIZE];

main( argc, argv )
int argc;
char *argv[];
{
    int myrank, numprocs;
    int i, j, dattag = 50, sigtag = 51;
    double litdata[LITSIZE];
    MPI_Status status;
    MPI_Request request;

    MPI_Init( &argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD,&myrank);
    MPI_Comm_size(MPI_COMM_WORLD,&numprocs);

    if (numprocs != 2) {
	fprintf(stderr, "%s must be run with %d processes\n",
		argv[0], 2);
	MPI_Finalize();
	exit(-1);
    }

    if (myrank == 0) {
	MPE_Describe_state(1, 2, "compute", "purple:vlines3");
    }

    for (i = 0; i < BIGSIZE; i++)
	bigdata[i] = 1000;
    for (i = 0; i < LITSIZE; i++)
	litdata[i] =    1;
   
    MPI_Barrier(MPI_COMM_WORLD);
    compute( 1 );
    MPI_Barrier(MPI_COMM_WORLD);
    compute( 2 );
    MPI_Barrier(MPI_COMM_WORLD);

    if (myrank == 0) {
	MPI_Irecv(bigdata, BIGSIZE, MPI_DOUBLE, 1, dattag, MPI_COMM_WORLD, &request );
	MPI_Recv( litdata, LITSIZE, MPI_DOUBLE, 1, sigtag, MPI_COMM_WORLD, &status );
	MPI_Send( litdata, LITSIZE, MPI_DOUBLE, 1, sigtag, MPI_COMM_WORLD );
	compute( 2 );
	MPI_Wait( &request, &status );
    }
    else /* myrank == 1 */ {
	MPI_Isend(bigdata, BIGSIZE, MPI_DOUBLE, 0, dattag, MPI_COMM_WORLD, &request);
	MPI_Send( litdata, LITSIZE, MPI_DOUBLE, 0, sigtag, MPI_COMM_WORLD );
	MPI_Recv( litdata, LITSIZE, MPI_DOUBLE, 0, sigtag, MPI_COMM_WORLD, &status);
	compute( 2 );
	MPI_Wait( &request, &status );
    }

    MPI_Barrier(MPI_COMM_WORLD);

    MPI_Finalize();
}

compute( size )			/* simulate working */
int size;
{
    int i,j;

    MPE_Log_event(1, 0, "");
    for (j = 0; j < size; j++) {
	for (i = 0; i < BIGSIZE; i++)
	    bigdata[i] = sqrt(sqrt(bigdata[i]));
    }
    MPE_Log_event(2, 0, "");
}



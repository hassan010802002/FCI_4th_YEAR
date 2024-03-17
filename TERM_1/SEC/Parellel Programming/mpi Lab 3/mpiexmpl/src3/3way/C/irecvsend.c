/* This program demonstrates what can happen in the irecv-send data exchange
   when one process is late
   */

#include "mpi.h"
#include "mpe.h"
#include <stdio.h>

#define BIGSIZE 10000 
#define LITSIZE     1
#define COMPUTE     1

main( argc, argv )
int argc;
char *argv[];
{
    int myrank, numprocs;
    int i, j, dattag = 50, sigtag = 51;
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

    if (myrank == 0) {
	MPE_Describe_state(1, 2, "compute", "purple:vlines3");
    }

    for (i = 0; i < BIGSIZE; i++)
	bigdata[i] = 1000;
    for (i = 0; i < LITSIZE; i++)
	litdata[i] =    1;
   
    MPI_Barrier(MPI_COMM_WORLD);

    if (myrank == 0) {
	MPI_Recv(bigdata, BIGSIZE, MPI_DOUBLE, 1, dattag, MPI_COMM_WORLD, &status);
    }
    else if (myrank == 1) {
	MPI_Recv( litdata, LITSIZE, MPI_DOUBLE, 2, sigtag, MPI_COMM_WORLD, &status);
	MPI_Recv( bigdata, BIGSIZE, MPI_DOUBLE, 2, dattag, MPI_COMM_WORLD, &status);
	MPI_Send( bigdata, BIGSIZE, MPI_DOUBLE, 0, dattag, MPI_COMM_WORLD);
    }
    else /* myrank == 2 */ {
	MPI_Isend(bigdata, BIGSIZE, MPI_DOUBLE, 1, dattag, MPI_COMM_WORLD, &request);
	MPI_Send( litdata, LITSIZE, MPI_DOUBLE, 1, sigtag, MPI_COMM_WORLD);

	/* simulate working */
	MPE_Log_event(1, 0, "");
	for (j = 0; j < COMPUTE; j++) {
	    for (i = 0; i < BIGSIZE; i++)
		bigdata[i] = sqrt(sqrt(bigdata[i]));
	}
	MPE_Log_event(2, 0, "");

	MPI_Wait( &request, &status );
    }
    MPI_Barrier(MPI_COMM_WORLD);

    MPI_Finalize();
}

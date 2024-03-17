/* This is a doctored jacobi

Processes are in a grid:        0     1


                                3     2
*/

#include "mpi.h"
#include "mpe.h"
#include <stdio.h>

/* #define BIGSIZE 10000 */
#define BIGSIZE 20000
#define LITSIZE     1
#define COMPUTE     1
#define NUMPROCS    4

double bigdata[BIGSIZE];

main( argc, argv )
int argc;
char *argv[];
{
    int myrank, numprocs;
    int i, j, k;
    int dattag = 50, sigtag = 51;
    double litdata[LITSIZE];
    MPI_Status  statuses[4];
    MPI_Request requests[4];
    MPI_Status  status;
    int  namelen;
    char processor_name[MPI_MAX_PROCESSOR_NAME];
    double t_ordered, t_unordered, t1;

    MPI_Init( &argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD,&myrank);
    MPI_Comm_size(MPI_COMM_WORLD,&numprocs);
    MPI_Get_processor_name(processor_name,&namelen);
    fprintf(stderr,"Process %d on %s\n", myrank, processor_name);

    if (numprocs != NUMPROCS) {
	fprintf(stderr, "%s must be run with %d processes\n",
		argv[0], NUMPROCS);
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
    /* Touch data */
    compute(1);
   
    MPI_Barrier(MPI_COMM_WORLD);

    for (k=0; k<3; k++) {
	if (k == 1) t1 = MPI_Wtime();
	if (myrank == 0) {
	    MPI_Send(bigdata, BIGSIZE, MPI_DOUBLE, 1, dattag, MPI_COMM_WORLD );
	    MPI_Recv(bigdata, BIGSIZE, MPI_DOUBLE, 1, dattag, MPI_COMM_WORLD, &status );

	    MPI_Send(bigdata, BIGSIZE, MPI_DOUBLE, 3, dattag, MPI_COMM_WORLD );
	    MPI_Recv(bigdata, BIGSIZE, MPI_DOUBLE, 3, dattag, MPI_COMM_WORLD, &status );
	    compute(1);
	}
	else if (myrank == 1) {
	    MPI_Recv(bigdata, BIGSIZE, MPI_DOUBLE, 0, dattag, MPI_COMM_WORLD, &status );
	    MPI_Send(bigdata, BIGSIZE, MPI_DOUBLE, 0, dattag, MPI_COMM_WORLD );

	    MPI_Send(bigdata, BIGSIZE, MPI_DOUBLE, 2, dattag, MPI_COMM_WORLD );
	    MPI_Recv(bigdata, BIGSIZE, MPI_DOUBLE, 2, dattag, MPI_COMM_WORLD, &status );
	    compute(1);
	}
	else if (myrank == 2) {
	    MPI_Recv(bigdata, BIGSIZE, MPI_DOUBLE, 3, dattag, MPI_COMM_WORLD, &status );
	    MPI_Send(bigdata, BIGSIZE, MPI_DOUBLE, 3, dattag, MPI_COMM_WORLD );

	    MPI_Recv(bigdata, BIGSIZE, MPI_DOUBLE, 1, dattag, MPI_COMM_WORLD, &status );
	    MPI_Send(bigdata, BIGSIZE, MPI_DOUBLE, 1, dattag, MPI_COMM_WORLD );
	    compute(1);
	}
	else /* myrank == 3 */ {
	    MPI_Send(bigdata, BIGSIZE, MPI_DOUBLE, 2, dattag, MPI_COMM_WORLD );
	    MPI_Recv(bigdata, BIGSIZE, MPI_DOUBLE, 2, dattag, MPI_COMM_WORLD, &status );

	    MPI_Recv(bigdata, BIGSIZE, MPI_DOUBLE, 0, dattag, MPI_COMM_WORLD, &status );
	    MPI_Send(bigdata, BIGSIZE, MPI_DOUBLE, 0, dattag, MPI_COMM_WORLD );
	    compute(1);
	}
    }
    t_ordered = MPI_Wtime() - t1;
    t_ordered /= 2.0;

    MPI_Barrier(MPI_COMM_WORLD);

    for (k=0; k<3; k++) {
	if (k == 1) t1 = MPI_Wtime();
	if (myrank == 0) {
	    MPI_Irecv(bigdata, BIGSIZE, MPI_DOUBLE, 1, dattag, MPI_COMM_WORLD, &requests[0] );
	    MPI_Irecv(bigdata, BIGSIZE, MPI_DOUBLE, 3, dattag, MPI_COMM_WORLD, &requests[1] );
	    MPI_Isend(bigdata, BIGSIZE, MPI_DOUBLE, 1, dattag, MPI_COMM_WORLD, &requests[2] );
	    MPI_Isend(bigdata, BIGSIZE, MPI_DOUBLE, 3, dattag, MPI_COMM_WORLD, &requests[3] );
	    MPI_Waitall( 4, requests, statuses );
	    compute(1);
	}
	else if (myrank == 1) {
	    MPI_Irecv(bigdata, BIGSIZE, MPI_DOUBLE, 0, dattag, MPI_COMM_WORLD, &requests[0] );
	    MPI_Irecv(bigdata, BIGSIZE, MPI_DOUBLE, 2, dattag, MPI_COMM_WORLD, &requests[1] );
	    MPI_Isend(bigdata, BIGSIZE, MPI_DOUBLE, 0, dattag, MPI_COMM_WORLD, &requests[2] );
	    MPI_Isend(bigdata, BIGSIZE, MPI_DOUBLE, 2, dattag, MPI_COMM_WORLD, &requests[3] );
	    MPI_Waitall( 4, requests, statuses );
	    compute(1);
	}
	else if (myrank == 2) {
	    MPI_Irecv(bigdata, BIGSIZE, MPI_DOUBLE, 1, dattag, MPI_COMM_WORLD, &requests[0] );
	    MPI_Irecv(bigdata, BIGSIZE, MPI_DOUBLE, 3, dattag, MPI_COMM_WORLD, &requests[1] );
	    MPI_Isend(bigdata, BIGSIZE, MPI_DOUBLE, 1, dattag, MPI_COMM_WORLD, &requests[2] );
	    MPI_Isend(bigdata, BIGSIZE, MPI_DOUBLE, 3, dattag, MPI_COMM_WORLD, &requests[3] );
	    MPI_Waitall( 4, requests, statuses );
	    compute(1);
	}
	else /* myrank == 3 */ {
	    MPI_Irecv(bigdata, BIGSIZE, MPI_DOUBLE, 0, dattag, MPI_COMM_WORLD, &requests[0] );
	    MPI_Irecv(bigdata, BIGSIZE, MPI_DOUBLE, 2, dattag, MPI_COMM_WORLD, &requests[1] );
	    MPI_Isend(bigdata, BIGSIZE, MPI_DOUBLE, 0, dattag, MPI_COMM_WORLD, &requests[2] );
	    MPI_Isend(bigdata, BIGSIZE, MPI_DOUBLE, 2, dattag, MPI_COMM_WORLD, &requests[3] );
	    MPI_Waitall( 4, requests, statuses );
	    compute(1);
	}
    }
    t_unordered = MPI_Wtime() - t1;
    t_unordered /= 2.0;

    MPI_Barrier(MPI_COMM_WORLD);
    printf( "[%d] T_ordered = %f, T_unordered = %f\n", myrank, t_ordered, t_unordered );

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



#include "mpi.h"
#include <stdio.h>

#define BIGSIZE 10000 
#define MAXLITSIZE     1024

int main( argc, argv )
int argc;
char *argv[];
{
    int myrank, numprocs;
    int i, tag = 50, litsize = 1;
    double bigdata[BIGSIZE];
    double litdata[MAXLITSIZE];
    double t1, ts1, ts2;
    MPI_Status status;
    MPI_Request request;

    MPI_Init( &argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD,&myrank);
    MPI_Comm_size(MPI_COMM_WORLD,&numprocs);

    if (numprocs < 3) {
        fprintf(stderr, "%s must be run with at least %d processes\n",
                argv[0], 3);
        MPI_Abort( MPI_COMM_WORLD, 1 );
    }

    if (myrank == 0) {
	for (i=0; i<argc; i++) {
	    if (!argv[i]) continue;
	    if (strcmp( argv[i], "-n" ) == 0) {
		litsize = atoi( argv[i+1] );
		i++;
	    }
	}
    }
    MPI_Bcast( &litsize, 1, MPI_INT, 0, MPI_COMM_WORLD );

    for (i = 0; i < BIGSIZE; i++)
        bigdata[i] = 1000;
    for (i = 0; i < litsize; i++)
        litdata[i] =    1;
   
    MPI_Barrier(MPI_COMM_WORLD);

    if (myrank == 0) {
        MPI_Send( bigdata, BIGSIZE, MPI_DOUBLE, 1, tag, MPI_COMM_WORLD);
        MPI_Recv( litdata, litsize, MPI_DOUBLE, 2, tag, MPI_COMM_WORLD, &status)
;
    }
    else if (myrank == 1) {
        MPI_Irecv(litdata, litsize, MPI_DOUBLE, 2, tag, MPI_COMM_WORLD, &request
);
        MPI_Send (litdata, litsize, MPI_DOUBLE, 2, tag, MPI_COMM_WORLD);
        MPI_Recv( bigdata, BIGSIZE, MPI_DOUBLE, 0, tag, MPI_COMM_WORLD, &status)
;
        MPI_Wait( &request, &status );
    }
    else if (myrank == 2) {
        MPI_Recv( litdata, litsize, MPI_DOUBLE, 1, tag, MPI_COMM_WORLD, &status)
;
	t1 = MPI_Wtime();
        MPI_Send( litdata, litsize, MPI_DOUBLE, 1, tag, MPI_COMM_WORLD);
	ts1 = MPI_Wtime() - t1;
	t1 = MPI_Wtime();
        MPI_Send( litdata, litsize, MPI_DOUBLE, 0, tag, MPI_COMM_WORLD);
	ts2 = MPI_Wtime() - t1;
    }

    if (myrank == 2) {
	printf( 
"[%d] Litsize = %d, Time for first send = %f, for second = %f\n", 
		myrank, litsize, ts1, ts2  );
    }

    MPI_Finalize();
    return 0;
}

#include <stdio.h>
#include <stdlib.h>
#include "mpi.h"

/* 
 * This program demonstrates the effect of unnecessary synchronization
 * even with correct (in the buffering sense) programs
 * The output is best understood from the upshot output
 */
int main( argc, argv )
int argc;
char **argv;
{
    int nr, nc, len;
    int left, right, up, down;    /* Neighbors */
    int rank, row, col;           /* My coords */
    int size, i, loop;
    double *edgein, *edgeout;
    MPI_Request req[4];
    MPI_Status  statuses[4];

    MPI_Init( &argc, &argv );

    /* Set defaults */
    nr = 4;
    nc = 3;
    len = 2048;

    argc--;
    argv++;
    while (argc) {
	if (strcmp(argv[0], "-nr") == 0) {
	    nr = atoi( argv[1] );
	    argc -= 2;
	    argv += 2;
	}
	else if (strcmp(argv[0], "-nc") == 0) {
	    nc = atoi( argv[1] );
	    argc -= 2;
	    argv += 2;
	}
	else if (strcmp(argv[0], "-len") == 0) {
	    len = atoi( argv[1] );
	    argc -= 2;
	    argv += 2;
	}
	else {
	    fprintf( stderr, "Unrecognized arg %s\n", argv[0] );
	    argc--; argv++;
	}
    }

    /* We could use the topology functions, but to maintain exact 
       control, we setup the mesh by hand */
    MPI_Comm_rank( MPI_COMM_WORLD, &rank );
    MPI_Comm_size( MPI_COMM_WORLD, &size );
    if (size < nr * nc) {
	fprintf( stderr, "Size of MPI_COMM_WORLD is too small\n" );
	MPI_Abort( MPI_COMM_WORLD, 1 );
	return 1;
    }
    
    row = rank % nr;
    col = rank / nr;

    left = right = up = down = MPI_PROC_NULL;
    if (row > 0) up = row - 1 + col * nr;
    if (col > 0) left = row + (col - 1) * nr;
    if (row < nr - 1) down = row + 1 + col * nr;
    if (col < nc - 1) right = row + (col + 1) * nr;

    /* Allocate and initialize the data areas */
    edgein = (double *)malloc( len * 8 * sizeof(double) );
    edgeout = edgein + 4 * len;
    
    for (i=0; i<8*len; i++) edgein[i] = 1.0;

    for (loop=0; loop<2; loop++) {
	MPI_Barrier( MPI_COMM_WORLD );
	MPI_Irecv( edgein, len, MPI_DOUBLE, up, 0, MPI_COMM_WORLD, &req[0] );
	MPI_Irecv( edgein+len, len, MPI_DOUBLE, left, 1, MPI_COMM_WORLD, 
		   &req[1] );
	MPI_Irecv( edgein+2*len, len, MPI_DOUBLE, down, 2, MPI_COMM_WORLD, 
		   &req[2] );
	MPI_Irecv( edgein+3*len, len, MPI_DOUBLE, right, 3, MPI_COMM_WORLD, 
		   &req[3] );
	
	MPI_Send( edgeout, len, MPI_DOUBLE, down, 0, MPI_COMM_WORLD );
	MPI_Send( edgeout+len, len, MPI_DOUBLE, right, 1, MPI_COMM_WORLD );
	MPI_Send( edgeout+2*len, len, MPI_DOUBLE, up, 2, MPI_COMM_WORLD );
	MPI_Send( edgeout+3*len, len, MPI_DOUBLE, left, 3, MPI_COMM_WORLD );
	
	MPI_Waitall( 4, req, statuses );
    }

    MPI_Finalize();
    return 0;
}

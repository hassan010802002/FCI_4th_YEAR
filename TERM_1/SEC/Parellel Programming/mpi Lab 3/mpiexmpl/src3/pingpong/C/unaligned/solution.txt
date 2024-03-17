#include <stdio.h>
#include <stdlib.h>
#include "mpi.h"

#define NUMBER_OF_TESTS 10

#define PAD 4096

#define CHAR 1
#define DOUBLE 2
#define INT 3

int main( argc, argv )
int argc;
char **argv;
{
    double       *sbuf, *rbuf, *r_ptr, *s_ptr;
    int          rank;
    int          n;
    double       t1, t2, tmin;
    int          j, k, nloop;
    MPI_Status   status;
    MPI_Datatype dtype;
    int          dtype_size, dtype_kind;
    char         *type_name;

    MPI_Init( &argc, &argv );

    MPI_Comm_rank( MPI_COMM_WORLD, &rank );

    /* Do 3 different datatypes */
    for (dtype_kind = 1; dtype_kind <= 3; dtype_kind++) {
	switch (dtype_kind) {
	case CHAR:
	    dtype = MPI_CHAR; type_name = "char"; break;
	case DOUBLE:
	    dtype = MPI_DOUBLE; type_name = "double"; break;
	case INT:
	    dtype = MPI_INT; type_name = "int"; break;
	}
	if (rank == 0) 
	    printf( "Kind %s\t\tn\ttime (sec)\tRate (MB/sec)\n", type_name );
	MPI_Type_size( dtype, &dtype_size );

	for (n=1; n<1100000; n*=2) {
	    if (n == 0) nloop = 1000;
	    else   	    nloop  = 1000/n;
	    if (nloop < 1) nloop = 1;

	    sbuf = s_ptr = (double *) malloc( n * dtype_size  + PAD );
	    rbuf = r_ptr = (double *) malloc( n * dtype_size  + PAD );
	    if (!sbuf || !rbuf) {
		fprintf( stderr, 
			 "Could not allocate send/recv buffers of size %d\n", 
			 n );
		MPI_Abort( MPI_COMM_WORLD, 1 );
	    }
	    /* Must keep the data aligned to type size, but no more */
	    sbuf += dtype_size * 3;
	    rbuf += dtype_size * 10;
	    tmin = 1000;
	    for (k=0; k<NUMBER_OF_TESTS; k++) {
		if (rank == 0) {
		    /* Make sure both processes are ready */
		    MPI_Sendrecv( MPI_BOTTOM, 0, MPI_INT, 1, 14,
				  MPI_BOTTOM, 0, MPI_INT, 1, 14, 
				  MPI_COMM_WORLD, &status );
		    t1 = MPI_Wtime();
		    for (j=0; j<nloop; j++) {
			MPI_Send( sbuf, n, dtype, 1, k, MPI_COMM_WORLD );
			MPI_Recv( rbuf, n, dtype, 1, k, MPI_COMM_WORLD, 
				  &status );
		    }
		    t2 = (MPI_Wtime() - t1) / nloop;
		    if (t2 < tmin) tmin = t2;
		}
		else if (rank == 1) {
		    /* Make sure both processes are ready */
		    MPI_Sendrecv( MPI_BOTTOM, 0, MPI_INT, 0, 14,
				  MPI_BOTTOM, 0, MPI_INT, 0, 14, 
				  MPI_COMM_WORLD, &status );
		    for (j=0; j<nloop; j++) {
			MPI_Recv( sbuf, n, dtype, 0, k, MPI_COMM_WORLD, 
				  &status );
			MPI_Send( rbuf, n, dtype, 0, k, MPI_COMM_WORLD );
		    }
		}
	    }
	    /* Convert to half the round-trip time */
	    tmin = tmin / 2.0;
	    if (rank == 0) {
		double rate;
		if (tmin > 0) rate = n * dtype_size * 1.0e-6 /tmin;
		else          rate = 0.0;
		printf( "Send/Recv\t\t%d\t%f\t%f\n", n, tmin, rate );
	    }
	    free( s_ptr );
	    free( r_ptr );
	}
    }

    MPI_Finalize( );
    return 0;
}

#include "mpi.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#ifdef DO_LOG
/* We don't really need the mpe.h file, and if we are combining this with
   -mpilog, we'll get the correct libraries */
/* #include "mpe.h" */
#else
#define MPE_Log_event( a, b, c )
#define MPE_Describe_state(a,b,c,d)
#endif

void Compute( cnt, size, databuf )
int    cnt, size;
double *databuf;
{
    int i,j;

    MPE_Log_event(1, 0, "");
    for (j = 0; j < cnt; j++) {
	for (i = 0; i < size; i++)
	    databuf[i] = sqrt(sqrt(databuf[i]));
    }
    MPE_Log_event(2, 0, "");
}

int main( argc, argv )
int argc;
char **argv;
{
    int         rank, size, left_nbr, right_nbr;
    int         false = 0;
    int         true = 1;
    int         i, k, n, m, args[2];
    double      *rbuf, *sbuf, *databuf;
    MPI_Comm    comm;
    MPI_Request r_recv, r_send, r[2];
    MPI_Status  status, statuses[2];
    double      t_comm, t_compute, t_both, t1;

    MPI_Init( &argc, &argv );

    /* Get n and m */
    MPI_Comm_rank( MPI_COMM_WORLD, &rank );
    if (rank == 0) {
	/* Add a compute state */
	MPE_Describe_state(1, 2, "Compute", "purple:vlines3");
	/* Set the defaults */
	args[0] = 20000;
	args[1] = 20000;
	for (i=0; i<argc; i++) {
	    if (!argv[i]) continue;
	    if (strcmp( argv[i], "-n" ) == 0) {
		args[0] = atoi( argv[i+1] );
		i++;
	    }
	    else if (strcmp( argv[i], "-m" ) == 0) {
		args[1] = atoi( argv[i+1] );
		i++;
	    }
	}
    }
    MPI_Bcast( args, 2, MPI_INT, 0, MPI_COMM_WORLD );
    n = args[0];
    m = args[1];
	
    /* Create a "good" communicator and get the neighbors (non-periodic) */
    MPI_Comm_size( MPI_COMM_WORLD, &size );
    MPI_Cart_create( MPI_COMM_WORLD, 1, &size, &false, true, &comm );
    MPI_Cart_shift( comm, 0, 1, &left_nbr, &right_nbr );

    MPI_Comm_size( comm, &size );
    MPI_Comm_rank( comm, &rank );

    /* Get the buffers */
    rbuf = (double *) malloc( n * sizeof(double) );
    sbuf = (double *) malloc( n * sizeof(double) );
    databuf = (double *)malloc( m * sizeof(double) );
    if (!rbuf || !sbuf) {
	fprintf( stderr, "Unable to allocate buffers of size %n\n", n );
	MPI_Abort( MPI_COMM_WORLD, 1 );
    }
    if (!databuf) {
	fprintf( stderr, "Unable to allocate buffers of size %n\n", m );
	MPI_Abort( MPI_COMM_WORLD, 1 );
    }
    for (k=0; k<m; k++) {
	databuf[k] = 1000.0;
    }

    /* Make sure that data has cycled through cache first */
    Compute( 1, m, databuf );
    t1 = MPI_Wtime();
    Compute( 1, m, databuf );
    t_compute= MPI_Wtime() - t1;

    /* For comparison, here's an Irecv/Isend/Wait without any computing */
    MPI_Barrier( comm );
    t1 = MPI_Wtime();
    MPI_Irecv( rbuf, n, MPI_DOUBLE, left_nbr, 5, comm, &r[0] );
    MPI_Isend( sbuf, n, MPI_DOUBLE, right_nbr, 5, comm, &r[1] );
    MPI_Waitall( 2, r, statuses );
    t_comm = MPI_Wtime() - t1;

    /* Simulate the computation */
    MPI_Barrier( comm );
    t1 = MPI_Wtime();
    r_recv = MPI_REQUEST_NULL;
    for (k=0;k<3;k++) {
	/* Wait on the previous recv */
	MPI_Wait( &r_recv, &status );
	MPI_Irecv( rbuf, n, MPI_DOUBLE, left_nbr, k, comm, &r_recv );
	MPI_Isend( sbuf, n, MPI_DOUBLE, right_nbr, k, comm, &r_send );
	Compute( 1, m, databuf );
	MPI_Wait( &r_send, &status );
    }	
    MPI_Wait( &r_recv, &status );
    t_both = MPI_Wtime() - t1;
    t_both /= 3.0;

    if (rank == 0) {
	printf( 
"For n = %d, m = %d, T_comm = %f, T_compute = %f, sum = %f, T_both = %f\n",
		n, m, t_comm, t_compute, t_comm + t_compute, t_both );
    }

    MPI_Finalize( );
    return 0;
}

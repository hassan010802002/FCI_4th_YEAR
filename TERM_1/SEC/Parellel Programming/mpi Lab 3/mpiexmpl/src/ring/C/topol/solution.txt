#include <stdio.h>
#include "mpi.h"

int main( argc, argv )
int argc;
char **argv;
{
    int rank, value, size, false=0;
    int right_nbr, left_nbr;
    MPI_Comm   ring_comm;
    MPI_Status status;

    MPI_Init( &argc, &argv );

    MPI_Comm_size( MPI_COMM_WORLD, &size );
    MPI_Cart_create( MPI_COMM_WORLD, 1, &size, &false, 1, &ring_comm );
    MPI_Cart_shift( ring_comm, 0, 1, &left_nbr, &right_nbr );
    MPI_Comm_rank( ring_comm, &rank );
    MPI_Comm_size( ring_comm, &size );
    do {
	if (rank == 0) {
	    scanf( "%d", &value );
	    MPI_Send( &value, 1, MPI_INT, right_nbr, 0, ring_comm );
	}
	else {
	    MPI_Recv( &value, 1, MPI_INT, left_nbr, 0, ring_comm, 
		      &status );
	    MPI_Send( &value, 1, MPI_INT, right_nbr, 0, ring_comm );
	}
	printf( "Process %d got %d\n", rank, value );
    } while (value >= 0);

    MPI_Finalize( );
    return 0;
}

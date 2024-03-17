#include <stdio.h>
#include "mpi.h"

int main( argc, argv )
int argc;
char **argv;
{
    int rank, size;
    MPI_Comm new_comm;

    MPI_Init( &argc, &argv );
    MPI_Comm_rank( MPI_COMM_WORLD, &rank );
    MPI_Comm_split( MPI_COMM_WORLD, rank == 0, 0, &new_comm );
    if (rank == 0) 
	master_io( MPI_COMM_WORLD, new_comm );
    else
	slave_io( MPI_COMM_WORLD, new_comm );

    MPI_Finalize( );
    return 0;
}

#define MSG_EXIT 1
#define MSG_PRINT_ORDERED 2
#define MSG_PRINT_UNORDERED 3

/* This is the master */
int master_io( master_comm, comm )
MPI_Comm comm;
{
    int        i,j, size, nslave, firstmsg;
    char       buf[256], buf2[256];
    MPI_Status status;

    MPI_Comm_size( master_comm, &size );
    nslave = size - 1;
    while (nslave > 0) {
	MPI_Recv( buf, 256, MPI_CHAR, MPI_ANY_SOURCE, MPI_ANY_TAG, 
		  master_comm, &status );
	switch (status.MPI_TAG) {
	case MSG_EXIT: nslave--; break;
	case MSG_PRINT_UNORDERED:
	    fputs( buf, stdout );
	    break;
	case MSG_PRINT_ORDERED:
	    /* This lets us get any of the ordered messages first, and then
	       start printing them.  There are other ways to do this
	       (see related exercises) */
	    firstmsg = status.MPI_SOURCE;
	    for (i=1; i<size; i++) {
		if (i == firstmsg) 
		    fputs( buf, stdout );
		else {
		    MPI_Recv( buf2, 256, MPI_CHAR, i, MSG_PRINT_ORDERED, 
			  master_comm, &status );
		    fputs( buf2, stdout );
		}
	    }
	    break;
	}
    }
    return 0;
}

/* This is the slave */
int slave_io( master_comm, comm )
MPI_Comm comm;
{
    char buf[256];
    int  rank;
    
    MPI_Comm_rank( comm, &rank );
    sprintf( buf, "Hello from slave %d\n", rank );
    MPI_Send( buf, strlen(buf) + 1, MPI_CHAR, 0, MSG_PRINT_ORDERED, 
	      master_comm );
    
    sprintf( buf, "Goodbye from slave %d\n", rank );
    MPI_Send( buf, strlen(buf) + 1, MPI_CHAR, 0, MSG_PRINT_ORDERED, 
	      master_comm );

    sprintf( buf, "I'm exiting (%d)\n", rank );
    MPI_Send( buf, strlen(buf) + 1, MPI_CHAR, 0, MSG_PRINT_UNORDERED, 
	      master_comm );

    MPI_Send( buf, 0, MPI_CHAR, 0, MSG_EXIT, master_comm );
    return 0;
}

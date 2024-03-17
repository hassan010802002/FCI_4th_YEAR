#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "mpi.h"
#include "jacobi.h"

void Exchange( mesh )
Mesh *mesh;
{
    MPI_Status status;
    double *xlocal     = mesh->xlocal;
    int     maxm       = mesh->maxm;
    int     lrow       = mesh->lrow;
    int     up_nbr     = mesh->up_nbr;
    int     down_nbr   = mesh->down_nbr;
    MPI_Comm ring_comm = mesh->ring_comm;
    int     rank;

    /* First, have ranks 2*i and 2*i+1 exchange, (top and bottom) then 
       2*i+1 and 2*i+2 */
    MPI_Comm_rank( ring_comm, &rank );
    if (rank & 0x1) {
	/* Odd sends down, receives from below */
	MPI_Sendrecv( xlocal + maxm, maxm, MPI_DOUBLE, down_nbr, 0, 
		      xlocal, maxm, MPI_DOUBLE, down_nbr, 0, ring_comm, 
		      &status );
    }
    else {
	/* Even sends up, receives from above */
	MPI_Sendrecv( xlocal + maxm * lrow, maxm, MPI_DOUBLE, up_nbr, 0, 
		      xlocal + maxm * (lrow + 1), maxm, MPI_DOUBLE, up_nbr, 0,
		      ring_comm, &status );
    }
    if (rank & 0x1) {
	/* Odd sends up, receives from above */
	MPI_Sendrecv( xlocal + maxm * lrow, maxm, MPI_DOUBLE, up_nbr, 1, 
		      xlocal + maxm * (lrow + 1), maxm, MPI_DOUBLE, up_nbr, 1,
		      ring_comm, &status );
    }
    else {
	/* Odd sends down, receives from below */
	MPI_Sendrecv( xlocal + maxm, maxm, MPI_DOUBLE, down_nbr, 1, 
		      xlocal, maxm, MPI_DOUBLE, down_nbr, 1, ring_comm, 
		      &status );
    }	
}

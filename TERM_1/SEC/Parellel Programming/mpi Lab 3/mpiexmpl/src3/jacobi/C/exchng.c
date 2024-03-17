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

    /* Send up, then receive from below */
    MPI_Send( xlocal + maxm * lrow, maxm, MPI_DOUBLE, up_nbr, 0,
	      ring_comm );
    MPI_Recv( xlocal, maxm, MPI_DOUBLE, down_nbr, 0, ring_comm, &status );
    /* Send down, then receive from above */
    MPI_Send( xlocal + maxm, maxm, MPI_DOUBLE, down_nbr, 1, ring_comm );
    MPI_Recv( xlocal + maxm * (lrow + 1), maxm, MPI_DOUBLE, up_nbr, 1, 
	      ring_comm, &status );
}

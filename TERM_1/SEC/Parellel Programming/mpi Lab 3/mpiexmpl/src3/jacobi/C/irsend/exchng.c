#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "mpi.h"
#include "jacobi.h"

void ExchangeInit( mesh )
Mesh *mesh;
{
    double *xlocal     = mesh->xlocal;
    int     maxm       = mesh->maxm;
    int     lrow       = mesh->lrow;
    int     up_nbr     = mesh->up_nbr;
    int     down_nbr   = mesh->down_nbr;
    MPI_Comm ring_comm = mesh->ring_comm;

    MPI_Irecv( xlocal, maxm, MPI_DOUBLE, down_nbr, 0, ring_comm, 
	       &mesh->rq[0] );
    MPI_Irecv( xlocal + maxm * (lrow + 1), maxm, MPI_DOUBLE, up_nbr, 1, 
	      ring_comm, &mesh->rq[1] );
}

void Exchange( mesh )
Mesh *mesh;
{
    MPI_Status statuses[4];
    double *xlocal     = mesh->xlocal;
    int     maxm       = mesh->maxm;
    int     lrow       = mesh->lrow;
    int     up_nbr     = mesh->up_nbr;
    int     down_nbr   = mesh->down_nbr;
    MPI_Comm ring_comm = mesh->ring_comm;
    MPI_Request r[4];

    /* Send up and down, then receive */
    MPI_Irsend( xlocal + maxm * lrow, maxm, MPI_DOUBLE, up_nbr, 0,
	       ring_comm, &r[2] );
    MPI_Irsend( xlocal + maxm, maxm, MPI_DOUBLE, down_nbr, 1, ring_comm, 
		&r[3] );
    r[0] = mesh->rq[0];
    r[1] = mesh->rq[1];
    MPI_Waitall( 4, r, statuses );
}

void ExchangeEnd( mesh )
Mesh *mesh;
{
    MPI_Cancel( &mesh->rq[0] );
    MPI_Cancel( &mesh->rq[1] );
}

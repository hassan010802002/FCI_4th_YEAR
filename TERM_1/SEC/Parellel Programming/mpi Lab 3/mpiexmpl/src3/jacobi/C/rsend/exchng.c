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
    MPI_Status statuses[2];
    double *xlocal     = mesh->xlocal;
    int     maxm       = mesh->maxm;
    int     lrow       = mesh->lrow;
    int     up_nbr     = mesh->up_nbr;
    int     down_nbr   = mesh->down_nbr;
    MPI_Comm ring_comm = mesh->ring_comm;

    /* Send up and down, then receive */
    MPI_Rsend( xlocal + maxm * lrow, maxm, MPI_DOUBLE, up_nbr, 0,
	       ring_comm );
    MPI_Rsend( xlocal + maxm, maxm, MPI_DOUBLE, down_nbr, 1, ring_comm );

    MPI_Waitall( 2, mesh->rq, statuses );
}

void ExchangeEnd( mesh )
Mesh *mesh;
{
    MPI_Cancel( &mesh->rq[0] );
    MPI_Cancel( &mesh->rq[1] );
}

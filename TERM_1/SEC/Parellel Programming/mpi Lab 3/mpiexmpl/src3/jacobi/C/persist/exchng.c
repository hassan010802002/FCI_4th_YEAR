#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "mpi.h"
#include "jacobi.h"

void ExchangeInit( mesh )
Mesh *mesh;
{
    double *xlocal     = mesh->xlocal;
    double *xnew       = mesh->xnew;
    int     maxm       = mesh->maxm;
    int     lrow       = mesh->lrow;
    int     up_nbr     = mesh->up_nbr;
    int     down_nbr   = mesh->down_nbr;
    MPI_Comm ring_comm = mesh->ring_comm;

    /* Send up, then receive from below */
    MPI_Recv_init( xlocal, maxm, MPI_DOUBLE, down_nbr, 0, ring_comm, 
		   &mesh->r1[0] );
    MPI_Recv_init( xlocal + maxm * (lrow + 1), maxm, MPI_DOUBLE, up_nbr, 1, 
	      ring_comm, &mesh->r1[1] );
    /* Send down, then receive from above */
    MPI_Send_init( xlocal + maxm * lrow, maxm, MPI_DOUBLE, up_nbr, 0,
	      ring_comm, &mesh->r1[2] );
    MPI_Send_init( xlocal + maxm, maxm, MPI_DOUBLE, down_nbr, 1, ring_comm, 
	       &mesh->r1[3] );

    /* Send up, then receive from below */
    MPI_Recv_init( xnew, maxm, MPI_DOUBLE, down_nbr, 0, ring_comm, 
		   &mesh->r2[0] );
    MPI_Recv_init( xnew + maxm * (lrow + 1), maxm, MPI_DOUBLE, up_nbr, 1, 
	      ring_comm, &mesh->r2[1] );
    /* Send down, then receive from above */
    MPI_Send_init( xnew + maxm * lrow, maxm, MPI_DOUBLE, up_nbr, 0,
	      ring_comm, &mesh->r2[2] );
    MPI_Send_init( xnew + maxm, maxm, MPI_DOUBLE, down_nbr, 1, ring_comm, 
	       &mesh->r2[3] );

    mesh->phase = 0;
}

void Exchange( mesh )
Mesh *mesh;
{
    MPI_Status statuses[4];

    if (mesh->phase == 0) {
	MPI_Startall( 4, mesh->r1 );
	MPI_Waitall( 4, mesh->r1, statuses );
    }
    else {
	MPI_Startall( 4, mesh->r2 );
	MPI_Waitall( 4, mesh->r2, statuses );
    }
    mesh->phase = ! mesh->phase;
}

void ExchangeDone( mesh )
Mesh *mesh;
{
    int i;
    for (i=0; i<4; i++) {
	MPI_Request_free( &mesh->r1[i] );
	MPI_Request_free( &mesh->r2[i] );
    }
}

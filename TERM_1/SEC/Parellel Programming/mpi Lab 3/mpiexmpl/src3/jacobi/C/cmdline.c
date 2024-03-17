#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "mpi.h"
#include "jacobi.h"

/* 
 * Command line arguments are not defined by the MPI Standard.
 * We'll just get the values from process 0 and broadcast them
 *
 * maxm is the number of columns and maxn is the number of rows in the
 * global mesh.  Because the mesh is divided into row-oriented slabs, the
 * resulting pieces are roughly maxm x maxn/p.  See setupmesh.c for
 * the exact dimensions.
 * 
 */

void Get_command_line( rank, argc, argv, maxm, maxn, do_print, maxit )
int rank, argc, *maxm, *maxn, *do_print, *maxit;
char **argv;
{
    int args[4];
    int i;

    if (rank == 0) {
	/* Get maxn from the command line */
	*maxn = DEFAULT_MAXN;
	*maxm = -1;
	for (i=1; i<argc; i++) {
	    if (!argv[i]) continue;
	    if (strcmp( argv[i], "-print" ) == 0) *do_print = 1;
	    else if (strcmp( argv[i], "-n" ) == 0) {
		*maxn = atoi( argv[i+1] );
		i++;
	    }
	    else if (strcmp( argv[i], "-m" ) == 0) {
		*maxm = atoi( argv[i+1] );
		i++;
	    }
	    else if (strcmp( argv[i], "-maxit" ) == 0) {
		*maxit = atoi( argv[i+1] );
		i++;
	    }
	}
	if (*maxm < 0) *maxm = *maxn;
	args[0] = *maxn;
	args[1] = *maxm;
	args[2] = *do_print;
	args[3] = *maxit;
    }
    MPI_Bcast( args, 4, MPI_INT, 0, MPI_COMM_WORLD );
    *maxn     = args[0];
    *maxm     = args[1];
    *do_print = args[2];
    *maxit    = args[3];
}

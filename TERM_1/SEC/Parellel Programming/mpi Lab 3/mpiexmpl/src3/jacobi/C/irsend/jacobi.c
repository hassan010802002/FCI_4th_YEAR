#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "mpi.h"
#include "jacobi.h"
#include "testname.h"

/*
 * do_print controls output useful for debugging and observing,
 * particularly the sloooowwww convergence of this method.
 */
static int do_print = 0; 
static int max_it   = 100;

/*
 * Define the symbol NO_CONV_TEST to mimic an explicit differencing scheme
 */

int main( argc, argv )
int argc;
char **argv;
{
    int        rank, size, i, j, itcnt;
    Mesh       mesh;
#ifndef NO_CONV_TEST
    double     diffnorm, gdiffnorm;
#else
#define gdiffnorm 1.0    
#endif
    double     *swap;
    double     *xlocalrow, *xnewrow;
#ifdef _AIX
#pragma disjoint (*xlocalrow, *xnewrow)
#endif
    int        maxm, maxn, lrow;
    int        k;
    double     t;

    MPI_Init( &argc, &argv );

    MPI_Comm_rank( MPI_COMM_WORLD, &rank );
    MPI_Comm_size( MPI_COMM_WORLD, &size );

    Get_command_line( rank, argc, argv, &maxm, &maxn, &do_print, &max_it );

    Setup_mesh( maxm, maxn, &mesh );

    /* Run twice and take the last time (ensures that code is paged in) */
    for (k=0; k<2; k++) {
	itcnt = 0;
	Init_mesh( &mesh );
	ExchangeInit( &mesh );
	MPI_Barrier( mesh.ring_comm );
	t = MPI_Wtime();
	if (do_print && rank == 0) {
	    printf( "Starting at time %f\n", t ); fflush(stdout);
	}
	/* lrow is used enough that we make a local copy */
	lrow = mesh.lrow;
	do {
	    Exchange( &mesh );
	
	    /* 
	       Compute new values (but not on boundary).
	       Note that many compilers will not generate good code for this
	       (i.e., will not do the obvious strength reductions).
	       The code below gets reasonable performance on some systems;
	       additional rewriting might help others (e.g., 1+j instead of 
	       j+1).

	       Note that without some "disjoint" xnewrow, xlocalrow,
	       extra loads are needed in the loop.
	       */
	    itcnt ++;
#ifndef NO_CONV_TEST
	    diffnorm  = 0.0;
#endif
	    xnewrow	  = mesh.xnew   + 1 * maxm;
	    xlocalrow = mesh.xlocal + 1 * maxm;
	    for (i=1; i<=lrow; i++) {
		for (j=1; j<maxm-1; j++) {
		    double diff;
		    /* Multiply by .25 instead of divide by 4.0 */
		    xnewrow[j] = (xlocalrow[j+1] + 
				  xlocalrow[j-1] +
				  xlocalrow[maxm + j] + 
				  xlocalrow[-maxm + j]) * 0.25;
#ifndef NO_CONV_TEST
		    /* Accumulating diffnorm here can reduce cache misses
		       on large data.  
		       Local variable diff is used because some compilers can not 
		       do this simple common sub-expression analysis 
		       */
		    diff	  = xnewrow[j] - xlocalrow[j];
		    diffnorm += diff * diff;
#endif
		}
		xnewrow   += maxm;
		xlocalrow += maxm;
	    }

	    swap = mesh.xlocal; mesh.xlocal = mesh.xnew ; mesh.xnew = swap;

	    /* Convergence test */
	    ExchangeInit( &mesh );
#ifdef NO_CONV_TEST
	    MPI_Barrier( mesh.ring_comm );
#else
	    MPI_Allreduce( &diffnorm, &gdiffnorm, 1, MPI_DOUBLE, MPI_SUM,
			   mesh.ring_comm );
	    gdiffnorm = sqrt( gdiffnorm );
	    if (do_print && rank == 0) {
		printf( "At iteration %d, diff is %e\n", itcnt, gdiffnorm );
		fflush( stdout );
	    }
#endif
	} while (gdiffnorm > 1.0e-2 && itcnt < max_it);

	t = MPI_Wtime() - t;
	ExchangeEnd( &mesh );
    }

    if (rank == 0) {
#ifdef NO_CONV_TEST
	printf( "%s: %d iterations in %f secs (%f MFlops), m=%d n=%d np=%d\n", 
		TESTNAME, itcnt, t,
		itcnt * (maxm-2.0)*(maxn-2)*(4)*1.0e-6/t, maxm, maxn, size );
#else
	/* 4 ops for new value, 3 for norm */
	printf( 
  "%s: %d iterations in %f secs (%f MFlops); diffnorm %f, m=%d n=%d np=%d\n", 
	        TESTNAME, itcnt, t,
		itcnt * (maxm-2.0)*(maxn-2)*(4+3)*1.0e-6/t, gdiffnorm, 
                maxm, maxn, size );
#endif
    }

    MPI_Comm_free( &mesh.ring_comm );
    MPI_Finalize( );
    return 0;
}

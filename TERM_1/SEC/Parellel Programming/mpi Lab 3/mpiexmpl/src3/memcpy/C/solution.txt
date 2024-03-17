#include <stdio.h>
#include <stdlib.h>
#include "mpi.h"

int main( argc, argv )
int argc;
char **argv;
{
    double t1, t2;
    double tmin;
    int    size, *in_data, *out_data;
    int    j, nloop, k;

    MPI_Init( &argc, &argv );

    printf( "Size (bytes) Time (sec)\tRate (MB/sec)\n" );
    for (size = 1; size < 1000000; size *= 2 ) {
	in_data = (int *)malloc( size * sizeof(int) );
	out_data = (int *)malloc( size * sizeof(int) );
	if (!in_data || !out_data) {
	    fprintf( stderr, "Failed to allocate space for %d ints\n", size );
	    break;
	}
	tmin = 1000.0;
	nloop = 100000/size;
	if (nloop == 0) nloop = 1;
	for (k=0; k < 10; k++) {
	    t1 = MPI_Wtime();
	    for (j=0; j<nloop; j++) 
		memcpy( out_data, in_data, size * sizeof(int) );
	    t2 = (MPI_Wtime() - t1) / nloop;
	    
	    if (t2 < tmin) tmin = t2;
	}
	printf( "%d\t%f\t%f\n", size * sizeof(int), tmin, 
		1.0e-6*size*sizeof(int)/tmin );
	free( in_data );
	free( out_data );
    }

    MPI_Finalize( );
    return 0;
}

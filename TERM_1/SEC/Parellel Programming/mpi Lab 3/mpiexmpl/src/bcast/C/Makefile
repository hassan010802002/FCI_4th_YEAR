# Generated automatically from Makefile.in by configure.
ALL: bcast
DIRS = struct pack
bcast: bcast.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o bcast bcast.c

clean:
	/bin/rm -f bcast *.o
	for dir in $(DIRS) ; do \
	    ( cd $$dir ; make clean ) ; done

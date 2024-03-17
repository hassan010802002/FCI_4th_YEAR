# Generated automatically from Makefile.in by configure.
ALL: ring
SHELL = /bin/sh

DIRS = topol

ring: ring.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o ring ring.c

clean:
	/bin/rm -f ring ring.o
	for dir in $(DIRS) ; do \
	    ( cd $$dir ; make clean ) ; done

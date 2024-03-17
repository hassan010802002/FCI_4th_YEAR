# Generated automatically from Makefile.in by configure.
ALL: memcpy
SHELL = /bin/sh
DIRS = unaligned
OPT = -O
memcpy: memcpy.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o memcpy $(OPT) memcpy.c
clean:
	/bin/rm -f memcpy memcpy.o memcpy.log
	for dir in $(DIRS) ; do \
	    ( cd $$dir ; make clean ) ; done

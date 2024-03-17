# Generated automatically from Makefile.in by configure.
ALL: exchng
SHELL = /bin/sh

DIRS = nonblock shift exchange
exchng: exchng.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o exchng exchng.c

profile.alog: exchng.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o exchng.log -mpilog exchng.c 
	mpirun -np 4 exchng.log
	/bin/mv exchng.log_profile.log profile.alog

clean:
	/bin/rm -f exchng exchng.o exchng.log
	for dir in $(DIRS) ; do \
	    ( cd $$dir ; make clean ) ; done


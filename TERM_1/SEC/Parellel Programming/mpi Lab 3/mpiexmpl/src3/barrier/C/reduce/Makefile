# Generated automatically from Makefile.in by configure.
ALL: barrier
SHELL = /bin/sh
DIRS = 
barrier: barrier.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o barrier -O barrier.c
profile.alog: barrier.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o barrier.log -O -mpilog barrier.c
	mpirun -np 2 barrier.log
	/bin/mv barrier.log_profile.log profile.alog
clean:
	/bin/rm -f barrier barrier.o barrier.log PI*
	#for dir in $(DIRS) ; do \
	#    ( cd $$dir ; make clean ) ; done

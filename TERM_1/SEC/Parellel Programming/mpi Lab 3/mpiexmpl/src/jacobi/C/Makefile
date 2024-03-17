# Generated automatically from Makefile.in by configure.
ALL: jacobi
SHELL = /bin/sh
DIRS = 
jacobi: jacobi.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o jacobi jacobi.c -lm 
profile.alog: jacobi.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o jacobi.log -mpilog jacobi.c -lm
	mpirun -np 4 jacobi.log
	/bin/mv jacobi.log_profile.log profile.alog
clean:
	/bin/rm -f jacobi jacobi.o jacobi.log
	#for dir in $(DIRS) ; do \
	#    ( cd $$dir ; make clean ) ; done

# Generated automatically from Makefile.in by configure.
ALL: collect
SHELL = /bin/sh

collect: collect.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o collect collect.c -lm 
profile.alog: collect.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o collect.log -mpilog collect.c -lm
	mpirun -np 4 collect.log
	/bin/mv collect.log_profile.log profile.alog
clean:
	/bin/rm -f collect collect.o collect.log

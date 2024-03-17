# Generated automatically from Makefile.in by configure.
ALL: vector
SHELL = /bin/sh
DIRS = 
vector: vector.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o vector -O vector.c
profile.alog: vector.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o vector.log -O -mpilog vector.c
	mpirun -np 2 vector.log
	/bin/mv vector.log_profile.log profile.alog
clean:
	/bin/rm -f vector vector.o vector.log
	#for dir in $(DIRS) ; do \
	#    ( cd $$dir ; make clean ) ; done

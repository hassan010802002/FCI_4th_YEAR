# Generated automatically from Makefile.in by configure.
ALL: irecv
SHELL = /bin/sh
DIRS = irecvisend
irecv: irecv.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o irecv -O irecv.c
profile.alog: irecv.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o irecv.log -O -mpilog irecv.c
	mpirun -np 2 irecv.log
	/bin/mv irecv.log_profile.log profile.alog
clean:
	/bin/rm -f irecv irecv.o irecv.log
	for dir in $(DIRS) ; do \
	    ( cd $$dir ; make clean ) ; done

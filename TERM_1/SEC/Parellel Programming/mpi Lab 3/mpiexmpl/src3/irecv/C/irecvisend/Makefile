# Generated automatically from Makefile.in by configure.
ALL: irecvisend
SHELL = /bin/sh
DIRS = 
irecvisend: irecvisend.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o irecvisend -O irecvisend.c
profile.alog: irecv.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o irecvisend.log -O -mpilog irecvisend.c
	mpirun -np 2 irecvisend.log
	/bin/mv irecvisend.log_profile.log profile.alog
clean:
	/bin/rm -f irecvisend irecvisend.o irecvisend.log
	#for dir in $(DIRS) ; do \
	#    ( cd $$dir ; make clean ) ; done

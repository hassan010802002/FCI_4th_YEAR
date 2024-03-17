# Generated automatically from Makefile.in by configure.
ALL: io
SHELL = /bin/sh
DIRS = 
io: io.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o io io.c 
profile.alog: io.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o io.log -mpilog io.c 
	mpirun -np 4 io.log
	/bin/mv io.log_profile.log profile.alog
clean:
	/bin/rm -f io io.o io.log
	#for dir in $(DIRS) ; do \
	#    ( cd $$dir ; make clean ) ; done

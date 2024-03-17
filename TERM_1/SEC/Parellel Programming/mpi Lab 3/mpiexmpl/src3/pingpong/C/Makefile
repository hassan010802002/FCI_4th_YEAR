# Generated automatically from Makefile.in by configure.
ALL: pingpong
SHELL = /bin/sh
DIRS = nb nbhead unaligned mass ssend smass
pingpong: pingpong.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o pingpong -O pingpong.c
profile.alog: pingpong.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o pingpong.log -O -mpilog pingpong.c
	mpirun -np 2 pingpong.log
	/bin/mv pingpong.log_profile.log profile.alog
clean:
	/bin/rm -f pingpong pingpong.o pingpong.log PI*
	for dir in $(DIRS) ; do \
	    ( cd $$dir ; make clean ) ; done

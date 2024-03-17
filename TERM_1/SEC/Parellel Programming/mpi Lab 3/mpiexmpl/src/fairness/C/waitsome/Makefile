# Generated automatically from Makefile.in by configure.
ALL: fairness
SHELL = /bin/sh
DIRS = waitsome
fairness: fairness.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o fairness fairness.c -lm 
profile.alog: fairness.c
	/usr/local/mpi/lib/sun4/ch_p4/mpicc -o fairness.log -mpilog fairness.c -lm
	mpirun -np 4 fairness.log
	/bin/mv fairness.log_profile.log profile.alog
clean:
	/bin/rm -f fairness fairness.o fairness.log
	#for dir in $(DIRS) ; do \
	#    ( cd $$dir ; make clean ) ; done

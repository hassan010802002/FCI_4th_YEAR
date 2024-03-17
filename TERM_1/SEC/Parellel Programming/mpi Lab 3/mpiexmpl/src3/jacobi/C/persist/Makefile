# Generated automatically from Makefile.in by configure.
ALL: jacobi
SHELL = /bin/sh
OPT = -O
MPICC=/usr/local/mpi/lib/sun4/ch_p4/mpicc
MPIRUN=mpirun -maxtime 5
SRCFILES=jacobi.c cmdline.c setupmesh.c exchng.c
OBJFILES=jacobi.o cmdline.o setupmesh.o exchng.o
jacobi: $(OBJFILES)
	$(MPICC) -o jacobi $(OPT) jacobi.o cmdline.o setupmesh.o exchng.o -lm
jacobi.log: $(OBJFILES)
	$(MPICC) -o jacobi.log -mpilog $(OPT) \
		jacobi.o cmdline.o setupmesh.o exchng.o -lm
jacobi-exp.log: $(SRCFILE)
	$(MPICC) -o jacobi-exp.log -mpilog $(OPT) -DNO_CONV_TEST \
		jacobi.c cmdline.c setupmesh.c exchng.c -lm

#
# An important part of understanding the behavior of these programs is
# creating and examining the trace or log files of the operations.  The
# following targets generate the log files by using a feature of the MPICH
# implementation (automatic generation with the -mpilog switch when linking).
# There are 4 versions:
#    profile.alog   - A simple version for a single log
#    profile.$()... - A version for runs with different numbers of processors,
#                     machines, and problem sizes
#    profile-nopoll. - A version like profile.$()..., but uses the -nopoll
#                      switch to change how an MPI implementation reacts
#                      to control messages.
#    profile-exp.    - A version with no convergence testing (and hence no
#                      reduce)
#
profile.alog: jacobi.log
	$(MPIRUN) -np 4 -mvhome -mvback jacobi.log_profile.log jacobi.log
	/bin/mv -f jacobi.log_profile.log profile.alog
# Use this for a particular machine
profile.$(MACH)-$(NP)-$(MAXM)-$(MAXN).alog: jacobi.log
	$(MPIRUN) -np $(NP) -mvhome -mvback jacobi.log_profile.log jacobi.log \
		-m $(MAXM) -n $(MAXN) -maxit 25
	/bin/mv -f jacobi.log_profile.log \
		profile.$(MACH)-$(NP)-$(MAXM)-$(MAXN).alog
profile-exp.$(MACH)-$(NP)-$(MAXM)-$(MAXN).alog: jacobi-exp.log
	$(MPIRUN) -np $(NP) -mvhome \
	-mvback jacobi-exp.log_profile.log jacobi-exp.log \
		-m $(MAXM) -n $(MAXN) -maxit 25
	/bin/mv -f jacobi-exp.log_profile.log \
		profile-exp.$(MACH)-$(NP)-$(MAXM)-$(MAXN).alog
# Use this for a particular machine
profile-nopoll.$(MACH)-$(NP)-$(MAXM)-$(MAXN).alog: jacobi.log
	$(MPIRUN) -np $(NP) -nopoll -mvhome -mvback jacobi.log_profile.log \
		jacobi.log -m $(MAXM) -n $(MAXN) -maxit 25
	/bin/mv -f jacobi.log_profile.log \
		profile-nopoll.$(MACH)-$(NP)-$(MAXM)-$(MAXN).alog

#
# The doall... targets run the tests, generating profiling information,
# for this examples and all related ones.
#  doall - Default tests (Jacobi with convergence tests)
#  doallexplicit - Jacobi with no convergence tests
#  doallnopoll - doall but with -nopoll to mpirun
#
doall:
	@if [ -s related.lst ] ; then \
	for dir in . `cat related.lst` ; do \
	    ( cd $$dir ; echo $$dir ; cat title.txt ; \
	      make MACH=$(MACH) OPT=$(OPT) NP=$(NP) MAXN=$(MAXN) \
		profile.$(MACH)-$(NP)-$(MAXM)-$(MAXN).alog ) ; done ; \
	else \
	      make MACH=$(MACH) OPT=$(OPT) NP=$(NP) MAXN=$(MAXN) \
		profile.$(MACH)-$(NP)-$(MAXM)-$(MAXN).alog ; \
	fi
doallexplicit:
	@if [ -s related.lst ] ; then \
	for dir in . `cat related.lst` ; do \
	    ( cd $$dir ; echo $$dir ; cat title.txt ; \
	      make MACH=$(MACH) OPT=$(OPT) NP=$(NP) MAXN=$(MAXN) \
		profile-exp.$(MACH)-$(NP)-$(MAXM)-$(MAXN).alog ; ) ; done ; \
	else \
	      make MACH=$(MACH) OPT=$(OPT) NP=$(NP) MAXN=$(MAXN) \
		profile-exp.$(MACH)-$(NP)-$(MAXM)-$(MAXN).alog ; \
	fi
doallnopoll:
	@if [ -s related.lst ] ; then \
	for dir in . `cat related.lst` ; do \
	    ( cd $$dir ; echo $$dir ; cat title.txt ; \
	      make MACH=$(MACH) OPT=$(OPT) NP=$(NP) MAXN=$(MAXN) \
		profile-nopoll.$(MACH)-$(NP)-$(MAXM)-$(MAXN).alog ) ; done ; \
	else \
	      make MACH=$(MACH) OPT=$(OPT) NP=$(NP) MAXN=$(MAXN) \
		profile-nopoll.$(MACH)-$(NP)-$(MAXM)-$(MAXN).alog ; \
	fi

compileall:
	@if [ -s related.lst ] ; then \
	for dir in . `cat related.lst` ; do \
	    ( cd $$dir ; echo $$dir ; cat title.txt ; \
	      make OPT=$(OPT) jacobi ; ) ; done ; \
	else \
	      make OPT=$(OPT) jacobi ; \
	fi
compilealllog:
	@if [ -s related.lst ] ; then \
	for dir in . `cat related.lst` ; do \
	    ( cd $$dir ; echo $$dir ; cat title.txt ; \
	      make OPT=$(OPT) jacobi.log jacobi-exp.log ; ) ; done ; \
	else \
	      make OPT=$(OPT) jacobi.log jacobi-exp.log ; \
	fi

.c.o:
	$(MPICC) -c $(OPT) $(DEFN) $*.c
cleanlocal:
	/bin/rm -f jacobi jacobi.o cmdline.o setupmesh.o exchng.o jacobi.log \
	jacobi-exp.log PI*
clean: cleanlocal
	if [ -s related.lst ] ; then \
	    for dir in `cat related.lst` ; do \
	        ( cd $$dir ; make clean ) ; done ; fi
output:
	$(MPICC) -o jacobi $(OPT) jacobi.c cmdline.c setupmesh.c exchng.c -lm 
	if [ -z "$(NP)" ] ; then \
	    $(MPIRUN) -np 4 jacobi ; \
	else
	    $(MPIRUN) -np $(NP) jacobi ; fi
	    

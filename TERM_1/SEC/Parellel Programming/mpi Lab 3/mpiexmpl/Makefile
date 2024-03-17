# Generated automatically from Makefile.in by configure.
DIRS = hellow bcast ring pi fairness exchange jacobi collect jacobicmpl
DIRS2 = io ioserv
DIRS3 = memcpy vector pingpong barrier 3way circulate jacobi
SHELL = /bin/sh
test:
	maint/makecourse
	maint/makecourse -src=src2
	maint/makecourse -src=src3
install:
	make clean
	maint/makecourse -root=http://www.mcs.anl.gov/mpi/tutorial/mpiexmpl
	maint/makecourse -root=http://www.mcs.anl.gov/mpi/tutorial/mpiexmpl \
		-src=src2
	maint/makecourse -root=http://www.mcs.anl.gov/mpi/tutorial/mpiexmpl \
		-src=src3
	cp -rp . /mcs/www/mpi/tutorial/mpiexmpl.new
	-/bin/mv /mcs/www/mpi/tutorial/mpiexmpl \
		/mcs/www/mpi/tutorial/mpiexmpl.old
	/bin/mv /mcs/www/mpi/tutorial/mpiexmpl.new \
		/mcs/www/mpi/tutorial/mpiexmpl
	/bin/rm -rf /mcs/www/mpi/tutorial/mpiexmpl.old
#
# This creates the tar file for SC'96
installsc96:
	make clean
	maint/makecourse -root=http://r50-h1-163.pgh.supercomp.org/demos/mpi/tutorial/mpiexmpl
	maint/makecourse -root=http://r50-h1-163.pgh.supercomp.org/demos/mpi/tutorial/mpiexmpl \
		-src=src2
	maint/makecourse -root=http://r50-h1-163.pgh.supercomp.org/demos/mpi/tutorial/mpiexmpl \
		-src=src3
	maint/maketar

clean:
	for dir in $(DIRS) ; do \
	    (cd src/$$dir/C ; make clean ) ; \
	done
	for dir in $(DIRS2) ; do \
	    (cd src2/$$dir/C ; make clean ) ; \
	done
	for dir in $(DIRS3) ; do \
	    (cd src3/$$dir/C ; make clean ) ; \
	done
#
# This target tries to run the example programs, when possible
examples:
	@for dir in src src2 src3 ; do \
	    if [ -x $$dir/runtests ] ; then \
	    echo "runtests in $$dir" ; \
	    ( cd $$dir ; runtests -base ) \
	    fi \
	done

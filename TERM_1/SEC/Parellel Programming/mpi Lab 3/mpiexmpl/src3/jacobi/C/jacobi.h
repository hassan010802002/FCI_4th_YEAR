/*
 * This example handles an arbitrary sized mesh, with DEFAULT_MAXN the
 * default size
 */
#define DEFAULT_MAXN (128 + 2)

#if defined(__STDC__) || defined(__cplusplus) || defined(HAVE_PROTOTYPES)
#define ANSI_ARGS(a) a
#else
#define ANSI_ARGS(a) ()
#endif

typedef struct {
    double   *xlocal, *xnew;
    int      maxm, maxn, lrow;
    int      up_nbr, down_nbr;
    MPI_Comm ring_comm;
} Mesh;

/* Forward refs */
void Setup_mesh ANSI_ARGS(( int, int, Mesh * ));
void Init_mesh ANSI_ARGS(( Mesh * ));
void Get_command_line ANSI_ARGS(( int, int, char **, int *, int *, int *, 
				  int * ));
void Exchange ANSI_ARGS(( Mesh * ));

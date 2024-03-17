#include <stdio.h>

#include "myfunctions.h"

/*
Source files are the files that contain the code that gets compiled. The implementation of your algorithm is contained in a source file. Header files contain code(usually function or class definitions ) that are copied into your source file by means of the #include preprocessor directive.
*/

/*
the expression arr[i] (is equivalent to *(arr+i))
*/

/*
use a typedef to declare an alias for an existing type; it never creates a
new type

typedef unsigned int uint_type;
typedef signed char schar_type, *schar_p, (*fp)(void);

we declare uint_type as an alias for the type unsigned
int. On the second line, we declare schar_type as an alias for signed char,
schar_p as an alias for signed char *, and fp as an alias for signed char(*)
(void).

Identifiers that end in _t in the standard headers are type definitions
(aliases for existing types). Generally speaking, you should not follow this
convention in your own code because the C Standard reserve identifiers that
match the patterns int[0-9a-z_]*_t and uint[0-9a-z_]*_t, and the Portable
Operating System Interface (POSIX) reserves all identifiers that end in _t. If you define identifiers that use these names, they may collide with names used by the implementation, which can cause problems that are difficult to debug.
*/

/*
Union types are similar to structures, except that the memory used by the
member objects overlaps. Unions can contain an object of one type at
one time, and an object of a different type at a different time, but never
both objects at the same time, and are primarily used to save memory.
*/


union {
  struct {
    int type;
  } n;
  struct {
    int type;
    int intnode;
  } ni;
  struct {
    int type;
    double doublenode;
  } nf;
} u;

u.nf.type = 1;
u.nf.doublenode = 3.14;

/*
Code that uses this union will typically check the type of the
node by examining the value stored in u.n.type and then accessing either
the intnode or doublenode struct depending on the type. If this had been
implemented as a structure, each node would contain storage for both the
intnode and the doublenode members. The use of a union allows the same
storage to be used for both members.
*/

/*
Tags are a special naming mechanism for structs, unions, and enumerations.
struct s {
  //---snip---
};

a tag is not a type name and cannot be used to declare a variable 
Instead, you must declare variables of this type

struct s v;   // instance of struct s
struct s *p;  // pointer to struct s

enum day { sun, mon, tue, wed, thu, fri, sat };
day today;  // error (not a type)
enum day tomorrow;  // OK


The tags of structures, unions, and enumerations are defined in a separate namespace from ordinary identifiers. This allows a C program to have
both a tag and another identifier with the same spelling in the same scope

enum status { ok, fail };  // enumeration
enum status status(void);  // function

struct s s; // may not be good practice, but it is valid in C.

typedef struct s { int x; } t;
typedef struct { int x; } t;
*/

/*
self-referential structures

struct tnode {
  int count;
  struct tnode *left;
  struct tnode *right;
};

If you omit the tag on the first line, the compiler may complain because the
referenced structure on lines 3 and 4 has not yet been declared, or because
the whole structure is not used anywhere.

you can declare a typedef as well:
typedef struct tnode {
  int count;
  struct tnode *left;
  struct tnode *right;
} tnode;

Most C programmers use a different name for the tag and the typedef,
but the same name works just fine

typedef struct tnode tnode;
struct tnode {
  int count;
  tnode *left
  tnode *right;
} tnode;
*/

/*
const

Objects declared with the const qualifier (const-qualified types) are not
modifiable

const int i = 1; // const-qualified int
i = 2; // error: i is const-qualified

It’s possible to accidentally convince your compiler to change a const-
qualified object for you. In the following example, we take the address of a
const-qualified object i and tell the compiler that this is actually a pointer to an int

const int i = 1;  // object of const-qualified type
int *ip = (int *)&i;
*ip = 2;  // undefined behavior

C does not allow you to cast away the const if the original was declared
as a const-qualified object

int i = 12;
const int j = 12;
const int *ip = &i;
const int *jp = &j;
*(int *)ip = 42; // ok
*(int *)jp = 42; // undefined behavior

*/

/*

volatile

Objects of volatile-qualified types serve a special purpose. Static volatile-
qualified objects are used to model memory-mapped input/output (I/O)
ports, and static constant volatile-qualified objects model memory-mapped
input ports such as a real-time clock.


The values stored in these objects may change without the knowledge
of the compiler. For example, every time the value from a real-time clock
is read, it may change, even if the value has not been written to by the
C program. Using a volatile-qualified type lets the compiler know that
the value may change, and ensures that every access to the real-time clock
occurs (­otherwise, an access to the real-time clock may be optimized away
or replaced by a previously read and cached value). In the following code,
for example, the compiler must generate instructions to read the value
from port and then write this value back to port:

volatile int port;
port = port;

Without the volatile qualification, the compiler would potentially eliminate both the read and the write.
*/

/*
restrict

A restrict-qualified pointer is used to promote optimization.


void f(unsigned int n, int * restrict p, int * restrict q) {
  while (n-- > 0) {
    *p++ = *q++;
  }
}

the compiler can assume that an object accessed through one of the pointer parameters is not also accessed through the other.
Although using restrict-qualified pointers can result in
more efficient code, you must ensure that the pointers do not refer to overlapping memory to prevent undefined behavior.
*/
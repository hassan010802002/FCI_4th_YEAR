/*
Boolean Types
*/
#include <stdbool.h>
_Bool flag1 = 0;
bool flag2 = false;
// Objects declared as _Bool can store only the values 0 and 1

/*
Character Types
*/
// three character types: char, signed char, and unsigned char.
/*
Each compiler implementation will define char to have the same alignment, size, range, representation, and behavior as either signed char or
unsigned char. Regardless of the choice made, char is a separate type from
the other two and is incompatible with both
*/

/*
Numerical Types
*/
/*
C provides several numerical types that can be used to represent integers,
enumerators, and floating-point values.

Integer Types

Signed integer types can be used to represent negative numbers, positive numbers, and zero. The signed integer types include signed char, short int, int,
long int, and long long int.

Except for int itself, the keyword int may be omitted in the declarations
for these types, so you might, for example, declare a type by using long long
instead of long long int.

For each signed integer type, there is a corresponding unsigned integer
type that uses the same amount of storage: unsigned char, unsigned short int,
unsigned int, unsigned long int, and unsigned long long int. The unsigned
types can be used to represent only positive numbers and zero. 

enum Types

An enumeration, or enum, allows you to define a type that assigns names (enumerators) to integer values in cases with an enumerable set of constant values. The following are examples of enumerations:
*/
enum day { sun, mon, tue, wed, thu, fri, sat };
enum cardinal_points { north = 0, east = 90, south = 180, west = 270 };
enum months { jan = 1, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec };
/*
If you don’t specify a value to the first enumerator with the = operator,
the value of its enumeration constant is 0, and each subsequent enumerator without an = adds 1 to the value of the previous enumeration constant.
Consequently, the value of sun in the day enumeration is 0, mon is 1, and
so forth. 
*/
/*
The actual value of the enumeration constant must be representable as
an int, but its type is implementation defined. For example, Visual C++ uses
a signed int, and GCC uses an unsigned int.
*/

/*
Floating-point types
*/
/*
float, double, and long double.
Floating-point arithmetic is similar to, and often used as a model for, the
arithmetic of real numbers.
*/

/*
Void Types
*/
/*
The void type is a rather strange type. The keyword void (by itself) means
“cannot hold any value.” For example, you can use it to indicate that a
function doesn’t return a value, or as the sole parameter of a function to
indicate that the function takes no arguments. On the other hand, the
derived type void * means that the pointer can reference any object.
*/

/*
Function Types
*/
/*
Function types are derived types. In this case, the type is derived from the
return type and the number and types of its parameters. The return type of
a function cannot be an array type. 

If the declarator includes
a parameter type list and a definition, the declaration of each parameter
must include an identifier, except parameter lists with only a single parameter of type void, which needs no identifier.
*/

int f(void);
int *fip(); // returns a pointer to an int
void g(int i, int j);
void h(int, int);
/*
Specifying parameters with identifiers (as done here with g) can be
problematic if an identifier is a macro. However, providing parameter 
names is good practice for self-documenting code, so omitting the identifiers (as done with h) is not typically recommended.
*/

/*
You should never
declare functions with an empty parameter list in C.

First, this is a deprecated feature of the language that may be removed in the future. Second,
the code could be ported to C++, so explicitly list parameter types and use
void when there are no parameters.
*/
int max(int a, int b){ return a > b ? a : b; }

/*
Derived Types

Pointer Types
A pointer type is derived from the function or object type that it points to,
called the referenced type. 
*/
int *ip;
char *cp;
void *vp;

// the address-of (&) and indirection (*) operators.
int i = 17;
int *ip = &i; // You use the & operator to take the address of an object or function

/*
We declare the variable ip as a pointer to int and assign it the address
of i.
You can also use the & operator on the result of the * operator:
*/
ip = &*ip; 

/*
The unary * operator converts a pointer to a type into a value of that
type. It denotes indirection and operates only on pointers. If the operand
points to a function, the result of using the * operator is the function designator, and if it points to an object, the result is a value of the designated
object. For example, if the operand is a pointer to int, the result of the indirection operator has the type int. If the pointer is not pointing to a valid
object or function, bad things may happen.
*/

// Arrays
// An array is a contiguously allocated sequence of objects that all have the same element type.
int ia[11];
float *afp[17];

//Structures
/*
contains sequentially allocated member objects. Each object has its own name and may have a distinct type—
unlike arrays, which must all be of the same type.
*/
struct sigrecord {
 int signum;
 char signame[20];
 char sigdesc[100];
} sigline, *sigline_p;
/*
Structures are useful for declaring collections of related objects and
may be used to represent things such as a date, customer, or personnel
record. They are especially useful for grouping objects that are frequently
passed together as arguments to a function, so you don’t need to repeatedly
pass individual objects separately. 
*/

/*
You reference members of an object of the structure type by
using the structure member (.) operator. If you have a pointer to a structure, you can reference its members with the structure pointer (->) operator
*/

sigline.signum = 5;
strcpy(sigline.signame, "SIGINT");
strcpy(sigline.sigdesc, "Interrupt from keyboard");
sigline_p = &sigline;
sigline_p->signum = 5;
strcpy(sigline_p->signame, "SIGINT");
strcpy(sigline_p->sigdesc, "Interrupt from keyboard");
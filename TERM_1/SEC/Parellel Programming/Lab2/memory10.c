/*
Dynamically allocated memory is allocated from the heap, which is simply
one or more large, subdividable blocks of memory that are managed by the
memory manager.
Memory managers are libraries that manage the heap for you by providing implementations of the standard memory management functions
*/

/*
malloc
allocates space for an object of a specified size whose initial value is indeterminate.
*/

#include <stdlib.h> // must for malloc
typedef struct {
  char c[10];
  int i;
  double d;
} widget;
widget *p = malloc(sizeof(widget));
if (p == NULL) {
  // Handle allocation error
}
// Continue processing


/*
Allocating Memory Without Declaring a Type

store the return value from malloc as a void pointer to avoid declar-
ing a type for the referenced object:
*/
void *p = malloc(size);

// Alternately, you can use a char pointer, which was the convention before
// the void type was introduced to C:
char *p = malloc(size);

/*
Once this occurs, the object has the effective type of
the last object copied into this storage, which imprints the type onto the
allocated object.

widget w = {"abc", 9, 3.2};
memcpy(p, &w, sizeof(widget));     // coerced to void * pointers
printf("p.i = %d.\n", p->i);

Because any type of object can be stored in allocated memory, we can
assign the pointers returned by all allocation functions, including malloc, to point to any type of object

Casting the Pointer to the Type of the Declared Object
widget *p = (widget *)malloc(sizeof(widget)); //this cast is unnecessary in C
*/


/*
Reading Uninitialized Memory
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(void) {
  char *str = (char *)malloc(16);
  if (str) {
    strncpy(str, "123456789abcdef", 15);
    printf("str = %s.\n", str);
    free(str);
    return EXIT_SUCCESS;
  }
  return EXIT_FAILURE;
}
/*
allocates 16 bytes of memory by calling malloc, and then
uses strncpy to copy the first 15 bytes of a string into the allocated memory.

strncpy(str, "123456789abcdef", 15);
str[15] = '\0'; // assignment(u)

If the source string is less than 15 bytes, the null termination character
will be copied, and the assignment at u is unnecessary. If the source string
is 15 bytes or longer, adding this assignment will ensure that the string is
properly null-terminated.
*/

/*
The aligned_alloc function is similar to the malloc function, except that it
requires you to define an alignment as well as a size for the allocated object.

void *aligned_alloc(size_t alignment, size_t size);
*/

/*
The calloc function allocates storage for an array of nmemb objects, each of
whose size is size bytes. It has the following signature:

void *calloc(size_t nmemb, size_t size);

initializes the storage to all zero-valued bytes.
You can also use the calloc function to allocate storage for a single object, which can be thought of as an array of one element.
*/

/*
The realloc function increases or decreases the size of previously allocated
storage. It takes a pointer to some memory allocated by an earlier call to
aligned_alloc, malloc, calloc, or realloc (or a null pointer) and a size, and has
the following signature:

void *realloc(void *ptr, size_t size);

You can use the realloc function to grow or (less commonly) shrink the
size of an array.
*/
void *p2;
void *p = malloc(100);
//---snip---
if ((nsize == 0) || (p2 = realloc(p, nsize)) == NULL) {
  free(p);
  return NULL;
}
p = p2;

/*
reallocarray function can reallocate storage for an array,
but also provides overflow checking for array size calculations

void *reallocarray(void *ptr, size_t nmemb, size_t size);

allocates storage for nmemb members of size
size and checks for integer overflow in the calculation nmemb * size
*/

/*
Free

should deallocate dynamically allocated memory when it’s no longer
needed by calling the free function. Deallocating memory is important
because it allows that memory to be reused.

void free(void *ptr);
*/
/*
C has four types
of scope: file, block, function prototype, and function.
*/

/*
The scope of an object or function identifier is determined by where
it is declared.
*/

/*
 If the declaration is outside any block or parameter list, the
identifier has file scope, meaning the scope is the entire text file in which it
appears as well as any files included after that point.
If the declaration appears inside a block or within the list of parameters, it has block scope, meaning that the identifier it declares is accessible
only within the block.
*/

/*
If the declaration appears within the list of parameter declarations in
a function prototype (not part of a function definition), the identifier has
function prototype scope, which terminates at the end of the function declarator
*/

/*
Function scope is the area between the opening { of a function definition
and its closing }. 
*/

/*
Scope and lifetime are entirely different concepts. Scope applies to identifiers,
whereas lifetime applies to objects. The scope of an identifier is the code region
where the object denoted by the identifier can be accessed by its name. The lifetime
of an object is the time period for which the object exists.
*/



#include <stdio.h>
void increment(void) {
 static unsigned int counter = 0;
 counter++;
 printf("%d ", counter);
}
/*
The lifetime of counter is the entire execution of the program,
and it will retain its last-stored value throughout its lifetime. You could achieve
the same behavior by declaring counter with file scope. However, it is good
software engineering practice to limit the scope of an object wherever
possible.


Static objects must be initialized with a constant value and not a
variable
int i = 3;
const int j = i; // ok
static int k = j; // error
*/

int main(void) {
 for (int i = 0; i < 5; i++) {
    increment();
 }  

 int i =4 ;
 const int j = i; // ok
 int x = 5;

 static int k = x; // error
 return 0;
}
#include <stdio.h>

void swap(int *pa, int *pb) {
 int t = *pa;
// the unary * operator dereferences the pointer to the object
 *pa = *pb;
 /*
 This dereferences the pointer pb, reads the referenced value, dereferences
the pointer pa, and then overwrites the value at the location referenced by
pa with the value referenced by pb.
 */
 *pb = t;
 return;
}

int main(void){
    int a = 21;
    int b = 17;
    // printf(&a);
    swap(&a, &b);
    /*
    The unary & is the address-of operator, which generates a pointer to its operand. This change is necessary because the swap function now accepts pointers to objects of type int as parameters instead of simply values of type int. 
    */
    printf("main: a = %d, b = %d\n", a, b);
    return 0;
}
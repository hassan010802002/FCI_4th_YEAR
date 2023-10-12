/*
An alignment represents the number of bytes between successive addresses at which a given
object can be allocated. 
*/

#include <stdalign.h>
#include <stdio.h>

// define a struct
struct S {
 int i; double d; char c;
};

int main(void) {
 unsigned char bad_buff[sizeof(struct S)];
 _Alignas(struct S) unsigned char good_buff[sizeof(struct S)];
 struct S *bad_s_ptr = (struct S *)bad_buff; // wrong pointer alignment
 struct S *good_s_ptr = (struct S *)good_buff; // correct pointer alignment
  //print the memory addresses.
  printf("%p\n", (void*)&bad_s_ptr);
  printf("%p\n", (void*)&good_s_ptr);
  printf(bad_buff[0].i)
}

/*
0x7ffe1ccdd5a0
0x7ffe1ccdd580
0x7ffe1ccdd570
*/
/*
The byte difference between structs a and b is 32, which indicates that the alignment was successful. The byte difference between structs b and c is 16, which indicates natural alignment.
*/
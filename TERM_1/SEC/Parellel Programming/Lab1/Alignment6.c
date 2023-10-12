/*
An alignment represents the number of bytes between successive addresses at which a given
object can be allocated. 
*/

#include <stdalign.h>
#include <stdio.h>


// define a struct
struct align16
{
  float data[4];
};
 

 
int main(void)
{
  //align to 32 bytes
  alignas(32) struct align16 a,b;
  struct align16 c;
  struct align16 d;
  //print the memory addresses.
  printf("%p\n", (void*)&a);
  printf("%p\n", (void*)&b);
  printf("%p\n", (void*)&c);
  printf("%p\n", (void*)&d);

}

/*
0x7ffe1ccdd5a0
0x7ffe1ccdd580
0x7ffe1ccdd570
*/
/*
The byte difference between structs a and b is 32, which indicates that the alignment was successful. The byte difference between structs b and c is 16, which indicates natural alignment.
*/
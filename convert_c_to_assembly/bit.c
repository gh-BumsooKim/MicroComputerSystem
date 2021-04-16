#include <stdio.h>

int main(void)
{
	int x = 13; 		// 00000000 00000000 00000000 00001101 
	int y = 15; 		// 00000000 00000000 00000000 00001111 
	int z;		
	
	z = ~x;
	printf("NOT X = %08X (%d)\n", z, z);
	
	z = x & y;
	printf("X AND Y = %08X (%d)\n", z, z);
	
	z = x | y;
	printf("X OR Y = %08X (%d)\n", z, z);
	
	z = x ^ y;
	printf("X XOR Y = %08X (%d)\n", z, z);
	
	return 0;
}

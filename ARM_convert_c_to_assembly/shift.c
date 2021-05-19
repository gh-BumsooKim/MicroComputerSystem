#include <stdio.h>

int main(void)
{
	int x = 15; 		 // 00000000 00000000 00000000 00001111
	int y = 3; 		 
	int z;		
	
	z = x << y
	printf("X << Y = %08X (%d)\n", z, z);
	
	z = x >> y;
	printf("X << Y = %08X (%d)\n", z, z);
	
	z = ~x << y;
	printf("~X << Y = %08X (%d)\n", z, z);
	
	z = ~x >> y;
	printf("~X >> Y = %08X (%d)\n", z, z);
	
	return 0;
}

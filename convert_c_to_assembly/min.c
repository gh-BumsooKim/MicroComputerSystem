#include <stdio.h>

int main(void)
{
	int n1, n2, n3, min;
	
	printf("n1을 입력하시오:");
	scanf("%d", &n1);
	
	printf("n2를 입력하시오:");
	scanf("%d", &n2);
	
	printf("n3를 입력하시오:");
	scanf("%d", &n3);
	
	if( n1 < n2 )
		if( n1 < n3 )
			min = n1;
		else
			min = n3;
	else
		if( n2 < n3 )
			min = n2;
		else
			min = n3;
			
	printf("제일 작은 수는 %d입니다\n", min);
	
	return 0;
}

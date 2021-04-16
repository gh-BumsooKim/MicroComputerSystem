#include <stdio.h>

void swap(int x, int y);

int main(void)
{
	int a = 100, b = 200;
	
	printf("main() a=%d b=%d\n",a, b);
	swap(&a, &b);
	printf("main() a=%d b=%d\n",a, b);
	
	return 0;
}

void swap(int *px, int *py)
{
	int tmp;
	
	printf("swap() *px=%d *py=%d\n", *px, *py);
	
	tmp = *px;
	*px = *py;
	*py = tmp;
	
	printf("swap() *px=%d *py=%d\n", *px, *py);
}

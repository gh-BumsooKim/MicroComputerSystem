#include <stdio.h> 
#define STUDENTS 5 

int get_sum(int score[], int n);  

int main(void) 
{ 
        int grade[STUDENTS] = { 1, 2, 3, 4, 5 };
		
        int sum; 
        sum = get_sum(grade, STUDENTS); 
        printf("배열의 합은 %d입니다.\n", sum); 
		
        return 0; 
} 

int get_sum(int score[], int n)      
{ 
        int i; 
        int sum = 0; 
        for(i = 0; i < n; i++) 
                sum += score[i]; 
				
        return sum;
}

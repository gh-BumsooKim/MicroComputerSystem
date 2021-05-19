#include <stdio.h>
#include <wiringPi.h>

#define LED 18
#define KEY 24

void isr_key(){

	int val = digitalRead(KEY);

	if (val == LOW){
		printf("Key is pressed \r\n");
		digitalWrite(LED, 1);
	}
	else{
		printf("Key is released \r\n");
		digitalWrite(LED, 0);
	}
}

void main(void){
	unsigned sec = 0;

	wiringPiSetupGpio();
	pinMode(LED, OUTPUT);
	pinMode(KEY, INPUT);

	wiringPiISR(KEY, INT_EDGE_BOTH, isr_key);

	while(1){
		printf("%d sec \r\n", sec);
		sec = sec + 1;
		delay(1000);
	}
}

#include <stdio.h>
#include <wiringPi.h>

#define LED_A 18
#define LED_B 27
#define LED_C 17
#define KEY 24

void main(void)
{
	printf("Raspberry Pi - mmap Version \r\n");

	wiringPiSetupGpio();

	pinMode(LED_A, OUTPUT);
	pinMode(LED_B, OUTPUT);
	pinMode(LED_C, OUTPUT);

	pinMode(KEY, INPUT);

	int pressed = 0;
	int status = 1;

	while(1)
	{
		int val = digitalRead(KEY);

		if (val==LOW){
			if(pressed == 0){
				pressed = 1;

				switch(status){
					case 1:
						digitalWrite(LED_A, 1);
						digitalWrite(LED_B, 0);
						digitalWrite(LED_C, 0);
						delay(100);
						break;
					case 2:
						digitalWrite(LED_A, 0);
						digitalWrite(LED_B, 1);
						digitalWrite(LED_C, 0);
						delay(100);
						break;
					case 3:
						digitalWrite(LED_A, 0);
						digitalWrite(LED_B, 0);
						digitalWrite(LED_C, 1);
						delay(100);
						break;
					case 4:
						digitalWrite(LED_A, 1);
						digitalWrite(LED_B, 1);
						digitalWrite(LED_C, 1);
						delay(100);
						break;
					case 0:
						digitalWrite(LED_A, 0);
						digitalWrite(LED_B, 0);
						digitalWrite(LED_C, 0);
						delay(100);
						break;
				}

				status = (status + 1) % 5;
			}
		}
		else
			pressed = 0;
	}
}

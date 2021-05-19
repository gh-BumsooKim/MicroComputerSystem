#include <stdio.h>
#include <wiringPi.h>

#define LED 18
#define KEY 24

void main(void)
{
	wiringPiSetupGpio();
	pinMode(LED, OUTPUT);
	pinMode(KEY, INPUT);

	for(;;)
	{
		int val = digitalRead(KEY);

		if (val==LOW){
			digitalWrite(LED, 1);
		}
		else
			digitalWrite(LED, 0);

		delay(10);
	}
}

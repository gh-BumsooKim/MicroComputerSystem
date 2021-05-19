#include <stdio.h>
#include <wiringPi.h>

#define LED 18

void main(void)
{

	wiringPiSetupGpio();
	pinMode(LED, OUTPUT);

	for(;;)
	{
		digitalWrite(LED,1);
		delay(500);
		digitalWrite(LED,0);
		delay(500);
	}
}

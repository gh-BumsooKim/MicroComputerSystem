# MicroComputerSystem

**중앙대학교 창의ICT공과대학 전자전기공학부 - 마이크로컴퓨터시스템**

ARM MircroProcesser Core Assembly Language with Raspi 4B

# ARM Programming

## Environment

- **OS** : Raspbian (Raspberry Pi 3)
- **Compiler** : gcc (Not Keil)
- **Editor** : nano
- **language** : ARM Assembly

```Assembly
	.data	@data area
string:	.asciz "Hello world\n"

	.text	@code area
	.global main
	
main:
	push {lr}	@push {r14}
	ldr r0, =string	@parameter
	bl printf
	pop {pc}	@pop {r15}
	.end	@end
```

## Getting Started

make directory and source file

```cmd
pwd
mkdir src
nano example.s
```

assemble source code and run

```cmd
gcc example.s -o example
./exmaple
```

<hr>

# GPIO Programming

## Environment

- **OS** : Raspbian (Raspberry Pi 3)
- **Compiler** : gcc (Not Keil)
- **Editor** : nano
- **language** : C

```c
#include <stdio.h>
#incldue <wiringPi.h>

#define LED 18

void main(void){
	wiringPiSetupGpio();
	pinMode(LED, OUTPUT);
	
	for(;;){
		digitalWrite(LED, 1);
		delay(500);
		digitalWrite(LED, 0);
		delay(500);
	}
}

```

## Getting Started

install WiringPi

```cmd
sudo apt-get install git-core
git clone http://github.com/WiringPi/WiringPi
cd WiringPi
./build
```

compile c source code and run

```cmd
nano example.c
gcc -o example example.c -lwiringPi
./exmaple

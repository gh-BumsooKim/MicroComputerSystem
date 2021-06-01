# MicroComputerSystem

**중앙대학교 창의ICT공과대학 전자전기공학부 - 마이크로컴퓨터시스템**

ARM MircroProcesser Core Assembly Language with Raspi 3
<br>

<br>
<p align="center">
<img src="imgs/mmap_switch_led.gif">
</p>

**Peripheral Device Control using Linux Kernel System Call with Virtual Memory Mapping**
<br>[BumSoo Kim](https://github.com/gh-BumsooKim)\*
<br>In 2021 MicroComputerSystem Lecture, CAU (* CAU A&T)


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
#include <wiringPi.h>

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
```cmd
gpio -g mode [N] out
gpio -g write [N] 1
gpio -g write [N] 0
```


## Getting Started

### (High Level) Peripheral Device Controll with wiringPi

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
./example
```

### (Low Level) Peripheral Device Controll with mmap 

compile custom wiringPi to library file

```cmd
nano gpmmlib.c
gcc -I./include -c gpmmlib.c
ar r libgpmm.a gpmmlib.o
ranlib libgpmm.a
mkdir lib
mv libgpmm.a ./lib
```

compile c source with custom library

```cmd
nano example.c
gcc -I./include -L./lib -o example example.c -lgpmm
sudo ./example 
```

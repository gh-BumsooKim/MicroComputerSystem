#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "wiringPi.h"

char *addr;

int wiringPiSetupGpio(void){
	int fd;

	fd = open("/dev/mem", O_RDWR | O_SYNC);

	if(fd < 0){
		printf("open() error\n");
		return -1;
	}

	addr = mmap(NULL, GPIO_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, GPIO_BASE);

	if(addr == MAP_FAILED){
		printf("mmap() error\n");
		return -1;
	}

	return 0;
}

int pinMode(int pin_no, int direction){
	if(direction == INPUT)
		set_gpio_input(pin_no, addr);
	else if(direction == OUTPUT)
		set_gpio_output(pin_no, addr);
	else{
		printf("pinMode() error\n");
		return -1;
	}

	return 0;
}

int digitalRead(int pin_no){
	gpio_lev(pin_no, addr);
}

int digitalWrite(int pin_no, int value){
	if(value == HIGH)
		gpio_set(pin_no, addr);
	else if(value == LOW)
		gpio_clear(pin_no, addr);
	else{
		printf("digitalWrite() error\n");
		return -1;
	}

	return 0;
}

void delay(int msec){
	usleep(msec*1000);
}

void set_gpio_input(int gpio_no, char *mmap_addr){
	unsigned int *reg;
	int shift_amount;

	reg = (unsigned int *)(mmap_addr + GPFSEL0_OFFSET + (gpio_no / 10 * 4));
	shift_amount = (gpio_no % 10) * 3;
	*reg = *reg & ~(0b111 << shift_amount);
}

void set_gpio_output(int gpio_no, char *mmap_addr){
	unsigned int *reg;
	int shift_amount;

	reg = (unsigned int *)(mmap_addr + GPFSEL0_OFFSET + (gpio_no / 10 * 4));

shift_amount = (gpio_no % 10) * 3;
	*reg = *reg | (1 << shift_amount);
}

int gpio_lev(int gpio_no, char *mmap_addr){
	unsigned int *reg;

	reg = (unsigned int *)(mmap_addr + GPLEV0_OFFSET);
	return *reg & (1 << gpio_no);
}

void gpio_set(int gpio_no, char *mmap_addr){
	unsigned int *reg;

	reg = (unsigned int *)(mmap_addr + GPSET0_OFFSET);
	*reg = 1 << gpio_no;
}

void gpio_clear(int gpio_no, char *mmap_addr){
	unsigned int *reg;

	reg = (unsigned int *)(mmap_addr + GPCLR0_OFFSET);
	*reg = 1 << gpio_no;
}

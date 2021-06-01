#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>

#define KEY 24
#define LED 18
#define LOW 0
#define HIGH 1

#define IO_BASE 0x3F000000
#define GPIO_BASE (IO_BASE + 0x200000)
#define GPIO_SIZE 256

#define GPFSEL0_OFFSET 0x0
#define GPSET0_OFFSET 0x1c
#define GPCLR0_OFFSET 0x28
#define GPLEV0_OFFSET 0x34

void set_gpio_input(int gpio_no, char *mmap_addr);
void set_gpio_output(int gpio_no, char *mmap_addr);

int gpio_lev(int gpio_no, char *mmap_addr);
void gpio_set(int gpio_no, char *mmap_addr);
void gpio_clear(int gpio_no, char *mmap_addr);

int main(int argc, char **argv){
	int fd;
	char *addr;

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

	set_gpio_input(KEY, addr);
	set_gpio_output(LED, addr);

	for(;;){
		if(gpio_lev(KEY, addr) == LOW){
			gpio_set(LED, addr);
			printf("Key is Pressed \r\n");
		}
		else{
			gpio_clear(LED, addr);
		}

		usleep(10000);
	}

	munmap(addr, GPIO_SIZE);
	close(fd);

	return 0;
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

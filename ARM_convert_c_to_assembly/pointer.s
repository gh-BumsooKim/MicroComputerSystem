 	.data
string1:	.asciz "main() a=%d b=%d\n"
string2:	.asciz "%d"
string3:	.asciz "swap() *px=%d *py=%d\n"
	.align
a:	.word	100
b:	.word	200

	.text
	.global main
	.extern printf

main:
	push {lr}	@push {r14}

	ldr r3, =a
	ldr r4, =b

	ldr r1, [r3]
	ldr r2, [r4]
	ldr r0, =string1

	push {r3, r4}
	bl printf
	pop {r3,r4}

	mov r0, r3
	mov r1, r4

	bl SWAP

	ldr r2, [r1]
	ldr r1, [r0]
	ldr r0, =string1
	bl printf

	pop {pc}	@pop {r15}

SWAP:
	push {lr}
	mov r7, r0
	mov r8, r1

	ldr r1, [r7]
	ldr r2, [r8]
	ldr r0, =string3

	bl printf

	mov r9, r7
	mov r7, r8
	mov r8, r9

	ldr r1, [r7]
	ldr r2, [r8]
	ldr r0, =string3

	bl printf

	mov r0, r7
	mov r1, r8

	pop {pc}


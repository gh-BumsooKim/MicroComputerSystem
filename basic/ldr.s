	.data
string: .asciz "The result is %d\n"

x:	.word 3	@init 3
y:	.word 7	@init 7
z:	.word

	.text
	.global main
	.extern printf

main:
	push {lr}	@push {r14}

	ldr r1, =x
	ldr r5, [r1]	@r5=x
	ldr r2, =y
	ldr r6, [r2]	@r6=y

	add r7, r5, r6	@r7=x+y

	ldr r3, =z

	str r7, [r3]

	ldr r0, =string
	ldr r1, [r3]

	bl printf

	pop {pc}	@pop {r15}


	.data
string: .asciz "The result is %d\n"

	.text
	.global main
	.extern printf

main:
	push {lr}	@push {r14}

	mov r1, #0

LOOP:
	add r1, #1
	cmp r1, #10
	bne LOOP

	ldr r0, =string
	mov r1, r1

	bl printf

	pop {pc}	@pop {r15}


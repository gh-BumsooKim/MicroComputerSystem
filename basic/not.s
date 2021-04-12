	.data
string: .asciz  "The result is %08d (Origin) %08d (NOT)\n"

	.text
	.global main
	.extern printf

main:
	push {lr}	@push {r14}

	mov r5, #0x000000FF

	mvn r6, r5
	add r6, r6, #1

	ldr r0, =string	@1 parameter string address
	mov r1, r5	@2 parameter
	mov r2, r6	@3 parameter

	bl printf
	pop {pc}	@pop {r15}


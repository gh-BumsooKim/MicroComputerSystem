	.data
string: .asciz  "The result is %08X (SUB)\n"

	.text
	.global main
	.extern printf

main:
	push {lr}	@push {r14}

	mov r5, #3
	mov r6, #6

	sub r7, r5, r6

	ldr r0, =string	@1 parameter string address
	mov r1, r7	@2 parameter

	bl printf
	pop {pc}	@pop {r15}


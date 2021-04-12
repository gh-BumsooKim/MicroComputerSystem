	.data
string: .asciz  "The result is %08d (Origin) %08d (+2LSL3)\n"

	.text
	.global main
	.extern printf

main:
	push {lr}	@push {r14}

	mov r5, #3
	mov r6, #2

	add r7, r5, r6, LSL #3	@z=3+2*2^3

	ldr r0, =string	@1 parameter string address
	mov r1, r5	@2 parameter
	mov r2, r7	@3 parameter

	bl printf
	pop {pc}	@pop {r15}


	.data
string: .asciz  "The result is %X%X\n"

	.text
	.global main
	.extern printf

main:
	push {lr}	@push {r14}

	mov r5, #0xFFFFFFFF
	mov r6, #0xFFFFFFFF

	adds r7, r5, r6

	mov r8, #0xFF
	mov r9, #0xFF

	adc r10, r8, r9

	ldr r0, =string	@1 parameter string address
	mov r1, r10	@2 parameter
	mov r2, r7	@3 parameter

	bl printf
	pop {pc}	@pop {r15}


	.data
string: .asciz  "The result is %08X (AND) %08X (BIC)\n"

	.text
	.global main
	.extern printf

main:
	push {lr}	@push {r14}

	mov r5, #0x000000FF
	mov r6, #0xFFFFFFFF

	and r7, r5, r6
	bic r8, r5, r6

	ldr r0, =string	@1 parameter string address
	mov r1, r7	@2 parameter
	mov r2, r8	@3 parameter

	bl printf
	pop {pc}	@pop {r15}


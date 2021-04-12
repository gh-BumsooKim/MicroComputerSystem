	.data
string: .asciz "The result is %d, %d, and %d\n"
	.align
TABLE1:	.word 10, 20, 30
TABLE2:	.space 12

	.text
	.global main
	.extern printf

main:
	push {lr}	@push {r14}

	ldr r5, =TABLE1
	ldr r6, =TABLE2

	ldr r7, [r5]
	str r7, [r6]

	ldr r7, [r5, #4]!
	str r7, [r6, #4]

	ldr r7, [r5, #4]
	str r7, [r6, #8]

	ldr r0, =string
	ldr r1, [r6]
	ldr r2, [r6, #4]
	ldr r3, [r6, #8]

	bl printf

	pop {pc}	@pop {r15}


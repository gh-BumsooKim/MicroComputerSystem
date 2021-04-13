	.data
string: .asciz "The result is %d\n"

	.text
	.global main
	.extern printf

main:
	push {lr}	@push {r14}

	mov r1, #3
	mov r2, #4

	cmp r1, r2
	blt ELSE
	mov r3, r1
	bal ENDIF
ELSE:
	mov r3, r2
ENDIF:
	ldr r0, =string
	mov r1, r3

	bl printf

	pop {pc}	@pop {r15}


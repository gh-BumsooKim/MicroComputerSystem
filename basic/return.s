	.data
string:	.asciz	"The result is %d\n"

	.text
	.global main
	.extern printf

main:
	stmfd r13!, {r14}	@push {r14}

	mov r0, #3
	mov r1, #7

	bl add_func

	mov r1, r0

	ldr r0, =string
	bl printf

	ldmfd r13!, {pc}	@pop {r15}

add_func:
	add r3, r0, r1
	mov r0, r3

	mov pc, lr

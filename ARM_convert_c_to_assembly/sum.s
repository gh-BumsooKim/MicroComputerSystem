 	.data
string1:	.asciz "배열의 합은 %d입니다.\n"
	.align
	.equ	STUDENT, 5
grade:	.word	1,2,3,4,5

	.text
	.global main
	.extern printf

main:
	push {lr}	@push {r14}

	ldr r5, =grade
	mov r0, r5
	mov r1, #STUDENT

	bl	GET_SUM

	mov r1, r0
	ldr r0, =string1

	bl printf

	pop {pc}	@pop {r15}

GET_SUM:
	mov r6, r1
	mov r7, #0
LOOP:
	ldr r8, [r0], #4
	add r7, r7, r8

	subs r6, r6, #1
	bne LOOP

	mov r0, r7
	mov pc, lr

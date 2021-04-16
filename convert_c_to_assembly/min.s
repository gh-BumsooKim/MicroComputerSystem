	.data
string1:	.asciz "n1을 입력하시오 :"
string2:	.asciz "n2를 입력하시오 :"
string3:	.asciz "n3을 입력하시오 :"
string4:	.asciz "%d"
string5:	.asciz "제일 작은 수는 %d입니다\n"
	.align
n1:	.word	0
n2:	.word	0
n3:	.word	0

	.text
	.global main
	.extern printf

main:
	push {lr}	@push {r14}

	ldr r0, =string1
	bl printf

	@ SCANF

	ldr r0, =string4
	ldr r1, =n1
	bl scanf
	ldr r5, =n1	@r5=n1
	ldr r5, [r5]


	ldr r0, =string2
	bl printf

	ldr r0, =string4
	ldr r1, =n2
	bl scanf
	ldr r6,	=n2	@r6=n2
	ldr r6, [r6]


	ldr r0, =string3
	bl printf

	ldr r0, =string4
	ldr r1, =n3
	bl scanf
	ldr r7, =n3	@r7=n3
	ldr r7, [r7]

	@ IF

	cmp r5, r6
	bge ELSE

	cmp r5, r7
	movge r8, r7	@r8=min
	movlt r8, r5

	bal ENDIF

ELSE:
	cmp r6, r7
	movge r8, r7	@r8=min
	movlt r8, r6

ENDIF:
	ldr r0, =string5
	mov r1, r8

	bl printf

	pop {pc}	@pop {r15}

	.data
string1: .asciz "정수를 입력하시오 :"
string2: .asciz "%d"
string3: .asciz "배열에 저장된 값은 아래와 같습니다:\n"
string4: .asciz "%d\n"

	.align
	.equ	SIZE, 5
arr:	.space	4*SIZE

	.text
	.global main
	.extern printf

main:
	push {lr}	@push {r14}

	mov r4, #0
	ldr r5, =arr

SCANFLOOP:
	ldr r0, =string1
	bl printf

	ldr r0, =string2
	mov r1, r5
	bl scanf

	add r5, r5, #4
	add r4, r4, #1
	cmp r4, #SIZE

	bne SCANFLOOP

	ldr r0, =string3
	bl printf

	mov r4, #0
	ldr r5, =arr

PRINTLOOP:
	ldr r0, =string4
	ldr r1, [r5], #4
	bl printf

	add r4, r4, #1
	cmp r4, #SIZE

	bne PRINTLOOP

	pop {pc}	@pop {r15}


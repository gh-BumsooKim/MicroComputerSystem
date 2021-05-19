 	.data
string1: .asciz "정수를 입력하시오 :"
string2: .asciz "%d"
string3: .asciz "배열에 저장된 값은 아래와 같습니다:\n"
string4: .asciz "%d\n"
	.align
	.equ	SIZE, 5
data:	.word	0

	.text
	.global main
	.extern printf

main:
	push {lr}	@push {r14}

	mov r4, #SIZE
	ldr r5, =data

SCANFLOOP:
	ldr r0, =string1
	bl printf

	ldr r0, =string2
	mov r1, r5
	bl scanf

	ldr r6, [r5]
	push {r6}
	subs r4, r4, #1

	bne SCANFLOOP

	ldr r0, =string3
	bl printf

	mov r4, #SIZE

PRINTLOOP:
	ldr r0, =string4
	pop {r6}

	mov r1, r6
	bl printf

	subs r4, r4, #1

	bne PRINTLOOP

	pop {pc}	@pop {r15}


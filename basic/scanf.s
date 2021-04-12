	.data
string0:	.asciz	"Input value :"
string1:	.asciz	"%d"
string2: 	.asciz  "The result is %d\n"
num:	.word

	.text
	.global main
	.extern printf

main:
	push {lr}	@push {r14}

	ldr r0, =string0
	bl printf

	ldr r0, =string1
	ldr r1, =num

	bl scanf	@scanf("%d", &num);

	ldr r0, =string2	@1 parameter string address
	ldr r1, =num
	ldr r1, [r1]	@2 parameter

	bl printf

	pop {pc}	@pop {r15}


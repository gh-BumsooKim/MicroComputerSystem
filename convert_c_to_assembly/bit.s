	.data
string1:	.asciz	"NOT X = %08X (%d)\n"
string2:	.asciz	"X AND Y = %08X (%d)\n"
string3:	.asciz	"X OR Y = %08X (%d)\n"
string4:	.asciz	"X XOR Y = %08X (%d)\n"

	.text
	.global main
	.extern printf

main:
	push {lr}	@push {r14}

	mov r5, #13	@r5=x=13
	mov r6, #15	@r6=y=15


	@ 1. NOT Operation

	mvn r7, r5	@r7=z=~x
	add r7, r7, #1

	ldr r0, =string1
	mov r1, r7
	mov r2, r7

	bl printf


	@ 2. AND Operation

	and r7, r5, r6	@r7=z=x&y

	ldr r0, =string2
	mov r1, r7
	mov r2, r7

	bl printf


	@ 3. OR Operation

	orr r7, r5, r6	@r7=z=x|y

	ldr r0, =string3
	mov r1, r7
	mov r2, r7

	bl printf


	@ 4. XOR Operation

	eor r7, r5, r6	@r7=z=x^y

	ldr r0, =string4
	mov r1, r7
	mov r2, r7

	bl printf

	pop {pc}	@pop {r15}


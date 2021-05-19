	.data
string1:	.asciz	"X << Y = %08X (%d)\n"
string2:	.asciz	"X >> Y = %08X (%d)\n"
string3:	.asciz	"~X << Y = %08X (%d)\n"
string4:	.asciz	"~x >> Y = %08X (%d)\n"

	.text
	.global main
	.extern printf

main:
	push {lr}	@push {r14}

	mov r5, #15	@r5=x=15
	mov r6, #3	@r6=y=3


	@ 1. Left-Shift Operation

	mov r7, r5, LSL r6	@r7=z=x>>y

	ldr r0, =string1
	mov r1, r7
	mov r2, r7

	bl printf


	@ 2. Right-Shift Operation

	mov r7, r5, LSR r6	@z=x<<y

	ldr r0, =string2
	mov r1, r7
	mov r2, r7

	bl printf


	@ 3. ~Left-Shift Operation

	mvn r7, r5
	add r7, #1	@z=~x
	mov r7, r7, LSL r6	@z=~x<<y

	ldr r0, =string3
	mov r1, r7
	mov r2, r7

	bl printf


	@ 4. ~Right-Shift Operation

	mvn r7, r5
	add r7, #1	@z=~x
	mov r7, r7, ASR r6	@z=~x>>y

	ldr r0, =string4
	mov r1, r7
	mov r2, r7

	bl printf

	pop {pc}	@pop {r15}


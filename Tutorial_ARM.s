@START - Data Area
@ Declare Variable

	.data
string:	.asciz "Hello world\n"
	.align
@END - Data Area


@START - Code Area
@ External Function

	.text
	.global main
	.extern printf
	
@ Main Logic Function 

main:
	push {lr}	@push {r14}
  
	ldr r0, =string	@parameter
	bl printf
  
	pop {pc}	@pop {r15}
  
	.end 
  
@END - Code Area

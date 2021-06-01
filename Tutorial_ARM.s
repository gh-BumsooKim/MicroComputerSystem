@START - Data Area

	.data
string:	.asciz "Hello world\n"
	.align
@END - Data Area


@START - Code Area
	.text
	.global main
	.extern printf

main:
	push {lr}	@push {r14}
  
	ldr r0, =string	@parameter
	bl printf
  
	pop {pc}	@pop {r15}
  
	.end 
  
@END - Code Area

	.data	@data area
string:	.asciz "Hello world\n"

	.text	@code area
	.global main
	.extern printf

main:
	push {lr}	@push {r14}
  
	ldr r0, =string	@parameter
	bl printf
  
	pop {pc}	@pop {r15}
  
	.end	@end 
  

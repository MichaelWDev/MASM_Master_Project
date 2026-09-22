INCLUDE Irvine32.inc

.data
A SDWORD 6
B SDWORD 7
N SDWORD 9

.code
main PROC
	mov EAX, A
	mov EBX, B
	mov ECX, N
	mov EDX, 0
	
	while_loop:
	cmp ECX, 0
	jle end_while

	cmp ECX, 3
	je else_if
	cmp ECX, EAX
	jl if_condition
	CMP ECX, EBX
	jle else_if

	if_condition:
	sub ECX, 2
	jmp end_if

	else_if:
	sub ECX, 2

	end_if:
	add EDX, ECX
	jmp while_loop

	end_while:
	
	
	mov N, ECX


	
	exit
main ENDP
END main
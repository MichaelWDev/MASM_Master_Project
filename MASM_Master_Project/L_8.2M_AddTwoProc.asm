INCLUDE L_8.2M_AddTwo.inc

.code

AddTwo PROC
	push ebp
	mov  ebp,esp
	mov  eax,[ebp + 12]       ; first parameter
	add  eax,[ebp + 8]        ; second parameter
	pop  ebp
	ret  8                ; clean up the stack

AddTwo ENDP


END
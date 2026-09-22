.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
array1 REAL8 1.0,2.0,3.0,4.0
array2 REAL8 4 DUP(?)

.code
main PROC
    mov ecx,4
    mov esi,OFFSET array1
    mov edi,OFFSET array2

L1:
    mov eax,[esi]
    jmp L2

L11:
    LOOP L1
    jmp exit

L2:
    mov edx,1

InnerLoop:
    mov [edi],eax
    add esi,8
    add edi,8

    dec edx
    jnz InnerLoop
    
    jmp L11
exit:
    INVOKE ExitProcess,0
main ENDP
END main
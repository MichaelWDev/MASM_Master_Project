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

loop L1
jmp exit

L1:
    mov eax,[esi]
    mov [edi],eax
    add esi,8
    add edi,8
    LOOP L1

exit:
    INVOKE ExitProcess,0
main ENDP
END main
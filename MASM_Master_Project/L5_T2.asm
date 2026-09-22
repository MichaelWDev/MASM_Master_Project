.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data

.code
main PROC
    mov eax,1
    mov ebx,2
    mov ecx,3
    mov edx,4
    mov esi,5
    mov edi,6
    mov ebp,7
    

    pushad

    

    pop edi
    pop esi
    pop ebp
    pop edx
    pop ecx
    pop ebx
    pop eax


    INVOKE ExitProcess,0
main ENDP
END main

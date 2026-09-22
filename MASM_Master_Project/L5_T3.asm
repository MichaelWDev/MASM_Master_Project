.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
myArray DWORD 10,20,30,40,50

.code

ArraySum PROC USES esi ecx
    mov eax,0
L1:
    add eax,[esi]
    add esi,TYPE DWORD
    loop L1
    ret
ArraySum ENDP

main PROC
    mov esi,OFFSET myArray
    mov ecx,5
    call ArraySum

    INVOKE ExitProcess,0
main ENDP

END main
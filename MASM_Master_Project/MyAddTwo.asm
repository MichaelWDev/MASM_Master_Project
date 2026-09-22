.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
michael DWORD ?

.code
main PROC
    mov eax, 5
    add eax, 6

    mov michael, eax

    invoke ExitProcess, 0
main ENDP
END main

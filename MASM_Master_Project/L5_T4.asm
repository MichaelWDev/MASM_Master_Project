.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.code

main PROC
    call Sub1
    INVOKE ExitProcess,0
main ENDP

Sub1 PROC
    call Sub2
    ret
Sub1 ENDP

Sub2 PROC
    call Sub3
    ret
Sub2 ENDP

Sub3 PROC
    ret
Sub3 ENDP

END main
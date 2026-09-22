
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
firstval    DWORD 20002000h
secondval   DWORD 11111111h
thirdval    DWORD 22222222h
sum_michael DWORD 0
.code
main PROC
mov eax,firstval
add eax,secondval
add eax,thirdval
mov sum_michael,eax
INVOKE ExitProcess, 0
main ENDP
END main

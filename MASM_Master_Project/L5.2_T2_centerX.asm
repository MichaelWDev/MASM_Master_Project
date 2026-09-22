.386
.model flat, stdcall
.stack 4096

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

ExitProcess proto, dwExitCode:dword

.data
    xChar BYTE "X",0

.code
main PROC

    mov eax, yellow + (blue * 16)
    call SetTextColor

    call Clrscr

    ; row
    mov dh, 12
    
    ; col
    mov dl, 40
    call GotoXY

    mov edx, OFFSET xChar
    call WriteString

    ; bottom row
    mov dh, 24
    
    ; column 0
    mov dl, 0
    call GotoXY

    call WaitMsg

    invoke ExitProcess, 0
main ENDP

END main

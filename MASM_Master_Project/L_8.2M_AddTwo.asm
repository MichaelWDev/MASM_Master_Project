; Demonstrate the AddTwo Procedure     (AddTwo.asm)
; Demonstrates different procedure call protocols.
;INCLUDE Irvine32.inc

.model flat, stdcall
.386
.stack 4096
OPTION PROC:PRIVATE
AddTwo PROTO
EXTERNDEF sum:DWORD
ExitProcess proto, dwExitCode:DWORD

.data
sum DWORD 0 ; ?
word1 WORD 1234h
word2 WORD 4111h

.code
main PROC PUBLIC

    ;call    Example1
    ;call    Example2

    movzx   eax,word1
    push    eax
    movzx   eax,word2
    push    eax
    call    AddTwo
    ; call    DumpRegs

    ; exit
    invoke  ExitProcess, 0

main ENDP

AddTwo PROC
; Adds two integers, returns sum in EAX.
; The RET instruction cleans up the stack.



    push ebp
    mov  ebp,esp
    mov  eax,[ebp + 12]       ; first parameter
    add  eax,[ebp + 8]        ; second parameter
    pop  ebp
    ret  8                ; clean up the stack
AddTwo ENDP

END main
.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
.data
val1 WORD 1000h
val2 WORD 2000h
arrayB BYTE 10h,20h,30h
arrayW WORD 100h,200h,300h
.code
main PROC
; demo MOVZX:
mov bx,0A69Bh
movzx eax,bx
movzx edx,bl
movzx cx,bl
; demo MOVSX:
mov bx, 0A69Bh
movsx eax,bx
movsx edx,bl
mov   bl, 7Bh
movsx cx,bl
; type the memory to memory exchange code


; val1 <-> val2
mov ax, val1
xchg ax, val2
mov val1, ax

; type the Direct-Offset Addressing code
; for accessing each arrayB element byte by byte
mov al, arrayB[0]
mov al, arrayB[1]
mov al, arrayB[2]

; type the Direct-Offset Addressing code
; for accessing arrayW data word by word
mov ax, arrayW
mov ax, [arrayW+2]
mov ax, arrayW[4]

INVOKE ExitProcess,0
main ENDP
END main
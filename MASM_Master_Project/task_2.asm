.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
.data
Rval SDWORD ?
Xval SDWORD 26
Yval SDWORD 30
Zval SDWORD 40
.code
main PROC
; INC and DEC
mov eax, 100000h
;...
; Expression: Rval = -Yval + (-Zval - Xval)
mov eax, Yval
neg eax
mov ebx, Zval
neg ebx
sub ebx, Xval
add eax, ebx
mov Rval, eax


; Zero flag example:
;...  ; ZF=1 ; by reaching 0
mov eax, 1
dec eax


;...  ; ZF=1 ; by overflowing
mov al, 255
add al, 1


; Sign flag example:
;...  ; SF=1 ; by reaching negative value
mov eax, 0
dec eax


;...  ; SF=1 ; by overflowing to negative value
mov al, 127
add al, 1


; Carry flag example:
;...  ; CF=1
mov al, 128
add al, 200


; Overflow flag example:
mov ax,7fffh 

;...  ;OF=1 by rolling over maximum value
mov al, 100
add al, 28

;...  ;OF=1 by rolling under minimum value
mov al, -127
sub al, 2

; Registers
mov ax,7FF0h
add al,10h  ; a. CF= 1   SF= 0  ZF= 1  OF= 0
add ah,2    ; a. CF=   SF=  ZF=  OF=
add ax,3    ; a. CF=   SF=  ZF=  OF=


INVOKE ExitProcess,0
main ENDP
END main

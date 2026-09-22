; Encrypt.asm from Irvine32.inc, edited for task 4

; Encryption Program               (Encrypt.asm)

; This program demonstrates simple symmetric
; encryption using the XOR instruction.

INCLUDE Irvine32.inc
KEY = 239     		; any value between 1-255
BUFMAX = 128     	; maximum buffer size

.data
sPrompt  BYTE  "Enter the plain text: ",0
sEncrypt BYTE  "Cipher text:          ",0
sDecrypt BYTE  "Decrypted:            ",0
buffer   BYTE   BUFMAX+1 DUP(0)
bufSize  DWORD  ?

.code
main PROC
    call InputTheString
    call TranslateBuffer

    mov edx,OFFSET sEncrypt
    call WriteString
    mov edx,OFFSET buffer
    mov ecx,bufSize
    call DisplayCiphertext

    call TranslateBuffer
    mov edx,OFFSET sDecrypt
    call DisplayMessage

    exit
main ENDP


;---------
DisplayCiphertext PROC USES eax ebx ecx edx esi

    mov esi, edx

cipherLoop:
    mov al, [esi]
    mov ebx, 1
    call WriteHexB

    inc esi
    loop cipherLoop

    call Crlf
    call Crlf
    ret
DisplayCiphertext ENDP



;-----------------------------------------------------
InputTheString PROC
;
; Prompts user for a plaintext string. Saves the string 
; and its length.
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
	pushad
	mov	edx,OFFSET sPrompt	; display a prompt
	call	WriteString
	mov	ecx,BUFMAX		; maximum character count
	mov	edx,OFFSET buffer   ; point to the buffer
	call	ReadString         	; input the string
	mov	bufSize,eax        	; save the length
	call	Crlf
	popad
	ret
InputTheString ENDP

;-----------------------------------------------------
DisplayMessage PROC
;
; Displays the encrypted or decrypted message.
; Receives: EDX points to the message
; Returns:  nothing
;-----------------------------------------------------
	pushad
	call	WriteString
	mov	edx,OFFSET buffer	; display the buffer
	call	WriteString
	call	Crlf
	call	Crlf
	popad
	ret
DisplayMessage ENDP

;-----------------------------------------------------
TranslateBuffer PROC
;
; Translates the string by exclusive-ORing each
; byte with the encryption key byte.
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
	pushad
	mov	ecx,bufSize		; loop counter
	mov	esi,0			; index 0 in buffer
L1:
	xor	buffer[esi],KEY	; translate a byte
	inc	esi				; point to next byte
	loop	L1

	popad
	ret
TranslateBuffer ENDP
END main
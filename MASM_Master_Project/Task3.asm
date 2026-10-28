; Write a program in MASM to compute the expression requested in problem 9 at page 405
; (section 10.1.8), in Edition 7 of the book, namely:

; Write an expression that returns the number of bytes in "field2" of "MyStruct".
; Place this in a full program that compiles

; Trace the code and post a snapshot for the moment when the expression is evaluated.

; Submit the snapshot and the source.

INCLUDE Irvine32.inc

; MyStruct
MyStruct STRUCT
	field1 WORD ?
	field2 DWORD ?
	field3 BYTE 10 DUP(?)
MyStruct ENDS

; data
.data
	; store number of bytes in field2
	field2Size DWORD SIZEOF MyStruct.field2


; code
.code
main PROC
	; load the bytes in field2
	mov eax, field2Size

	; shows the registers in the console window
	call DumpRegs

	exit
main ENDP
END main
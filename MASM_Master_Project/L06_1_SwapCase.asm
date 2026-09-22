.386
.model flat, stdcall
INCLUDE Irvine32.inc

.data
buffer BYTE 256 DUP(0)
spaces80 BYTE 80 DUP(" "), 0
textlen DWORD ?

.code
main PROC

mov EAX, black*16 + lightGray
call SetTextColor

call Clrscr

mov EDX, 00h
call Gotoxy

mov EAX, blue*16 + yellow
call SetTextColor

mov EDX, OFFSET spaces80
call WriteString

mov EDX, 29*256
call Gotoxy

mov EAX, yellow*16 + blue
call SetTextColor

mov EDX, OFFSET spaces80
call WriteString

mov EDX, 00h
call Gotoxy

mov EAX, blue*16 + yellow
call SetTextColor

mov EDX, OFFSET buffer
mov ECX, SIZEOF buffer - 1
call ReadString
mov textlen, EAX
mov ESI, OFFSET buffer

cycle:

cmp BYTE PTR [ESI], 0
je end_cycle


cmp BYTE PTR [ESI], 'A'
jb next_char


cmp BYTE PTR [ESI], 'z'
ja next_char


cmp BYTE PTR [ESI], 'Z'
jbe char_to_flip


cmp BYTE PTR [ESI], 'a'
jbe char_to_flip
jb next_char

char_to_flip:
xor BYTE PTR [ESI], 20h
next_char:
inc ESI

jmp cycle
end_cycle:

mov EDX, 29*256
call Gotoxy
mov EAX, yellow*16 + blue
call SetTextColor
mov EDX, OFFSET buffer
call WriteString


mov EAX, 2000
call Delay
exit
main ENDP
END main
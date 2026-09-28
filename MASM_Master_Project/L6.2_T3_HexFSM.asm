INCLUDE Irvine32.inc
.data
 InvalidInputMsg BYTE " -> Invalid input",13,10,0
 SuccessMsg BYTE " -> Success",13,10,0
 value1 BYTE "0A8Ahh",0
 value2 BYTE "0F8ah",0
 value3 BYTE "0A8Ah",0
 value4 BYTE "8ACh",0
 value5 BYTE "FAh",0
 value6 BYTE "2AF8a",0
 value7 BYTE "8A54gh",0
 .code
main PROC
  mov esi, OFFSET value1
  call translate
  mov esi, OFFSET value2
  call translate
  mov esi, OFFSET value3
  call translate
  mov esi, OFFSET value4
  call translate
  mov esi, OFFSET value5
  call translate
  mov esi, OFFSET value6
  call translate
  mov esi, OFFSET value7
  call translate

  exit
main ENDP

translate PROC
 mov EDX, ESI
 call WriteString

StateA: ;accept +,-,0-9
 call GetNext
 
 cmp al, '+'
 je StateB
 cmp al, '-'
 je StateB
 call isDigit
 jz StateC

 jmp failure

StateB: ;accept 0-9
  call GetNext

  call isDigit
  jz StateC

  jmp failure

StateC: ; accept 0-9,a-f,A-F,h,H
  call GetNext
  call isDigit

  jz StateC
  cmp al, 'h'
  je StateD

  cmp al, 'H'
  je StateD
  jmp StateC

  cmp al, 'A'
  jb failure

  cmp al, 'f'
  ja failure

  cmp al, 'F'
  jbe StateC
  jmp failure

StateD: ; accept null	
success:
 call GetNext
 cmp al,0 ; should end with a null
 jne failure

 mov EDX, OFFSET SuccessMsg
 call WriteString
 ret
failure:
 mov EDX, OFFSET InvalidInputMsg
 call WriteString
 ret
translate ENDP

GetNext PROC
   mov AL, [ESI]
   inc ESI
   ret
GetNext ENDP
END main
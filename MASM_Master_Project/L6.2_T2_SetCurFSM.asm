.model flat, stdcall
.stack 4096

.data
BadXCoordMsg BYTE "X-coordinate out of range",13,10,0
BadYCoordMsg BYTE "Y-coordinate out of range",13,10,0

.code
PUBLIC SetCursorPosition

SetCursorPosition PROC
State_Start:
	cmp dl, 10
	jb State_DL_less_10
	cmp dl, 79
	ja State_DL_gt_79

State_DL_OK:
	cmp dh, 10
	jb State_DH_less_10
	cmp dh, 24
	ja State_DH_gt_24

State_DL_less_10:
	mov edx, OFFSET BadXCoordMsg
	call WriteString
	jmp quit

State_DH_less_10:
	mov edx, OFFSET BadYCoordMsg
	call WriteString
	jmp quit

State_OK:
	call Gotoxy

quit:
	ret

SetCursorPosition ENDP

END

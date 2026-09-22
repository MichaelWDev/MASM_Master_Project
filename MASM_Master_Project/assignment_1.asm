INCLUDE Irvine32.inc

.data
msg BYTE "MASM setup complete!", 0

.code
main PROC
    mov edx, OFFSET msg
    call WriteString
    exit
main ENDP

END main
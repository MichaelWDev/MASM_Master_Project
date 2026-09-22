DisplayCiphertext PROC USES eax ebx ecx edx esi

    mov esi, edx

cipherLoop:
    mov al, [esi]
    mov ebx, 1
    call WriteHexB

    inc esi
    loop cipherLoop

    ret
DisplayCiphertext ENDP

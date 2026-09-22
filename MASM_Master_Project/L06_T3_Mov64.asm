ExitProcess proto
.data
myDword DWORD 80808080h
myDword2 DWORD 70000000h
.code
main proc
 mov rax,0FFFFFFFFFFFFFFFFh
 mov al,BYTE PTR myDword   ; rax =
 mov rax,0FFFFFFFFFFFFFFFFh
 mov ax,WORD PTR myDword   ; rax =
 mov eax,myDword           ; rax =
 mov rax,0FFFFFFFFFFFFFFFFh
 mov eax,myDword2          ; rax =
 movsxd rax, myDword       ; rax =
 mov rax,0FFFFFFFFFFFFFFFFh
 and rax,80h               ; rax =
 mov rax,0FFFFFFFFFFFFFFFFh
 and rax,8080h             ; rax =
 mov rax,0FFFFFFFFFFFFFFFFh
 and rax,70808080h         ; rax =
 mov rax,0FFFFFFFFFFFFFFFFh
 and rax,80808080h         ; rax =
 mov ecx,0
 call ExitProcess
main endp
end
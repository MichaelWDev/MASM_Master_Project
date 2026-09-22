.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
source DWORD "T", "h", "i", "s", " ", "i", "s", " ", "i", "t", 0
target DWORD LENGTHOF source DUP(0)
count EQU LENGTHOF source
tmp DWORD ?
.code
main PROC
 mov esi,0
 mov ecx, SIZEOF source
L1:
 mov tpm, ECX

 mov ecx, 2

 L2:
  mov al,BYTE PTR [source+esi]
  mov BYTE PTR [target+esi],al
  inc esi
 loop L2

 mov ecx, tpm
 loop L1

 invoke ExitProcess,0
main ENDP
END main

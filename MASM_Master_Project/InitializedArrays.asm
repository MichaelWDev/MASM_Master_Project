; Initialized Arrays

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

SUNDAY = 0
MONDAY = 1
TUESDAY = 2
WEDNESDAY = 3
THURSDAY = 4
FRIDAY = 5
SATURDAY = 6

.data
myArray BYTE 5000 DUP(?)

week BYTE SUNDAY, MONDAY, TUESDAY, WEDNESDAY

.code
main PROC

INVOKE ExitProcess, 0
main ENDP
END main

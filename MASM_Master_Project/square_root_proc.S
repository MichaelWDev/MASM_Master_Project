// File: square_root_proc.S
// Florida Tech, CSE3120
// Instructor: Marius Silaghi
.code32
.text
.globl __main
.type  __main, @function
.globl square_root_proc
.type  square_root_proc, @function
square_root_proc:
 push %EBX
 push %ECX
 push %EDX
 // init some register <reg_i> with 0 (xor with itself), to represent variable i
 //     note that <reg_i> should not be EAX, or EDX as those are used in multiplication
 xor %ECX, %ECX

 // move EAX into yet another register <reg_value>
 mov %EAX, %EBX

cycle:
 // move the register <reg_i> into EAX
 mov %ECX, %EAX

 // multiply EAX with the register storing <reg_i>
 mul %EAX

 // if the result is equal with <reg_value> jump out of the loop
 jc notfound
 cmp %EBX, %EAX
 je found

 // increment <reg_i> and jump to the EAX preparation with <reg_i>
 inc %ECX
 jmp cycle

found:
 // store for return in EAX the result (the value of <reg_i>)
 mov %ECX, %EAX

notfound:
 // restore original values of registers <reg_i> <reg_value> EDX
 pop %EDX
 pop %ECX
 pop %EBX

 // nops as many as needed
.rept 10
 nop
.endr

 // return
 ret

__main:
 mov $4, %eax
 call square_root_proc
 mov %eax, %ebx
 // exit code
 mov $1, %eax
 // exit syscall
int $0x80
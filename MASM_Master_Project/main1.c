#include <stdio.h> // Line 1
#include <stdint.h> // Line 2
int main() { // Line 3
    char* str = "String Tested"; //Line 4
    char* pos; // Line 5
    asm("cld \n\t" // Line 6
        "movq %1, %%rdi \n\t" // Line 7
        "movq $14, %%rcx \n\t"
        "movb $'T, %%al \n\t"  // $84
        "repne scasb \n\t"
        "decq %%rdi \n\t"
        "movq %%rdi, %0"
        : "=rm" (pos)
        : "g" (str)
        : "rcx", "rdi", "rax", "cc");
    printf("str: %p  pos: %p %c \n", str, pos, *pos);
}
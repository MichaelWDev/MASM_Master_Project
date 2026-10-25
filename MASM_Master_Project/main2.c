#include <stdio.h>
#include <stdint.h>
#include <string.h>
int main() {
    char* str = "String Tested";
    char* pos;
    long long int tail;
    asm("cld \n\t"
        "movb $'T', %%al \n\t"
        "repne scasb \n\t"
        "decq %%rdi \n\t"
        "movq %%rdi, %0 \n\t"
        "movq %%rcx, %1 \n\t"
        : "=m" (pos), "=rm" (tail)
        : "D" (str), "c" (strlen(str))
        : "rax", "cc");
    printf("str: %p  pos: %p %c tail=%lld\n", str, pos, *pos, tail);
}
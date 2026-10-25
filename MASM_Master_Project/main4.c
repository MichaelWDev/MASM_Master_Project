#include <stdio.h>
#include <stdint.h>

int main() {
    uint64_t c = 0, b = 1000, a = 2000;
    asm("lea 10(%1, %2, 4), %0\n"
        : "=r" (c)
        : "r" (b), "r" (a)
    );
    printf("c=%lld\n", c);
}
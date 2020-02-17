#include <stdarg.h>

#include "util.h"

volatile char* uart_tx = (char*) 0xc0000000;

void printf(const char* s, ...) {
    va_list args;
    va_start(args, s);
    while (*s != '\0') {
        if (*s == '%') {
            s++;
            if (*s == 'd') {
                int x = va_arg(args, int);
                printInt(x);
                s++;
            } else if (*s == 'x') {
                int x = va_arg(args, int);
                printHex(x);
                s++;
            } else if (*s == 's') {
                char* str = va_arg(args, char*);
                printString(str);
                s++;
            } else {
                *uart_tx = '%';
            }
        } else {
            *uart_tx = *s;
            s++;
        }
    }
}

void printChar(char c) {
    *uart_tx = c;
}

void printString(const char *s) {
    while (*s != '\0') {
        *uart_tx = *s;
        s++;
    }
}

void printHex(int x) {
    for (int i = 32/4-1 ; i >= 0 ; i--) {
        char c = (x >> (4*i)) & 0xF;
        c += 48;
        if (c > 57) {
            c += 39;
        }
        printChar(c);
    }
}

void printInt(int x) {
    int i = 0;
    int d = 1;
    if (x < 0) {
        printChar('-');
        printInt(-x);
    } else {
        while ((x / d) > 10) {
            i++;
            d*=10;
        }
        while (d > 0) {
            printDigit((x / d) % 10);
            d /= 10;
        }
    }
}

void printDigit(char d) {
    *uart_tx = '0' + d;
}

int trapHandler(int mcause, int mepc, int regs[32]) {
    printf("Trap detected!\n");
    printf("  mcause = %d\n", mcause);
    printf("  mepc = 0x%x\n", mepc);
    printf("  regs:\n");
    for (int i = 0 ; i < 32 ; i++) {
        printf("    x%d = 0x%x\n", i, regs[i]);
    }
    abort();
    return mepc;
}

void abort();
void printf(const char *s, ...);
void printChar(char c);
void printString(const char *s);
void printHex(int x);
void printInt(int x);
void printDigit(char d);
int trapHandler(int mcause, int mepc, int regs[32]);

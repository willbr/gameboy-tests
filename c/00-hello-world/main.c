#define EI __asm__("ei");
#define DI __asm__("di");

volatile unsigned char test;

void inc() {
    test += 1;
}

void main() {
    EI;
    inc();
    test = 0;
    inc();
    DI;
    inc();
}


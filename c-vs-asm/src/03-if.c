extern void puts(char*);
extern volatile unsigned char i;
extern volatile signed char j;

void if_test(void)
{

    if (i) {
        puts("is true");
    }

    if (!i) {
        puts("isn't true");
    }

    if (i > 0) {
        puts("i > 0");
    }

    if (i >= 0) {
        puts("i >= 0");
    }

    if (i == 0) {
        puts("i == 0");
    }

    /* ######################################## */


    if (j) {
        puts("is true");
    }

    if (!j) {
        puts("isn't true");
    }

    if (j > 0) {
        puts("j > 0");
    }

    if (j >= 0) {
        puts("j >= 0");
    }

    if (j == 0) {
        puts("j == 0");
    }

    if (j < 0) {
        puts("j < 0");
    }

    if (j <= 0) {
        puts("j <= 0");
    }
    return;
}


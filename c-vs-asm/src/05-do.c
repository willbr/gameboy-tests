extern unsigned char j;

void variable(void)
{
    unsigned char i;

    i = 0;

    do {
        j = i;
        ++i;
    } while (i < 10);

    return;
}


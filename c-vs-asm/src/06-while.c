extern unsigned char j;

void variable(void)
{
    unsigned char i;

    i = 0;

    while (i < 10) {
        j = i;
        ++i;
    }

    return;
}


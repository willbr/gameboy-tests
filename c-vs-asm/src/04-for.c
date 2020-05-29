extern unsigned char j;

void variable(void)
{
    unsigned char i;
    for (i = 0; i < 10; ++i) {
        j = i;
    }

    return;
}


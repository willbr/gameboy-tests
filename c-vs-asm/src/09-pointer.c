extern unsigned char j;


unsigned char add(
        unsigned char *a,
        unsigned char *b
        );


void variable(void)
{
    unsigned char i;
    unsigned char j = 4;
    unsigned char k = 9;

    i = add(&j, &k);

    return;
}


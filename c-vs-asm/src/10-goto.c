extern unsigned char i;
extern void other_func(unsigned j);


void variable(void)
{
    if (i == 5) {
        goto one;
    } else {
        goto two;
    }

one:
    other_func(1);
    goto three;

two:
    other_func(2);
    goto three;

three:
    other_func(3);

    return;
}


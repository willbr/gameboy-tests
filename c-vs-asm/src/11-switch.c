extern unsigned char i;
extern void other_func(unsigned j);


void variable(void)
{
    switch (i) {
        case 0:
            other_func(0);
            break;
        case 1:
            other_func(1);
            break;
        case 2:
            other_func(2);
            break;
        case 3:
            other_func(3);
            break;
        case 4:
            other_func(4);
            break;
        default:
            break;
    }
}


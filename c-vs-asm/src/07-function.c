extern unsigned char j;

void list_i(void){
    unsigned char i;

    i = 0;

    while (i < 10) {
        j = i;
        ++i;
    }
}


void list_i_limit(unsigned char limit){
    unsigned char i;

    i = 0;

    while (i < limit) {
        j = i;
        ++i;
    }
}



void variable(void)
{
    list_i();
    list_i_limit(123);

    return;
}


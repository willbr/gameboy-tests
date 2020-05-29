const unsigned char global_i = 5;

void variable(void)
{
    volatile unsigned char local_j = 123;

    ++local_j;

    local_j = global_i;

    local_j += 1;

    local_j = global_i;

    return;
}


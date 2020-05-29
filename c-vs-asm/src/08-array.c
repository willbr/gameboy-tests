extern unsigned char j;

void variable(void)
{
    unsigned char i;
    unsigned char face[] = {'a', 'b', 'c', 'd', '\0'};
    unsigned char face_length = sizeof(face) / sizeof(face[0]);

    for (i = 0; i < face_length; ++i) {
        j = face[i];
    }

    return;
}


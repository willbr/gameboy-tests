#ifndef RANDOM_H
#define RANDOM_H


char random8_between(char min, char max);
char random8();


const u8 random_table[] = {
    0x67, 0xA8, 0x34, 0x6E, 0x99, 0x8B, 0x0E, 0x20,
    0xC6, 0xF3, 0xC3, 0x7A, 0x0A, 0xBA, 0xAE, 0x9F,
    0x80, 0x2B, 0xA2, 0x6D, 0x3E, 0xBF, 0x68, 0xB7,
    0xD8, 0x33, 0xC9, 0xB1, 0xDB, 0x07, 0xAA, 0xDA,
    0x38, 0x24, 0x21, 0x37, 0x98, 0x7B, 0xD6, 0xF5,
    0x63, 0x5D, 0xEB, 0xD3, 0x95, 0xE2, 0xD2, 0xBC,
    0x4B, 0xFA, 0x89, 0x1F, 0x82, 0x0B, 0xA4, 0x01,
    0x76, 0xFB, 0xFE, 0x8F, 0x50, 0x51, 0xE1, 0x6C,
    0xFC, 0xE4, 0xE6, 0xF9, 0x40, 0x32, 0xF0, 0x62,
    0xEC, 0x9B, 0x84, 0x27, 0x0F, 0x19, 0x13, 0xF8,
    0xCE, 0x8C, 0xCA, 0x0C, 0xE9, 0xDC, 0x5E, 0xE3,
    0x17, 0xAF, 0x53, 0x1A, 0xAB, 0xAD, 0x6B, 0x75,
    0x94, 0xBE, 0xF6, 0x5A, 0x18, 0x3D, 0x14, 0x22,
    0x46, 0x59, 0x6F, 0x58, 0x85, 0x78, 0xD7, 0x08,
    0xED, 0x26, 0x02, 0x93, 0x1C, 0x79, 0x90, 0x2E,
    0xCD, 0x04, 0xE8, 0xAC, 0x4A, 0xF1, 0x29, 0x10,
    0x83, 0x15, 0x73, 0xB5, 0x87, 0x4D, 0xD4, 0x86,
    0x70, 0x8D, 0xC0, 0x57, 0x36, 0x45, 0xC7, 0xFF,
    0x23, 0xD5, 0xA3, 0x81, 0xA5, 0xE7, 0x97, 0x5C,
    0xF2, 0x03, 0x7C, 0xD0, 0xE5, 0xDF, 0x1E, 0xB4,
    0x1D, 0x12, 0x4C, 0xBB, 0x31, 0xBD, 0x4F, 0x28,
    0x9D, 0x41, 0xA1, 0xE0, 0x9E, 0x05, 0x66, 0xA9,
    0x77, 0xCC, 0xA0, 0x54, 0xB2, 0x8A, 0xF4, 0xC1,
    0x3C, 0x1B, 0x3F, 0x61, 0x00, 0x65, 0x0D, 0x71,
    0x69, 0x56, 0x30, 0x06, 0x09, 0x7F, 0x88, 0xD9,
    0xCB, 0x60, 0xEE, 0x39, 0xC5, 0x74, 0x96, 0xDD,
    0xC2, 0x2F, 0xB6, 0x4E, 0x9C, 0xD1, 0x91, 0xEA,
    0x7E, 0x5B, 0x64, 0xFD, 0x3A, 0x43, 0x55, 0xEF,
    0x49, 0x47, 0x7D, 0xB0, 0x25, 0x2C, 0x6A, 0xA7,
    0xB3, 0x8E, 0xB8, 0x5F, 0x3B, 0xCF, 0x2D, 0xC8,
    0xF7, 0x44, 0x35, 0x42, 0xB9, 0x9A, 0x92, 0x48,
    0x16, 0xA6, 0x72, 0x2A, 0x11, 0xDE, 0x52, 0xC4
};


char random8_between(char min, char max)
{
    return (random8() % (max + 1 - min)) + min;
}


char random8()
{
    static u8 i = 123;
    return random_table[i++];
}


#endif


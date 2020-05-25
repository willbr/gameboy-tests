#include <string.h> /* memset */

typedef unsigned char u8;
typedef          char i8;
typedef unsigned int  u16;
typedef          int  i16;

struct Object {
    u8 x;
    u8 y;
    u8 tile;
    u8 flags;
};

enum Joy_Button {
    j_down   = 0b10000000,
    j_up     = 0b01000000,
    j_left   = 0b00100000,
    j_right  = 0b00010000,

    j_start  = 0b00001000,
    j_select = 0b00000100,

    j_b      = 0b00000010,
    j_a      = 0b00000001,
};

char random8();
void poll_joypad(void);
void init(void);
void update(void);
void draw(void);
void dma_copy(void);

#define btn(j) (joypad & j)
#define halt() __asm__("halt\n\tnop")
#define nop() __asm__("nop")
#define breakpoint() __asm__("ld b,b")
#define debug_msg() __asm__("ld d,d")


#define rP1 0xFF00
__sfr __at (0x00) p1_joypad;

#define dpad_pin   0b00100000 
#define button_pin 0b00010000 

__sfr __at (0x0F) interrupt_flag;
__sfr __at (0xFF) interrupt_enable;

const u8 IEF_HILO = 0b00010000;
const u8 IEF_SERIAL = 0b00001000;
const u8 IEF_TIMER = 0b00000100;
const u8 IEF_LCDC = 0b00000010;
const u8 IEF_VBLANK = 0b00000001;

__sfr __at (0x26) NR52;

__sfr __at (0x40) LCDC;

#define LCDCF_OFF      0b00000000 // LCD Control Operation
#define LCDCF_ON       0b10000000 // LCD Control Operation
#define LCDCF_WIN9800  0b00000000 // Window Tile Map Display Select
#define LCDCF_WIN9C00  0b01000000 // Window Tile Map Display Select
#define LCDCF_WINOFF   0b00000000 // Window Display
#define LCDCF_WINON    0b00100000 // Window Display
#define LCDCF_BG8800   0b00000000 // BG & Window Tile Data Select
#define LCDCF_BG8000   0b00010000 // BG & Window Tile Data Select
#define LCDCF_BG9800   0b00000000 // BG Tile Map Display Select
#define LCDCF_BG9C00   0b00001000 // BG Tile Map Display Select
#define LCDCF_OBJ8     0b00000000 // OBJ Construction
#define LCDCF_OBJ16    0b00000100 // OBJ Construction
#define LCDCF_OBJOFF   0b00000000 // OBJ Display
#define LCDCF_OBJON    0b00000010 // OBJ Display
#define LCDCF_BGOFF    0b00000000 // BG Display
#define LCDCF_BGON     0b00000001 // BG Display

__sfr __at (0x41) STAT;
__sfr __at (0x42) SCY;
__sfr __at (0x43) SCX;
__sfr __at (0x44) LY;
__sfr __at (0x45) LYC;

__sfr __at (0x46) DMA;

__sfr __at (0x47) BGP;
__sfr __at (0x48) OBP0;
__sfr __at (0x49) OBP1;

u8 __at (0x9000) tiles;
u8 __at (0x9800) bgmap[32][32];

u8 __at (0xFE00) OAMRAM;
u8 __at (0xFF80) HRAM;

/*#define OBJECT_SIZE 4*/

#define OAMF_PRI       0b10000000 // Priority
#define OAMF_YFLIP     0b01000000 // Y flip
#define OAMF_XFLIP     0b00100000 // X flip
#define OAMF_PAL0      0b00000000 // 0,1 (DMG)
#define OAMF_PAL1      0b00010000 // 0,1 (DMG)
#define OAMF_BANK0     0b00000000 // 0,1 (GBC)
#define OAMF_BANK1     0b00001000 // 0,1 (GBC)

#define OAMF_PALMASK   0b00000111 // Palette (GBC)

#define OAMB_PRI       7 // Priority
#define OAMB_YFLIP     6 // Y flip
#define OAMB_XFLIP     5 // X flip
#define OAMB_PAL1      4 // 0,1 (DMG)
#define OAMB_BANK1     3 // 0,1 (GBC)

const u8 font_tiles[] = {
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,

    0b00000001,
    0b00000001,
    0b00000010,
    0b00000010,
    0b00000100,
    0b00000100,
    0b00001000,
    0b00001000,
    0b00010000,
    0b00010000,
    0b00100000,
    0b00100000,
    0b01000000,
    0b01000000,
    0b10000000,
    0b10000000,

    0b10000000,
    0b10000000,
    0b01000000,
    0b01000000,
    0b00100000,
    0b00100000,
    0b00010000,
    0b00010000,
    0b00001000,
    0b00001000,
    0b00000100,
    0b00000100,
    0b00000010,
    0b00000010,
    0b00000001,
    0b00000001,

    0b10000001,
    0b10000001,
    0b01000010,
    0b01000010,
    0b00100100,
    0b00100100,
    0b00011000,
    0b00011000,
    0b00011000,
    0b00011000,
    0b00100100,
    0b00100100,
    0b01000010,
    0b01000010,
    0b10000001,
    0b10000001
};


/*volatile __at (0xC000) struct Object shadow_oam[40];*/

volatile __at (0xFE00) struct Object oam[40];

/* Global Variables */

/* define shadow_oam first
 * so that it's the first item in work ram at 0xC000
 * this is needed so DMA works
 * DMA needs the low address bits to be 0x00
 */

struct Object shadow_oam[40]; 

volatile u8 joypad = 0;
volatile u8 joypad_dpad_state = 0;
volatile u8 joypad_btn_state = 0;

/* End Global Variables */

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

void update(void)
{
    static u8 i;
    static u8 j;

    OBP0 += 1;
    OBP1 -= 1;

    /*SCX += random8();*/
    /*SCY += random8();*/

    /*for (j = 0; j < 1; ++j) {*/
        /*i = random8_between(0, 40);*/

        /*shadow_oam[i].x     = random8() & 150;*/
        /*shadow_oam[i].y     = random8() & 140;*/
        /*shadow_oam[i].tile  = random8_between(0, 0x19);*/
        /*shadow_oam[i].flags = random8();*/

    /*}*/

    /*shadow_oam[0].x     = 0x40;*/
    /*shadow_oam[0].y     = 0x40;*/
    /*shadow_oam[0].tile  = 0x19;*/
    /*shadow_oam[0].flags = random8();*/
}


void draw(void)
{
    bgmap[ 2][ 8] = btn(j_b) ? 3 : 0;
    bgmap[ 1][ 9] = btn(j_a) ? 3 : 0;


    bgmap[ 1][ 3] = btn(j_up) ? 3 : 0;
    bgmap[ 2][ 2] = btn(j_left)  ? 3 : 0;
    bgmap[ 2][ 4] = btn(j_right) ? 3 : 0;
    bgmap[ 3][ 3] = btn(j_down) ? 3 : 0;

    bgmap[ 4][ 5] = btn(j_select) ? 3 : 0;
    bgmap[ 4][ 7] = btn(j_start) ? 3 : 0;

    dma_copy();
}


void main(void) {
    init();

    while(1) {
        update();

        /* halt until vblank */
        halt();
        draw();
    }
}

void timer_isr(void) __interrupt
{
    __asm__("ld b, b;bgb breakpoint");
}

void vblank_isr(void) __critical __interrupt
{
    poll_joypad();
    /*__asm__("ld b, b;bgb breakpoint");*/
}

void lcd_isr(void) __critical __interrupt
{
    __asm__("ld b, b;bgb breakpoint");
}

void serial_isr(void) __critical __interrupt
{
    __asm__("ld b, b;bgb breakpoint");
}

void joypad_isr(void) __critical __interrupt
{
    __asm__("ld b, b;bgb breakpoint");
}


void dma_copy(void)
{
    /*breakpoint();*/

    __asm__(""
            "ld hl, #_shadow_oam\n\t"
            "ld a, h\n\t"
            "ldh (_DMA), a\n\t"
            "ld a, #0x20\n\t"
            "$1:\n\t"
            "dec a\n\t"
            "jr nz, $1\n\t"
           );
}


void poll_joypad(void) 
{
    /*breakpoint();*/
    __asm__(""
            "rP1 = #0xFF00\n\t"
            /* read U, D, L, R keys */
            "ld a, #0x20\n\t"     
            "ld (rP1), a\n\t"
            "ld a, (rP1)\n\t"
            "ld a, (rP1)\n\t"

            "ld (_joypad_dpad_state), a\n\t"
            /*"swap a\n\t"*/
            /*"ld (_joypad), a\n\t"*/

            /* Read keys A, B, SE, ST */
            "ld a, (#0x10)\n\t"
            "ld (rP1), a\n\t"

            "ld a, (rP1)\n\t"
            "ld a, (rP1)\n\t"
            "ld a, (rP1)\n\t"
            "ld a, (rP1)\n\t"
            "ld a, (rP1)\n\t"
            "ld a, (rP1)\n\t"
            "ld (_joypad_btn_state), a\n\t"
            /*"ld hl, #_joypad\n\t"*/
            /*"and a, (hl)\n\t"*/
            /*"ld (_joypad), a\n\t"*/

            "ld a, (#0x30)\n\t"
            "ld (rP1), a\n\t"
            );

    /*breakpoint();*/
        joypad_btn_state = (~joypad_btn_state) & 0x0F;
        joypad_dpad_state = (~joypad_dpad_state) & 0x0F;
    /*breakpoint();*/
        joypad = (joypad_dpad_state << 4) ^ joypad_btn_state;
    /*breakpoint();*/
}


void init(void) {
    /*u8 i;*/

    { __critical
        while (LY < 144) {} /* wait until vblank */

        LCDC = LCDCF_OFF;

        memcpy(&tiles, &font_tiles, sizeof(font_tiles));

        /*breakpoint();*/
        memset(&bgmap, 0, 360);
        /* add tile to bgmap */

        memset(&oam, 0x00, sizeof(oam)); 
        memset(&shadow_oam, 0x19, sizeof(oam)); 

        /*for (i = 0; i < 40; ++i) {*/
            /*shadow_oam[i].x     = random8_between(0, 255); */
            /*shadow_oam[i].y     = random8_between(0, 255);*/
            /*shadow_oam[i].tile  = random8_between(0, 0x19);*/
            /*shadow_oam[i].flags = random8_between(0, 255);*/
        /*}*/

        shadow_oam[0].x     = 0x30; 
        shadow_oam[0].y     = 0x40;
        shadow_oam[0].tile  = 0x19;
        shadow_oam[0].flags = OAMF_PAL0;

        shadow_oam[1].x     = 0x50; 
        shadow_oam[1].y     = 0x60;
        shadow_oam[1].tile  = 0x19;
        shadow_oam[1].flags = OAMF_PAL1 | OAMF_YFLIP;


        BGP = 0b11100100;
        OBP0 = 0b11100100;
        OBP1 = 0b11100100;

        SCY = 0;
        SCX = 0;

        NR52 = 0;

        LCDC = 
            LCDCF_ON | 
            LCDCF_BGON | 
            LCDCF_OBJ8 |
            LCDCF_OBJON;

    }

    __asm__("ei");
    interrupt_enable = IEF_VBLANK;
}



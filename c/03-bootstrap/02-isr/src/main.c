#include <string.h>

#define breakpoint() __asm__("ld b,b")
#define debug_msg() __asm__("ld d,d")

typedef unsigned char u8;
typedef          char i8;
typedef unsigned int  u16;
typedef          int  i16;

__sfr __at (0x00) p1_joy_pad;

__sfr __at (0x0F) interrupt_flag;
__sfr __at (0xFF) interrupt_enable;

const u8 IEF_HILO = 0b00010000;
const u8 IEF_SERIAL = 0b00001000;
const u8 IEF_TIMER = 0b00000100;
const u8 IEF_LCDC = 0b00000010;
const u8 IEF_VBLANK = 0b00000001;

__sfr __at (0x26) NR52;

__sfr __at (0x40) LCDC;
__sfr __at (0x41) STAT;
__sfr __at (0x42) SCY;
__sfr __at (0x43) SCX;
__sfr __at (0x44) LY;
__sfr __at (0x45) LYC;

__sfr __at (0x47) BGP;

u8 __at (0x9000) tiles;
u8 __at (0x9800) bgmap;

const u8 font_tiles[] = {
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


void main() {
    { __critical
        while (LY < 144) {} /* wait until vblank */

        LCDC = 0;

        memcpy(&tiles, &font_tiles, sizeof(font_tiles));

        /*breakpoint();*/
        memset(&bgmap, 0, 360);
        /* add tile to bgmap */

        BGP = 0b11100100;

        SCY = 0;
        SCX = 0;

        NR52 = 0;

        LCDC = 0b10000001;
    }

    __asm__("ei");
    interrupt_enable |= IEF_VBLANK;

    while(1) {
        __asm__("halt\n\t"
                "nop");
        SCY += 1;
    }
}

void timer_isr(void) __interrupt
{
    __asm__("ld b, b;bgb breakpoint");
}

void vblank_isr(void) __critical __interrupt
{
    __asm__("nop");
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


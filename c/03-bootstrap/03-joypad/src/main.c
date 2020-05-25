#include <string.h>

void poll_joypad(void);

#define breakpoint() __asm__("ld b,b")
#define debug_msg() __asm__("ld d,d")

typedef unsigned char u8;
typedef          char i8;
typedef unsigned int  u16;
typedef          int  i16;

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
__sfr __at (0x41) STAT;
__sfr __at (0x42) SCY;
__sfr __at (0x43) SCX;
__sfr __at (0x44) LY;
__sfr __at (0x45) LYC;

__sfr __at (0x47) BGP;

u8 __at (0x9000) tiles;
u8 __at (0x9800) bgmap;

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


u8 joypad = 0;
u8 joypad_dpad_state = 0;
u8 joypad_btn_state = 0;

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
        /*SCY += 1;*/

        /**(&bgmap + 0) = 0;*/
        /**(&bgmap + 1) = 1;*/
        /**(&bgmap + 2) = 2;*/
        /**(&bgmap + 3) = 3;*/

        *(&bgmap + 32 +  0) = joypad & 0b00010000 ? 3 : 0;
        *(&bgmap + 32 +  1) = joypad & 0b00100000 ? 3 : 0;
        *(&bgmap + 32 +  2) = joypad & 0b01000000 ? 3 : 0;
        *(&bgmap + 32 +  3) = joypad & 0b10000000 ? 3 : 0;

        *(&bgmap + 32 + 4) = joypad & 0b00000001 ? 3 : 0;
        *(&bgmap + 32 + 5) = joypad & 0b00000010 ? 3 : 0;
        *(&bgmap + 32 + 6) = joypad & 0b00000100 ? 3 : 0;
        *(&bgmap + 32 + 7) = joypad & 0b00001000 ? 3 : 0;

        *(&bgmap + 0) = joypad_dpad_state & 0b0001 ? 3 : 0;
        *(&bgmap + 1) = joypad_dpad_state & 0b0010 ? 3 : 0;
        *(&bgmap + 2) = joypad_dpad_state & 0b0100 ? 3 : 0;
        *(&bgmap + 3) = joypad_dpad_state & 0b1000 ? 3 : 0;

        *(&bgmap + 4)  = joypad_btn_state & 0b0001 ? 3 : 0;
        *(&bgmap + 5) = joypad_btn_state & 0b0010 ? 3 : 0;
        *(&bgmap + 6) = joypad_btn_state & 0b0100 ? 3 : 0;
        *(&bgmap + 7) = joypad_btn_state & 0b1000 ? 3 : 0;
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


void poll_joypad(void) 
{
    /*breakpoint();*/
    __asm__(""
            "rP1 = #0xFF00"
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

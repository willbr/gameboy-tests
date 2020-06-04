#ifndef GAMEBOY_H
#define GAMEBOY_H

#include <string.h> /* memset */

typedef unsigned char u8;
typedef signed   char i8;
typedef unsigned int  u16;
typedef signed   int  i16;

struct Object {
    u8 y;
    u8 x;
    u8 tile;

    u8 cgb_palette_number : 3;
    u8 cgb_tile_bank : 1;

    u8 palette_number : 1;
    u8 x_flip : 1;
    u8 y_flip : 1;
    u8 priority : 1;
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

void poll_joypad(void);
void dma_copy(void);

#define btn(j) (joypad & j)
#define btnp(j) ((~previous_joypad) & joypad & j)

#define halt() __asm__("halt\n\tnop")
#define nop() __asm__("nop")

#define enable_interrupts() __asm__("ei")
#define disable_interrupts() __asm__("di")

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

/*volatile __at (0xC000) struct Object shadow_oam[40];*/

volatile __at (0xFE00) struct Object oam[40];

/* Global Variables */

/* define shadow_oam first
 * so that it's the first item in work ram at 0xC000
 * this is needed so DMA works
 * DMA needs the low address bits to be 0x00
 */

struct Object shadow_oam[40]; 

volatile u8 previous_joypad = 0;
volatile u8 joypad = 0;
volatile u8 joypad_dpad_state = 0;
volatile u8 joypad_btn_state = 0;

/* End Global Variables */


void dma_copy(void)
{
    nop();
    /*breakpoint();*/

    //__asm__(""
            //"ld hl, #_shadow_oam\n\t"
            //"ld a, h\n\t"
            //"ldh (_DMA), a\n\t"
            //"ld a, #0x20\n\t"
            //"$1:\n\t"
            //"dec a\n\t"
            //"jr nz, $1\n\t"
           //);
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

        joypad_btn_state = (~joypad_btn_state) & 0x0F;
        joypad_dpad_state = (~joypad_dpad_state) & 0x0F;

        previous_joypad = joypad;

        joypad = (joypad_dpad_state << 4) ^ joypad_btn_state;
}






void timer_isr(void) __critical __interrupt __naked
{
    breakpoint();
    __asm__("ret");
}

void vblank_isr(void) __critical __interrupt __naked
{
    poll_joypad();
    //breakpoint();
    __asm__("ret");
}

void lcd_isr(void) __critical __interrupt __naked
{
    breakpoint();
    __asm__("ret");
}

void serial_isr(void) __critical __interrupt __naked
{
    breakpoint();
    __asm__("ret");
}

void joypad_isr(void) __critical __interrupt __naked
{
    breakpoint();
    __asm__("ret");
}

#endif



#ifndef FRIEND_H
#define FRIEND_H

#include <string.h> /* memset */
#include "gameboy.h"

void init(void);
void system_init(void);
void update(void);
void draw(void);

void main(void) {
    system_init();

    init();

    while(1) {
        update();
        halt();
        draw();
    }
}

void system_init(void) {
    {
        __asm__("di");

        while (LY < 144) {} /* wait until vblank */

        LCDC = LCDCF_OFF;

        //memcpy(&tiles, &font_tiles, sizeof(font_tiles));

        memset(&bgmap, 0, 360);

        memset(&oam, 0x00, sizeof(oam)); 
        memset(&shadow_oam, 0x19, sizeof(oam)); 

        BGP = 0b11100100;
        OBP0 = 0b11100100;
        OBP1 = 0b11100100;

        SCY = 0;
        SCX = 0;

        NR52 = 0;

    }
}

#endif


#include "..\assets\char_map.h"
#include <string.h> /* memset */
#include "gameboy.h"
#include "friend.h"
#include "friend_draw.h"

void puts(u8 * s);
inline void putchar(u8 c);

struct Point {
    u8 x;
    u8 y;
};

struct Point cursor;

void puts(u8 *s)
{
    while (*s != '\0') {
        putchar(*s);
        s +=1;
    }
}

inline void putchar(u8 c)
{
    if (c == '\0') {
        return;
        /*breakpoint();*/
        /*goto enforce_screen_limit;*/
    } else if (c == '\n') {
        cursor.x = 0;
        cursor.y += 1;
        goto enforce_screen_limit;
    } else if (' ' <= c && c <= 'Z') {
        nop();
    } else if ('a' <= c && c <= 'z') {
        c = c - 32;
        nop();
    } else {
        breakpoint();
    }

    bgmap[cursor.y][cursor.x] = c - ' ';
    cursor.x += 1;

enforce_screen_limit:
    if (cursor.x > 19) {
        cursor.x = 0;
        cursor.y += 1;

        if (cursor.y > 17) {
            cursor.y = 0;
        }
    }
}


void init(void)
{
    /*cursor.x = 0;*/
    /*cursor.y = 0;*/

    memset(&tiles, 0, sizeof(tiles));
    memcpy(&tiles, &char_map, sizeof(char_map));

    /*u8 c = 0;*/
    /*u8 x = 0;*/
    /*u8 y = 0;*/
    /*static u8 p;*/

    /*for (y = 0; y < 8; ++y) {*/
        /*for (x = 0; x < 8; ++x) {*/
            /*tile_pset(0x0, x, y, c++);*/

            /*p = tile_pget(0x0, x, y);*/

            /*tile_pset(0x0, x, y, p);*/

            /*if (c == 4) {*/
                /*c = 0;*/
            /*}*/
        /*}*/
    /*}*/

    /*static u8 ramp[4];*/

    /*oam[0].x = 40;*/
    /*oam[0].y = 40;*/
    /*oam[0].tile = 0x19;*/

    puts("(ld a 0x4f)\n");
    puts("the\n");
    puts("hello, world!\n");
    puts("The quick brown fox jumped over the lazy dog\n");
    puts("abcdefghijklmnopqrstuvwxyz\n");

    LCDC = 
        LCDCF_ON | 
        LCDCF_BGON | 
        LCDCF_OBJ8 |
        LCDCF_OBJON;

    enable_interrupts();
    interrupt_enable = IEF_VBLANK;
}


void update(void)
{
    /*breakpoint();*/
    /*static u8 step = 0;*/

    /*if (step++ == 8) {*/
        /*OBP0 += 1;*/
        /*OBP1 -= 1;*/

        /*[>BGP += 1;<]*/
        /*step = 0;*/
    /*}*/
}


void draw(void)
{
    /*if (btn(j_left)) {*/
        /*oam[0].x -= 1;*/
    /*}*/

    /*if (btn(j_right)) {*/
        /*oam[0].x += 1;*/
    /*}*/

    /*if (btn(j_up)) {*/
        /*oam[0].y -= 1;*/
    /*}*/

    /*if (btn(j_down)) {*/
        /*oam[0].y += 1;*/
    /*}*/

    /*if (btnp(j_left)) {*/
        /*oam[0].x_flip -= 1;*/
    /*}*/

    /*if (btnp(j_right)) {*/
        /*oam[0].x_flip += 1;*/
    /*}*/

    /*if (btnp(j_up)) {*/
        /*oam[0].y_flip -= 1;*/
    /*}*/

    /*if (btnp(j_down)) {*/
        /*oam[0].y_flip += 1;*/
    /*}*/

    /*bgmap[ 1][ 3] = btn(j_up) ? 3 : 0;*/
    /*bgmap[ 2][ 2] = btn(j_left)  ? 3 : 0;*/
    /*bgmap[ 2][ 4] = btn(j_right) ? 3 : 0;*/
    /*bgmap[ 3][ 3] = btn(j_down) ? 3 : 0;*/
}



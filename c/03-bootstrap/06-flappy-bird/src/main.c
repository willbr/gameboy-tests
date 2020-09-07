#include "..\assets\char_map.h"
#include <string.h> /* memset */

#include "friend.h"
#include "friend_draw.h"

const i8 gravity = 1;
const i8 flap_velocity = -2;
#define SUBPIXELS 3


struct Point {
    u8 x;
    u8 y;
};


struct Player {
    struct Point position;
    i8 y_velocity;
    u8 score;
};

struct Point cursor = { .x = 0, .y = 0};

struct Player player;

u8 game_over = 0;


void init_player()
{
    player.position.x = 40;
    player.position.y = 40;

    player.y_velocity = 1;
    player.score = 0;
}


void init(void)
{
    init_player();

    memset(&oam, 0, sizeof(oam));
    memset(&tiles, 0, sizeof(tiles));
    memset(&bgmap, 0, sizeof(bgmap));

    memcpy(&tiles, &char_map, sizeof(char_map));

    oam[0].tile = 0x19;
    oam[1].tile = 0x19;
    oam[2].tile = 0x19;
    oam[3].tile = 0x19;

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

    if (btnp(j_a)) {
        player.y_velocity = (flap_velocity << SUBPIXELS);
        /*breakpoint();*/
    } else {
        player.y_velocity += gravity;
    }

    i8 step;
    step = (player.y_velocity >> SUBPIXELS);
    player.position.y += step;

    // remove old pipes
    // insert new pipes
    // pipe collision
    // group collision

    if (player.position.y > (160 - 16)) {
        /*BGP += 1;*/
        OBP0 += 1;
        init_player();
    }
}


void draw(void)
{
    oam[0].x = player.position.x;
    oam[0].y = player.position.y;

    oam[1].x = player.position.x + 8;
    oam[1].y = player.position.y;

    oam[2].x = player.position.x;
    oam[2].y = player.position.y + 8;

    oam[3].x = player.position.x + 8;
    oam[3].y = player.position.y + 8;

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



#include <stdbool.h> /* true and false */
#include <stdint.h>  /* uint8_t        */
#include <stdio.h>   /* puts           */

void test__tile_pset();

typedef uint8_t u8;

u8 tiles[192 * 2] = {};

#include "friend_draw.h"

int main(int argc, char **argv)
{
    test__tile_pset();

    return 0;
}


void test__tile_pset()
{
    u8 expected_result;
    u8 result;

    for (u8 j = 0; j < 192; ++j) {
        for (u8 i = 0; i < 4; ++i) {
            expected_result = i;

            tile_pset(j, 0, 0, i);

            result = tile_pget(j, 0, 0);

            if (result != expected_result) {
                printf("%x\n", result);
                printf("%x\n", expected_result);
                assert(false);
            }
        }
    }
}


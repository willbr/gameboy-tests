#ifndef FRIEND_DRAW_H
#define FRIEND_DRAW_H

const u8 bytes_per_row = 2;
const u8 bytes_per_tile = 16;

inline u8* get_tile(u8 tile_number)
{
    //u8 offset = tile_number * bytes_per_tile;
    u8 offset = tile_number << 4;
    return &tiles + offset;
}

inline u8* tile_get_row(u8 tile_number, u8 y)
{
    u8 *tile = get_tile(tile_number);

    //u8 offset = y * bytes_per_row;
    u8 offset = y << 2;

    return tile + offset;
}


u8 tile_pget(u8 tile_number, u8 x, u8 y)
{
    u8 mask = (128 >> x);

    u8 *row = tile_get_row(tile_number, y);

    u8 hi = *(row + 1) & mask;
    u8 lo = *(row + 0) & mask;

    return (hi ? 2 : 0) + (lo ? 1 : 0);
}


void tile_pset(u8 tile_number, u8 x, u8 y, u8 value)
{
    u8 *row = tile_get_row(tile_number, y);

    u8 mask = (128 >> x);

    switch (value) {
        case 0b11:
            *(row + 0) |= mask;
            *(row + 1) |= mask;
            break;

        case 0b10:
            *(row + 0) &= ~mask;
            *(row + 1) |= mask;
            break;

        case 0b01:
            *(row + 0) |= mask;
            *(row + 1) &= ~mask;
            break;

        case 0b00:
            *(row + 0) &= ~mask;
            *(row + 1) &= ~mask;
            break;
    }
}

#endif

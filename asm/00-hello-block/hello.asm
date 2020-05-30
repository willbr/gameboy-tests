INCLUDE "./bootstrap.asm"

SECTION "Game code", ROM0[end_of_cartridge_header]

main:
    var xpos, ds, 2
    var ypos, ds, 2

    call init

    xor a
    ld [xpos], a
    ;ld [ypos], a

.dead_end:
    halt
    nop
    jr .dead_end


init:
    di

    wait_for_vblank

    lcd LCDCF_OFF

    lda [rBGP], default_palette

    memcpy _VRAM, sprite01, 16

    lda [_SCRN0 + 0], 0

    xor a
    lda [rSCX], a
    lda [rSCY], a

    sound AUDENA_OFF

    lcd LCDCF_ON | LCDCF_BG8000 | LCDCF_BGON

    reti


SECTION "tiles", ROM0

sprite01:
    dw `00000000
    dw `00111100
    dw `01122110
    dw `01233210
    dw `01233210
    dw `01122110
    dw `00111100
    dw `00000000


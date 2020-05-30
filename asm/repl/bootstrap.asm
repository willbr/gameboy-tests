INCLUDE "../../../hardware.inc/hardware.inc"

default_palette EQU %11100100

; ###########################################################

wait_for_vblank: MACRO
.loop\@
    ld a, [rLY]
    cp SCRN_Y;
    jr c, .loop\@
ENDM

; ###########################################################

var: MACRO
PUSHS

SECTION "variables", WRAM0

IF _NARG != 3
    FAIL "VAR: Expected 3 args, but got {d:_NARG}"
ENDC

\1::
    \2 \3 

POPS
ENDM

; ###########################################################

lda: MACRO
    ;PRINTT "arg1 \1\n"
    ;PRINTT "arg2 \2\n"

    IF "\2" == "a" 
        ;pass
    ELIF "\2" == "0"
        xor a
    ELSE
        ld a, \2
    ENDC

    ld \1, a
ENDM

; ###########################################################

lcd: MACRO
    lda [rLCDC], \1
ENDM

; ###########################################################

sound: MACRO
    lda [rAUDENA], \1
ENDM

; ###########################################################

breakpoint: MACRO
    ld b,b
ENDM

; ###########################################################

memcpy: MACRO ; dst, src, length
    ld hl, \1
    ld de, \2
    ld bc,  \3

.loop_start\@:
    ;ld a, [de]
    ;ld [hli], a
    lda [hli], [de]

    inc de
    dec bc

    ld a, b
    or c

    jr nz, .loop_start\@

ENDM

; ###########################################################

SECTION "Header", ROM0[$100]

EntryPoint:
    nop
    jp main
EntryPointEnd:

end_of_cartridge_header EQU $150
header_length EQU end_of_cartridge_header - EntryPointEnd

REPT header_length
    db 0
ENDR


; ###########################################################


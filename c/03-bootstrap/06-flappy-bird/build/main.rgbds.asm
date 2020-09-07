;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	; MODULE main
	.optsdcc -mgbz80
	; Generated using the rgbds tokens.
	; We have to define these here as sdcc doesn't make them global by default
	GLOBAL __mulschar
	GLOBAL __muluchar
	GLOBAL __mulint
	GLOBAL __divschar
	GLOBAL __divuchar
	GLOBAL __divsint
	GLOBAL __divuint
	GLOBAL __modschar
	GLOBAL __moduchar
	GLOBAL __modsint
	GLOBAL __moduint
	GLOBAL __mullong
	GLOBAL __modslong
	GLOBAL __divslong
	GLOBAL banked_call
	GLOBAL banked_ret

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	GLOBAL _init_player
	GLOBAL _tile_pset
	GLOBAL _tile_pget
	GLOBAL _main
	GLOBAL _joypad_isr
	GLOBAL _serial_isr
	GLOBAL _lcd_isr
	GLOBAL _vblank_isr
	GLOBAL _timer_isr
	GLOBAL ___memcpy
	GLOBAL _memset
	GLOBAL _game_over
	GLOBAL _player
	GLOBAL _cursor
	GLOBAL _joypad_btn_state
	GLOBAL _joypad_dpad_state
	GLOBAL _joypad
	GLOBAL _previous_joypad
	GLOBAL _shadow_oam
	GLOBAL _oam
	GLOBAL _HRAM
	GLOBAL _OAMRAM
	GLOBAL _bgmap
	GLOBAL _tiles
	GLOBAL _flap_velocity
	GLOBAL _gravity
	GLOBAL _bytes_per_tile
	GLOBAL _bytes_per_row
	GLOBAL _IEF_VBLANK
	GLOBAL _IEF_LCDC
	GLOBAL _IEF_TIMER
	GLOBAL _IEF_SERIAL
	GLOBAL _IEF_HILO
	GLOBAL _char_map
	GLOBAL _dma_copy
	GLOBAL _poll_joypad
	GLOBAL _system_init
	GLOBAL _init
	GLOBAL _update
	GLOBAL _draw
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_p1_joypad	=	0x0000
_interrupt_flag	=	0x000f
_interrupt_enable	=	0x00ff
_NR52	=	0x0026
_LCDC	=	0x0040
_STAT	=	0x0041
_SCY	=	0x0042
_SCX	=	0x0043
_LY	=	0x0044
_LYC	=	0x0045
_DMA	=	0x0046
_BGP	=	0x0047
_OBP0	=	0x0048
_OBP1	=	0x0049
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	SECTION "src\main.c_DATA",BSS
_tiles	=	0x9000
_bgmap	=	0x9800
_OAMRAM	=	0xfe00
_HRAM	=	0xff80
_oam	=	0xfe00
_shadow_oam:
	DS 160
_previous_joypad:
	DS 1
_joypad:
	DS 1
_joypad_dpad_state:
	DS 1
_joypad_btn_state:
	DS 1
_cursor:
	DS 2
_player:
	DS 4
_game_over:
	DS 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	SECTION "DABS (ABS)",CODE
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	SECTION "HOME",CODE
	SECTION "GSINIT",CODE
	SECTION "GSFINAL",CODE
	SECTION "GSINIT",CODE
;src\/gameboy.h:140: volatile u8 previous_joypad = 0;
	ld	hl, _previous_joypad
	ld	[hl], $00
;src\/gameboy.h:141: volatile u8 joypad = 0;
	ld	hl, _joypad
	ld	[hl], $00
;src\/gameboy.h:142: volatile u8 joypad_dpad_state = 0;
	ld	hl, _joypad_dpad_state
	ld	[hl], $00
;src\/gameboy.h:143: volatile u8 joypad_btn_state = 0;
	ld	hl, _joypad_btn_state
	ld	[hl], $00
;src\main.c:24: struct Point cursor = { .x = 0, .y = 0};
	ld	hl, _cursor
	ld	[hl], $00
	ld	hl, (_cursor + 0x0001)
	ld	[hl], $00
;src\main.c:28: u8 game_over = 0;
	ld	hl, _game_over
	ld	[hl], $00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	SECTION "src\main.c_HOME",HOME
	SECTION "src\main.c_HOME",HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	SECTION "src\main.c_CODE",CODE
;src\/gameboy.h:148: void dma_copy(void)
;	---------------------------------
; Function dma_copy
; ---------------------------------
_dma_copy::
;src\/gameboy.h:150: nop();
	nop
.l00101:
;src\/gameboy.h:162: }
	ret
_char_map:
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $10	; 16
	DB $08	; 8
	DB $10	; 16
	DB $08	; 8
	DB $00	; 0
	DB $18	; 24
	DB $00	; 0
	DB $00	; 0
	DB $10	; 16
	DB $08	; 8
	DB $00	; 0
	DB $18	; 24
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $48	; 72	'H'
	DB $24	; 36
	DB $00	; 0
	DB $48	; 72	'H'
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $24	; 36
	DB $00	; 0
	DB $24	; 36
	DB $00	; 0
	DB $7E	; 126
	DB $00	; 0
	DB $24	; 36
	DB $00	; 0
	DB $7E	; 126
	DB $00	; 0
	DB $24	; 36
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $10	; 16
	DB $0C	; 12
	DB $00	; 0
	DB $18	; 24
	DB $10	; 16
	DB $0C	; 12
	DB $10	; 16
	DB $04	; 4
	DB $10	; 16
	DB $04	; 4
	DB $00	; 0
	DB $38	; 56	'8'
	DB $10	; 16
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $46	; 70	'F'
	DB $00	; 0
	DB $A4	; 164
	DB $A0	; 160
	DB $48	; 72	'H'
	DB $00	; 0
	DB $18	; 24
	DB $02	; 2
	DB $34	; 52	'4'
	DB $00	; 0
	DB $2A	; 42
	DB $00	; 0
	DB $66	; 102	'f'
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $18	; 24
	DB $20	; 32
	DB $04	; 4
	DB $0C	; 12
	DB $20	; 32
	DB $20	; 32
	DB $18	; 24
	DB $10	; 16
	DB $48	; 72	'H'
	DB $18	; 24
	DB $44	; 68	'D'
	DB $40	; 64
	DB $32	; 50	'2'
	DB $00	; 0
	DB $00	; 0
	DB $20	; 32
	DB $10	; 16
	DB $00	; 0
	DB $30	; 48	'0'
	DB $00	; 0
	DB $20	; 32
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $0C	; 12
	DB $08	; 8
	DB $10	; 16
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $10	; 16
	DB $08	; 8
	DB $10	; 16
	DB $00	; 0
	DB $0C	; 12
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $30	; 48	'0'
	DB $10	; 16
	DB $08	; 8
	DB $00	; 0
	DB $08	; 8
	DB $00	; 0
	DB $08	; 8
	DB $10	; 16
	DB $08	; 8
	DB $00	; 0
	DB $30	; 48	'0'
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $40	; 64
	DB $08	; 8
	DB $10	; 16
	DB $20	; 32
	DB $20	; 32
	DB $10	; 16
	DB $00	; 0
	DB $48	; 72	'H'
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $10	; 16
	DB $08	; 8
	DB $10	; 16
	DB $08	; 8
	DB $66	; 102	'f'
	DB $18	; 24
	DB $00	; 0
	DB $7E	; 126
	DB $10	; 16
	DB $08	; 8
	DB $10	; 16
	DB $08	; 8
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $20	; 32
	DB $40	; 64
	DB $40	; 64
	DB $20	; 32
	DB $20	; 32
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $7E	; 126
	DB $7C	; 124
	DB $02	; 2
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $60	; 96
	DB $40	; 64
	DB $20	; 32
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $02	; 2
	DB $02	; 2
	DB $04	; 4
	DB $04	; 4
	DB $08	; 8
	DB $10	; 16
	DB $08	; 8
	DB $00	; 0
	DB $30	; 48	'0'
	DB $20	; 32
	DB $40	; 64
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $28	; 40
	DB $10	; 16
	DB $44	; 68	'D'
	DB $00	; 0
	DB $10	; 16
	DB $44	; 68	'D'
	DB $10	; 16
	DB $44	; 68	'D'
	DB $44	; 68	'D'
	DB $00	; 0
	DB $28	; 40
	DB $10	; 16
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $10	; 16
	DB $08	; 8
	DB $00	; 0
	DB $08	; 8
	DB $00	; 0
	DB $08	; 8
	DB $00	; 0
	DB $08	; 8
	DB $00	; 0
	DB $08	; 8
	DB $18	; 24
	DB $04	; 4
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $18	; 24
	DB $10	; 16
	DB $24	; 36
	DB $20	; 32
	DB $44	; 68	'D'
	DB $00	; 0
	DB $08	; 8
	DB $08	; 8
	DB $10	; 16
	DB $00	; 0
	DB $3E	; 62
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $44	; 68	'D'
	DB $38	; 56	'8'
	DB $00	; 0
	DB $04	; 4
	DB $00	; 0
	DB $1C	; 28
	DB $06	; 6
	DB $00	; 0
	DB $00	; 0
	DB $02	; 2
	DB $22	; 34
	DB $1C	; 28
	DB $00	; 0
	DB $00	; 0
	DB $08	; 8
	DB $10	; 16
	DB $08	; 8
	DB $20	; 32
	DB $00	; 0
	DB $48	; 72	'H'
	DB $40	; 64
	DB $3E	; 62
	DB $00	; 0
	DB $08	; 8
	DB $00	; 0
	DB $08	; 8
	DB $00	; 0
	DB $08	; 8
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $20	; 32
	DB $1E	; 30
	DB $00	; 0
	DB $20	; 32
	DB $04	; 4
	DB $38	; 56	'8'
	DB $00	; 0
	DB $04	; 4
	DB $08	; 8
	DB $04	; 4
	DB $00	; 0
	DB $38	; 56	'8'
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $08	; 8
	DB $00	; 0
	DB $10	; 16
	DB $20	; 32
	DB $10	; 16
	DB $00	; 0
	DB $3E	; 62
	DB $10	; 16
	DB $22	; 34
	DB $00	; 0
	DB $1E	; 30
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $7E	; 126
	DB $04	; 4
	DB $02	; 2
	DB $00	; 0
	DB $04	; 4
	DB $00	; 0
	DB $04	; 4
	DB $00	; 0
	DB $08	; 8
	DB $00	; 0
	DB $08	; 8
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $3C	; 60
	DB $00	; 0
	DB $64	; 100	'd'
	DB $00	; 0
	DB $44	; 68	'D'
	DB $44	; 68	'D'
	DB $38	; 56	'8'
	DB $40	; 64
	DB $3C	; 60
	DB $20	; 32
	DB $44	; 68	'D'
	DB $00	; 0
	DB $38	; 56	'8'
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $3C	; 60
	DB $20	; 32
	DB $44	; 68	'D'
	DB $20	; 32
	DB $4C	; 76	'L'
	DB $00	; 0
	DB $38	; 56	'8'
	DB $00	; 0
	DB $18	; 24
	DB $20	; 32
	DB $10	; 16
	DB $60	; 96
	DB $10	; 16
	DB $00	; 0
	DB $00	; 0
	DB $20	; 32
	DB $10	; 16
	DB $00	; 0
	DB $30	; 48	'0'
	DB $00	; 0
	DB $00	; 0
	DB $20	; 32
	DB $10	; 16
	DB $00	; 0
	DB $30	; 48	'0'
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $20	; 32
	DB $10	; 16
	DB $00	; 0
	DB $30	; 48	'0'
	DB $00	; 0
	DB $00	; 0
	DB $20	; 32
	DB $10	; 16
	DB $00	; 0
	DB $30	; 48	'0'
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $0C	; 12
	DB $0C	; 12
	DB $10	; 16
	DB $00	; 0
	DB $70	; 112	'p'
	DB $60	; 96
	DB $10	; 16
	DB $00	; 0
	DB $1C	; 28
	DB $0C	; 12
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $7C	; 124
	DB $7C	; 124
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $7C	; 124
	DB $7C	; 124
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $30	; 48	'0'
	DB $30	; 48	'0'
	DB $08	; 8
	DB $00	; 0
	DB $0E	; 14
	DB $06	; 6
	DB $08	; 8
	DB $00	; 0
	DB $38	; 56	'8'
	DB $30	; 48	'0'
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $04	; 4
	DB $38	; 56	'8'
	DB $60	; 96
	DB $04	; 4
	DB $04	; 4
	DB $48	; 72	'H'
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $00	; 0
	DB $42	; 66	'B'
	DB $3C	; 60
	DB $00	; 0
	DB $42	; 66	'B'
	DB $08	; 8
	DB $52	; 82	'R'
	DB $00	; 0
	DB $5E	; 94
	DB $00	; 0
	DB $40	; 64
	DB $42	; 66	'B'
	DB $3C	; 60
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $10	; 16
	DB $28	; 40
	DB $28	; 40
	DB $44	; 68	'D'
	DB $00	; 0
	DB $44	; 68	'D'
	DB $AA	; 170
	DB $54	; 84	'T'
	DB $00	; 0
	DB $82	; 130
	DB $00	; 0
	DB $82	; 130
	DB $82	; 130
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $88	; 136
	DB $70	; 112	'p'
	DB $04	; 4
	DB $40	; 64
	DB $00	; 0
	DB $44	; 68	'D'
	DB $04	; 4
	DB $78	; 120	'x'
	DB $00	; 0
	DB $44	; 68	'D'
	DB $04	; 4
	DB $40	; 64
	DB $88	; 136
	DB $70	; 112	'p'
	DB $00	; 0
	DB $00	; 0
	DB $40	; 64
	DB $38	; 56	'8'
	DB $84	; 132
	DB $00	; 0
	DB $00	; 0
	DB $80	; 128
	DB $00	; 0
	DB $80	; 128
	DB $00	; 0
	DB $80	; 128
	DB $84	; 132
	DB $00	; 0
	DB $40	; 64
	DB $38	; 56	'8'
	DB $00	; 0
	DB $00	; 0
	DB $40	; 64
	DB $3C	; 60
	DB $04	; 4
	DB $42	; 66	'B'
	DB $00	; 0
	DB $42	; 66	'B'
	DB $00	; 0
	DB $42	; 66	'B'
	DB $04	; 4
	DB $42	; 66	'B'
	DB $40	; 64
	DB $3C	; 60
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $40	; 64
	DB $3C	; 60
	DB $00	; 0
	DB $40	; 64
	DB $00	; 0
	DB $70	; 112	'p'
	DB $00	; 0
	DB $40	; 64
	DB $00	; 0
	DB $40	; 64
	DB $40	; 64
	DB $3C	; 60
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $40	; 64
	DB $3C	; 60
	DB $00	; 0
	DB $40	; 64
	DB $00	; 0
	DB $78	; 120	'x'
	DB $20	; 32
	DB $40	; 64
	DB $00	; 0
	DB $40	; 64
	DB $00	; 0
	DB $40	; 64
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $0C	; 12
	DB $00	; 0
	DB $30	; 48	'0'
	DB $20	; 32
	DB $40	; 64
	DB $00	; 0
	DB $5E	; 94
	DB $58	; 88	'X'
	DB $24	; 36
	DB $00	; 0
	DB $04	; 4
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $44	; 68	'D'
	DB $00	; 0
	DB $44	; 68	'D'
	DB $00	; 0
	DB $7C	; 124
	DB $00	; 0
	DB $44	; 68	'D'
	DB $20	; 32
	DB $44	; 68	'D'
	DB $00	; 0
	DB $24	; 36
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $3E	; 62
	DB $00	; 0
	DB $08	; 8
	DB $00	; 0
	DB $08	; 8
	DB $00	; 0
	DB $28	; 40
	DB $28	; 40
	DB $10	; 16
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $04	; 4
	DB $22	; 34
	DB $08	; 8
	DB $24	; 36
	DB $00	; 0
	DB $38	; 56	'8'
	DB $02	; 2
	DB $24	; 36
	DB $00	; 0
	DB $22	; 34
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $20	; 32
	DB $00	; 0
	DB $20	; 32
	DB $00	; 0
	DB $20	; 32
	DB $00	; 0
	DB $20	; 32
	DB $00	; 0
	DB $20	; 32
	DB $02	; 2
	DB $3C	; 60
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $18	; 24
	DB $12	; 18
	DB $2C	; 44
	DB $04	; 4
	DB $2A	; 42
	DB $00	; 0
	DB $2A	; 42
	DB $00	; 0
	DB $42	; 66	'B'
	DB $00	; 0
	DB $42	; 66	'B'
	DB $00	; 0
	DB $02	; 2
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $20	; 32
	DB $00	; 0
	DB $22	; 34
	DB $20	; 32
	DB $12	; 18
	DB $30	; 48	'0'
	DB $4A	; 74	'J'
	DB $00	; 0
	DB $4A	; 74	'J'
	DB $04	; 4
	DB $4A	; 74	'J'
	DB $00	; 0
	DB $44	; 68	'D'
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $3C	; 60
	DB $24	; 36
	DB $42	; 66	'B'
	DB $00	; 0
	DB $42	; 66	'B'
	DB $20	; 32
	DB $42	; 66	'B'
	DB $02	; 2
	DB $3C	; 60
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $20	; 32
	DB $1C	; 28
	DB $14	; 20
	DB $22	; 34
	DB $04	; 4
	DB $22	; 34
	DB $00	; 0
	DB $64	; 100	'd'
	DB $04	; 4
	DB $38	; 56	'8'
	DB $00	; 0
	DB $20	; 32
	DB $00	; 0
	DB $20	; 32
	DB $00	; 0
	DB $00	; 0
	DB $20	; 32
	DB $1C	; 28
	DB $04	; 4
	DB $22	; 34
	DB $02	; 2
	DB $41	; 65	'A'
	DB $00	; 0
	DB $49	; 73	'I'
	DB $26	; 38
	DB $49	; 73	'I'
	DB $00	; 0
	DB $3E	; 62
	DB $00	; 0
	DB $01	; 1
	DB $00	; 0
	DB $00	; 0
	DB $44	; 68	'D'
	DB $38	; 56	'8'
	DB $20	; 32
	DB $44	; 68	'D'
	DB $04	; 4
	DB $28	; 40
	DB $00	; 0
	DB $30	; 48	'0'
	DB $04	; 4
	DB $28	; 40
	DB $00	; 0
	DB $24	; 36
	DB $00	; 0
	DB $20	; 32
	DB $00	; 0
	DB $00	; 0
	DB $20	; 32
	DB $1C	; 28
	DB $00	; 0
	DB $20	; 32
	DB $20	; 32
	DB $1C	; 28
	DB $04	; 4
	DB $02	; 2
	DB $04	; 4
	DB $22	; 34
	DB $20	; 32
	DB $1C	; 28
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $7F	; 127
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $44	; 68	'D'
	DB $00	; 0
	DB $4C	; 76	'L'
	DB $00	; 0
	DB $44	; 68	'D'
	DB $00	; 0
	DB $44	; 68	'D'
	DB $08	; 8
	DB $44	; 68	'D'
	DB $40	; 64
	DB $38	; 56	'8'
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $40	; 64
	DB $00	; 0
	DB $41	; 65	'A'
	DB $62	; 98	'b'
	DB $01	; 1
	DB $00	; 0
	DB $22	; 34
	DB $14	; 20
	DB $22	; 34
	DB $00	; 0
	DB $14	; 20
	DB $10	; 16
	DB $08	; 8
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $41	; 65	'A'
	DB $00	; 0
	DB $41	; 65	'A'
	DB $00	; 0
	DB $42	; 66	'B'
	DB $00	; 0
	DB $2A	; 42
	DB $04	; 4
	DB $2A	; 42
	DB $22	; 34
	DB $14	; 20
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $00	; 0
	DB $20	; 32
	DB $42	; 66	'B'
	DB $24	; 36
	DB $12	; 18
	DB $10	; 16
	DB $0C	; 12
	DB $10	; 16
	DB $08	; 8
	DB $20	; 32
	DB $14	; 20
	DB $44	; 68	'D'
	DB $22	; 34
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $24	; 36
	DB $00	; 0
	DB $24	; 36
	DB $20	; 32
	DB $18	; 24
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $20	; 32
	DB $20	; 32
	DB $40	; 64
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $40	; 64
	DB $3E	; 62
	DB $00	; 0
	DB $02	; 2
	DB $00	; 0
	DB $0C	; 12
	DB $00	; 0
	DB $30	; 48	'0'
	DB $00	; 0
	DB $40	; 64
	DB $02	; 2
	DB $7C	; 124
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $04	; 4
	DB $78	; 120	'x'
	DB $00	; 0
	DB $40	; 64
	DB $00	; 0
	DB $40	; 64
	DB $00	; 0
	DB $40	; 64
	DB $00	; 0
	DB $40	; 64
	DB $04	; 4
	DB $78	; 120	'x'
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $20	; 32
	DB $40	; 64
	DB $00	; 0
	DB $20	; 32
	DB $30	; 48	'0'
	DB $00	; 0
	DB $00	; 0
	DB $10	; 16
	DB $18	; 24
	DB $00	; 0
	DB $00	; 0
	DB $08	; 8
	DB $00	; 0
	DB $0C	; 12
	DB $00	; 0
	DB $00	; 0
	DB $20	; 32
	DB $1E	; 30
	DB $00	; 0
	DB $02	; 2
	DB $00	; 0
	DB $02	; 2
	DB $00	; 0
	DB $02	; 2
	DB $00	; 0
	DB $02	; 2
	DB $20	; 32
	DB $1E	; 30
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $38	; 56	'8'
	DB $00	; 0
	DB $2C	; 44
	DB $00	; 0
	DB $44	; 68	'D'
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $7E	; 126
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $20	; 32
	DB $40	; 64
	DB $00	; 0
	DB $20	; 32
	DB $00	; 0
	DB $20	; 32
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $08	; 8
	DB $24	; 36
	DB $10	; 16
	DB $24	; 36
	DB $08	; 8
	DB $24	; 36
	DB $10	; 16
	DB $24	; 36
	DB $08	; 8
	DB $24	; 36
	DB $10	; 16
	DB $24	; 36
	DB $08	; 8
	DB $24	; 36
	DB $10	; 16
	DB $24	; 36
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $FF	; 255
	DB $55	; 85	'U'
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $3F	; 63
	DB $15	; 21
	DB $20	; 32
	DB $0A	; 10
	DB $20	; 32
	DB $10	; 16
	DB $27	; 39
	DB $08	; 8
	DB $24	; 36
	DB $10	; 16
	DB $24	; 36
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $FC	; 252
	DB $50	; 80	'P'
	DB $04	; 4
	DB $A8	; 168
	DB $04	; 4
	DB $10	; 16
	DB $E4	; 228
	DB $08	; 8
	DB $24	; 36
	DB $10	; 16
	DB $24	; 36
	DB $10	; 16
	DB $24	; 36
	DB $08	; 8
	DB $24	; 36
	DB $10	; 16
	DB $27	; 39
	DB $0A	; 10
	DB $20	; 32
	DB $15	; 21
	DB $20	; 32
	DB $00	; 0
	DB $3F	; 63
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $10	; 16
	DB $24	; 36
	DB $08	; 8
	DB $24	; 36
	DB $10	; 16
	DB $E4	; 228
	DB $A8	; 168
	DB $04	; 4
	DB $50	; 80	'P'
	DB $04	; 4
	DB $00	; 0
	DB $FC	; 252
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $DD	; 221
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $75	; 117	'u'
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $DD	; 221
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $75	; 117	'u'
	DB $00	; 0
	DB $FE	; 254
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $FB	; 251
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $FE	; 254
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $FB	; 251
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $EE	; 238
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $EE	; 238
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $54	; 84	'T'
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $51	; 81	'Q'
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $54	; 84	'T'
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $51	; 81	'Q'
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $40	; 64
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $40	; 64
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $A8	; 168
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $A2	; 162
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $A8	; 168
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $A2	; 162
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $80	; 128
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $80	; 128
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $01	; 1
	DB $00	; 0
	DB $03	; 3
	DB $00	; 0
	DB $07	; 7
	DB $00	; 0
	DB $0F	; 15
	DB $00	; 0
	DB $1F	; 31
	DB $00	; 0
	DB $3F	; 63
	DB $00	; 0
	DB $7F	; 127
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $80	; 128
	DB $00	; 0
	DB $C0	; 192
	DB $00	; 0
	DB $E0	; 224
	DB $00	; 0
	DB $F0	; 240
	DB $00	; 0
	DB $F8	; 248
	DB $00	; 0
	DB $FC	; 252
	DB $00	; 0
	DB $FE	; 254
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $7F	; 127
	DB $00	; 0
	DB $3F	; 63
	DB $00	; 0
	DB $1F	; 31
	DB $00	; 0
	DB $0F	; 15
	DB $00	; 0
	DB $07	; 7
	DB $00	; 0
	DB $03	; 3
	DB $00	; 0
	DB $01	; 1
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FE	; 254
	DB $00	; 0
	DB $FC	; 252
	DB $00	; 0
	DB $F8	; 248
	DB $00	; 0
	DB $F0	; 240
	DB $00	; 0
	DB $E0	; 224
	DB $00	; 0
	DB $C0	; 192
	DB $00	; 0
	DB $80	; 128
	DB $01	; 1
	DB $00	; 0
	DB $03	; 3
	DB $00	; 0
	DB $07	; 7
	DB $00	; 0
	DB $0F	; 15
	DB $00	; 0
	DB $1F	; 31
	DB $00	; 0
	DB $3F	; 63
	DB $00	; 0
	DB $7F	; 127
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $80	; 128
	DB $00	; 0
	DB $C0	; 192
	DB $00	; 0
	DB $E0	; 224
	DB $00	; 0
	DB $F0	; 240
	DB $00	; 0
	DB $F8	; 248
	DB $00	; 0
	DB $FC	; 252
	DB $00	; 0
	DB $FE	; 254
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $7F	; 127
	DB $00	; 0
	DB $3F	; 63
	DB $00	; 0
	DB $1F	; 31
	DB $00	; 0
	DB $0F	; 15
	DB $00	; 0
	DB $07	; 7
	DB $00	; 0
	DB $03	; 3
	DB $00	; 0
	DB $01	; 1
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FE	; 254
	DB $00	; 0
	DB $FC	; 252
	DB $00	; 0
	DB $F8	; 248
	DB $00	; 0
	DB $F0	; 240
	DB $00	; 0
	DB $E0	; 224
	DB $00	; 0
	DB $C0	; 192
	DB $00	; 0
	DB $80	; 128
	DB $00	; 0
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FD	; 253
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $F7	; 247
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $77	; 119	'w'
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $DD	; 221
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $75	; 117	'u'
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $DD	; 221
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $77	; 119	'w'
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $DD	; 221
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $DD	; 221
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $FB	; 251
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $FE	; 254
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $BB	; 187
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $EE	; 238
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $BB	; 187
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $EE	; 238
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $BA	; 186
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $EE	; 238
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $EA	; 234
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $EE	; 238
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $51	; 81	'Q'
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $55	; 85	'U'
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $11	; 17
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $54	; 84	'T'
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $11	; 17
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $44	; 68	'D'
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $11	; 17
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $44	; 68	'D'
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $10	; 16
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $44	; 68	'D'
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $40	; 64
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $A2	; 162
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $AA	; 170
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $A2	; 162
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $A8	; 168
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $22	; 34
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $88	; 136
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $22	; 34
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $88	; 136
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $20	; 32
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $88	; 136
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $80	; 128
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $3C	; 60
	DB $00	; 0
	DB $7E	; 126
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $7E	; 126
	DB $00	; 0
	DB $3C	; 60
	DB $00	; 0
	DB $3C	; 60
	DB $00	; 0
	DB $7E	; 126
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $7E	; 126
	DB $00	; 0
	DB $3C	; 60
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $3C	; 60
	DB $00	; 0
	DB $7E	; 126
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $7E	; 126
	DB $00	; 0
	DB $3C	; 60
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $3C	; 60
	DB $00	; 0
	DB $7E	; 126
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $7E	; 126
	DB $00	; 0
	DB $3C	; 60
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $3C	; 60
	DB $00	; 0
	DB $7E	; 126
	DB $00	; 0
	DB $7E	; 126
	DB $00	; 0
	DB $3C	; 60
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $3C	; 60
	DB $00	; 0
	DB $7E	; 126
	DB $00	; 0
	DB $3C	; 60
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $18	; 24
	DB $00	; 0
	DB $3C	; 60
	DB $00	; 0
	DB $18	; 24
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $18	; 24
	DB $00	; 0
	DB $18	; 24
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FF	; 255
	DB $00	; 0
	DB $FE	; 254
	DB $00	; 0
	DB $FE	; 254
	DB $00	; 0
	DB $FE	; 254
	DB $00	; 0
	DB $FE	; 254
	DB $00	; 0
	DB $FE	; 254
	DB $00	; 0
	DB $FE	; 254
	DB $00	; 0
	DB $FE	; 254
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $FC	; 252
	DB $00	; 0
	DB $FC	; 252
	DB $00	; 0
	DB $FC	; 252
	DB $00	; 0
	DB $FC	; 252
	DB $00	; 0
	DB $FC	; 252
	DB $00	; 0
	DB $FC	; 252
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $F8	; 248
	DB $00	; 0
	DB $F8	; 248
	DB $00	; 0
	DB $F8	; 248
	DB $00	; 0
	DB $F8	; 248
	DB $00	; 0
	DB $F8	; 248
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $F0	; 240
	DB $00	; 0
	DB $F0	; 240
	DB $00	; 0
	DB $F0	; 240
	DB $00	; 0
	DB $F0	; 240
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $E0	; 224
	DB $00	; 0
	DB $E0	; 224
	DB $00	; 0
	DB $E0	; 224
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $C0	; 192
	DB $00	; 0
	DB $C0	; 192
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $80	; 128
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
_IEF_HILO:
	DB $10	; 16
_IEF_SERIAL:
	DB $08	; 8
_IEF_TIMER:
	DB $04	; 4
_IEF_LCDC:
	DB $02	; 2
_IEF_VBLANK:
	DB $01	; 1
;src\/gameboy.h:165: void poll_joypad(void) 
;	---------------------------------
; Function poll_joypad
; ---------------------------------
_poll_joypad::
;src\/gameboy.h:197: );
	rP1	= #0xFF00
	ld	a, #0x20
	ld	(rP1), a
	ld	a, (rP1)
	ld	a, (rP1)
	ld	(_joypad_dpad_state), a
	ld	a, (#0x10)
	ld	(rP1), a
	ld	a, (rP1)
	ld	a, (rP1)
	ld	a, (rP1)
	ld	a, (rP1)
	ld	a, (rP1)
	ld	a, (rP1)
	ld	(_joypad_btn_state), a
	ld	a, (#0x30)
	ld	(rP1), a
;src\/gameboy.h:199: joypad_btn_state = (~joypad_btn_state) & 0x0F;
	ld	hl, _joypad_btn_state
	ld	a, [hl]
	cpl
	and	a, $0F
	ld	[hl], a
;src\/gameboy.h:200: joypad_dpad_state = (~joypad_dpad_state) & 0x0F;
	ld	hl, _joypad_dpad_state
	ld	a, [hl]
	cpl
	and	a, $0F
	ld	[hl], a
;src\/gameboy.h:202: previous_joypad = joypad;
	push	hl
	ld	hl, _joypad
	ld	a, [hl]
	ld	hl, _previous_joypad
	ld	[hl], a
	pop	hl
;src\/gameboy.h:204: joypad = (joypad_dpad_state << 4) ^ joypad_btn_state;
	ld	hl, _joypad_dpad_state
	ld	a, [hl]
	swap	a
	and	a, $F0
	ld	hl, _joypad_btn_state
	xor	a, [hl]
	ld	hl, _joypad
	ld	[hl], a
.l00101:
;src\/gameboy.h:205: }
	ret
;src\/gameboy.h:212: void timer_isr(void) __critical __interrupt __naked
;	---------------------------------
; Function timer_isr
; ---------------------------------
_timer_isr::
;src\/gameboy.h:214: breakpoint();
	ld	b,b
;src\/gameboy.h:215: __asm__("reti");
	reti
.l00101:
;src\/gameboy.h:216: }
;src\/gameboy.h:218: void vblank_isr(void) __critical __interrupt __naked
;	---------------------------------
; Function vblank_isr
; ---------------------------------
_vblank_isr::
;src\/gameboy.h:220: poll_joypad();
	call	_poll_joypad
;src\/gameboy.h:222: __asm__("reti");
	reti
.l00101:
;src\/gameboy.h:223: }
;src\/gameboy.h:225: void lcd_isr(void) __critical __interrupt __naked
;	---------------------------------
; Function lcd_isr
; ---------------------------------
_lcd_isr::
;src\/gameboy.h:227: breakpoint();
	ld	b,b
;src\/gameboy.h:228: __asm__("reti");
	reti
.l00101:
;src\/gameboy.h:229: }
;src\/gameboy.h:231: void serial_isr(void) __critical __interrupt __naked
;	---------------------------------
; Function serial_isr
; ---------------------------------
_serial_isr::
;src\/gameboy.h:233: breakpoint();
	ld	b,b
;src\/gameboy.h:234: __asm__("reti");
	reti
.l00101:
;src\/gameboy.h:235: }
;src\/gameboy.h:237: void joypad_isr(void) __critical __interrupt __naked
;	---------------------------------
; Function joypad_isr
; ---------------------------------
_joypad_isr::
;src\/gameboy.h:239: breakpoint();
	ld	b,b
;src\/gameboy.h:240: __asm__("reti");
	reti
.l00101:
;src\/gameboy.h:241: }
;src\/friend.h:15: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src\/friend.h:16: system_init();
	call	_system_init
;src\/friend.h:18: init();
	call	_init
;src\/friend.h:20: while(1) {
.l00102:
;src\/friend.h:21: update();
	call	_update
;src\/friend.h:23: halt();
	halt
	nop
;src\/friend.h:24: draw();
	call	_draw
	jr	.l00102
.l00104:
;src\/friend.h:26: }
	ret
;src\/friend.h:30: void system_init(void) {
;	---------------------------------
; Function system_init
; ---------------------------------
_system_init::
;src\/friend.h:32: disable_interrupts();
	di
;src\/friend.h:34: while (LY < 144) {} /* wait until vblank */
.l00101:
	ldh	a, (_LY+0)
	sub	a, $90
	jr	C,.l00101
;src\/friend.h:36: LCDC = LCDCF_OFF;
	ld	a, $00
	ldh	(_LCDC+0),a
;src\/friend.h:45: BGP = 0b11100100;
	ld	a, $E4
	ldh	(_BGP+0),a
;src\/friend.h:46: OBP0 = 0b11100100;
	ld	a, $E4
	ldh	(_OBP0+0),a
;src\/friend.h:47: OBP1 = 0b11100100;
	ld	a, $E4
	ldh	(_OBP1+0),a
;src\/friend.h:49: SCY = 0;
	ld	a, $00
	ldh	(_SCY+0),a
;src\/friend.h:50: SCX = 0;
	ld	a, $00
	ldh	(_SCX+0),a
;src\/friend.h:52: NR52 = 0;
	ld	a, $00
	ldh	(_NR52+0),a
.l00104:
;src\/friend.h:57: }
	ret
;src\/friend_draw.h:25: u8 tile_pget(u8 tile_number, u8 x, u8 y)
;	---------------------------------
; Function tile_pget
; ---------------------------------
_tile_pget::
	add	sp, #-3
;src\/friend_draw.h:27: u8 mask = (128 >> x);
	ld	hl, [sp+6]
	ld	a, [hl]
	push	af
	ld	c, $80
	ld	b, $00
	pop	af
	inc	a
	jr	.l00120
.l00119:
	sra	b
	rr	c
.l00120:
	dec	a
	jr	NZ, .l00119
	ld	hl, [sp+0]
	ld	[hl], c
;src\/friend_draw.h:29: u8 *row = tile_get_row(tile_number, y);
	ld	hl, [sp+7]
	ld	a, [hl]
	ld	hl, [sp+2]
	ld	[hl], a
	ld	hl, [sp+5]
	ld	a, [hl]
;src\/friend_draw.h:10: u8 offset = tile_number << 4;
	swap	a
	and	a, $F0
	ld	c, a
;src\/friend_draw.h:16: u8 *tile = get_tile(tile_number);
	ld	a, _tiles & $FF
	add	a, c
	ld	c, a
	ld	a, _tiles >> 8
	adc	a, $00
	ld	b, a
;src\/friend_draw.h:19: u8 offset = y << 2;
	ld	hl, [sp+2]
	ld	a, [hl]
	add	a, a
	add	a, a
;src\/friend_draw.h:29: u8 *row = tile_get_row(tile_number, y);
	add	a, c
	ld	c, a
	ld	a, $00
	adc	a, b
	ld	b, a
;src\/friend_draw.h:31: u8 hi = *(row + 1) & mask;
	ld	hl, $0001
	add	hl, bc
	ld	a, l
	ld	d, h
	ld	hl, [sp+1]
	ld	[hl], a
	inc	hl
	ld	[hl], d
	dec	hl
	ld	e, [hl]
	inc	hl
	ld	d, [hl]
	ld	a,[de]
	dec	hl
	dec	hl
	and	a, [hl]
	ld	d, a
;src\/friend_draw.h:32: u8 lo = *(row + 0) & mask;
	ld	a, [bc]
	and	a, [hl]
	ld	e, a
;src\/friend_draw.h:34: return (hi ? 2 : 0) + (lo ? 1 : 0);
	ld	a, d
	or	a, a
	jr	Z,.l00105
	ld	bc, $0002
	jr	.l00106
.l00105:
	ld	bc, $0000
.l00106:
	ld	a, e
	or	a, a
	jr	Z,.l00107
	ld	de, $0001
	jr	.l00108
.l00107:
	ld	de, $0000
.l00108:
	ld	a, e
	add	a, c
	ld	e, a
.l00103:
;src\/friend_draw.h:35: }
	add	sp, #3
	ret
_bytes_per_row:
	DB $02	; 2
_bytes_per_tile:
	DB $10	; 16
;src\/friend_draw.h:38: void tile_pset(u8 tile_number, u8 x, u8 y, u8 value)
;	---------------------------------
; Function tile_pset
; ---------------------------------
_tile_pset::
	add	sp, #-4
;src\/friend_draw.h:40: u8 *row = tile_get_row(tile_number, y);
	ld	hl, [sp+8]
	ld	a, [hl]
	ld	hl, [sp+3]
	ld	[hl], a
	ld	hl, [sp+6]
	ld	a, [hl]
;src\/friend_draw.h:10: u8 offset = tile_number << 4;
	swap	a
	and	a, $F0
	ld	c, a
;src\/friend_draw.h:16: u8 *tile = get_tile(tile_number);
	ld	a, _tiles & $FF
	add	a, c
	ld	c, a
	ld	a, _tiles >> 8
	adc	a, $00
	ld	b, a
;src\/friend_draw.h:19: u8 offset = y << 2;
	ld	hl, [sp+3]
	ld	a, [hl]
	add	a, a
	add	a, a
;src\/friend_draw.h:40: u8 *row = tile_get_row(tile_number, y);
	add	a, c
	ld	c, a
	ld	a, $00
	adc	a, b
	ld	b, a
;src\/friend_draw.h:42: u8 mask = (128 >> x);
	ld	hl, [sp+7]
	ld	a, [hl]
	push	af
	ld	e, $80
	ld	d, $00
	pop	af
	inc	a
	jr	.l00131
.l00130:
	sra	d
	rr	e
.l00131:
	dec	a
	jr	NZ, .l00130
	ld	hl, [sp+0]
	ld	[hl], e
;src\/friend_draw.h:47: *(row + 1) |= mask;
	ld	hl, $0001
	add	hl, bc
	ld	a, l
	ld	d, h
	ld	hl, [sp+1]
	ld	[hl], a
	inc	hl
	ld	[hl], d
;src\/friend_draw.h:51: *(row + 0) &= ~mask;
	dec	hl
	dec	hl
	ld	a, [hl]
	cpl
	ld	hl, [sp+3]
	ld	[hl], a
;src\/friend_draw.h:44: switch (value) {
	ld	hl, [sp+9]
	ld	a, [hl]
	or	a, a
	jp	Z,.l00104
.l00132:
	ld	hl, [sp+9]
	ld	a, [hl]
	dec	a
	jp	Z,.l00103
.l00133:
	ld	hl, [sp+9]
	ld	a, [hl]
	sub	a, $02
	jr	Z,.l00102
.l00134:
	ld	hl, [sp+9]
	ld	a, [hl]
	sub	a, $03
	jr	Z,.l00136
.l00135:
	jp	.l00108
.l00136:
;src\/friend_draw.h:46: *(row + 0) |= mask;
	ld	a, [bc]
	ld	hl, [sp+0]
	or	a, [hl]
	ld	[bc], a
;src\/friend_draw.h:47: *(row + 1) |= mask;
	inc	hl
	ld	e, [hl]
	inc	hl
	ld	d, [hl]
	ld	a,[de]
	dec	hl
	dec	hl
	or	a, [hl]
	ld	c, a
	inc	hl
	ld	a, [hl]
	inc	hl
	ld	h, [hl]
	ld	l, a
	ld	[hl], c
;src\/friend_draw.h:48: break;
	jp	.l00108
;src\/friend_draw.h:50: case 0b10:
.l00102:
;src\/friend_draw.h:51: *(row + 0) &= ~mask;
	ld	a, [bc]
	ld	hl, [sp+3]
	and	a, [hl]
	ld	[bc], a
;src\/friend_draw.h:52: *(row + 1) |= mask;
	dec	hl
	dec	hl
	ld	e, [hl]
	inc	hl
	ld	d, [hl]
	ld	a,[de]
	dec	hl
	dec	hl
	or	a, [hl]
	ld	c, a
	inc	hl
	ld	a, [hl]
	inc	hl
	ld	h, [hl]
	ld	l, a
	ld	[hl], c
;src\/friend_draw.h:53: break;
	jp	.l00108
;src\/friend_draw.h:55: case 0b01:
.l00103:
;src\/friend_draw.h:56: *(row + 0) |= mask;
	ld	a, [bc]
	ld	hl, [sp+0]
	or	a, [hl]
	ld	[bc], a
;src\/friend_draw.h:57: *(row + 1) &= ~mask;
	inc	hl
	ld	e, [hl]
	inc	hl
	ld	d, [hl]
	ld	a,[de]
	inc	hl
	and	a, [hl]
	ld	c, a
	dec	hl
	dec	hl
	ld	a, [hl]
	inc	hl
	ld	h, [hl]
	ld	l, a
	ld	[hl], c
;src\/friend_draw.h:58: break;
	jr	.l00108
;src\/friend_draw.h:60: case 0b00:
.l00104:
;src\/friend_draw.h:61: *(row + 0) &= ~mask;
	ld	a, [bc]
	ld	hl, [sp+3]
	and	a, [hl]
	ld	[bc], a
;src\/friend_draw.h:62: *(row + 1) &= ~mask;
	dec	hl
	dec	hl
	ld	e, [hl]
	inc	hl
	ld	d, [hl]
	ld	a,[de]
	inc	hl
	and	a, [hl]
	ld	c, a
	dec	hl
	dec	hl
	ld	a, [hl]
	inc	hl
	ld	h, [hl]
	ld	l, a
	ld	[hl], c
;src\/friend_draw.h:64: }
.l00108:
;src\/friend_draw.h:65: }
	add	sp, #4
	ret
;src\main.c:31: void init_player()
;	---------------------------------
; Function init_player
; ---------------------------------
_init_player::
;src\main.c:33: player.position.x = 40;
	ld	hl, _player
	ld	[hl], $28
;src\main.c:34: player.position.y = 40;
	ld	hl, (_player + 0x0001)
	ld	[hl], $28
;src\main.c:36: player.y_velocity = 1;
	ld	hl, (_player + 0x0002)
	ld	[hl], $01
;src\main.c:37: player.score = 0;
	ld	hl, (_player + 0x0003)
	ld	[hl], $00
.l00101:
;src\main.c:38: }
	ret
_gravity:
	DB $01	;  1
_flap_velocity:
	DB $FE	; -2
;src\main.c:41: void init(void)
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src\main.c:43: init_player();
	call	_init_player
;src\main.c:45: memset(&oam, 0, sizeof(oam));
	ld	hl, $00A0
	push	hl
	ld	l, $00
	push	hl
	ld	hl, _oam
	push	hl
	call	_memset
	add	sp, #6
;src\main.c:46: memset(&tiles, 0, sizeof(tiles));
	ld	hl, $0001
	push	hl
	ld	l, $00
	push	hl
	ld	hl, _tiles
	push	hl
	call	_memset
	add	sp, #6
;src\main.c:47: memset(&bgmap, 0, sizeof(bgmap));
	ld	hl, $0400
	push	hl
	ld	h, $00
	push	hl
	ld	hl, _bgmap
	push	hl
	call	_memset
	add	sp, #6
;src\main.c:49: memcpy(&tiles, &char_map, sizeof(char_map));
	ld	hl, $0800
	push	hl
	ld	hl, _char_map
	push	hl
	ld	hl, _tiles
	push	hl
	call	___memcpy
	add	sp, #6
;src\main.c:51: oam[0].tile = 0x19;
	ld	hl, (_oam + 0x0002)
	ld	[hl], $19
;src\main.c:52: oam[1].tile = 0x19;
	ld	hl, (_oam + 0x0006)
	ld	[hl], $19
;src\main.c:53: oam[2].tile = 0x19;
	ld	hl, (_oam + 0x000a)
	ld	[hl], $19
;src\main.c:54: oam[3].tile = 0x19;
	ld	hl, (_oam + 0x000e)
	ld	[hl], $19
;src\main.c:60: LCDCF_OBJON;
	ld	a, $83
	ldh	(_LCDC+0),a
;src\main.c:62: enable_interrupts();
	ei
;src\main.c:63: interrupt_enable = IEF_VBLANK;
	ld	hl, _IEF_VBLANK
	ld	a, [hl]
	ldh	(_interrupt_enable+0),a
.l00101:
;src\main.c:64: }
	ret
;src\main.c:67: void update(void)
;	---------------------------------
; Function update
; ---------------------------------
_update::
;src\main.c:70: if (btnp(j_a)) {
	ld	hl, _previous_joypad
	ld	c, [hl]
	xor	a, a
	cpl
	ld	b, a
	ld	a, c
	cpl
	ld	c, a
	ld	hl, _joypad
	ld	e, [hl]
	ld	d, $00
	ld	a, c
	and	a, e
	ld	c, a
	ld	a, b
	and	a, d
	bit	0, c
	jr	Z,.l00102
.l00118:
;src\main.c:71: player.y_velocity = (flap_velocity << SUBPIXELS);
	ld	bc, _player+2
	ld	hl, _flap_velocity
	ld	a, [hl]
	add	a, a
	add	a, a
	add	a, a
	ld	[bc], a
	jr	.l00103
.l00102:
;src\main.c:74: player.y_velocity += gravity;
	ld	bc, _player+2
	ld	a, [bc]
	ld	e, a
	ld	hl, _gravity
	ld	a, [hl]
	add	a, e
	ld	[bc], a
.l00103:
;src\main.c:78: step = (player.y_velocity >> SUBPIXELS);
	ld	a, ((_player + 0x0002) + 0)
	sra	a
	sra	a
	sra	a
;src\main.c:79: player.position.y += step;
	ld	bc, _player + 1
	push	af
	ld	a, [bc]
	ld	e, a
	pop	af
	add	a, e
;src\main.c:86: if (player.position.y > (160 - 16)) {
	ld	[bc],a
	ld	c, a
	ld	a, $90
	sub	a, c
	ret	NC
;src\main.c:88: OBP0 += 1;
	ldh	a, (_OBP0+0)
	inc	a
	ldh	(_OBP0+0),a
;src\main.c:89: init_player();
	call	_init_player
.l00106:
;src\main.c:91: }
	ret
;src\main.c:94: void draw(void)
;	---------------------------------
; Function draw
; ---------------------------------
_draw::
;src\main.c:96: oam[0].x = player.position.x;
	ld	de, _oam+1
	ld	bc, _player+0
	ld	a, [bc]
	ld	[de], a
;src\main.c:97: oam[0].y = player.position.y;
	ld	a, ((_player + 0x0001) + 0)
	ld	hl, _oam
	ld	[hl], a
;src\main.c:99: oam[1].x = player.position.x + 8;
	ld	de, _oam+5
	ld	a, [bc]
	add	a, $08
	ld	[de], a
;src\main.c:100: oam[1].y = player.position.y;
	ld	a, ((_player + 0x0001) + 0)
	ld	hl, (_oam + 0x0004)
	ld	[hl], a
;src\main.c:102: oam[2].x = player.position.x;
	ld	de, _oam+9
	ld	a, [bc]
	ld	[de], a
;src\main.c:103: oam[2].y = player.position.y + 8;
	ld	a, ((_player + 0x0001) + 0)
	add	a, $08
	ld	hl, (_oam + 0x0008)
	ld	[hl], a
;src\main.c:105: oam[3].x = player.position.x + 8;
	ld	de, _oam+13
	ld	a, [bc]
	add	a, $08
	ld	[de], a
;src\main.c:106: oam[3].y = player.position.y + 8;
	ld	bc, _oam+12
	ld	a, ((_player + 0x0001) + 0)
	add	a, $08
	ld	[bc], a
.l00101:
;src\main.c:144: }
	ret
	SECTION "src\main.c_CODE",CODE
	SECTION "CABS (ABS)",CODE

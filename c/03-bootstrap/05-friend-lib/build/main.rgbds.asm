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
	GLOBAL _main
	GLOBAL _joypad_isr
	GLOBAL _serial_isr
	GLOBAL _lcd_isr
	GLOBAL _vblank_isr
	GLOBAL _timer_isr
	GLOBAL ___memcpy
	GLOBAL _memset
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
	GLOBAL _IEF_VBLANK
	GLOBAL _IEF_LCDC
	GLOBAL _IEF_TIMER
	GLOBAL _IEF_SERIAL
	GLOBAL _IEF_HILO
	GLOBAL _char_map
	GLOBAL _dma_copy
	GLOBAL _poll_joypad
	GLOBAL _system_init
	GLOBAL _puts
	GLOBAL _putchar
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
_update_step_65536_70:
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
;src\main.c:91: static u8 step = 0;
	ld	hl, _update_step_65536_70
	ld	[hl], $00
;src\/gameboy.h:136: volatile u8 previous_joypad = 0;
	ld	hl, _previous_joypad
	ld	[hl], $00
;src\/gameboy.h:137: volatile u8 joypad = 0;
	ld	hl, _joypad
	ld	[hl], $00
;src\/gameboy.h:138: volatile u8 joypad_dpad_state = 0;
	ld	hl, _joypad_dpad_state
	ld	[hl], $00
;src\/gameboy.h:139: volatile u8 joypad_btn_state = 0;
	ld	hl, _joypad_btn_state
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
;src\/gameboy.h:144: void dma_copy(void)
;	---------------------------------
; Function dma_copy
; ---------------------------------
_dma_copy::
;src\/gameboy.h:157: }
.l00101:
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
;src\/gameboy.h:160: void poll_joypad(void) 
;	---------------------------------
; Function poll_joypad
; ---------------------------------
_poll_joypad::
;src\/gameboy.h:192: );
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
;src\/gameboy.h:194: joypad_btn_state = (~joypad_btn_state) & 0x0F;
	ld	hl, _joypad_btn_state
	ld	a, [hl]
	cpl
	and	a, $0F
	ld	[hl], a
;src\/gameboy.h:195: joypad_dpad_state = (~joypad_dpad_state) & 0x0F;
	ld	hl, _joypad_dpad_state
	ld	a, [hl]
	cpl
	and	a, $0F
	ld	[hl], a
;src\/gameboy.h:197: previous_joypad = joypad;
	push	hl
	ld	hl, _joypad
	ld	a, [hl]
	ld	hl, _previous_joypad
	ld	[hl], a
	pop	hl
;src\/gameboy.h:199: joypad = (joypad_dpad_state << 4) ^ joypad_btn_state;
	ld	hl, _joypad_dpad_state
	ld	a, [hl]
	swap	a
	and	a, $F0
	ld	hl, _joypad_btn_state
	xor	a, [hl]
	ld	hl, _joypad
	ld	[hl], a
.l00101:
;src\/gameboy.h:200: }
	ret
;src\/gameboy.h:207: void timer_isr(void) __critical __interrupt __naked
;	---------------------------------
; Function timer_isr
; ---------------------------------
_timer_isr::
;src\/gameboy.h:209: breakpoint();
	ld	b,b
;src\/gameboy.h:210: __asm__("ret");
	ret
.l00101:
;src\/gameboy.h:211: }
;src\/gameboy.h:213: void vblank_isr(void) __critical __interrupt __naked
;	---------------------------------
; Function vblank_isr
; ---------------------------------
_vblank_isr::
;src\/gameboy.h:215: poll_joypad();
;src\/gameboy.h:217: __asm__("ret");
	jp	_poll_joypad
.l00101:
;src\/gameboy.h:218: }
;src\/gameboy.h:220: void lcd_isr(void) __critical __interrupt __naked
;	---------------------------------
; Function lcd_isr
; ---------------------------------
_lcd_isr::
;src\/gameboy.h:222: breakpoint();
	ld	b,b
;src\/gameboy.h:223: __asm__("ret");
	ret
.l00101:
;src\/gameboy.h:224: }
;src\/gameboy.h:226: void serial_isr(void) __critical __interrupt __naked
;	---------------------------------
; Function serial_isr
; ---------------------------------
_serial_isr::
;src\/gameboy.h:228: breakpoint();
	ld	b,b
;src\/gameboy.h:229: __asm__("ret");
	ret
.l00101:
;src\/gameboy.h:230: }
;src\/gameboy.h:232: void joypad_isr(void) __critical __interrupt __naked
;	---------------------------------
; Function joypad_isr
; ---------------------------------
_joypad_isr::
;src\/gameboy.h:234: breakpoint();
	ld	b,b
;src\/gameboy.h:235: __asm__("ret");
	ret
.l00101:
;src\/gameboy.h:236: }
;src\/friend.h:12: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src\/friend.h:13: system_init();
	call	_system_init
;src\/friend.h:15: init();
	call	_init
;src\/friend.h:17: while(1) {
.l00102:
;src\/friend.h:18: update();
	call	_update
;src\/friend.h:19: halt();
	halt
	nop
;src\/friend.h:20: draw();
	call	_draw
;src\/friend.h:21: dma_copy();
	call	_dma_copy
	jr	.l00102
.l00104:
;src\/friend.h:23: }
	ret
;src\/friend.h:25: void system_init(void) {
;	---------------------------------
; Function system_init
; ---------------------------------
_system_init::
;src\/friend.h:27: __asm__("di");
	di
;src\/friend.h:29: while (LY < 144) {} /* wait until vblank */
.l00101:
	ldh	a, (_LY+0)
	sub	a, $90
	jr	C,.l00101
;src\/friend.h:31: LCDC = LCDCF_OFF;
	ld	a, $00
	ldh	(_LCDC+0),a
;src\/friend.h:35: memset(&bgmap, 0, 360);
	ld	hl, $0168
	push	hl
	ld	hl, $0000
	push	hl
	ld	hl, _bgmap
	push	hl
	call	_memset
	add	sp, #6
;src\/friend.h:37: memset(&oam, 0x00, sizeof(oam)); 
	ld	hl, $00A0
	push	hl
	ld	l, $00
	push	hl
	ld	hl, _oam
	push	hl
	call	_memset
	add	sp, #6
;src\/friend.h:38: memset(&shadow_oam, 0x19, sizeof(oam)); 
	ld	hl, $00A0
	push	hl
	ld	l, $19
	push	hl
	ld	hl, _shadow_oam
	push	hl
	call	_memset
	add	sp, #6
;src\/friend.h:40: BGP = 0b11100100;
	ld	a, $E4
	ldh	(_BGP+0),a
;src\/friend.h:41: OBP0 = 0b11100100;
	ld	a, $E4
	ldh	(_OBP0+0),a
;src\/friend.h:42: OBP1 = 0b11100100;
	ld	a, $E4
	ldh	(_OBP1+0),a
;src\/friend.h:44: SCY = 0;
	ld	a, $00
	ldh	(_SCY+0),a
;src\/friend.h:45: SCX = 0;
	ld	a, $00
	ldh	(_SCX+0),a
;src\/friend.h:47: NR52 = 0;
	ld	a, $00
	ldh	(_NR52+0),a
.l00104:
;src\/friend.h:50: }
	ret
;src\main.c:16: void puts(u8 *s)
;	---------------------------------
; Function puts
; ---------------------------------
_puts::
;src\main.c:18: while (*s != '\0') {
	ld	hl, [sp+3]
	dec	hl
	ld	c, [hl]
	inc	hl
	ld	b, [hl]
.l00101:
	ld	a, [bc]
	or	a, a
	ret	Z
;src\main.c:19: putchar(*s);
	push	bc
	push	af
	inc	sp
	call	_putchar
	inc	sp
	pop	bc
;src\main.c:20: s +=1;
	inc	bc
	jr	.l00101
.l00104:
;src\main.c:22: }
	ret
;src\main.c:24: inline void putchar(u8 c)
;	---------------------------------
; Function putchar
; ---------------------------------
_putchar::
	dec	sp
;src\main.c:26: if (c == '\0') {
	ld	hl, [sp+3]
	ld	a, [hl]
	or	a, a
;src\main.c:27: return;
	jp	Z,.l00120
.l00113:
;src\main.c:30: } else if (c == '\n') {
	ld	hl, [sp+3]
	ld	a, [hl]
	sub	a, $0A
	jr	Z,.l00163
.l00162:
	jr	.l00110
.l00163:
;src\main.c:31: cursor.x = 0;
	ld	hl, _cursor
	ld	[hl], $00
;src\main.c:32: cursor.y += 1;
	ld	bc, _cursor+1
	ld	a, [bc]
	inc	a
	ld	[bc], a
;src\main.c:33: goto enforce_screen_limit;
	jp	.l00115
.l00110:
;src\main.c:34: } else if (' ' <= c && c <= 'Z') {
	ld	hl, [sp+3]
	ld	a, [hl]
	sub	a, $20
	jr	C,.l00106
	ld	a, $5A
	sub	a, [hl]
	jr	C,.l00106
;src\main.c:35: nop();
	nop
	jr	.l00114
.l00106:
;src\main.c:36: } else if ('a' <= c && c <= 'z') {
	ld	hl, [sp+3]
	ld	a, [hl]
	sub	a, $61
	jr	C,.l00102
	ld	a, $7A
	sub	a, [hl]
	jr	C,.l00102
;src\main.c:37: c = c - 32;
	ld	a, [hl]
	add	a, $E0
	ld	[hl], a
;src\main.c:38: nop();
	nop
	jr	.l00114
.l00102:
;src\main.c:40: breakpoint();
	ld	b,b
.l00114:
;src\main.c:43: bgmap[cursor.y][cursor.x] = c - ' ';
	ld	a, ((_cursor + 0x0001) + 0)
	ld	c, a
	ld	b, $00
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	ld	hl, _bgmap
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (_cursor + 0)
	add	a, c
	ld	c, a
	ld	a, $00
	adc	a, b
	ld	b, a
	ld	hl, [sp+3]
	ld	a, [hl]
	add	a, $E0
	ld	[bc], a
;src\main.c:44: cursor.x += 1;
	ld	a, (_cursor + 0)
	inc	a
	ld	hl, _cursor
	ld	[hl], a
;src\main.c:46: enforce_screen_limit:
.l00115:
;src\main.c:47: if (cursor.x > 19) {
	ld	hl, _cursor + 0
	ld	c, [hl]
	ld	a, $13
	sub	a, c
	jr	NC,.l00120
;src\main.c:48: cursor.x = 0;
	ld	hl, _cursor
	ld	[hl], $00
;src\main.c:49: cursor.y += 1;
	ld	bc, _cursor+1
	ld	a, [bc]
	inc	a
;src\main.c:51: if (cursor.y > 17) {
	ld	[bc],a
	ld	hl, [sp+0]
	ld	[hl], a
	ld	a, $11
	sub	a, [hl]
	jr	NC,.l00120
;src\main.c:52: cursor.y = 0;
	xor	a, a
	ld	[bc], a
.l00120:
;src\main.c:55: }
	inc	sp
	ret
;src\main.c:58: void init(void)
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src\main.c:60: cursor.x = 0;
	ld	hl, _cursor
	ld	[hl], $00
;src\main.c:61: cursor.y = 0;
	ld	hl, (_cursor + 0x0001)
	ld	[hl], $00
;src\main.c:63: memset(&tiles, 0, sizeof(tiles));
	ld	hl, $0001
	push	hl
	ld	l, $00
	push	hl
	ld	hl, _tiles
	push	hl
	call	_memset
	add	sp, #6
;src\main.c:64: memcpy(&tiles, &char_map, sizeof(char_map));
	ld	hl, $0800
	push	hl
	ld	hl, _char_map
	push	hl
	ld	hl, _tiles
	push	hl
	call	___memcpy
	add	sp, #6
;src\main.c:66: oam[0].x = 40;
	ld	hl, (_oam + 0x0001)
	ld	[hl], $28
;src\main.c:67: oam[0].y = 40;
	ld	hl, _oam
	ld	[hl], $28
;src\main.c:68: oam[0].tile = 0x19;
	ld	hl, (_oam + 0x0002)
	ld	[hl], $19
;src\main.c:76: puts("abcdefghijklmnopqrstuvwxyz\n");
	ld	hl, ___str_8
	push	hl
	call	_puts
	add	sp, #2
;src\main.c:82: LCDCF_OBJON;
	ld	a, $83
	ldh	(_LCDC+0),a
;src\main.c:84: __asm__("ei");
	ei
;src\main.c:85: interrupt_enable = IEF_VBLANK;
	ld	hl, _IEF_VBLANK
	ld	a, [hl]
	ldh	(_interrupt_enable+0),a
.l00101:
;src\main.c:86: }
	ret
___str_8:
	DB "(ld a 0x4f)"
	DB $0A
	DB $0A
	DB "the"
	DB $0A
	DB $0A
	DB "hello, world!"
	DB $0A
	DB $0A
	DB "The quick brown fox jumped over the lazy dog"
	DB $0A
	DB $0A
	DB "abcdefghijklmnopqrstuvwxyz"
	DB $0A
	DB $00
;src\main.c:89: void update(void)
;	---------------------------------
; Function update
; ---------------------------------
_update::
;src\main.c:93: if (step++ == 16) {
	ld	hl, _update_step_65536_70
	ld	c, [hl]
	inc	[hl]
	ld	a, c
	sub	a, $10
	jr	Z,.l00111
.l00110:
	jr	.l00103
.l00111:
;src\main.c:94: OBP0 += 1;
	ldh	a, (_OBP0+0)
	inc	a
	ldh	(_OBP0+0),a
;src\main.c:95: OBP1 -= 1;
	ldh	a, (_OBP1+0)
	add	a, $FF
	ldh	(_OBP1+0),a
;src\main.c:98: step = 0;
	ld	[hl], $00
.l00103:
;src\main.c:100: }
	ret
;src\main.c:103: void draw(void)
;	---------------------------------
; Function draw
; ---------------------------------
_draw::
;src\main.c:105: if (btn(j_left)) {
	ld	hl, _joypad
	ld	a, [hl]
	bit	5, a
	jr	Z,.l00102
.l00145:
;src\main.c:106: oam[0].x -= 1;
	ld	bc, _oam+1
	ld	a, ((_oam + 0x0001) + 0)
	dec	a
	ld	[bc], a
.l00102:
;src\main.c:109: if (btn(j_right)) {
	ld	hl, _joypad
	ld	a, [hl]
	bit	4, a
	jr	Z,.l00104
.l00146:
;src\main.c:110: oam[0].x += 1;
	ld	bc, _oam+1
	ld	a, ((_oam + 0x0001) + 0)
	inc	a
	ld	[bc], a
.l00104:
;src\main.c:113: if (btn(j_up)) {
	ld	hl, _joypad
	ld	a, [hl]
	bit	6, a
	jr	Z,.l00106
.l00147:
;src\main.c:114: oam[0].y -= 1;
	ld	bc, _oam+0
	ld	a, (_oam + 0)
	dec	a
	ld	[bc], a
.l00106:
;src\main.c:117: if (btn(j_down)) {
	ld	hl, _joypad
	ld	a, [hl]
	rlca
	jr	NC,.l00108
.l00148:
;src\main.c:118: oam[0].y += 1;
	ld	bc, _oam+0
	ld	a, (_oam + 0)
	inc	a
	ld	[bc], a
.l00108:
;src\main.c:121: if (btnp(j_left)) {
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
	bit	5, c
	jr	Z,.l00110
.l00149:
;src\main.c:122: oam[0].x_flip -= 1;
	ld	bc, _oam+3
	ld	hl, (_oam + 0x0003) + 0
	ld	a, [hl]
	swap	a
	rrca
	and	a, $01
	dec	a
	swap	a
	rlca
	and	a, $20
	ld	l, a
	ld	a, [bc]
	and	a, $DF
	or	a, l
	ld	[bc], a
.l00110:
;src\main.c:125: if (btnp(j_right)) {
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
	bit	4, c
	jr	Z,.l00113
.l00150:
;src\main.c:126: oam[0].x_flip += 1;
	ld	bc, _oam+3
	ld	hl, (_oam + 0x0003) + 0
	ld	a, [hl]
	swap	a
	rrca
	and	a, $01
	inc	a
	swap	a
	rlca
	and	a, $20
	ld	l, a
	ld	a, [bc]
	and	a, $DF
	or	a, l
	ld	[bc], a
.l00113:
;src\main.c:132: }
	ret
	SECTION "src\main.c_CODE",CODE
	SECTION "CABS (ABS)",CODE

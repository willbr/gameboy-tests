;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _tile_pset
	.globl _tile_pget
	.globl _main
	.globl _joypad_isr
	.globl _serial_isr
	.globl _lcd_isr
	.globl _vblank_isr
	.globl _timer_isr
	.globl ___memcpy
	.globl _memset
	.globl _cursor
	.globl _joypad_btn_state
	.globl _joypad_dpad_state
	.globl _joypad
	.globl _previous_joypad
	.globl _shadow_oam
	.globl _oam
	.globl _HRAM
	.globl _OAMRAM
	.globl _bgmap
	.globl _tiles
	.globl _bytes_per_tile
	.globl _bytes_per_row
	.globl _IEF_VBLANK
	.globl _IEF_LCDC
	.globl _IEF_TIMER
	.globl _IEF_SERIAL
	.globl _IEF_HILO
	.globl _char_map
	.globl _dma_copy
	.globl _poll_joypad
	.globl _system_init
	.globl _puts
	.globl _putchar
	.globl _init
	.globl _update
	.globl _draw
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
	.area _DATA
_tiles	=	0x9000
_bgmap	=	0x9800
_OAMRAM	=	0xfe00
_HRAM	=	0xff80
_oam	=	0xfe00
_shadow_oam::
	.ds 160
_previous_joypad::
	.ds 1
_joypad::
	.ds 1
_joypad_dpad_state::
	.ds 1
_joypad_btn_state::
	.ds 1
_cursor::
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;src\/gameboy.h:140: volatile u8 previous_joypad = 0;
	ld	hl, #_previous_joypad
	ld	(hl), #0x00
;src\/gameboy.h:141: volatile u8 joypad = 0;
	ld	hl, #_joypad
	ld	(hl), #0x00
;src\/gameboy.h:142: volatile u8 joypad_dpad_state = 0;
	ld	hl, #_joypad_dpad_state
	ld	(hl), #0x00
;src\/gameboy.h:143: volatile u8 joypad_btn_state = 0;
	ld	hl, #_joypad_btn_state
	ld	(hl), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src\/gameboy.h:148: void dma_copy(void)
;	---------------------------------
; Function dma_copy
; ---------------------------------
_dma_copy::
;src\/gameboy.h:150: nop();
	nop
;src\/gameboy.h:162: }
	ret
_char_map:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x0c	; 12
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0xa4	; 164
	.db #0xa0	; 160
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x48	; 72	'H'
	.db #0x18	; 24
	.db #0x44	; 68	'D'
	.db #0x40	; 64
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x66	; 102	'f'
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x7c	; 124
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x44	; 68	'D'
	.db #0x10	; 16
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x24	; 36
	.db #0x20	; 32
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x22	; 34
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x40	; 64
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x10	; 16
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x40	; 64
	.db #0x3c	; 60
	.db #0x20	; 32
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x20	; 32
	.db #0x44	; 68	'D'
	.db #0x20	; 32
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x38	; 56	'8'
	.db #0x60	; 96
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x08	; 8
	.db #0x52	; 82	'R'
	.db #0x00	; 0
	.db #0x5e	; 94
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0xaa	; 170
	.db #0x54	; 84	'T'
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0x84	; 132
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x3c	; 60
	.db #0x04	; 4
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x04	; 4
	.db #0x42	; 66	'B'
	.db #0x40	; 64
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x5e	; 94
	.db #0x58	; 88	'X'
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x20	; 32
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x22	; 34
	.db #0x08	; 8
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x12	; 18
	.db #0x2c	; 44
	.db #0x04	; 4
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x20	; 32
	.db #0x12	; 18
	.db #0x30	; 48	'0'
	.db #0x4a	; 74	'J'
	.db #0x00	; 0
	.db #0x4a	; 74	'J'
	.db #0x04	; 4
	.db #0x4a	; 74	'J'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x20	; 32
	.db #0x42	; 66	'B'
	.db #0x02	; 2
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x22	; 34
	.db #0x04	; 4
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x64	; 100	'd'
	.db #0x04	; 4
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x1c	; 28
	.db #0x04	; 4
	.db #0x22	; 34
	.db #0x02	; 2
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x49	; 73	'I'
	.db #0x26	; 38
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x20	; 32
	.db #0x44	; 68	'D'
	.db #0x04	; 4
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x1c	; 28
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x22	; 34
	.db #0x20	; 32
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x08	; 8
	.db #0x44	; 68	'D'
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x62	; 98	'b'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x14	; 20
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x04	; 4
	.db #0x2a	; 42
	.db #0x22	; 34
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x12	; 18
	.db #0x10	; 16
	.db #0x0c	; 12
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x20	; 32
	.db #0x14	; 20
	.db #0x44	; 68	'D'
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x24	; 36
	.db #0x08	; 8
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x24	; 36
	.db #0x08	; 8
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x24	; 36
	.db #0x08	; 8
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x15	; 21
	.db #0x20	; 32
	.db #0x0a	; 10
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x27	; 39
	.db #0x08	; 8
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x50	; 80	'P'
	.db #0x04	; 4
	.db #0xa8	; 168
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0xe4	; 228
	.db #0x08	; 8
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x24	; 36
	.db #0x08	; 8
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x27	; 39
	.db #0x0a	; 10
	.db #0x20	; 32
	.db #0x15	; 21
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x24	; 36
	.db #0x08	; 8
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0xe4	; 228
	.db #0xa8	; 168
	.db #0x04	; 4
	.db #0x50	; 80	'P'
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_IEF_HILO:
	.db #0x10	; 16
_IEF_SERIAL:
	.db #0x08	; 8
_IEF_TIMER:
	.db #0x04	; 4
_IEF_LCDC:
	.db #0x02	; 2
_IEF_VBLANK:
	.db #0x01	; 1
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
	ld	hl, #_joypad_btn_state
	ld	a, (hl)
	cpl
	and	a, #0x0f
	ld	(hl), a
;src\/gameboy.h:200: joypad_dpad_state = (~joypad_dpad_state) & 0x0F;
	ld	hl, #_joypad_dpad_state
	ld	a, (hl)
	cpl
	and	a, #0x0f
	ld	(hl), a
;src\/gameboy.h:202: previous_joypad = joypad;
	push	hl
	ld	hl, #_joypad
	ld	a, (hl)
	ld	hl, #_previous_joypad
	ld	(hl), a
	pop	hl
;src\/gameboy.h:204: joypad = (joypad_dpad_state << 4) ^ joypad_btn_state;
	ld	hl, #_joypad_dpad_state
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	ld	hl, #_joypad_btn_state
	xor	a, (hl)
	ld	hl, #_joypad
	ld	(hl), a
;src\/gameboy.h:205: }
	ret
;src\/gameboy.h:212: void timer_isr(void) __critical __interrupt __naked
;	---------------------------------
; Function timer_isr
; ---------------------------------
_timer_isr::
;src\/gameboy.h:214: breakpoint();
	ld	b,b
;src\/gameboy.h:215: __asm__("ret");
	ret
;src\/gameboy.h:216: }
;src\/gameboy.h:218: void vblank_isr(void) __critical __interrupt __naked
;	---------------------------------
; Function vblank_isr
; ---------------------------------
_vblank_isr::
;src\/gameboy.h:220: poll_joypad();
;src\/gameboy.h:222: __asm__("ret");
	jp	_poll_joypad
;src\/gameboy.h:223: }
;src\/gameboy.h:225: void lcd_isr(void) __critical __interrupt __naked
;	---------------------------------
; Function lcd_isr
; ---------------------------------
_lcd_isr::
;src\/gameboy.h:227: breakpoint();
	ld	b,b
;src\/gameboy.h:228: __asm__("ret");
	ret
;src\/gameboy.h:229: }
;src\/gameboy.h:231: void serial_isr(void) __critical __interrupt __naked
;	---------------------------------
; Function serial_isr
; ---------------------------------
_serial_isr::
;src\/gameboy.h:233: breakpoint();
	ld	b,b
;src\/gameboy.h:234: __asm__("ret");
	ret
;src\/gameboy.h:235: }
;src\/gameboy.h:237: void joypad_isr(void) __critical __interrupt __naked
;	---------------------------------
; Function joypad_isr
; ---------------------------------
_joypad_isr::
;src\/gameboy.h:239: breakpoint();
	ld	b,b
;src\/gameboy.h:240: __asm__("ret");
	ret
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
00102$:
;src\/friend.h:21: update();
	call	_update
;src\/friend.h:23: halt();
	halt
	nop
;src\/friend.h:24: draw();
	call	_draw
	jr	00102$
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
00101$:
	ldh	a, (_LY+0)
	sub	a, #0x90
	jr	C,00101$
;src\/friend.h:36: LCDC = LCDCF_OFF;
	ld	a, #0x00
	ldh	(_LCDC+0),a
;src\/friend.h:45: BGP = 0b11100100;
	ld	a, #0xe4
	ldh	(_BGP+0),a
;src\/friend.h:46: OBP0 = 0b11100100;
	ld	a, #0xe4
	ldh	(_OBP0+0),a
;src\/friend.h:47: OBP1 = 0b11100100;
	ld	a, #0xe4
	ldh	(_OBP1+0),a
;src\/friend.h:49: SCY = 0;
	ld	a, #0x00
	ldh	(_SCY+0),a
;src\/friend.h:50: SCX = 0;
	ld	a, #0x00
	ldh	(_SCX+0),a
;src\/friend.h:52: NR52 = 0;
	ld	a, #0x00
	ldh	(_NR52+0),a
;src\/friend.h:57: }
	ret
;src\/friend_draw.h:25: u8 tile_pget(u8 tile_number, u8 x, u8 y)
;	---------------------------------
; Function tile_pget
; ---------------------------------
_tile_pget::
	add	sp, #-3
;src\/friend_draw.h:27: u8 mask = (128 >> x);
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	ld	bc,#0x0080
	pop	af
	inc	a
	jr	00120$
00119$:
	sra	b
	rr	c
00120$:
	dec	a
	jr	NZ, 00119$
	ldhl	sp,	#0
	ld	(hl), c
;src\/friend_draw.h:29: u8 *row = tile_get_row(tile_number, y);
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl)
;src\/friend_draw.h:10: u8 offset = tile_number << 4;
	swap	a
	and	a, #0xf0
	ld	c, a
;src\/friend_draw.h:16: u8 *tile = get_tile(tile_number);
	ld	a, #<(_tiles)
	add	a, c
	ld	c, a
	ld	a, #>(_tiles)
	adc	a, #0x00
	ld	b, a
;src\/friend_draw.h:19: u8 offset = y << 2;
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, a
	add	a, a
;src\/friend_draw.h:29: u8 *row = tile_get_row(tile_number, y);
	add	a, c
	ld	c, a
	ld	a, #0x00
	adc	a, b
	ld	b, a
;src\/friend_draw.h:31: u8 hi = *(row + 1) & mask;
	ld	hl, #0x0001
	add	hl, bc
	ld	a, l
	ld	d, h
	ldhl	sp,	#1
	ld	(hl+), a
	ld	(hl), d
	dec	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a,(de)
	dec	hl
	dec	hl
	and	a, (hl)
	ld	d, a
;src\/friend_draw.h:32: u8 lo = *(row + 0) & mask;
	ld	a, (bc)
	and	a, (hl)
	ld	e, a
;src\/friend_draw.h:34: return (hi ? 2 : 0) + (lo ? 1 : 0);
	ld	a, d
	or	a, a
	jr	Z,00105$
	ld	bc, #0x0002
	jr	00106$
00105$:
	ld	bc, #0x0000
00106$:
	ld	a, e
	or	a, a
	jr	Z,00107$
	ld	de, #0x0001
	jr	00108$
00107$:
	ld	de, #0x0000
00108$:
	ld	a, e
	add	a, c
	ld	e, a
;src\/friend_draw.h:35: }
	add	sp, #3
	ret
_bytes_per_row:
	.db #0x02	; 2
_bytes_per_tile:
	.db #0x10	; 16
;src\/friend_draw.h:38: void tile_pset(u8 tile_number, u8 x, u8 y, u8 value)
;	---------------------------------
; Function tile_pset
; ---------------------------------
_tile_pset::
	add	sp, #-4
;src\/friend_draw.h:40: u8 *row = tile_get_row(tile_number, y);
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
;src\/friend_draw.h:10: u8 offset = tile_number << 4;
	swap	a
	and	a, #0xf0
	ld	c, a
;src\/friend_draw.h:16: u8 *tile = get_tile(tile_number);
	ld	a, #<(_tiles)
	add	a, c
	ld	c, a
	ld	a, #>(_tiles)
	adc	a, #0x00
	ld	b, a
;src\/friend_draw.h:19: u8 offset = y << 2;
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, a
	add	a, a
;src\/friend_draw.h:40: u8 *row = tile_get_row(tile_number, y);
	add	a, c
	ld	c, a
	ld	a, #0x00
	adc	a, b
	ld	b, a
;src\/friend_draw.h:42: u8 mask = (128 >> x);
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	ld	de,#0x0080
	pop	af
	inc	a
	jr	00131$
00130$:
	sra	d
	rr	e
00131$:
	dec	a
	jr	NZ, 00130$
	ldhl	sp,	#0
	ld	(hl), e
;src\/friend_draw.h:47: *(row + 1) |= mask;
	ld	hl, #0x0001
	add	hl, bc
	ld	a, l
	ld	d, h
	ldhl	sp,	#1
	ld	(hl+), a
	ld	(hl), d
;src\/friend_draw.h:51: *(row + 0) &= ~mask;
	dec	hl
	dec	hl
	ld	a, (hl)
	cpl
	ldhl	sp,	#3
	ld	(hl), a
;src\/friend_draw.h:44: switch (value) {
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jp	Z,00104$
	ldhl	sp,	#9
	ld	a, (hl)
	dec	a
	jp	Z,00103$
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x02
	jr	Z,00102$
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x03
	jp	NZ,00108$
;src\/friend_draw.h:46: *(row + 0) |= mask;
	ld	a, (bc)
	ldhl	sp,	#0
	or	a, (hl)
	ld	(bc), a
;src\/friend_draw.h:47: *(row + 1) |= mask;
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a,(de)
	dec	hl
	dec	hl
	or	a, (hl)
	ld	c, a
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;src\/friend_draw.h:48: break;
	jp	00108$
;src\/friend_draw.h:50: case 0b10:
00102$:
;src\/friend_draw.h:51: *(row + 0) &= ~mask;
	ld	a, (bc)
	ldhl	sp,	#3
	and	a, (hl)
	ld	(bc), a
;src\/friend_draw.h:52: *(row + 1) |= mask;
	dec	hl
	dec	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a,(de)
	dec	hl
	dec	hl
	or	a, (hl)
	ld	c, a
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;src\/friend_draw.h:53: break;
	jp	00108$
;src\/friend_draw.h:55: case 0b01:
00103$:
;src\/friend_draw.h:56: *(row + 0) |= mask;
	ld	a, (bc)
	ldhl	sp,	#0
	or	a, (hl)
	ld	(bc), a
;src\/friend_draw.h:57: *(row + 1) &= ~mask;
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a,(de)
	inc	hl
	and	a, (hl)
	ld	c, a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;src\/friend_draw.h:58: break;
	jr	00108$
;src\/friend_draw.h:60: case 0b00:
00104$:
;src\/friend_draw.h:61: *(row + 0) &= ~mask;
	ld	a, (bc)
	ldhl	sp,	#3
	and	a, (hl)
	ld	(bc), a
;src\/friend_draw.h:62: *(row + 1) &= ~mask;
	dec	hl
	dec	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a,(de)
	inc	hl
	and	a, (hl)
	ld	c, a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;src\/friend_draw.h:64: }
00108$:
;src\/friend_draw.h:65: }
	add	sp, #4
	ret
;src\main.c:17: void puts(u8 *s)
;	---------------------------------
; Function puts
; ---------------------------------
_puts::
;src\main.c:19: while (*s != '\0') {
	ldhl	sp,#(3 - 1)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
00101$:
	ld	a, (bc)
	or	a, a
	ret	Z
;src\main.c:20: putchar(*s);
	push	bc
	push	af
	inc	sp
	call	_putchar
	inc	sp
	pop	bc
;src\main.c:21: s +=1;
	inc	bc
	jr	00101$
;src\main.c:23: }
	ret
;src\main.c:25: inline void putchar(u8 c)
;	---------------------------------
; Function putchar
; ---------------------------------
_putchar::
	dec	sp
;src\main.c:27: if (c == '\0') {
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
;src\main.c:28: return;
	jp	Z,00120$
;src\main.c:31: } else if (c == '\n') {
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x0a
	jr	NZ,00110$
;src\main.c:32: cursor.x = 0;
	ld	hl, #_cursor
	ld	(hl), #0x00
;src\main.c:33: cursor.y += 1;
	ld	bc, #_cursor+1
	ld	a, (bc)
	inc	a
	ld	(bc), a
;src\main.c:34: goto enforce_screen_limit;
	jp	00115$
00110$:
;src\main.c:35: } else if (' ' <= c && c <= 'Z') {
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x20
	jr	C,00106$
	ld	a, #0x5a
	sub	a, (hl)
	jr	C,00106$
;src\main.c:36: nop();
	nop
	jr	00114$
00106$:
;src\main.c:37: } else if ('a' <= c && c <= 'z') {
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x61
	jr	C,00102$
	ld	a, #0x7a
	sub	a, (hl)
	jr	C,00102$
;src\main.c:38: c = c - 32;
	ld	a, (hl)
	add	a, #0xe0
	ld	(hl), a
;src\main.c:39: nop();
	nop
	jr	00114$
00102$:
;src\main.c:41: breakpoint();
	ld	b,b
00114$:
;src\main.c:44: bgmap[cursor.y][cursor.x] = c - ' ';
	ld	a, (#(_cursor + 0x0001) + 0)
	ld	c, a
	ld	b, #0x00
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
	ld	hl, #_bgmap
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (#_cursor + 0)
	add	a, c
	ld	c, a
	ld	a, #0x00
	adc	a, b
	ld	b, a
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, #0xe0
	ld	(bc), a
;src\main.c:45: cursor.x += 1;
	ld	a, (#_cursor + 0)
	inc	a
	ld	hl, #_cursor
	ld	(hl), a
;src\main.c:47: enforce_screen_limit:
00115$:
;src\main.c:48: if (cursor.x > 19) {
	ld	hl, #_cursor + 0
	ld	c, (hl)
	ld	a, #0x13
	sub	a, c
	jr	NC,00120$
;src\main.c:49: cursor.x = 0;
	ld	hl, #_cursor
	ld	(hl), #0x00
;src\main.c:50: cursor.y += 1;
	ld	bc, #_cursor+1
	ld	a, (bc)
	inc	a
	ld	(bc), a
;src\main.c:52: if (cursor.y > 17) {
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, #0x11
	sub	a, (hl)
	jr	NC,00120$
;src\main.c:53: cursor.y = 0;
	xor	a, a
	ld	(bc), a
00120$:
;src\main.c:56: }
	inc	sp
	ret
;src\main.c:59: void init(void)
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src\main.c:64: memset(&tiles, 0, sizeof(tiles));
	ld	hl, #0x0001
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, #_tiles
	push	hl
	call	_memset
	add	sp, #6
;src\main.c:65: memcpy(&tiles, &char_map, sizeof(char_map));
	ld	hl, #0x0800
	push	hl
	ld	hl, #_char_map
	push	hl
	ld	hl, #_tiles
	push	hl
	call	___memcpy
	add	sp, #6
;src\main.c:96: puts("abcdefghijklmnopqrstuvwxyz\n");
	ld	hl, #___str_8
	push	hl
	call	_puts
	add	sp, #2
;src\main.c:102: LCDCF_OBJON;
	ld	a, #0x83
	ldh	(_LCDC+0),a
;src\main.c:104: enable_interrupts();
	ei
;src\main.c:105: interrupt_enable = IEF_VBLANK;
	ld	hl, #_IEF_VBLANK
	ld	a, (hl)
	ldh	(_interrupt_enable+0),a
;src\main.c:106: }
	ret
___str_8:
	.ascii "(ld a 0x4f)"
	.db 0x0a
	.db 0x0a
	.ascii "the"
	.db 0x0a
	.db 0x0a
	.ascii "hello, world!"
	.db 0x0a
	.db 0x0a
	.ascii "The quick brown fox jumped over the lazy dog"
	.db 0x0a
	.db 0x0a
	.ascii "abcdefghijklmnopqrstuvwxyz"
	.db 0x0a
	.db 0x00
;src\main.c:109: void update(void)
;	---------------------------------
; Function update
; ---------------------------------
_update::
;src\main.c:121: }
	ret
;src\main.c:124: void draw(void)
;	---------------------------------
; Function draw
; ---------------------------------
_draw::
;src\main.c:162: }
	ret
	.area _CODE
	.area _CABS (ABS)

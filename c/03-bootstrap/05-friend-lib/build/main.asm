;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
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
_update_step_65536_70:
	.ds 1
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
;src\main.c:91: static u8 step = 0;
	ld	hl, #_update_step_65536_70
	ld	(hl), #0x00
;src\/gameboy.h:136: volatile u8 previous_joypad = 0;
	ld	hl, #_previous_joypad
	ld	(hl), #0x00
;src\/gameboy.h:137: volatile u8 joypad = 0;
	ld	hl, #_joypad
	ld	(hl), #0x00
;src\/gameboy.h:138: volatile u8 joypad_dpad_state = 0;
	ld	hl, #_joypad_dpad_state
	ld	(hl), #0x00
;src\/gameboy.h:139: volatile u8 joypad_btn_state = 0;
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
;src\/gameboy.h:144: void dma_copy(void)
;	---------------------------------
; Function dma_copy
; ---------------------------------
_dma_copy::
;src\/gameboy.h:157: }
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
	ld	hl, #_joypad_btn_state
	ld	a, (hl)
	cpl
	and	a, #0x0f
	ld	(hl), a
;src\/gameboy.h:195: joypad_dpad_state = (~joypad_dpad_state) & 0x0F;
	ld	hl, #_joypad_dpad_state
	ld	a, (hl)
	cpl
	and	a, #0x0f
	ld	(hl), a
;src\/gameboy.h:197: previous_joypad = joypad;
	push	hl
	ld	hl, #_joypad
	ld	a, (hl)
	ld	hl, #_previous_joypad
	ld	(hl), a
	pop	hl
;src\/gameboy.h:199: joypad = (joypad_dpad_state << 4) ^ joypad_btn_state;
	ld	hl, #_joypad_dpad_state
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	ld	hl, #_joypad_btn_state
	xor	a, (hl)
	ld	hl, #_joypad
	ld	(hl), a
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
;src\/gameboy.h:211: }
;src\/gameboy.h:213: void vblank_isr(void) __critical __interrupt __naked
;	---------------------------------
; Function vblank_isr
; ---------------------------------
_vblank_isr::
;src\/gameboy.h:215: poll_joypad();
;src\/gameboy.h:217: __asm__("ret");
	jp	_poll_joypad
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
00102$:
;src\/friend.h:18: update();
	call	_update
;src\/friend.h:19: halt();
	halt
	nop
;src\/friend.h:20: draw();
	call	_draw
;src\/friend.h:21: dma_copy();
	call	_dma_copy
	jr	00102$
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
00101$:
	ldh	a, (_LY+0)
	sub	a, #0x90
	jr	C,00101$
;src\/friend.h:31: LCDC = LCDCF_OFF;
	ld	a, #0x00
	ldh	(_LCDC+0),a
;src\/friend.h:35: memset(&bgmap, 0, 360);
	ld	hl, #0x0168
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #_bgmap
	push	hl
	call	_memset
	add	sp, #6
;src\/friend.h:37: memset(&oam, 0x00, sizeof(oam)); 
	ld	hl, #0x00a0
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, #_oam
	push	hl
	call	_memset
	add	sp, #6
;src\/friend.h:38: memset(&shadow_oam, 0x19, sizeof(oam)); 
	ld	hl, #0x00a0
	push	hl
	ld	l, #0x19
	push	hl
	ld	hl, #_shadow_oam
	push	hl
	call	_memset
	add	sp, #6
;src\/friend.h:40: BGP = 0b11100100;
	ld	a, #0xe4
	ldh	(_BGP+0),a
;src\/friend.h:41: OBP0 = 0b11100100;
	ld	a, #0xe4
	ldh	(_OBP0+0),a
;src\/friend.h:42: OBP1 = 0b11100100;
	ld	a, #0xe4
	ldh	(_OBP1+0),a
;src\/friend.h:44: SCY = 0;
	ld	a, #0x00
	ldh	(_SCY+0),a
;src\/friend.h:45: SCX = 0;
	ld	a, #0x00
	ldh	(_SCX+0),a
;src\/friend.h:47: NR52 = 0;
	ld	a, #0x00
	ldh	(_NR52+0),a
;src\/friend.h:50: }
	ret
;src\main.c:16: void puts(u8 *s)
;	---------------------------------
; Function puts
; ---------------------------------
_puts::
;src\main.c:18: while (*s != '\0') {
	ldhl	sp,#(3 - 1)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
00101$:
	ld	a, (bc)
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
	jr	00101$
;src\main.c:22: }
	ret
;src\main.c:24: inline void putchar(u8 c)
;	---------------------------------
; Function putchar
; ---------------------------------
_putchar::
	dec	sp
;src\main.c:26: if (c == '\0') {
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
;src\main.c:27: return;
	jp	Z,00120$
;src\main.c:30: } else if (c == '\n') {
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x0a
	jr	NZ,00110$
;src\main.c:31: cursor.x = 0;
	ld	hl, #_cursor
	ld	(hl), #0x00
;src\main.c:32: cursor.y += 1;
	ld	bc, #_cursor+1
	ld	a, (bc)
	inc	a
	ld	(bc), a
;src\main.c:33: goto enforce_screen_limit;
	jp	00115$
00110$:
;src\main.c:34: } else if (' ' <= c && c <= 'Z') {
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x20
	jr	C,00106$
	ld	a, #0x5a
	sub	a, (hl)
	jr	C,00106$
;src\main.c:35: nop();
	nop
	jr	00114$
00106$:
;src\main.c:36: } else if ('a' <= c && c <= 'z') {
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x61
	jr	C,00102$
	ld	a, #0x7a
	sub	a, (hl)
	jr	C,00102$
;src\main.c:37: c = c - 32;
	ld	a, (hl)
	add	a, #0xe0
	ld	(hl), a
;src\main.c:38: nop();
	nop
	jr	00114$
00102$:
;src\main.c:40: breakpoint();
	ld	b,b
00114$:
;src\main.c:43: bgmap[cursor.y][cursor.x] = c - ' ';
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
;src\main.c:44: cursor.x += 1;
	ld	a, (#_cursor + 0)
	inc	a
	ld	hl, #_cursor
	ld	(hl), a
;src\main.c:46: enforce_screen_limit:
00115$:
;src\main.c:47: if (cursor.x > 19) {
	ld	hl, #_cursor + 0
	ld	c, (hl)
	ld	a, #0x13
	sub	a, c
	jr	NC,00120$
;src\main.c:48: cursor.x = 0;
	ld	hl, #_cursor
	ld	(hl), #0x00
;src\main.c:49: cursor.y += 1;
	ld	bc, #_cursor+1
	ld	a, (bc)
	inc	a
	ld	(bc), a
;src\main.c:51: if (cursor.y > 17) {
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, #0x11
	sub	a, (hl)
	jr	NC,00120$
;src\main.c:52: cursor.y = 0;
	xor	a, a
	ld	(bc), a
00120$:
;src\main.c:55: }
	inc	sp
	ret
;src\main.c:58: void init(void)
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src\main.c:60: cursor.x = 0;
	ld	hl, #_cursor
	ld	(hl), #0x00
;src\main.c:61: cursor.y = 0;
	ld	hl, #(_cursor + 0x0001)
	ld	(hl), #0x00
;src\main.c:63: memset(&tiles, 0, sizeof(tiles));
	ld	hl, #0x0001
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, #_tiles
	push	hl
	call	_memset
	add	sp, #6
;src\main.c:64: memcpy(&tiles, &char_map, sizeof(char_map));
	ld	hl, #0x0800
	push	hl
	ld	hl, #_char_map
	push	hl
	ld	hl, #_tiles
	push	hl
	call	___memcpy
	add	sp, #6
;src\main.c:66: oam[0].x = 40;
	ld	hl, #(_oam + 0x0001)
	ld	(hl), #0x28
;src\main.c:67: oam[0].y = 40;
	ld	hl, #_oam
	ld	(hl), #0x28
;src\main.c:68: oam[0].tile = 0x19;
	ld	hl, #(_oam + 0x0002)
	ld	(hl), #0x19
;src\main.c:76: puts("abcdefghijklmnopqrstuvwxyz\n");
	ld	hl, #___str_8
	push	hl
	call	_puts
	add	sp, #2
;src\main.c:82: LCDCF_OBJON;
	ld	a, #0x83
	ldh	(_LCDC+0),a
;src\main.c:84: __asm__("ei");
	ei
;src\main.c:85: interrupt_enable = IEF_VBLANK;
	ld	hl, #_IEF_VBLANK
	ld	a, (hl)
	ldh	(_interrupt_enable+0),a
;src\main.c:86: }
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
;src\main.c:89: void update(void)
;	---------------------------------
; Function update
; ---------------------------------
_update::
;src\main.c:93: if (step++ == 16) {
	ld	hl, #_update_step_65536_70
	ld	c, (hl)
	inc	(hl)
	ld	a, c
	sub	a, #0x10
	ret	NZ
;src\main.c:94: OBP0 += 1;
	ldh	a, (_OBP0+0)
	inc	a
	ldh	(_OBP0+0),a
;src\main.c:95: OBP1 -= 1;
	ldh	a, (_OBP1+0)
	add	a, #0xff
	ldh	(_OBP1+0),a
;src\main.c:98: step = 0;
	ld	(hl), #0x00
;src\main.c:100: }
	ret
;src\main.c:103: void draw(void)
;	---------------------------------
; Function draw
; ---------------------------------
_draw::
;src\main.c:105: if (btn(j_left)) {
	ld	hl, #_joypad
	ld	a, (hl)
	bit	5, a
	jr	Z,00102$
;src\main.c:106: oam[0].x -= 1;
	ld	bc, #_oam+1
	ld	a, (#(_oam + 0x0001) + 0)
	dec	a
	ld	(bc), a
00102$:
;src\main.c:109: if (btn(j_right)) {
	ld	hl, #_joypad
	ld	a, (hl)
	bit	4, a
	jr	Z,00104$
;src\main.c:110: oam[0].x += 1;
	ld	bc, #_oam+1
	ld	a, (#(_oam + 0x0001) + 0)
	inc	a
	ld	(bc), a
00104$:
;src\main.c:113: if (btn(j_up)) {
	ld	hl, #_joypad
	ld	a, (hl)
	bit	6, a
	jr	Z,00106$
;src\main.c:114: oam[0].y -= 1;
	ld	bc, #_oam+0
	ld	a, (#_oam + 0)
	dec	a
	ld	(bc), a
00106$:
;src\main.c:117: if (btn(j_down)) {
	ld	hl, #_joypad
	ld	a, (hl)
	rlca
	jr	NC,00108$
;src\main.c:118: oam[0].y += 1;
	ld	bc, #_oam+0
	ld	a, (#_oam + 0)
	inc	a
	ld	(bc), a
00108$:
;src\main.c:121: if (btnp(j_left)) {
	ld	hl, #_previous_joypad
	ld	c, (hl)
	xor	a, a
	cpl
	ld	b, a
	ld	a, c
	cpl
	ld	c, a
	ld	hl, #_joypad
	ld	e, (hl)
	ld	d, #0x00
	ld	a, c
	and	a, e
	ld	c, a
	ld	a, b
	and	a, d
	bit	5, c
	jr	Z,00110$
;src\main.c:122: oam[0].x_flip -= 1;
	ld	bc, #_oam+3
	ld	hl, #(_oam + 0x0003) + 0
	ld	a, (hl)
	swap	a
	rrca
	and	a, #0x01
	dec	a
	swap	a
	rlca
	and	a, #0x20
	ld	l, a
	ld	a, (bc)
	and	a, #0xdf
	or	a, l
	ld	(bc), a
00110$:
;src\main.c:125: if (btnp(j_right)) {
	ld	hl, #_previous_joypad
	ld	c, (hl)
	xor	a, a
	cpl
	ld	b, a
	ld	a, c
	cpl
	ld	c, a
	ld	hl, #_joypad
	ld	e, (hl)
	ld	d, #0x00
	ld	a, c
	and	a, e
	ld	c, a
	ld	a, b
	and	a, d
	bit	4, c
	ret	Z
;src\main.c:126: oam[0].x_flip += 1;
	ld	bc, #_oam+3
	ld	hl, #(_oam + 0x0003) + 0
	ld	a, (hl)
	swap	a
	rrca
	and	a, #0x01
	inc	a
	swap	a
	rlca
	and	a, #0x20
	ld	l, a
	ld	a, (bc)
	and	a, #0xdf
	or	a, l
	ld	(bc), a
;src\main.c:132: }
	ret
	.area _CODE
	.area _CABS (ABS)

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
	.globl ___memcpy
	.globl _memset
	.globl _bgmap
	.globl _tiles
	.globl _font_tiles
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
G$NR52$0_0$0 == 0x0026
_NR52	=	0x0026
G$LCDC$0_0$0 == 0x0040
_LCDC	=	0x0040
G$STAT$0_0$0 == 0x0041
_STAT	=	0x0041
G$SCY$0_0$0 == 0x0042
_SCY	=	0x0042
G$SCX$0_0$0 == 0x0043
_SCX	=	0x0043
G$LY$0_0$0 == 0x0044
_LY	=	0x0044
G$LYC$0_0$0 == 0x0045
_LYC	=	0x0045
G$BGP$0_0$0 == 0x0047
_BGP	=	0x0047
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$tiles$0_0$0 == 0x9000
_tiles	=	0x9000
G$bgmap$0_0$0 == 0x9800
_bgmap	=	0x9800
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$78$0_0$25	= .
	.globl	C$main.c$78$0_0$25
;src\main.c:78: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$79$1_0$25	= .
	.globl	C$main.c$79$1_0$25
;src\main.c:79: while (LY < 144) {} /* wait until vblank */
00101$:
	ldh	a, (_LY+0)
	sub	a, #0x90
	jr	C,00101$
	C$main.c$81$1_0$25	= .
	.globl	C$main.c$81$1_0$25
;src\main.c:81: LCDC = 0;
	ld	a, #0x00
	ldh	(_LCDC+0),a
	C$main.c$83$1_0$25	= .
	.globl	C$main.c$83$1_0$25
;src\main.c:83: memcpy(&tiles, &font_tiles, sizeof(font_tiles));
	ld	hl, #0x0030
	push	hl
	ld	hl, #_font_tiles
	push	hl
	ld	hl, #_tiles
	push	hl
	call	___memcpy
	add	sp, #6
	C$main.c$85$1_0$25	= .
	.globl	C$main.c$85$1_0$25
;src\main.c:85: breakpoint();
	ld	b,b
	C$main.c$86$1_0$25	= .
	.globl	C$main.c$86$1_0$25
;src\main.c:86: memset(&bgmap, 0, 360);
	ld	hl, #0x0168
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #_bgmap
	push	hl
	call	_memset
	add	sp, #6
	C$main.c$89$1_0$25	= .
	.globl	C$main.c$89$1_0$25
;src\main.c:89: BGP = 0b11100100;
	ld	a, #0xe4
	ldh	(_BGP+0),a
	C$main.c$91$1_0$25	= .
	.globl	C$main.c$91$1_0$25
;src\main.c:91: SCY = 0;
	ld	a, #0x00
	ldh	(_SCY+0),a
	C$main.c$92$1_0$25	= .
	.globl	C$main.c$92$1_0$25
;src\main.c:92: SCX = 0;
	ld	a, #0x00
	ldh	(_SCX+0),a
	C$main.c$94$1_0$25	= .
	.globl	C$main.c$94$1_0$25
;src\main.c:94: NR52 = 0;
	ld	a, #0x00
	ldh	(_NR52+0),a
	C$main.c$96$1_0$25	= .
	.globl	C$main.c$96$1_0$25
;src\main.c:96: LCDC = 0b10000001;
	ld	a, #0x81
	ldh	(_LCDC+0),a
	C$main.c$98$1_0$25	= .
	.globl	C$main.c$98$1_0$25
;src\main.c:98: while(1) {}
00105$:
	jr	00105$
	C$main.c$99$1_0$25	= .
	.globl	C$main.c$99$1_0$25
;src\main.c:99: }
	C$main.c$99$1_0$25	= .
	.globl	C$main.c$99$1_0$25
	XG$main$0$0	= .
	.globl	XG$main$0$0
	ret
G$font_tiles$0_0$0 == .
_font_tiles:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x81	; 129
	.area _CODE
	.area _CABS (ABS)

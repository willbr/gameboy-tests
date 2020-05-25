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
	GLOBAL ___memcpy
	GLOBAL _memset
	GLOBAL _bgmap
	GLOBAL _tiles
	GLOBAL _font_tiles
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
	SECTION "src\main.c_DATA",BSS
G$tiles$0_0$0 == 0x9000
_tiles	=	0x9000
G$bgmap$0_0$0 == 0x9800
_bgmap	=	0x9800
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	SECTION "src\main.c_HOME",HOME
	SECTION "src\main.c_HOME",HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	SECTION "src\main.c_CODE",CODE
	G$main$0$0	!equ .
	GLOBAL	G$main$0$0
	C$main.c$78$0_0$25	!equ .
	GLOBAL	C$main.c$78$0_0$25
;src\main.c:78: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$79$1_0$25	!equ .
	GLOBAL	C$main.c$79$1_0$25
;src\main.c:79: while (LY < 144) {} /* wait until vblank */
.l00101:
	ldh	a, (_LY+0)
	sub	a, $90
	jr	C,.l00101
	C$main.c$81$1_0$25	!equ .
	GLOBAL	C$main.c$81$1_0$25
;src\main.c:81: LCDC = 0;
	ld	a, $00
	ldh	(_LCDC+0),a
	C$main.c$83$1_0$25	!equ .
	GLOBAL	C$main.c$83$1_0$25
;src\main.c:83: memcpy(&tiles, &font_tiles, sizeof(font_tiles));
	ld	hl, $0030
	push	hl
	ld	hl, _font_tiles
	push	hl
	ld	hl, _tiles
	push	hl
	call	___memcpy
	add	sp, #6
	C$main.c$85$1_0$25	!equ .
	GLOBAL	C$main.c$85$1_0$25
;src\main.c:85: breakpoint();
	ld	b,b
	C$main.c$86$1_0$25	!equ .
	GLOBAL	C$main.c$86$1_0$25
;src\main.c:86: memset(&bgmap, 0, 360);
	ld	hl, $0168
	push	hl
	ld	hl, $0000
	push	hl
	ld	hl, _bgmap
	push	hl
	call	_memset
	add	sp, #6
	C$main.c$89$1_0$25	!equ .
	GLOBAL	C$main.c$89$1_0$25
;src\main.c:89: BGP = 0b11100100;
	ld	a, $E4
	ldh	(_BGP+0),a
	C$main.c$91$1_0$25	!equ .
	GLOBAL	C$main.c$91$1_0$25
;src\main.c:91: SCY = 0;
	ld	a, $00
	ldh	(_SCY+0),a
	C$main.c$92$1_0$25	!equ .
	GLOBAL	C$main.c$92$1_0$25
;src\main.c:92: SCX = 0;
	ld	a, $00
	ldh	(_SCX+0),a
	C$main.c$94$1_0$25	!equ .
	GLOBAL	C$main.c$94$1_0$25
;src\main.c:94: NR52 = 0;
	ld	a, $00
	ldh	(_NR52+0),a
	C$main.c$96$1_0$25	!equ .
	GLOBAL	C$main.c$96$1_0$25
;src\main.c:96: LCDC = 0b10000001;
	ld	a, $81
	ldh	(_LCDC+0),a
	C$main.c$98$1_0$25	!equ .
	GLOBAL	C$main.c$98$1_0$25
;src\main.c:98: while(1) {}
.l00105:
	jr	.l00105
.l00107:
	C$main.c$99$1_0$25	!equ .
	GLOBAL	C$main.c$99$1_0$25
;src\main.c:99: }
	C$main.c$99$1_0$25	!equ .
	GLOBAL	C$main.c$99$1_0$25
	XG$main$0$0	!equ .
	GLOBAL	XG$main$0$0
	ret
G$font_tiles$0_0$0 == .
_font_tiles:
	DB $01	; 1
	DB $01	; 1
	DB $02	; 2
	DB $02	; 2
	DB $04	; 4
	DB $04	; 4
	DB $08	; 8
	DB $08	; 8
	DB $10	; 16
	DB $10	; 16
	DB $20	; 32
	DB $20	; 32
	DB $40	; 64
	DB $40	; 64
	DB $80	; 128
	DB $80	; 128
	DB $80	; 128
	DB $80	; 128
	DB $40	; 64
	DB $40	; 64
	DB $20	; 32
	DB $20	; 32
	DB $10	; 16
	DB $10	; 16
	DB $08	; 8
	DB $08	; 8
	DB $04	; 4
	DB $04	; 4
	DB $02	; 2
	DB $02	; 2
	DB $01	; 1
	DB $01	; 1
	DB $81	; 129
	DB $81	; 129
	DB $42	; 66	'B'
	DB $42	; 66	'B'
	DB $24	; 36
	DB $24	; 36
	DB $18	; 24
	DB $18	; 24
	DB $18	; 24
	DB $18	; 24
	DB $24	; 36
	DB $24	; 36
	DB $42	; 66	'B'
	DB $42	; 66	'B'
	DB $81	; 129
	DB $81	; 129
	SECTION "src\main.c_CODE",CODE
	SECTION "CABS (ABS)",CODE

;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	; MODULE main
	.optsdcc -mgbz80
	; Generated using the rgbds tokens.

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_p1_joy_pad	=	0x0000
_interrupt_flag	=	0x000f
_interrupt_enable	=	0x00ff
_NR52	=	0x0026
_LCDC	=	0x0040
_STAT	=	0x0041
_SCY	=	0x0042
_SCX	=	0x0043
_LY	=	0x0044
_LYC	=	0x0045
_BGP	=	0x0047
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	SECTION "src\main.c_DATA",BSS
_tiles	=	0x9000
_bgmap	=	0x9800
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	SECTION "DABS (ABS)",CODE
;--------------------------------------------------------
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
;src\main.c:90: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src\main.c:92: while (LY < 144) {} /* wait until vblank */
	di
.l00101:
	ldh	a, (_LY+0)
	sub	a, $90
	jr	C,.l00101
	ei
;src\main.c:94: LCDC = 0;
	ld	a, $00
	ldh	(_LCDC+0),a
;src\main.c:96: memcpy(&tiles, &font_tiles, sizeof(font_tiles));
	ld	hl, $0030
	push	hl
	ld	hl, _font_tiles
	push	hl
	ld	hl, _tiles
	push	hl
	call	___memcpy
	add	sp, #6
;src\main.c:99: memset(&bgmap, 0, 360);
	ld	hl, $0168
	push	hl
	ld	hl, $0000
	push	hl
	ld	hl, _bgmap
	push	hl
	call	_memset
	add	sp, #6
;src\main.c:102: BGP = 0b11100100;
	ld	a, $E4
	ldh	(_BGP+0),a
;src\main.c:104: SCY = 0;
	ld	a, $00
	ldh	(_SCY+0),a
;src\main.c:105: SCX = 0;
	ld	a, $00
	ldh	(_SCX+0),a
;src\main.c:107: NR52 = 0;
	ld	a, $00
	ldh	(_NR52+0),a
;src\main.c:109: LCDC = 0b10000001;
	ld	a, $81
	ldh	(_LCDC+0),a
;src\main.c:112: __asm__("ei");
	ei
;src\main.c:113: interrupt_enable |= IEF_VBLANK;
	ld	hl, _IEF_VBLANK
	ld	c, [hl]
	ldh	a, (_interrupt_enable+0)
	or	a, c
	ldh	(_interrupt_enable+0),a
;src\main.c:115: while(1) {
.l00105:
;src\main.c:117: "nop");
	halt
	nop
;src\main.c:118: SCY += 1;
	ldh	a, (_SCY+0)
	inc	a
	ldh	(_SCY+0),a
	jr	.l00105
.l00107:
;src\main.c:120: }
	ret
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
;src\main.c:122: void timer_isr(void) __interrupt
;	---------------------------------
; Function timer_isr
; ---------------------------------
_timer_isr::
	ei
	push	af
		push bc
		push de
		push hl
;src\main.c:124: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
.l00101:
;src\main.c:125: }
	pop	hl
		pop de
		pop bc
		pop af
	ret
;src\main.c:127: void vblank_isr(void) __critical __interrupt
;	---------------------------------
; Function vblank_isr
; ---------------------------------
_vblank_isr::
	push	af
		push bc
		push de
		push hl
;src\main.c:129: __asm__("nop");
	nop
.l00101:
;src\main.c:131: }
	pop	hl
		pop de
		pop bc
		pop af
	reti
;src\main.c:133: void lcd_isr(void) __critical __interrupt
;	---------------------------------
; Function lcd_isr
; ---------------------------------
_lcd_isr::
	push	af
		push bc
		push de
		push hl
;src\main.c:135: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
.l00101:
;src\main.c:136: }
	pop	hl
		pop de
		pop bc
		pop af
	reti
;src\main.c:138: void serial_isr(void) __critical __interrupt
;	---------------------------------
; Function serial_isr
; ---------------------------------
_serial_isr::
	push	af
		push bc
		push de
		push hl
;src\main.c:140: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
.l00101:
;src\main.c:141: }
	pop	hl
		pop de
		pop bc
		pop af
	reti
;src\main.c:143: void joypad_isr(void) __critical __interrupt
;	---------------------------------
; Function joypad_isr
; ---------------------------------
_joypad_isr::
	push	af
		push bc
		push de
		push hl
;src\main.c:145: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
.l00101:
;src\main.c:146: }
	pop	hl
		pop de
		pop bc
		pop af
	reti
	SECTION "src\main.c_CODE",CODE
	SECTION "CABS (ABS)",CODE

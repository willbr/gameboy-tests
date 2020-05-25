;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _joypad_isr
	.globl _serial_isr
	.globl _lcd_isr
	.globl _vblank_isr
	.globl _timer_isr
	.globl _main
	.globl ___memcpy
	.globl _memset
	.globl _bgmap
	.globl _tiles
	.globl _font_tiles
	.globl _IEF_VBLANK
	.globl _IEF_LCDC
	.globl _IEF_TIMER
	.globl _IEF_SERIAL
	.globl _IEF_HILO
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
G$p1_joy_pad$0_0$0 == 0x0000
_p1_joy_pad	=	0x0000
G$interrupt_flag$0_0$0 == 0x000f
_interrupt_flag	=	0x000f
G$interrupt_enable$0_0$0 == 0x00ff
_interrupt_enable	=	0x00ff
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
	C$main.c$90$0_0$25	= .
	.globl	C$main.c$90$0_0$25
;src\main.c:90: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$92$2_0$26	= .
	.globl	C$main.c$92$2_0$26
;src\main.c:92: while (LY < 144) {} /* wait until vblank */
	di
00101$:
	ldh	a, (_LY+0)
	sub	a, #0x90
	jr	C,00101$
	ei
	C$main.c$94$2_0$26	= .
	.globl	C$main.c$94$2_0$26
;src\main.c:94: LCDC = 0;
	ld	a, #0x00
	ldh	(_LCDC+0),a
	C$main.c$96$2_0$26	= .
	.globl	C$main.c$96$2_0$26
;src\main.c:96: memcpy(&tiles, &font_tiles, sizeof(font_tiles));
	ld	hl, #0x0030
	push	hl
	ld	hl, #_font_tiles
	push	hl
	ld	hl, #_tiles
	push	hl
	call	___memcpy
	add	sp, #6
	C$main.c$99$2_0$26	= .
	.globl	C$main.c$99$2_0$26
;src\main.c:99: memset(&bgmap, 0, 360);
	ld	hl, #0x0168
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #_bgmap
	push	hl
	call	_memset
	add	sp, #6
	C$main.c$102$2_0$26	= .
	.globl	C$main.c$102$2_0$26
;src\main.c:102: BGP = 0b11100100;
	ld	a, #0xe4
	ldh	(_BGP+0),a
	C$main.c$104$2_0$26	= .
	.globl	C$main.c$104$2_0$26
;src\main.c:104: SCY = 0;
	ld	a, #0x00
	ldh	(_SCY+0),a
	C$main.c$105$2_0$26	= .
	.globl	C$main.c$105$2_0$26
;src\main.c:105: SCX = 0;
	ld	a, #0x00
	ldh	(_SCX+0),a
	C$main.c$107$2_0$26	= .
	.globl	C$main.c$107$2_0$26
;src\main.c:107: NR52 = 0;
	ld	a, #0x00
	ldh	(_NR52+0),a
	C$main.c$109$2_0$26	= .
	.globl	C$main.c$109$2_0$26
;src\main.c:109: LCDC = 0b10000001;
	ld	a, #0x81
	ldh	(_LCDC+0),a
	C$main.c$112$1_0$25	= .
	.globl	C$main.c$112$1_0$25
;src\main.c:112: __asm__("ei");
	ei
	C$main.c$113$1_0$25	= .
	.globl	C$main.c$113$1_0$25
;src\main.c:113: interrupt_enable |= IEF_VBLANK;
	ld	hl, #_IEF_VBLANK
	ld	c, (hl)
	ldh	a, (_interrupt_enable+0)
	or	a, c
	ldh	(_interrupt_enable+0),a
	C$main.c$115$1_0$25	= .
	.globl	C$main.c$115$1_0$25
;src\main.c:115: while(1) {
00105$:
	C$main.c$117$2_0$28	= .
	.globl	C$main.c$117$2_0$28
;src\main.c:117: "nop");
	halt
	nop
	C$main.c$118$2_0$28	= .
	.globl	C$main.c$118$2_0$28
;src\main.c:118: SCY += 1;
	ldh	a, (_SCY+0)
	inc	a
	ldh	(_SCY+0),a
	jr	00105$
	C$main.c$120$1_0$25	= .
	.globl	C$main.c$120$1_0$25
;src\main.c:120: }
	C$main.c$120$1_0$25	= .
	.globl	C$main.c$120$1_0$25
	XG$main$0$0	= .
	.globl	XG$main$0$0
	ret
G$IEF_HILO$0_0$0 == .
_IEF_HILO:
	.db #0x10	; 16
G$IEF_SERIAL$0_0$0 == .
_IEF_SERIAL:
	.db #0x08	; 8
G$IEF_TIMER$0_0$0 == .
_IEF_TIMER:
	.db #0x04	; 4
G$IEF_LCDC$0_0$0 == .
_IEF_LCDC:
	.db #0x02	; 2
G$IEF_VBLANK$0_0$0 == .
_IEF_VBLANK:
	.db #0x01	; 1
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
	G$timer_isr$0$0	= .
	.globl	G$timer_isr$0$0
	C$main.c$122$1_0$30	= .
	.globl	C$main.c$122$1_0$30
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
	C$main.c$124$1_0$30	= .
	.globl	C$main.c$124$1_0$30
;src\main.c:124: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
	C$main.c$125$1_0$30	= .
	.globl	C$main.c$125$1_0$30
;src\main.c:125: }
	pop	hl
	pop de
	pop bc
	pop af
	C$main.c$125$1_0$30	= .
	.globl	C$main.c$125$1_0$30
	XG$timer_isr$0$0	= .
	.globl	XG$timer_isr$0$0
	ret
	G$vblank_isr$0$0	= .
	.globl	G$vblank_isr$0$0
	C$main.c$127$1_0$32	= .
	.globl	C$main.c$127$1_0$32
;src\main.c:127: void vblank_isr(void) __critical __interrupt
;	---------------------------------
; Function vblank_isr
; ---------------------------------
_vblank_isr::
	push	af
	push bc
	push de
	push hl
	C$main.c$129$1_0$32	= .
	.globl	C$main.c$129$1_0$32
;src\main.c:129: __asm__("nop");
	nop
	C$main.c$131$1_0$32	= .
	.globl	C$main.c$131$1_0$32
;src\main.c:131: }
	pop	hl
	pop de
	pop bc
	pop af
	C$main.c$131$1_0$32	= .
	.globl	C$main.c$131$1_0$32
	XG$vblank_isr$0$0	= .
	.globl	XG$vblank_isr$0$0
	reti
	G$lcd_isr$0$0	= .
	.globl	G$lcd_isr$0$0
	C$main.c$133$1_0$34	= .
	.globl	C$main.c$133$1_0$34
;src\main.c:133: void lcd_isr(void) __critical __interrupt
;	---------------------------------
; Function lcd_isr
; ---------------------------------
_lcd_isr::
	push	af
	push bc
	push de
	push hl
	C$main.c$135$1_0$34	= .
	.globl	C$main.c$135$1_0$34
;src\main.c:135: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
	C$main.c$136$1_0$34	= .
	.globl	C$main.c$136$1_0$34
;src\main.c:136: }
	pop	hl
	pop de
	pop bc
	pop af
	C$main.c$136$1_0$34	= .
	.globl	C$main.c$136$1_0$34
	XG$lcd_isr$0$0	= .
	.globl	XG$lcd_isr$0$0
	reti
	G$serial_isr$0$0	= .
	.globl	G$serial_isr$0$0
	C$main.c$138$1_0$36	= .
	.globl	C$main.c$138$1_0$36
;src\main.c:138: void serial_isr(void) __critical __interrupt
;	---------------------------------
; Function serial_isr
; ---------------------------------
_serial_isr::
	push	af
	push bc
	push de
	push hl
	C$main.c$140$1_0$36	= .
	.globl	C$main.c$140$1_0$36
;src\main.c:140: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
	C$main.c$141$1_0$36	= .
	.globl	C$main.c$141$1_0$36
;src\main.c:141: }
	pop	hl
	pop de
	pop bc
	pop af
	C$main.c$141$1_0$36	= .
	.globl	C$main.c$141$1_0$36
	XG$serial_isr$0$0	= .
	.globl	XG$serial_isr$0$0
	reti
	G$joypad_isr$0$0	= .
	.globl	G$joypad_isr$0$0
	C$main.c$143$1_0$38	= .
	.globl	C$main.c$143$1_0$38
;src\main.c:143: void joypad_isr(void) __critical __interrupt
;	---------------------------------
; Function joypad_isr
; ---------------------------------
_joypad_isr::
	push	af
	push bc
	push de
	push hl
	C$main.c$145$1_0$38	= .
	.globl	C$main.c$145$1_0$38
;src\main.c:145: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
	C$main.c$146$1_0$38	= .
	.globl	C$main.c$146$1_0$38
;src\main.c:146: }
	pop	hl
	pop de
	pop bc
	pop af
	C$main.c$146$1_0$38	= .
	.globl	C$main.c$146$1_0$38
	XG$joypad_isr$0$0	= .
	.globl	XG$joypad_isr$0$0
	reti
	.area _CODE
	.area _CABS (ABS)

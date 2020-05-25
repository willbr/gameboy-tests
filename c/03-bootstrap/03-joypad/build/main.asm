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
	.globl _joypad_btn_state
	.globl _joypad_dpad_state
	.globl _joypad
	.globl _bgmap
	.globl _tiles
	.globl _font_tiles
	.globl _IEF_VBLANK
	.globl _IEF_LCDC
	.globl _IEF_TIMER
	.globl _IEF_SERIAL
	.globl _IEF_HILO
	.globl _poll_joypad
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
G$p1_joypad$0_0$0 == 0x0000
_p1_joypad	=	0x0000
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
G$joypad$0_0$0==.
_joypad::
	.ds 1
G$joypad_dpad_state$0_0$0==.
_joypad_dpad_state::
	.ds 1
G$joypad_btn_state$0_0$0==.
_joypad_btn_state::
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
	C$main.c$113$1_0$41	= .
	.globl	C$main.c$113$1_0$41
;src\main.c:113: u8 joypad = 0;
	ld	hl, #_joypad
	ld	(hl), #0x00
	C$main.c$114$1_0$41	= .
	.globl	C$main.c$114$1_0$41
;src\main.c:114: u8 joypad_dpad_state = 0;
	ld	hl, #_joypad_dpad_state
	ld	(hl), #0x00
	C$main.c$115$1_0$41	= .
	.globl	C$main.c$115$1_0$41
;src\main.c:115: u8 joypad_btn_state = 0;
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
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$117$0_0$26	= .
	.globl	C$main.c$117$0_0$26
;src\main.c:117: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$119$2_0$27	= .
	.globl	C$main.c$119$2_0$27
;src\main.c:119: while (LY < 144) {} /* wait until vblank */
	di
00101$:
	ldh	a, (_LY+0)
	sub	a, #0x90
	jr	C,00101$
	ei
	C$main.c$121$2_0$27	= .
	.globl	C$main.c$121$2_0$27
;src\main.c:121: LCDC = 0;
	ld	a, #0x00
	ldh	(_LCDC+0),a
	C$main.c$123$2_0$27	= .
	.globl	C$main.c$123$2_0$27
;src\main.c:123: memcpy(&tiles, &font_tiles, sizeof(font_tiles));
	ld	hl, #0x0040
	push	hl
	ld	hl, #_font_tiles
	push	hl
	ld	hl, #_tiles
	push	hl
	call	___memcpy
	add	sp, #6
	C$main.c$126$2_0$27	= .
	.globl	C$main.c$126$2_0$27
;src\main.c:126: memset(&bgmap, 0, 360);
	ld	hl, #0x0168
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #_bgmap
	push	hl
	call	_memset
	add	sp, #6
	C$main.c$129$2_0$27	= .
	.globl	C$main.c$129$2_0$27
;src\main.c:129: BGP = 0b11100100;
	ld	a, #0xe4
	ldh	(_BGP+0),a
	C$main.c$131$2_0$27	= .
	.globl	C$main.c$131$2_0$27
;src\main.c:131: SCY = 0;
	ld	a, #0x00
	ldh	(_SCY+0),a
	C$main.c$132$2_0$27	= .
	.globl	C$main.c$132$2_0$27
;src\main.c:132: SCX = 0;
	ld	a, #0x00
	ldh	(_SCX+0),a
	C$main.c$134$2_0$27	= .
	.globl	C$main.c$134$2_0$27
;src\main.c:134: NR52 = 0;
	ld	a, #0x00
	ldh	(_NR52+0),a
	C$main.c$136$2_0$27	= .
	.globl	C$main.c$136$2_0$27
;src\main.c:136: LCDC = 0b10000001;
	ld	a, #0x81
	ldh	(_LCDC+0),a
	C$main.c$139$1_0$26	= .
	.globl	C$main.c$139$1_0$26
;src\main.c:139: __asm__("ei");
	ei
	C$main.c$140$1_0$26	= .
	.globl	C$main.c$140$1_0$26
;src\main.c:140: interrupt_enable |= IEF_VBLANK;
	ld	hl, #_IEF_VBLANK
	ld	c, (hl)
	ldh	a, (_interrupt_enable+0)
	or	a, c
	ldh	(_interrupt_enable+0),a
	C$main.c$142$1_0$26	= .
	.globl	C$main.c$142$1_0$26
;src\main.c:142: while(1) {
00105$:
	C$main.c$144$2_0$29	= .
	.globl	C$main.c$144$2_0$29
;src\main.c:144: "nop");
	halt
	nop
	C$main.c$152$2_0$29	= .
	.globl	C$main.c$152$2_0$29
;src\main.c:152: *(&bgmap + 15) = joypad & 0b00000001 ? 3 : 0;
	ld	hl, #_joypad
	ld	a, (hl)
	rrca
	jr	NC,00109$
	ld	bc, #0x0003
	jr	00110$
00109$:
	ld	bc, #0x0000
00110$:
	ld	hl, #(_bgmap + 0x000f)
	ld	(hl), c
	C$main.c$155$2_0$29	= .
	.globl	C$main.c$155$2_0$29
;src\main.c:155: *(&bgmap + 32 +  0) = joypad & 0b00010000 ? 3 : 0;
	ld	hl, #_joypad
	ld	a, (hl)
	bit	4, a
	jr	Z,00111$
	ld	bc, #0x0003
	jr	00112$
00111$:
	ld	bc, #0x0000
00112$:
	ld	hl, #(_bgmap + 0x0020)
	ld	(hl), c
	C$main.c$156$2_0$29	= .
	.globl	C$main.c$156$2_0$29
;src\main.c:156: *(&bgmap + 32 +  1) = joypad & 0b00100000 ? 3 : 0;
	ld	hl, #_joypad
	ld	a, (hl)
	bit	5, a
	jr	Z,00113$
	ld	bc, #0x0003
	jr	00114$
00113$:
	ld	bc, #0x0000
00114$:
	ld	hl, #(_bgmap + 0x0021)
	ld	(hl), c
	C$main.c$157$2_0$29	= .
	.globl	C$main.c$157$2_0$29
;src\main.c:157: *(&bgmap + 32 +  2) = joypad & 0b01000000 ? 3 : 0;
	ld	hl, #_joypad
	ld	a, (hl)
	bit	6, a
	jr	Z,00115$
	ld	bc, #0x0003
	jr	00116$
00115$:
	ld	bc, #0x0000
00116$:
	ld	hl, #(_bgmap + 0x0022)
	ld	(hl), c
	C$main.c$158$2_0$29	= .
	.globl	C$main.c$158$2_0$29
;src\main.c:158: *(&bgmap + 32 +  3) = joypad & 0b10000000 ? 3 : 0;
	ld	hl, #_joypad
	ld	a, (hl)
	rlca
	jr	NC,00117$
	ld	bc, #0x0003
	jr	00118$
00117$:
	ld	bc, #0x0000
00118$:
	ld	hl, #(_bgmap + 0x0023)
	ld	(hl), c
	C$main.c$160$2_0$29	= .
	.globl	C$main.c$160$2_0$29
;src\main.c:160: *(&bgmap + 32 + 4) = joypad & 0b00000001 ? 3 : 0;
	ld	hl, #_joypad
	ld	a, (hl)
	rrca
	jr	NC,00119$
	ld	bc, #0x0003
	jr	00120$
00119$:
	ld	bc, #0x0000
00120$:
	ld	hl, #(_bgmap + 0x0024)
	ld	(hl), c
	C$main.c$161$2_0$29	= .
	.globl	C$main.c$161$2_0$29
;src\main.c:161: *(&bgmap + 32 + 5) = joypad & 0b00000010 ? 3 : 0;
	ld	hl, #_joypad
	ld	a, (hl)
	bit	1, a
	jr	Z,00121$
	ld	bc, #0x0003
	jr	00122$
00121$:
	ld	bc, #0x0000
00122$:
	ld	hl, #(_bgmap + 0x0025)
	ld	(hl), c
	C$main.c$162$2_0$29	= .
	.globl	C$main.c$162$2_0$29
;src\main.c:162: *(&bgmap + 32 + 6) = joypad & 0b00000100 ? 3 : 0;
	ld	hl, #_joypad
	ld	a, (hl)
	bit	2, a
	jr	Z,00123$
	ld	bc, #0x0003
	jr	00124$
00123$:
	ld	bc, #0x0000
00124$:
	ld	hl, #(_bgmap + 0x0026)
	ld	(hl), c
	C$main.c$163$2_0$29	= .
	.globl	C$main.c$163$2_0$29
;src\main.c:163: *(&bgmap + 32 + 7) = joypad & 0b00001000 ? 3 : 0;
	ld	hl, #_joypad
	ld	a, (hl)
	bit	3, a
	jr	Z,00125$
	ld	bc, #0x0003
	jr	00126$
00125$:
	ld	bc, #0x0000
00126$:
	ld	hl, #(_bgmap + 0x0027)
	ld	(hl), c
	C$main.c$165$2_0$29	= .
	.globl	C$main.c$165$2_0$29
;src\main.c:165: *(&bgmap + 0) = joypad_dpad_state & 0b0001 ? 3 : 0;
	ld	hl, #_joypad_dpad_state
	ld	a, (hl)
	rrca
	jr	NC,00127$
	ld	bc, #0x0003
	jr	00128$
00127$:
	ld	bc, #0x0000
00128$:
	ld	hl, #_bgmap
	ld	(hl), c
	C$main.c$166$2_0$29	= .
	.globl	C$main.c$166$2_0$29
;src\main.c:166: *(&bgmap + 1) = joypad_dpad_state & 0b0010 ? 3 : 0;
	ld	hl, #_joypad_dpad_state
	ld	a, (hl)
	bit	1, a
	jr	Z,00129$
	ld	bc, #0x0003
	jr	00130$
00129$:
	ld	bc, #0x0000
00130$:
	ld	hl, #(_bgmap + 0x0001)
	ld	(hl), c
	C$main.c$167$2_0$29	= .
	.globl	C$main.c$167$2_0$29
;src\main.c:167: *(&bgmap + 2) = joypad_dpad_state & 0b0100 ? 3 : 0;
	ld	hl, #_joypad_dpad_state
	ld	a, (hl)
	bit	2, a
	jr	Z,00131$
	ld	bc, #0x0003
	jr	00132$
00131$:
	ld	bc, #0x0000
00132$:
	ld	hl, #(_bgmap + 0x0002)
	ld	(hl), c
	C$main.c$168$2_0$29	= .
	.globl	C$main.c$168$2_0$29
;src\main.c:168: *(&bgmap + 3) = joypad_dpad_state & 0b1000 ? 3 : 0;
	ld	hl, #_joypad_dpad_state
	ld	a, (hl)
	bit	3, a
	jr	Z,00133$
	ld	bc, #0x0003
	jr	00134$
00133$:
	ld	bc, #0x0000
00134$:
	ld	hl, #(_bgmap + 0x0003)
	ld	(hl), c
	C$main.c$170$2_0$29	= .
	.globl	C$main.c$170$2_0$29
;src\main.c:170: *(&bgmap + 4)  = joypad_btn_state & 0b0001 ? 3 : 0;
	ld	hl, #_joypad_btn_state
	ld	a, (hl)
	rrca
	jr	NC,00135$
	ld	bc, #0x0003
	jr	00136$
00135$:
	ld	bc, #0x0000
00136$:
	ld	hl, #(_bgmap + 0x0004)
	ld	(hl), c
	C$main.c$171$2_0$29	= .
	.globl	C$main.c$171$2_0$29
;src\main.c:171: *(&bgmap + 5) = joypad_btn_state & 0b0010 ? 3 : 0;
	ld	hl, #_joypad_btn_state
	ld	a, (hl)
	bit	1, a
	jr	Z,00137$
	ld	bc, #0x0003
	jr	00138$
00137$:
	ld	bc, #0x0000
00138$:
	ld	hl, #(_bgmap + 0x0005)
	ld	(hl), c
	C$main.c$172$2_0$29	= .
	.globl	C$main.c$172$2_0$29
;src\main.c:172: *(&bgmap + 6) = joypad_btn_state & 0b0100 ? 3 : 0;
	ld	hl, #_joypad_btn_state
	ld	a, (hl)
	bit	2, a
	jr	Z,00139$
	ld	bc, #0x0003
	jr	00140$
00139$:
	ld	bc, #0x0000
00140$:
	ld	hl, #(_bgmap + 0x0006)
	ld	(hl), c
	C$main.c$173$2_0$29	= .
	.globl	C$main.c$173$2_0$29
;src\main.c:173: *(&bgmap + 7) = joypad_btn_state & 0b1000 ? 3 : 0;
	ld	hl, #_joypad_btn_state
	ld	a, (hl)
	bit	3, a
	jr	Z,00141$
	ld	bc, #0x0003
	jr	00142$
00141$:
	ld	bc, #0x0000
00142$:
	ld	hl, #(_bgmap + 0x0007)
	ld	(hl), c
	jp	00105$
	C$main.c$175$1_0$26	= .
	.globl	C$main.c$175$1_0$26
;src\main.c:175: }
	C$main.c$175$1_0$26	= .
	.globl	C$main.c$175$1_0$26
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	C$main.c$177$1_0$31	= .
	.globl	C$main.c$177$1_0$31
;src\main.c:177: void timer_isr(void) __interrupt
;	---------------------------------
; Function timer_isr
; ---------------------------------
_timer_isr::
	ei
	push	af
	push bc
	push de
	push hl
	C$main.c$179$1_0$31	= .
	.globl	C$main.c$179$1_0$31
;src\main.c:179: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
	C$main.c$180$1_0$31	= .
	.globl	C$main.c$180$1_0$31
;src\main.c:180: }
	pop	hl
	pop de
	pop bc
	pop af
	C$main.c$180$1_0$31	= .
	.globl	C$main.c$180$1_0$31
	XG$timer_isr$0$0	= .
	.globl	XG$timer_isr$0$0
	ret
	G$vblank_isr$0$0	= .
	.globl	G$vblank_isr$0$0
	C$main.c$182$1_0$33	= .
	.globl	C$main.c$182$1_0$33
;src\main.c:182: void vblank_isr(void) __critical __interrupt
;	---------------------------------
; Function vblank_isr
; ---------------------------------
_vblank_isr::
	push	af
	push bc
	push de
	push hl
	C$main.c$184$1_0$33	= .
	.globl	C$main.c$184$1_0$33
;src\main.c:184: poll_joypad();
	call	_poll_joypad
	C$main.c$186$1_0$33	= .
	.globl	C$main.c$186$1_0$33
;src\main.c:186: }
	pop	hl
	pop de
	pop bc
	pop af
	C$main.c$186$1_0$33	= .
	.globl	C$main.c$186$1_0$33
	XG$vblank_isr$0$0	= .
	.globl	XG$vblank_isr$0$0
	reti
	G$lcd_isr$0$0	= .
	.globl	G$lcd_isr$0$0
	C$main.c$188$1_0$35	= .
	.globl	C$main.c$188$1_0$35
;src\main.c:188: void lcd_isr(void) __critical __interrupt
;	---------------------------------
; Function lcd_isr
; ---------------------------------
_lcd_isr::
	push	af
	push bc
	push de
	push hl
	C$main.c$190$1_0$35	= .
	.globl	C$main.c$190$1_0$35
;src\main.c:190: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
	C$main.c$191$1_0$35	= .
	.globl	C$main.c$191$1_0$35
;src\main.c:191: }
	pop	hl
	pop de
	pop bc
	pop af
	C$main.c$191$1_0$35	= .
	.globl	C$main.c$191$1_0$35
	XG$lcd_isr$0$0	= .
	.globl	XG$lcd_isr$0$0
	reti
	G$serial_isr$0$0	= .
	.globl	G$serial_isr$0$0
	C$main.c$193$1_0$37	= .
	.globl	C$main.c$193$1_0$37
;src\main.c:193: void serial_isr(void) __critical __interrupt
;	---------------------------------
; Function serial_isr
; ---------------------------------
_serial_isr::
	push	af
	push bc
	push de
	push hl
	C$main.c$195$1_0$37	= .
	.globl	C$main.c$195$1_0$37
;src\main.c:195: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
	C$main.c$196$1_0$37	= .
	.globl	C$main.c$196$1_0$37
;src\main.c:196: }
	pop	hl
	pop de
	pop bc
	pop af
	C$main.c$196$1_0$37	= .
	.globl	C$main.c$196$1_0$37
	XG$serial_isr$0$0	= .
	.globl	XG$serial_isr$0$0
	reti
	G$joypad_isr$0$0	= .
	.globl	G$joypad_isr$0$0
	C$main.c$198$1_0$39	= .
	.globl	C$main.c$198$1_0$39
;src\main.c:198: void joypad_isr(void) __critical __interrupt
;	---------------------------------
; Function joypad_isr
; ---------------------------------
_joypad_isr::
	push	af
	push bc
	push de
	push hl
	C$main.c$200$1_0$39	= .
	.globl	C$main.c$200$1_0$39
;src\main.c:200: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
	C$main.c$201$1_0$39	= .
	.globl	C$main.c$201$1_0$39
;src\main.c:201: }
	pop	hl
	pop de
	pop bc
	pop af
	C$main.c$201$1_0$39	= .
	.globl	C$main.c$201$1_0$39
	XG$joypad_isr$0$0	= .
	.globl	XG$joypad_isr$0$0
	reti
	G$poll_joypad$0$0	= .
	.globl	G$poll_joypad$0$0
	C$main.c$204$1_0$41	= .
	.globl	C$main.c$204$1_0$41
;src\main.c:204: void poll_joypad(void) 
;	---------------------------------
; Function poll_joypad
; ---------------------------------
_poll_joypad::
	C$main.c$236$1_0$41	= .
	.globl	C$main.c$236$1_0$41
;src\main.c:236: );
	rP1	= #0xFF00ld a, #0x20
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
	C$main.c$239$1_0$41	= .
	.globl	C$main.c$239$1_0$41
;src\main.c:239: joypad_btn_state = (~joypad_btn_state) & 0x0F;
	ld	hl, #_joypad_btn_state
	ld	a, (hl)
	cpl
	and	a, #0x0f
	ld	(hl), a
	C$main.c$240$1_0$41	= .
	.globl	C$main.c$240$1_0$41
;src\main.c:240: joypad_dpad_state = (~joypad_dpad_state) & 0x0F;
	ld	hl, #_joypad_dpad_state
	ld	a, (hl)
	cpl
	and	a, #0x0f
	C$main.c$242$1_0$41	= .
	.globl	C$main.c$242$1_0$41
;src\main.c:242: joypad = (joypad_dpad_state << 4) ^ joypad_btn_state;
	ld	(hl),a
	swap	a
	and	a, #0xf0
	ld	hl, #_joypad_btn_state
	xor	a, (hl)
	ld	hl, #_joypad
	ld	(hl), a
	C$main.c$244$1_0$41	= .
	.globl	C$main.c$244$1_0$41
;src\main.c:244: }
	C$main.c$244$1_0$41	= .
	.globl	C$main.c$244$1_0$41
	XG$poll_joypad$0$0	= .
	.globl	XG$poll_joypad$0$0
	ret
	.area _CODE
	.area _CABS (ABS)

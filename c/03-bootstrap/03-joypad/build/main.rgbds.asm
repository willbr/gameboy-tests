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
	GLOBAL _joypad_isr
	GLOBAL _serial_isr
	GLOBAL _lcd_isr
	GLOBAL _vblank_isr
	GLOBAL _timer_isr
	GLOBAL _main
	GLOBAL ___memcpy
	GLOBAL _memset
	GLOBAL _joypad_btn_state
	GLOBAL _joypad_dpad_state
	GLOBAL _joypad
	GLOBAL _bgmap
	GLOBAL _tiles
	GLOBAL _font_tiles
	GLOBAL _IEF_VBLANK
	GLOBAL _IEF_LCDC
	GLOBAL _IEF_TIMER
	GLOBAL _IEF_SERIAL
	GLOBAL _IEF_HILO
	GLOBAL _poll_joypad
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
	SECTION "src\main.c_DATA",BSS
G$tiles$0_0$0 == 0x9000
_tiles	=	0x9000
G$bgmap$0_0$0 == 0x9800
_bgmap	=	0x9800
G$joypad$0_0$0==.
_joypad:
	DS 1
G$joypad_dpad_state$0_0$0==.
_joypad_dpad_state:
	DS 1
G$joypad_btn_state$0_0$0==.
_joypad_btn_state:
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
	C$main.c$113$1_0$41	!equ .
	GLOBAL	C$main.c$113$1_0$41
;src\main.c:113: u8 joypad = 0;
	ld	hl, _joypad
	ld	[hl], $00
	C$main.c$114$1_0$41	!equ .
	GLOBAL	C$main.c$114$1_0$41
;src\main.c:114: u8 joypad_dpad_state = 0;
	ld	hl, _joypad_dpad_state
	ld	[hl], $00
	C$main.c$115$1_0$41	!equ .
	GLOBAL	C$main.c$115$1_0$41
;src\main.c:115: u8 joypad_btn_state = 0;
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
	G$main$0$0	!equ .
	GLOBAL	G$main$0$0
	C$main.c$117$0_0$26	!equ .
	GLOBAL	C$main.c$117$0_0$26
;src\main.c:117: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$119$2_0$27	!equ .
	GLOBAL	C$main.c$119$2_0$27
;src\main.c:119: while (LY < 144) {} /* wait until vblank */
	di
.l00101:
	ldh	a, (_LY+0)
	sub	a, $90
	jr	C,.l00101
	ei
	C$main.c$121$2_0$27	!equ .
	GLOBAL	C$main.c$121$2_0$27
;src\main.c:121: LCDC = 0;
	ld	a, $00
	ldh	(_LCDC+0),a
	C$main.c$123$2_0$27	!equ .
	GLOBAL	C$main.c$123$2_0$27
;src\main.c:123: memcpy(&tiles, &font_tiles, sizeof(font_tiles));
	ld	hl, $0040
	push	hl
	ld	hl, _font_tiles
	push	hl
	ld	hl, _tiles
	push	hl
	call	___memcpy
	add	sp, #6
	C$main.c$126$2_0$27	!equ .
	GLOBAL	C$main.c$126$2_0$27
;src\main.c:126: memset(&bgmap, 0, 360);
	ld	hl, $0168
	push	hl
	ld	hl, $0000
	push	hl
	ld	hl, _bgmap
	push	hl
	call	_memset
	add	sp, #6
	C$main.c$129$2_0$27	!equ .
	GLOBAL	C$main.c$129$2_0$27
;src\main.c:129: BGP = 0b11100100;
	ld	a, $E4
	ldh	(_BGP+0),a
	C$main.c$131$2_0$27	!equ .
	GLOBAL	C$main.c$131$2_0$27
;src\main.c:131: SCY = 0;
	ld	a, $00
	ldh	(_SCY+0),a
	C$main.c$132$2_0$27	!equ .
	GLOBAL	C$main.c$132$2_0$27
;src\main.c:132: SCX = 0;
	ld	a, $00
	ldh	(_SCX+0),a
	C$main.c$134$2_0$27	!equ .
	GLOBAL	C$main.c$134$2_0$27
;src\main.c:134: NR52 = 0;
	ld	a, $00
	ldh	(_NR52+0),a
	C$main.c$136$2_0$27	!equ .
	GLOBAL	C$main.c$136$2_0$27
;src\main.c:136: LCDC = 0b10000001;
	ld	a, $81
	ldh	(_LCDC+0),a
	C$main.c$139$1_0$26	!equ .
	GLOBAL	C$main.c$139$1_0$26
;src\main.c:139: __asm__("ei");
	ei
	C$main.c$140$1_0$26	!equ .
	GLOBAL	C$main.c$140$1_0$26
;src\main.c:140: interrupt_enable |= IEF_VBLANK;
	ld	hl, _IEF_VBLANK
	ld	c, [hl]
	ldh	a, (_interrupt_enable+0)
	or	a, c
	ldh	(_interrupt_enable+0),a
	C$main.c$142$1_0$26	!equ .
	GLOBAL	C$main.c$142$1_0$26
;src\main.c:142: while(1) {
.l00105:
	C$main.c$144$2_0$29	!equ .
	GLOBAL	C$main.c$144$2_0$29
;src\main.c:144: "nop");
	halt
	nop
	C$main.c$152$2_0$29	!equ .
	GLOBAL	C$main.c$152$2_0$29
;src\main.c:152: *(&bgmap + 15) = joypad & 0b00000001 ? 3 : 0;
	ld	hl, _joypad
	ld	a, [hl]
	rrca
	jr	NC,.l00109
.l00245:
	ld	bc, $0003
	jr	.l00110
.l00109:
	ld	bc, $0000
.l00110:
	ld	hl, (_bgmap + 0x000f)
	ld	[hl], c
	C$main.c$155$2_0$29	!equ .
	GLOBAL	C$main.c$155$2_0$29
;src\main.c:155: *(&bgmap + 32 +  0) = joypad & 0b00010000 ? 3 : 0;
	ld	hl, _joypad
	ld	a, [hl]
	bit	4, a
	jr	Z,.l00111
.l00246:
	ld	bc, $0003
	jr	.l00112
.l00111:
	ld	bc, $0000
.l00112:
	ld	hl, (_bgmap + 0x0020)
	ld	[hl], c
	C$main.c$156$2_0$29	!equ .
	GLOBAL	C$main.c$156$2_0$29
;src\main.c:156: *(&bgmap + 32 +  1) = joypad & 0b00100000 ? 3 : 0;
	ld	hl, _joypad
	ld	a, [hl]
	bit	5, a
	jr	Z,.l00113
.l00247:
	ld	bc, $0003
	jr	.l00114
.l00113:
	ld	bc, $0000
.l00114:
	ld	hl, (_bgmap + 0x0021)
	ld	[hl], c
	C$main.c$157$2_0$29	!equ .
	GLOBAL	C$main.c$157$2_0$29
;src\main.c:157: *(&bgmap + 32 +  2) = joypad & 0b01000000 ? 3 : 0;
	ld	hl, _joypad
	ld	a, [hl]
	bit	6, a
	jr	Z,.l00115
.l00248:
	ld	bc, $0003
	jr	.l00116
.l00115:
	ld	bc, $0000
.l00116:
	ld	hl, (_bgmap + 0x0022)
	ld	[hl], c
	C$main.c$158$2_0$29	!equ .
	GLOBAL	C$main.c$158$2_0$29
;src\main.c:158: *(&bgmap + 32 +  3) = joypad & 0b10000000 ? 3 : 0;
	ld	hl, _joypad
	ld	a, [hl]
	rlca
	jr	NC,.l00117
.l00249:
	ld	bc, $0003
	jr	.l00118
.l00117:
	ld	bc, $0000
.l00118:
	ld	hl, (_bgmap + 0x0023)
	ld	[hl], c
	C$main.c$160$2_0$29	!equ .
	GLOBAL	C$main.c$160$2_0$29
;src\main.c:160: *(&bgmap + 32 + 4) = joypad & 0b00000001 ? 3 : 0;
	ld	hl, _joypad
	ld	a, [hl]
	rrca
	jr	NC,.l00119
.l00250:
	ld	bc, $0003
	jr	.l00120
.l00119:
	ld	bc, $0000
.l00120:
	ld	hl, (_bgmap + 0x0024)
	ld	[hl], c
	C$main.c$161$2_0$29	!equ .
	GLOBAL	C$main.c$161$2_0$29
;src\main.c:161: *(&bgmap + 32 + 5) = joypad & 0b00000010 ? 3 : 0;
	ld	hl, _joypad
	ld	a, [hl]
	bit	1, a
	jr	Z,.l00121
.l00251:
	ld	bc, $0003
	jr	.l00122
.l00121:
	ld	bc, $0000
.l00122:
	ld	hl, (_bgmap + 0x0025)
	ld	[hl], c
	C$main.c$162$2_0$29	!equ .
	GLOBAL	C$main.c$162$2_0$29
;src\main.c:162: *(&bgmap + 32 + 6) = joypad & 0b00000100 ? 3 : 0;
	ld	hl, _joypad
	ld	a, [hl]
	bit	2, a
	jr	Z,.l00123
.l00252:
	ld	bc, $0003
	jr	.l00124
.l00123:
	ld	bc, $0000
.l00124:
	ld	hl, (_bgmap + 0x0026)
	ld	[hl], c
	C$main.c$163$2_0$29	!equ .
	GLOBAL	C$main.c$163$2_0$29
;src\main.c:163: *(&bgmap + 32 + 7) = joypad & 0b00001000 ? 3 : 0;
	ld	hl, _joypad
	ld	a, [hl]
	bit	3, a
	jr	Z,.l00125
.l00253:
	ld	bc, $0003
	jr	.l00126
.l00125:
	ld	bc, $0000
.l00126:
	ld	hl, (_bgmap + 0x0027)
	ld	[hl], c
	C$main.c$165$2_0$29	!equ .
	GLOBAL	C$main.c$165$2_0$29
;src\main.c:165: *(&bgmap + 0) = joypad_dpad_state & 0b0001 ? 3 : 0;
	ld	hl, _joypad_dpad_state
	ld	a, [hl]
	rrca
	jr	NC,.l00127
.l00254:
	ld	bc, $0003
	jr	.l00128
.l00127:
	ld	bc, $0000
.l00128:
	ld	hl, _bgmap
	ld	[hl], c
	C$main.c$166$2_0$29	!equ .
	GLOBAL	C$main.c$166$2_0$29
;src\main.c:166: *(&bgmap + 1) = joypad_dpad_state & 0b0010 ? 3 : 0;
	ld	hl, _joypad_dpad_state
	ld	a, [hl]
	bit	1, a
	jr	Z,.l00129
.l00255:
	ld	bc, $0003
	jr	.l00130
.l00129:
	ld	bc, $0000
.l00130:
	ld	hl, (_bgmap + 0x0001)
	ld	[hl], c
	C$main.c$167$2_0$29	!equ .
	GLOBAL	C$main.c$167$2_0$29
;src\main.c:167: *(&bgmap + 2) = joypad_dpad_state & 0b0100 ? 3 : 0;
	ld	hl, _joypad_dpad_state
	ld	a, [hl]
	bit	2, a
	jr	Z,.l00131
.l00256:
	ld	bc, $0003
	jr	.l00132
.l00131:
	ld	bc, $0000
.l00132:
	ld	hl, (_bgmap + 0x0002)
	ld	[hl], c
	C$main.c$168$2_0$29	!equ .
	GLOBAL	C$main.c$168$2_0$29
;src\main.c:168: *(&bgmap + 3) = joypad_dpad_state & 0b1000 ? 3 : 0;
	ld	hl, _joypad_dpad_state
	ld	a, [hl]
	bit	3, a
	jr	Z,.l00133
.l00257:
	ld	bc, $0003
	jr	.l00134
.l00133:
	ld	bc, $0000
.l00134:
	ld	hl, (_bgmap + 0x0003)
	ld	[hl], c
	C$main.c$170$2_0$29	!equ .
	GLOBAL	C$main.c$170$2_0$29
;src\main.c:170: *(&bgmap + 4)  = joypad_btn_state & 0b0001 ? 3 : 0;
	ld	hl, _joypad_btn_state
	ld	a, [hl]
	rrca
	jr	NC,.l00135
.l00258:
	ld	bc, $0003
	jr	.l00136
.l00135:
	ld	bc, $0000
.l00136:
	ld	hl, (_bgmap + 0x0004)
	ld	[hl], c
	C$main.c$171$2_0$29	!equ .
	GLOBAL	C$main.c$171$2_0$29
;src\main.c:171: *(&bgmap + 5) = joypad_btn_state & 0b0010 ? 3 : 0;
	ld	hl, _joypad_btn_state
	ld	a, [hl]
	bit	1, a
	jr	Z,.l00137
.l00259:
	ld	bc, $0003
	jr	.l00138
.l00137:
	ld	bc, $0000
.l00138:
	ld	hl, (_bgmap + 0x0005)
	ld	[hl], c
	C$main.c$172$2_0$29	!equ .
	GLOBAL	C$main.c$172$2_0$29
;src\main.c:172: *(&bgmap + 6) = joypad_btn_state & 0b0100 ? 3 : 0;
	ld	hl, _joypad_btn_state
	ld	a, [hl]
	bit	2, a
	jr	Z,.l00139
.l00260:
	ld	bc, $0003
	jr	.l00140
.l00139:
	ld	bc, $0000
.l00140:
	ld	hl, (_bgmap + 0x0006)
	ld	[hl], c
	C$main.c$173$2_0$29	!equ .
	GLOBAL	C$main.c$173$2_0$29
;src\main.c:173: *(&bgmap + 7) = joypad_btn_state & 0b1000 ? 3 : 0;
	ld	hl, _joypad_btn_state
	ld	a, [hl]
	bit	3, a
	jr	Z,.l00141
.l00261:
	ld	bc, $0003
	jr	.l00142
.l00141:
	ld	bc, $0000
.l00142:
	ld	hl, (_bgmap + 0x0007)
	ld	[hl], c
	jp	.l00105
.l00107:
	C$main.c$175$1_0$26	!equ .
	GLOBAL	C$main.c$175$1_0$26
;src\main.c:175: }
	C$main.c$175$1_0$26	!equ .
	GLOBAL	C$main.c$175$1_0$26
	XG$main$0$0	!equ .
	GLOBAL	XG$main$0$0
	ret
G$IEF_HILO$0_0$0 == .
_IEF_HILO:
	DB $10	; 16
G$IEF_SERIAL$0_0$0 == .
_IEF_SERIAL:
	DB $08	; 8
G$IEF_TIMER$0_0$0 == .
_IEF_TIMER:
	DB $04	; 4
G$IEF_LCDC$0_0$0 == .
_IEF_LCDC:
	DB $02	; 2
G$IEF_VBLANK$0_0$0 == .
_IEF_VBLANK:
	DB $01	; 1
G$font_tiles$0_0$0 == .
_font_tiles:
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
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
	G$timer_isr$0$0	!equ .
	GLOBAL	G$timer_isr$0$0
	C$main.c$177$1_0$31	!equ .
	GLOBAL	C$main.c$177$1_0$31
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
	C$main.c$179$1_0$31	!equ .
	GLOBAL	C$main.c$179$1_0$31
;src\main.c:179: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
.l00101:
	C$main.c$180$1_0$31	!equ .
	GLOBAL	C$main.c$180$1_0$31
;src\main.c:180: }
	pop	hl
		pop de
		pop bc
		pop af
	C$main.c$180$1_0$31	!equ .
	GLOBAL	C$main.c$180$1_0$31
	XG$timer_isr$0$0	!equ .
	GLOBAL	XG$timer_isr$0$0
	ret
	G$vblank_isr$0$0	!equ .
	GLOBAL	G$vblank_isr$0$0
	C$main.c$182$1_0$33	!equ .
	GLOBAL	C$main.c$182$1_0$33
;src\main.c:182: void vblank_isr(void) __critical __interrupt
;	---------------------------------
; Function vblank_isr
; ---------------------------------
_vblank_isr::
	push	af
		push bc
		push de
		push hl
	C$main.c$184$1_0$33	!equ .
	GLOBAL	C$main.c$184$1_0$33
;src\main.c:184: poll_joypad();
	call	_poll_joypad
.l00101:
	C$main.c$186$1_0$33	!equ .
	GLOBAL	C$main.c$186$1_0$33
;src\main.c:186: }
	pop	hl
		pop de
		pop bc
		pop af
	C$main.c$186$1_0$33	!equ .
	GLOBAL	C$main.c$186$1_0$33
	XG$vblank_isr$0$0	!equ .
	GLOBAL	XG$vblank_isr$0$0
	reti
	G$lcd_isr$0$0	!equ .
	GLOBAL	G$lcd_isr$0$0
	C$main.c$188$1_0$35	!equ .
	GLOBAL	C$main.c$188$1_0$35
;src\main.c:188: void lcd_isr(void) __critical __interrupt
;	---------------------------------
; Function lcd_isr
; ---------------------------------
_lcd_isr::
	push	af
		push bc
		push de
		push hl
	C$main.c$190$1_0$35	!equ .
	GLOBAL	C$main.c$190$1_0$35
;src\main.c:190: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
.l00101:
	C$main.c$191$1_0$35	!equ .
	GLOBAL	C$main.c$191$1_0$35
;src\main.c:191: }
	pop	hl
		pop de
		pop bc
		pop af
	C$main.c$191$1_0$35	!equ .
	GLOBAL	C$main.c$191$1_0$35
	XG$lcd_isr$0$0	!equ .
	GLOBAL	XG$lcd_isr$0$0
	reti
	G$serial_isr$0$0	!equ .
	GLOBAL	G$serial_isr$0$0
	C$main.c$193$1_0$37	!equ .
	GLOBAL	C$main.c$193$1_0$37
;src\main.c:193: void serial_isr(void) __critical __interrupt
;	---------------------------------
; Function serial_isr
; ---------------------------------
_serial_isr::
	push	af
		push bc
		push de
		push hl
	C$main.c$195$1_0$37	!equ .
	GLOBAL	C$main.c$195$1_0$37
;src\main.c:195: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
.l00101:
	C$main.c$196$1_0$37	!equ .
	GLOBAL	C$main.c$196$1_0$37
;src\main.c:196: }
	pop	hl
		pop de
		pop bc
		pop af
	C$main.c$196$1_0$37	!equ .
	GLOBAL	C$main.c$196$1_0$37
	XG$serial_isr$0$0	!equ .
	GLOBAL	XG$serial_isr$0$0
	reti
	G$joypad_isr$0$0	!equ .
	GLOBAL	G$joypad_isr$0$0
	C$main.c$198$1_0$39	!equ .
	GLOBAL	C$main.c$198$1_0$39
;src\main.c:198: void joypad_isr(void) __critical __interrupt
;	---------------------------------
; Function joypad_isr
; ---------------------------------
_joypad_isr::
	push	af
		push bc
		push de
		push hl
	C$main.c$200$1_0$39	!equ .
	GLOBAL	C$main.c$200$1_0$39
;src\main.c:200: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
.l00101:
	C$main.c$201$1_0$39	!equ .
	GLOBAL	C$main.c$201$1_0$39
;src\main.c:201: }
	pop	hl
		pop de
		pop bc
		pop af
	C$main.c$201$1_0$39	!equ .
	GLOBAL	C$main.c$201$1_0$39
	XG$joypad_isr$0$0	!equ .
	GLOBAL	XG$joypad_isr$0$0
	reti
	G$poll_joypad$0$0	!equ .
	GLOBAL	G$poll_joypad$0$0
	C$main.c$204$1_0$41	!equ .
	GLOBAL	C$main.c$204$1_0$41
;src\main.c:204: void poll_joypad(void) 
;	---------------------------------
; Function poll_joypad
; ---------------------------------
_poll_joypad::
	C$main.c$236$1_0$41	!equ .
	GLOBAL	C$main.c$236$1_0$41
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
	C$main.c$239$1_0$41	!equ .
	GLOBAL	C$main.c$239$1_0$41
;src\main.c:239: joypad_btn_state = (~joypad_btn_state) & 0x0F;
	ld	hl, _joypad_btn_state
	ld	a, [hl]
	cpl
	and	a, $0F
	ld	[hl], a
	C$main.c$240$1_0$41	!equ .
	GLOBAL	C$main.c$240$1_0$41
;src\main.c:240: joypad_dpad_state = (~joypad_dpad_state) & 0x0F;
	ld	hl, _joypad_dpad_state
	ld	a, [hl]
	cpl
	and	a, $0F
	C$main.c$242$1_0$41	!equ .
	GLOBAL	C$main.c$242$1_0$41
;src\main.c:242: joypad = (joypad_dpad_state << 4) ^ joypad_btn_state;
	ld	[hl],a
	swap	a
	and	a, $F0
	ld	hl, _joypad_btn_state
	xor	a, [hl]
	ld	hl, _joypad
	ld	[hl], a
.l00101:
	C$main.c$244$1_0$41	!equ .
	GLOBAL	C$main.c$244$1_0$41
;src\main.c:244: }
	C$main.c$244$1_0$41	!equ .
	GLOBAL	C$main.c$244$1_0$41
	XG$poll_joypad$0$0	!equ .
	GLOBAL	XG$poll_joypad$0$0
	ret
	SECTION "src\main.c_CODE",CODE
	SECTION "CABS (ABS)",CODE

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
	GLOBAL _random8_between
	GLOBAL ___memcpy
	GLOBAL _memset
	GLOBAL _joypad_btn_state
	GLOBAL _joypad_dpad_state
	GLOBAL _joypad
	GLOBAL _shadow_oam
	GLOBAL _oam
	GLOBAL _HRAM
	GLOBAL _OAMRAM
	GLOBAL _bgmap
	GLOBAL _tiles
	GLOBAL _random_table
	GLOBAL _font_tiles
	GLOBAL _IEF_VBLANK
	GLOBAL _IEF_LCDC
	GLOBAL _IEF_TIMER
	GLOBAL _IEF_SERIAL
	GLOBAL _IEF_HILO
	GLOBAL _random8
	GLOBAL _update
	GLOBAL _draw
	GLOBAL _dma_copy
	GLOBAL _poll_joypad
	GLOBAL _init
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
_joypad:
	DS 1
_joypad_dpad_state:
	DS 1
_joypad_btn_state:
	DS 1
_random8_i_65536_32:
	DS 1
_update_i_65536_34:
	DS 1
_update_j_65536_34:
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
;src\main.c:247: static u8 i = 123;
	ld	hl, _random8_i_65536_32
	ld	[hl], $7B
;src\main.c:199: u8 joypad = 0;
	ld	hl, _joypad
	ld	[hl], $00
;src\main.c:200: u8 joypad_dpad_state = 0;
	ld	hl, _joypad_dpad_state
	ld	[hl], $00
;src\main.c:201: u8 joypad_btn_state = 0;
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
;src\main.c:240: char random8_between(char min, char max)
;	---------------------------------
; Function random8_between
; ---------------------------------
_random8_between::
	add	sp, #-3
;src\main.c:242: return (random8() % (max + 1 - min)) + min;
	call	_random8
	ld	hl, [sp+0]
	ld	[hl], e
	ld	hl, [sp+6]
	ld	c, [hl]
	ld	b, $00
	inc	bc
	ld	hl, [sp+1]
	ld	[hl], c
	inc	hl
	ld	[hl], b
	ld	hl, [sp+5]
	ld	c, [hl]
	ld	b, $00
	ld	hl, [sp+2]
	dec	hl
	ld	e, [hl]
	inc	hl
	ld	d, [hl]
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ld	b, a
	ld	c, e
	dec	hl
	dec	hl
	ld	e, [hl]
	ld	d, $00
	push	bc
	push	de
	call	__modsint
	add	sp, #4
	ld	hl, [sp+5]
	ld	a, [hl]
	add	a, e
	ld	e, a
.l00101:
;src\main.c:243: }
	add	sp, #3
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
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
	DB $00	; 0
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
_random_table:
	DB $67	; 103	'g'
	DB $A8	; 168
	DB $34	; 52	'4'
	DB $6E	; 110	'n'
	DB $99	; 153
	DB $8B	; 139
	DB $0E	; 14
	DB $20	; 32
	DB $C6	; 198
	DB $F3	; 243
	DB $C3	; 195
	DB $7A	; 122	'z'
	DB $0A	; 10
	DB $BA	; 186
	DB $AE	; 174
	DB $9F	; 159
	DB $80	; 128
	DB $2B	; 43
	DB $A2	; 162
	DB $6D	; 109	'm'
	DB $3E	; 62
	DB $BF	; 191
	DB $68	; 104	'h'
	DB $B7	; 183
	DB $D8	; 216
	DB $33	; 51	'3'
	DB $C9	; 201
	DB $B1	; 177
	DB $DB	; 219
	DB $07	; 7
	DB $AA	; 170
	DB $DA	; 218
	DB $38	; 56	'8'
	DB $24	; 36
	DB $21	; 33
	DB $37	; 55	'7'
	DB $98	; 152
	DB $7B	; 123
	DB $D6	; 214
	DB $F5	; 245
	DB $63	; 99	'c'
	DB $5D	; 93
	DB $EB	; 235
	DB $D3	; 211
	DB $95	; 149
	DB $E2	; 226
	DB $D2	; 210
	DB $BC	; 188
	DB $4B	; 75	'K'
	DB $FA	; 250
	DB $89	; 137
	DB $1F	; 31
	DB $82	; 130
	DB $0B	; 11
	DB $A4	; 164
	DB $01	; 1
	DB $76	; 118	'v'
	DB $FB	; 251
	DB $FE	; 254
	DB $8F	; 143
	DB $50	; 80	'P'
	DB $51	; 81	'Q'
	DB $E1	; 225
	DB $6C	; 108	'l'
	DB $FC	; 252
	DB $E4	; 228
	DB $E6	; 230
	DB $F9	; 249
	DB $40	; 64
	DB $32	; 50	'2'
	DB $F0	; 240
	DB $62	; 98	'b'
	DB $EC	; 236
	DB $9B	; 155
	DB $84	; 132
	DB $27	; 39
	DB $0F	; 15
	DB $19	; 25
	DB $13	; 19
	DB $F8	; 248
	DB $CE	; 206
	DB $8C	; 140
	DB $CA	; 202
	DB $0C	; 12
	DB $E9	; 233
	DB $DC	; 220
	DB $5E	; 94
	DB $E3	; 227
	DB $17	; 23
	DB $AF	; 175
	DB $53	; 83	'S'
	DB $1A	; 26
	DB $AB	; 171
	DB $AD	; 173
	DB $6B	; 107	'k'
	DB $75	; 117	'u'
	DB $94	; 148
	DB $BE	; 190
	DB $F6	; 246
	DB $5A	; 90	'Z'
	DB $18	; 24
	DB $3D	; 61
	DB $14	; 20
	DB $22	; 34
	DB $46	; 70	'F'
	DB $59	; 89	'Y'
	DB $6F	; 111	'o'
	DB $58	; 88	'X'
	DB $85	; 133
	DB $78	; 120	'x'
	DB $D7	; 215
	DB $08	; 8
	DB $ED	; 237
	DB $26	; 38
	DB $02	; 2
	DB $93	; 147
	DB $1C	; 28
	DB $79	; 121	'y'
	DB $90	; 144
	DB $2E	; 46
	DB $CD	; 205
	DB $04	; 4
	DB $E8	; 232
	DB $AC	; 172
	DB $4A	; 74	'J'
	DB $F1	; 241
	DB $29	; 41
	DB $10	; 16
	DB $83	; 131
	DB $15	; 21
	DB $73	; 115	's'
	DB $B5	; 181
	DB $87	; 135
	DB $4D	; 77	'M'
	DB $D4	; 212
	DB $86	; 134
	DB $70	; 112	'p'
	DB $8D	; 141
	DB $C0	; 192
	DB $57	; 87	'W'
	DB $36	; 54	'6'
	DB $45	; 69	'E'
	DB $C7	; 199
	DB $FF	; 255
	DB $23	; 35
	DB $D5	; 213
	DB $A3	; 163
	DB $81	; 129
	DB $A5	; 165
	DB $E7	; 231
	DB $97	; 151
	DB $5C	; 92
	DB $F2	; 242
	DB $03	; 3
	DB $7C	; 124
	DB $D0	; 208
	DB $E5	; 229
	DB $DF	; 223
	DB $1E	; 30
	DB $B4	; 180
	DB $1D	; 29
	DB $12	; 18
	DB $4C	; 76	'L'
	DB $BB	; 187
	DB $31	; 49	'1'
	DB $BD	; 189
	DB $4F	; 79	'O'
	DB $28	; 40
	DB $9D	; 157
	DB $41	; 65	'A'
	DB $A1	; 161
	DB $E0	; 224
	DB $9E	; 158
	DB $05	; 5
	DB $66	; 102	'f'
	DB $A9	; 169
	DB $77	; 119	'w'
	DB $CC	; 204
	DB $A0	; 160
	DB $54	; 84	'T'
	DB $B2	; 178
	DB $8A	; 138
	DB $F4	; 244
	DB $C1	; 193
	DB $3C	; 60
	DB $1B	; 27
	DB $3F	; 63
	DB $61	; 97	'a'
	DB $00	; 0
	DB $65	; 101	'e'
	DB $0D	; 13
	DB $71	; 113	'q'
	DB $69	; 105	'i'
	DB $56	; 86	'V'
	DB $30	; 48	'0'
	DB $06	; 6
	DB $09	; 9
	DB $7F	; 127
	DB $88	; 136
	DB $D9	; 217
	DB $CB	; 203
	DB $60	; 96
	DB $EE	; 238
	DB $39	; 57	'9'
	DB $C5	; 197
	DB $74	; 116	't'
	DB $96	; 150
	DB $DD	; 221
	DB $C2	; 194
	DB $2F	; 47
	DB $B6	; 182
	DB $4E	; 78	'N'
	DB $9C	; 156
	DB $D1	; 209
	DB $91	; 145
	DB $EA	; 234
	DB $7E	; 126
	DB $5B	; 91
	DB $64	; 100	'd'
	DB $FD	; 253
	DB $3A	; 58
	DB $43	; 67	'C'
	DB $55	; 85	'U'
	DB $EF	; 239
	DB $49	; 73	'I'
	DB $47	; 71	'G'
	DB $7D	; 125
	DB $B0	; 176
	DB $25	; 37
	DB $2C	; 44
	DB $6A	; 106	'j'
	DB $A7	; 167
	DB $B3	; 179
	DB $8E	; 142
	DB $B8	; 184
	DB $5F	; 95
	DB $3B	; 59
	DB $CF	; 207
	DB $2D	; 45
	DB $C8	; 200
	DB $F7	; 247
	DB $44	; 68	'D'
	DB $35	; 53	'5'
	DB $42	; 66	'B'
	DB $B9	; 185
	DB $9A	; 154
	DB $92	; 146
	DB $48	; 72	'H'
	DB $16	; 22
	DB $A6	; 166
	DB $72	; 114	'r'
	DB $2A	; 42
	DB $11	; 17
	DB $DE	; 222
	DB $52	; 82	'R'
	DB $C4	; 196
;src\main.c:245: char random8()
;	---------------------------------
; Function random8
; ---------------------------------
_random8::
;src\main.c:248: return random_table[i++];
	ld	hl, _random8_i_65536_32
	ld	c, [hl]
	inc	[hl]
	ld	a, _random_table & $FF
	add	a, c
	ld	c, a
	ld	a, _random_table >> 8
	adc	a, $00
	ld	b, a
	ld	a, [bc]
	ld	e, a
.l00101:
;src\main.c:249: }
	ret
;src\main.c:251: void update(void)
;	---------------------------------
; Function update
; ---------------------------------
_update::
;src\main.c:256: OBP0 += 1;
	ldh	a, (_OBP0+0)
	inc	a
	ldh	(_OBP0+0),a
;src\main.c:257: OBP1 -= 1;
	ldh	a, (_OBP1+0)
	add	a, $FF
	ldh	(_OBP1+0),a
.l00101:
;src\main.c:276: }
	ret
;src\main.c:279: void draw(void)
;	---------------------------------
; Function draw
; ---------------------------------
_draw::
;src\main.c:281: bgmap[ 2][ 8] = btn(j_b) ? 3 : 0;
	ld	hl, _joypad
	ld	a, [hl]
	bit	1, a
	jr	Z,.l00103
.l00159:
	ld	bc, $0003
	jr	.l00104
.l00103:
	ld	bc, $0000
.l00104:
	ld	hl, (_bgmap + 0x0048)
	ld	[hl], c
;src\main.c:282: bgmap[ 1][ 9] = btn(j_a) ? 3 : 0;
	ld	hl, _joypad
	ld	a, [hl]
	rrca
	jr	NC,.l00105
.l00160:
	ld	bc, $0003
	jr	.l00106
.l00105:
	ld	bc, $0000
.l00106:
	ld	hl, (_bgmap + 0x0029)
	ld	[hl], c
;src\main.c:285: bgmap[ 1][ 3] = btn(j_up) ? 3 : 0;
	ld	hl, _joypad
	ld	a, [hl]
	bit	6, a
	jr	Z,.l00107
.l00161:
	ld	bc, $0003
	jr	.l00108
.l00107:
	ld	bc, $0000
.l00108:
	ld	hl, (_bgmap + 0x0023)
	ld	[hl], c
;src\main.c:286: bgmap[ 2][ 2] = btn(j_left)  ? 3 : 0;
	ld	hl, _joypad
	ld	a, [hl]
	bit	5, a
	jr	Z,.l00109
.l00162:
	ld	bc, $0003
	jr	.l00110
.l00109:
	ld	bc, $0000
.l00110:
	ld	hl, (_bgmap + 0x0042)
	ld	[hl], c
;src\main.c:287: bgmap[ 2][ 4] = btn(j_right) ? 3 : 0;
	ld	hl, _joypad
	ld	a, [hl]
	bit	4, a
	jr	Z,.l00111
.l00163:
	ld	bc, $0003
	jr	.l00112
.l00111:
	ld	bc, $0000
.l00112:
	ld	hl, (_bgmap + 0x0044)
	ld	[hl], c
;src\main.c:288: bgmap[ 3][ 3] = btn(j_down) ? 3 : 0;
	ld	hl, _joypad
	ld	a, [hl]
	rlca
	jr	NC,.l00113
.l00164:
	ld	bc, $0003
	jr	.l00114
.l00113:
	ld	bc, $0000
.l00114:
	ld	hl, (_bgmap + 0x0063)
	ld	[hl], c
;src\main.c:290: bgmap[ 4][ 5] = btn(j_select) ? 3 : 0;
	ld	hl, _joypad
	ld	a, [hl]
	bit	2, a
	jr	Z,.l00115
.l00165:
	ld	bc, $0003
	jr	.l00116
.l00115:
	ld	bc, $0000
.l00116:
	ld	hl, (_bgmap + 0x0085)
	ld	[hl], c
;src\main.c:291: bgmap[ 4][ 7] = btn(j_start) ? 3 : 0;
	ld	hl, _joypad
	ld	a, [hl]
	bit	3, a
	jr	Z,.l00117
.l00166:
	ld	bc, $0003
	jr	.l00118
.l00117:
	ld	bc, $0000
.l00118:
	ld	hl, (_bgmap + 0x0087)
	ld	[hl], c
;src\main.c:293: dma_copy();
	call	_dma_copy
.l00101:
;src\main.c:294: }
	ret
;src\main.c:297: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src\main.c:298: init();
	call	_init
;src\main.c:300: while(1) {
.l00102:
;src\main.c:301: update();
	call	_update
;src\main.c:304: halt();
	halt
	nop
;src\main.c:305: draw();
	call	_draw
	jr	.l00102
.l00104:
;src\main.c:307: }
	ret
;src\main.c:309: void timer_isr(void) __interrupt
;	---------------------------------
; Function timer_isr
; ---------------------------------
_timer_isr::
	ei
	push	af
		push bc
		push de
		push hl
;src\main.c:311: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
.l00101:
;src\main.c:312: }
	pop	hl
		pop de
		pop bc
		pop af
	ret
;src\main.c:314: void vblank_isr(void) __critical __interrupt
;	---------------------------------
; Function vblank_isr
; ---------------------------------
_vblank_isr::
	push	af
		push bc
		push de
		push hl
;src\main.c:316: poll_joypad();
	call	_poll_joypad
.l00101:
;src\main.c:318: }
	pop	hl
		pop de
		pop bc
		pop af
	reti
;src\main.c:320: void lcd_isr(void) __critical __interrupt
;	---------------------------------
; Function lcd_isr
; ---------------------------------
_lcd_isr::
	push	af
		push bc
		push de
		push hl
;src\main.c:322: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
.l00101:
;src\main.c:323: }
	pop	hl
		pop de
		pop bc
		pop af
	reti
;src\main.c:325: void serial_isr(void) __critical __interrupt
;	---------------------------------
; Function serial_isr
; ---------------------------------
_serial_isr::
	push	af
		push bc
		push de
		push hl
;src\main.c:327: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
.l00101:
;src\main.c:328: }
	pop	hl
		pop de
		pop bc
		pop af
	reti
;src\main.c:330: void joypad_isr(void) __critical __interrupt
;	---------------------------------
; Function joypad_isr
; ---------------------------------
_joypad_isr::
	push	af
		push bc
		push de
		push hl
;src\main.c:332: __asm__("ld b, b;bgb breakpoint");
	ld	b, b;bgb breakpoint
.l00101:
;src\main.c:333: }
	pop	hl
		pop de
		pop bc
		pop af
	reti
;src\main.c:336: void dma_copy(void)
;	---------------------------------
; Function dma_copy
; ---------------------------------
_dma_copy::
;src\main.c:348: );
	ld	hl, #_shadow_oam
	ld	a, h
	ldh	(_DMA), a
	ld	a, #0x20
		$1:
	dec	a
	jr	nz, $1
.l00101:
;src\main.c:349: }
	ret
;src\main.c:352: void poll_joypad(void) 
;	---------------------------------
; Function poll_joypad
; ---------------------------------
_poll_joypad::
;src\main.c:384: );
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
;src\main.c:387: joypad_btn_state = (~joypad_btn_state) & 0x0F;
	ld	hl, _joypad_btn_state
	ld	a, [hl]
	cpl
	and	a, $0F
	ld	[hl], a
;src\main.c:388: joypad_dpad_state = (~joypad_dpad_state) & 0x0F;
	ld	hl, _joypad_dpad_state
	ld	a, [hl]
	cpl
	and	a, $0F
;src\main.c:390: joypad = (joypad_dpad_state << 4) ^ joypad_btn_state;
	ld	[hl],a
	swap	a
	and	a, $F0
	ld	hl, _joypad_btn_state
	xor	a, [hl]
	ld	hl, _joypad
	ld	[hl], a
.l00101:
;src\main.c:392: }
	ret
;src\main.c:395: void init(void) {
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src\main.c:399: while (LY < 144) {} /* wait until vblank */
	di
.l00101:
	ldh	a, (_LY+0)
	sub	a, $90
	jr	C,.l00101
	ei
;src\main.c:401: LCDC = LCDCF_OFF;
	ld	a, $00
	ldh	(_LCDC+0),a
;src\main.c:403: memcpy(&tiles, &font_tiles, sizeof(font_tiles));
	ld	hl, $0040
	push	hl
	ld	hl, _font_tiles
	push	hl
	ld	hl, _tiles
	push	hl
	call	___memcpy
	add	sp, #6
;src\main.c:406: memset(&bgmap, 0, 360);
	ld	hl, $0168
	push	hl
	ld	hl, $0000
	push	hl
	ld	hl, _bgmap
	push	hl
	call	_memset
	add	sp, #6
;src\main.c:409: memset(&oam, 0x00, sizeof(oam)); 
	ld	hl, $00A0
	push	hl
	ld	l, $00
	push	hl
	ld	hl, _oam
	push	hl
	call	_memset
	add	sp, #6
;src\main.c:410: memset(&shadow_oam, 0x19, sizeof(oam)); 
	ld	hl, $00A0
	push	hl
	ld	l, $19
	push	hl
	ld	hl, _shadow_oam
	push	hl
	call	_memset
	add	sp, #6
;src\main.c:419: shadow_oam[0].x     = 0x30; 
	ld	hl, _shadow_oam
	ld	[hl], $30
;src\main.c:420: shadow_oam[0].y     = 0x40;
	ld	hl, (_shadow_oam + 0x0001)
	ld	[hl], $40
;src\main.c:421: shadow_oam[0].tile  = 0x19;
	ld	hl, (_shadow_oam + 0x0002)
	ld	[hl], $19
;src\main.c:422: shadow_oam[0].flags = OAMF_PAL0;
	ld	hl, (_shadow_oam + 0x0003)
	ld	[hl], $00
;src\main.c:424: shadow_oam[1].x     = 0x50; 
	ld	hl, (_shadow_oam + 0x0004)
	ld	[hl], $50
;src\main.c:425: shadow_oam[1].y     = 0x60;
	ld	hl, (_shadow_oam + 0x0005)
	ld	[hl], $60
;src\main.c:426: shadow_oam[1].tile  = 0x19;
	ld	hl, (_shadow_oam + 0x0006)
	ld	[hl], $19
;src\main.c:427: shadow_oam[1].flags = OAMF_PAL1 | OAMF_YFLIP;
	ld	hl, (_shadow_oam + 0x0007)
	ld	[hl], $50
;src\main.c:430: BGP = 0b11100100;
	ld	a, $E4
	ldh	(_BGP+0),a
;src\main.c:431: OBP0 = 0b11100100;
	ld	a, $E4
	ldh	(_OBP0+0),a
;src\main.c:432: OBP1 = 0b11100100;
	ld	a, $E4
	ldh	(_OBP1+0),a
;src\main.c:434: SCY = 0;
	ld	a, $00
	ldh	(_SCY+0),a
;src\main.c:435: SCX = 0;
	ld	a, $00
	ldh	(_SCX+0),a
;src\main.c:437: NR52 = 0;
	ld	a, $00
	ldh	(_NR52+0),a
;src\main.c:443: LCDCF_OBJON;
	ld	a, $83
	ldh	(_LCDC+0),a
;src\main.c:447: __asm__("ei");
	ei
;src\main.c:448: interrupt_enable = IEF_VBLANK;
	ld	hl, _IEF_VBLANK
	ld	a, [hl]
	ldh	(_interrupt_enable+0),a
.l00104:
;src\main.c:449: }
	ret
	SECTION "src\main.c_CODE",CODE
	SECTION "CABS (ABS)",CODE

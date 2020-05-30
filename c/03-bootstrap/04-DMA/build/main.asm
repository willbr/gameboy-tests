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
	.globl _random8_between
	.globl ___memcpy
	.globl _memset
	.globl _joypad_btn_state
	.globl _joypad_dpad_state
	.globl _joypad
	.globl _shadow_oam
	.globl _oam
	.globl _HRAM
	.globl _OAMRAM
	.globl _bgmap
	.globl _tiles
	.globl _random_table
	.globl _font_tiles
	.globl _IEF_VBLANK
	.globl _IEF_LCDC
	.globl _IEF_TIMER
	.globl _IEF_SERIAL
	.globl _IEF_HILO
	.globl _random8
	.globl _update
	.globl _draw
	.globl _dma_copy
	.globl _poll_joypad
	.globl _init
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
_joypad::
	.ds 1
_joypad_dpad_state::
	.ds 1
_joypad_btn_state::
	.ds 1
_random8_i_65536_32:
	.ds 1
_update_i_65536_34:
	.ds 1
_update_j_65536_34:
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
;src\main.c:247: static u8 i = 123;
	ld	hl, #_random8_i_65536_32
	ld	(hl), #0x7b
;src\main.c:199: volatile u8 joypad = 0;
	ld	hl, #_joypad
	ld	(hl), #0x00
;src\main.c:200: volatile u8 joypad_dpad_state = 0;
	ld	hl, #_joypad_dpad_state
	ld	(hl), #0x00
;src\main.c:201: volatile u8 joypad_btn_state = 0;
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
;src\main.c:240: char random8_between(char min, char max)
;	---------------------------------
; Function random8_between
; ---------------------------------
_random8_between::
	add	sp, #-3
;src\main.c:242: return (random8() % (max + 1 - min)) + min;
	call	_random8
	ldhl	sp,	#0
	ld	(hl), e
	ldhl	sp,	#6
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	ldhl	sp,	#1
	ld	(hl), c
	inc	hl
	ld	(hl), b
	ldhl	sp,	#5
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,#(2 - 1)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ld	b, a
	ld	c, e
	dec	hl
	dec	hl
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	push	de
	call	__modsint
	add	sp, #4
	ldhl	sp,	#5
	ld	a, (hl)
	add	a, e
	ld	e, a
;src\main.c:243: }
	add	sp, #3
	ret
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
_random_table:
	.db #0x67	; 103	'g'
	.db #0xa8	; 168
	.db #0x34	; 52	'4'
	.db #0x6e	; 110	'n'
	.db #0x99	; 153
	.db #0x8b	; 139
	.db #0x0e	; 14
	.db #0x20	; 32
	.db #0xc6	; 198
	.db #0xf3	; 243
	.db #0xc3	; 195
	.db #0x7a	; 122	'z'
	.db #0x0a	; 10
	.db #0xba	; 186
	.db #0xae	; 174
	.db #0x9f	; 159
	.db #0x80	; 128
	.db #0x2b	; 43
	.db #0xa2	; 162
	.db #0x6d	; 109	'm'
	.db #0x3e	; 62
	.db #0xbf	; 191
	.db #0x68	; 104	'h'
	.db #0xb7	; 183
	.db #0xd8	; 216
	.db #0x33	; 51	'3'
	.db #0xc9	; 201
	.db #0xb1	; 177
	.db #0xdb	; 219
	.db #0x07	; 7
	.db #0xaa	; 170
	.db #0xda	; 218
	.db #0x38	; 56	'8'
	.db #0x24	; 36
	.db #0x21	; 33
	.db #0x37	; 55	'7'
	.db #0x98	; 152
	.db #0x7b	; 123
	.db #0xd6	; 214
	.db #0xf5	; 245
	.db #0x63	; 99	'c'
	.db #0x5d	; 93
	.db #0xeb	; 235
	.db #0xd3	; 211
	.db #0x95	; 149
	.db #0xe2	; 226
	.db #0xd2	; 210
	.db #0xbc	; 188
	.db #0x4b	; 75	'K'
	.db #0xfa	; 250
	.db #0x89	; 137
	.db #0x1f	; 31
	.db #0x82	; 130
	.db #0x0b	; 11
	.db #0xa4	; 164
	.db #0x01	; 1
	.db #0x76	; 118	'v'
	.db #0xfb	; 251
	.db #0xfe	; 254
	.db #0x8f	; 143
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0xe1	; 225
	.db #0x6c	; 108	'l'
	.db #0xfc	; 252
	.db #0xe4	; 228
	.db #0xe6	; 230
	.db #0xf9	; 249
	.db #0x40	; 64
	.db #0x32	; 50	'2'
	.db #0xf0	; 240
	.db #0x62	; 98	'b'
	.db #0xec	; 236
	.db #0x9b	; 155
	.db #0x84	; 132
	.db #0x27	; 39
	.db #0x0f	; 15
	.db #0x19	; 25
	.db #0x13	; 19
	.db #0xf8	; 248
	.db #0xce	; 206
	.db #0x8c	; 140
	.db #0xca	; 202
	.db #0x0c	; 12
	.db #0xe9	; 233
	.db #0xdc	; 220
	.db #0x5e	; 94
	.db #0xe3	; 227
	.db #0x17	; 23
	.db #0xaf	; 175
	.db #0x53	; 83	'S'
	.db #0x1a	; 26
	.db #0xab	; 171
	.db #0xad	; 173
	.db #0x6b	; 107	'k'
	.db #0x75	; 117	'u'
	.db #0x94	; 148
	.db #0xbe	; 190
	.db #0xf6	; 246
	.db #0x5a	; 90	'Z'
	.db #0x18	; 24
	.db #0x3d	; 61
	.db #0x14	; 20
	.db #0x22	; 34
	.db #0x46	; 70	'F'
	.db #0x59	; 89	'Y'
	.db #0x6f	; 111	'o'
	.db #0x58	; 88	'X'
	.db #0x85	; 133
	.db #0x78	; 120	'x'
	.db #0xd7	; 215
	.db #0x08	; 8
	.db #0xed	; 237
	.db #0x26	; 38
	.db #0x02	; 2
	.db #0x93	; 147
	.db #0x1c	; 28
	.db #0x79	; 121	'y'
	.db #0x90	; 144
	.db #0x2e	; 46
	.db #0xcd	; 205
	.db #0x04	; 4
	.db #0xe8	; 232
	.db #0xac	; 172
	.db #0x4a	; 74	'J'
	.db #0xf1	; 241
	.db #0x29	; 41
	.db #0x10	; 16
	.db #0x83	; 131
	.db #0x15	; 21
	.db #0x73	; 115	's'
	.db #0xb5	; 181
	.db #0x87	; 135
	.db #0x4d	; 77	'M'
	.db #0xd4	; 212
	.db #0x86	; 134
	.db #0x70	; 112	'p'
	.db #0x8d	; 141
	.db #0xc0	; 192
	.db #0x57	; 87	'W'
	.db #0x36	; 54	'6'
	.db #0x45	; 69	'E'
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0x23	; 35
	.db #0xd5	; 213
	.db #0xa3	; 163
	.db #0x81	; 129
	.db #0xa5	; 165
	.db #0xe7	; 231
	.db #0x97	; 151
	.db #0x5c	; 92
	.db #0xf2	; 242
	.db #0x03	; 3
	.db #0x7c	; 124
	.db #0xd0	; 208
	.db #0xe5	; 229
	.db #0xdf	; 223
	.db #0x1e	; 30
	.db #0xb4	; 180
	.db #0x1d	; 29
	.db #0x12	; 18
	.db #0x4c	; 76	'L'
	.db #0xbb	; 187
	.db #0x31	; 49	'1'
	.db #0xbd	; 189
	.db #0x4f	; 79	'O'
	.db #0x28	; 40
	.db #0x9d	; 157
	.db #0x41	; 65	'A'
	.db #0xa1	; 161
	.db #0xe0	; 224
	.db #0x9e	; 158
	.db #0x05	; 5
	.db #0x66	; 102	'f'
	.db #0xa9	; 169
	.db #0x77	; 119	'w'
	.db #0xcc	; 204
	.db #0xa0	; 160
	.db #0x54	; 84	'T'
	.db #0xb2	; 178
	.db #0x8a	; 138
	.db #0xf4	; 244
	.db #0xc1	; 193
	.db #0x3c	; 60
	.db #0x1b	; 27
	.db #0x3f	; 63
	.db #0x61	; 97	'a'
	.db #0x00	; 0
	.db #0x65	; 101	'e'
	.db #0x0d	; 13
	.db #0x71	; 113	'q'
	.db #0x69	; 105	'i'
	.db #0x56	; 86	'V'
	.db #0x30	; 48	'0'
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x7f	; 127
	.db #0x88	; 136
	.db #0xd9	; 217
	.db #0xcb	; 203
	.db #0x60	; 96
	.db #0xee	; 238
	.db #0x39	; 57	'9'
	.db #0xc5	; 197
	.db #0x74	; 116	't'
	.db #0x96	; 150
	.db #0xdd	; 221
	.db #0xc2	; 194
	.db #0x2f	; 47
	.db #0xb6	; 182
	.db #0x4e	; 78	'N'
	.db #0x9c	; 156
	.db #0xd1	; 209
	.db #0x91	; 145
	.db #0xea	; 234
	.db #0x7e	; 126
	.db #0x5b	; 91
	.db #0x64	; 100	'd'
	.db #0xfd	; 253
	.db #0x3a	; 58
	.db #0x43	; 67	'C'
	.db #0x55	; 85	'U'
	.db #0xef	; 239
	.db #0x49	; 73	'I'
	.db #0x47	; 71	'G'
	.db #0x7d	; 125
	.db #0xb0	; 176
	.db #0x25	; 37
	.db #0x2c	; 44
	.db #0x6a	; 106	'j'
	.db #0xa7	; 167
	.db #0xb3	; 179
	.db #0x8e	; 142
	.db #0xb8	; 184
	.db #0x5f	; 95
	.db #0x3b	; 59
	.db #0xcf	; 207
	.db #0x2d	; 45
	.db #0xc8	; 200
	.db #0xf7	; 247
	.db #0x44	; 68	'D'
	.db #0x35	; 53	'5'
	.db #0x42	; 66	'B'
	.db #0xb9	; 185
	.db #0x9a	; 154
	.db #0x92	; 146
	.db #0x48	; 72	'H'
	.db #0x16	; 22
	.db #0xa6	; 166
	.db #0x72	; 114	'r'
	.db #0x2a	; 42
	.db #0x11	; 17
	.db #0xde	; 222
	.db #0x52	; 82	'R'
	.db #0xc4	; 196
;src\main.c:245: char random8()
;	---------------------------------
; Function random8
; ---------------------------------
_random8::
;src\main.c:248: return random_table[i++];
	ld	hl, #_random8_i_65536_32
	ld	c, (hl)
	inc	(hl)
	ld	a, #<(_random_table)
	add	a, c
	ld	c, a
	ld	a, #>(_random_table)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	e, a
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
	add	a, #0xff
	ldh	(_OBP1+0),a
;src\main.c:276: }
	ret
;src\main.c:279: void draw(void)
;	---------------------------------
; Function draw
; ---------------------------------
_draw::
;src\main.c:281: bgmap[ 2][ 8] = btn(j_b) ? 3 : 0;
	ld	hl, #_joypad
	ld	a, (hl)
	bit	1, a
	jr	Z,00103$
	ld	bc, #0x0003
	jr	00104$
00103$:
	ld	bc, #0x0000
00104$:
	ld	hl, #(_bgmap + 0x0048)
	ld	(hl), c
;src\main.c:282: bgmap[ 1][ 9] = btn(j_a) ? 3 : 0;
	ld	hl, #_joypad
	ld	a, (hl)
	rrca
	jr	NC,00105$
	ld	bc, #0x0003
	jr	00106$
00105$:
	ld	bc, #0x0000
00106$:
	ld	hl, #(_bgmap + 0x0029)
	ld	(hl), c
;src\main.c:285: bgmap[ 1][ 3] = btn(j_up) ? 3 : 0;
	ld	hl, #_joypad
	ld	a, (hl)
	bit	6, a
	jr	Z,00107$
	ld	bc, #0x0003
	jr	00108$
00107$:
	ld	bc, #0x0000
00108$:
	ld	hl, #(_bgmap + 0x0023)
	ld	(hl), c
;src\main.c:286: bgmap[ 2][ 2] = btn(j_left)  ? 3 : 0;
	ld	hl, #_joypad
	ld	a, (hl)
	bit	5, a
	jr	Z,00109$
	ld	bc, #0x0003
	jr	00110$
00109$:
	ld	bc, #0x0000
00110$:
	ld	hl, #(_bgmap + 0x0042)
	ld	(hl), c
;src\main.c:287: bgmap[ 2][ 4] = btn(j_right) ? 3 : 0;
	ld	hl, #_joypad
	ld	a, (hl)
	bit	4, a
	jr	Z,00111$
	ld	bc, #0x0003
	jr	00112$
00111$:
	ld	bc, #0x0000
00112$:
	ld	hl, #(_bgmap + 0x0044)
	ld	(hl), c
;src\main.c:288: bgmap[ 3][ 3] = btn(j_down) ? 3 : 0;
	ld	hl, #_joypad
	ld	a, (hl)
	rlca
	jr	NC,00113$
	ld	bc, #0x0003
	jr	00114$
00113$:
	ld	bc, #0x0000
00114$:
	ld	hl, #(_bgmap + 0x0063)
	ld	(hl), c
;src\main.c:290: bgmap[ 4][ 5] = btn(j_select) ? 3 : 0;
	ld	hl, #_joypad
	ld	a, (hl)
	bit	2, a
	jr	Z,00115$
	ld	bc, #0x0003
	jr	00116$
00115$:
	ld	bc, #0x0000
00116$:
	ld	hl, #(_bgmap + 0x0085)
	ld	(hl), c
;src\main.c:291: bgmap[ 4][ 7] = btn(j_start) ? 3 : 0;
	ld	hl, #_joypad
	ld	a, (hl)
	bit	3, a
	jr	Z,00117$
	ld	bc, #0x0003
	jr	00118$
00117$:
	ld	bc, #0x0000
00118$:
	ld	hl, #(_bgmap + 0x0087)
	ld	(hl), c
;src\main.c:293: dma_copy();
;src\main.c:294: }
	jp	_dma_copy
;src\main.c:297: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src\main.c:298: init();
	call	_init
;src\main.c:300: while(1) {
00102$:
;src\main.c:301: update();
	call	_update
;src\main.c:304: halt();
	halt
	nop
;src\main.c:305: draw();
	call	_draw
	jr	00102$
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
	ld	hl, #_joypad_btn_state
	ld	a, (hl)
	cpl
	and	a, #0x0f
	ld	(hl), a
;src\main.c:388: joypad_dpad_state = (~joypad_dpad_state) & 0x0F;
	ld	hl, #_joypad_dpad_state
	ld	a, (hl)
	cpl
	and	a, #0x0f
	ld	(hl), a
;src\main.c:390: joypad = (joypad_dpad_state << 4) ^ joypad_btn_state;
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	ld	hl, #_joypad_btn_state
	xor	a, (hl)
	ld	hl, #_joypad
	ld	(hl), a
;src\main.c:392: }
	ret
;src\main.c:395: void init(void) {
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src\main.c:399: while (LY < 144) {} /* wait until vblank */
	di
00101$:
	ldh	a, (_LY+0)
	sub	a, #0x90
	jr	C,00101$
	ei
;src\main.c:401: LCDC = LCDCF_OFF;
	ld	a, #0x00
	ldh	(_LCDC+0),a
;src\main.c:403: memcpy(&tiles, &font_tiles, sizeof(font_tiles));
	ld	hl, #0x0040
	push	hl
	ld	hl, #_font_tiles
	push	hl
	ld	hl, #_tiles
	push	hl
	call	___memcpy
	add	sp, #6
;src\main.c:406: memset(&bgmap, 0, 360);
	ld	hl, #0x0168
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #_bgmap
	push	hl
	call	_memset
	add	sp, #6
;src\main.c:409: memset(&oam, 0x00, sizeof(oam)); 
	ld	hl, #0x00a0
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, #_oam
	push	hl
	call	_memset
	add	sp, #6
;src\main.c:410: memset(&shadow_oam, 0x19, sizeof(oam)); 
	ld	hl, #0x00a0
	push	hl
	ld	l, #0x19
	push	hl
	ld	hl, #_shadow_oam
	push	hl
	call	_memset
	add	sp, #6
;src\main.c:419: shadow_oam[0].x     = 0x30; 
	ld	hl, #_shadow_oam
	ld	(hl), #0x30
;src\main.c:420: shadow_oam[0].y     = 0x40;
	ld	hl, #(_shadow_oam + 0x0001)
	ld	(hl), #0x40
;src\main.c:421: shadow_oam[0].tile  = 0x19;
	ld	hl, #(_shadow_oam + 0x0002)
	ld	(hl), #0x19
;src\main.c:422: shadow_oam[0].flags = OAMF_PAL0;
	ld	hl, #(_shadow_oam + 0x0003)
	ld	(hl), #0x00
;src\main.c:424: shadow_oam[1].x     = 0x50; 
	ld	hl, #(_shadow_oam + 0x0004)
	ld	(hl), #0x50
;src\main.c:425: shadow_oam[1].y     = 0x60;
	ld	hl, #(_shadow_oam + 0x0005)
	ld	(hl), #0x60
;src\main.c:426: shadow_oam[1].tile  = 0x19;
	ld	hl, #(_shadow_oam + 0x0006)
	ld	(hl), #0x19
;src\main.c:427: shadow_oam[1].flags = OAMF_PAL1 | OAMF_YFLIP;
	ld	hl, #(_shadow_oam + 0x0007)
	ld	(hl), #0x50
;src\main.c:430: BGP = 0b11100100;
	ld	a, #0xe4
	ldh	(_BGP+0),a
;src\main.c:431: OBP0 = 0b11100100;
	ld	a, #0xe4
	ldh	(_OBP0+0),a
;src\main.c:432: OBP1 = 0b11100100;
	ld	a, #0xe4
	ldh	(_OBP1+0),a
;src\main.c:434: SCY = 0;
	ld	a, #0x00
	ldh	(_SCY+0),a
;src\main.c:435: SCX = 0;
	ld	a, #0x00
	ldh	(_SCX+0),a
;src\main.c:437: NR52 = 0;
	ld	a, #0x00
	ldh	(_NR52+0),a
;src\main.c:443: LCDCF_OBJON;
	ld	a, #0x83
	ldh	(_LCDC+0),a
;src\main.c:447: __asm__("ei");
	ei
;src\main.c:448: interrupt_enable = IEF_VBLANK;
	ld	hl, #_IEF_VBLANK
	ld	a, (hl)
	ldh	(_interrupt_enable+0),a
;src\main.c:449: }
	ret
	.area _CODE
	.area _CABS (ABS)

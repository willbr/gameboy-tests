;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	; MODULE 03_if
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
	GLOBAL _if_test
	GLOBAL _puts
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	SECTION "src/03-if.c_DATA",BSS
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
	SECTION "src/03-if.c_HOME",HOME
	SECTION "src/03-if.c_HOME",HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	SECTION "src/03-if.c_CODE",CODE
;src/03-if.c:5: void if_test(void)
;	---------------------------------
; Function if_test
; ---------------------------------
_if_test::
;src/03-if.c:8: if (i) {
	ld	hl, _i
	ld	a, [hl]
	or	a, a
	jp	NZ, .l00101
	jp	.l00102
.l00101:
;src/03-if.c:9: puts("is true");
	ld	hl, ___str_0
	push	hl
	call	_puts
	add	sp, #2
.l00102:
;src/03-if.c:12: if (!i) {
	ld	hl, _i
	ld	a, [hl]
	or	a, a
	jp	NZ, .l00104
.l00103:
;src/03-if.c:13: puts("isn't true");
	ld	hl, ___str_1
	push	hl
	call	_puts
	add	sp, #2
.l00104:
;src/03-if.c:16: if (i > 0) {
	ld	hl, _i
	ld	a, [hl]
	or	a, a
	jp	NZ, .l00105
	jp	.l00107
.l00105:
;src/03-if.c:17: puts("i > 0");
	ld	hl, ___str_2
	push	hl
	call	_puts
	add	sp, #2
.l00106:
;src/03-if.c:20: if (i >= 0) {
.l00107:
;src/03-if.c:21: puts("i >= 0");
	ld	hl, ___str_3
	push	hl
	call	_puts
	add	sp, #2
.l00108:
;src/03-if.c:24: if (i == 0) {
	ld	hl, _i
	ld	a, [hl]
	or	a, a
	jp	NZ, .l00110
.l00109:
;src/03-if.c:25: puts("i == 0");
	ld	hl, ___str_4
	push	hl
	call	_puts
	add	sp, #2
.l00110:
;src/03-if.c:31: if (j) {
	ld	hl, _j
	ld	a, [hl]
	or	a, a
	jp	NZ, .l00111
	jp	.l00112
.l00111:
;src/03-if.c:32: puts("is true");
	ld	hl, ___str_0
	push	hl
	call	_puts
	add	sp, #2
.l00112:
;src/03-if.c:35: if (!j) {
	ld	hl, _j
	ld	a, [hl]
	or	a, a
	jp	NZ, .l00114
.l00113:
;src/03-if.c:36: puts("isn't true");
	ld	hl, ___str_1
	push	hl
	call	_puts
	add	sp, #2
.l00114:
;src/03-if.c:39: if (j > 0) {
	ld	hl, _j
	ld	a, [hl]
	ld	e, a
	ld	a, $00
	ld	d, a
	xor	a, a
	sub	a, [hl]
	bit	7, e
	jp	Z, .l00152
	bit	7, d
	jp	NZ, .l00153
	cp	a, a
	jp	.l00153
.l00152:
	bit	7, d
	jp	Z, .l00153
	scf
.l00153:
	jp	C, .l00115
	jp	.l00116
.l00115:
;src/03-if.c:40: puts("j > 0");
	ld	hl, ___str_5
	push	hl
	call	_puts
	add	sp, #2
.l00116:
;src/03-if.c:43: if (j >= 0) {
	ld	hl, _j
	ld	a, [hl]
	bit	7, a
	jp	NZ, .l00118
.l00117:
;src/03-if.c:44: puts("j >= 0");
	ld	hl, ___str_6
	push	hl
	call	_puts
	add	sp, #2
.l00118:
;src/03-if.c:47: if (j == 0) {
	ld	hl, _j
	ld	a, [hl]
	or	a, a
	jp	NZ, .l00120
.l00119:
;src/03-if.c:48: puts("j == 0");
	ld	hl, ___str_7
	push	hl
	call	_puts
	add	sp, #2
.l00120:
;src/03-if.c:51: if (j < 0) {
	ld	hl, _j
	ld	a, [hl]
	bit	7, a
	jp	NZ, .l00121
	jp	.l00122
.l00121:
;src/03-if.c:52: puts("j < 0");
	ld	hl, ___str_8
	push	hl
	call	_puts
	add	sp, #2
.l00122:
;src/03-if.c:55: if (j <= 0) {
	ld	hl, _j
	ld	a, [hl]
	ld	e, a
	ld	a, $00
	ld	d, a
	xor	a, a
	sub	a, [hl]
	bit	7, e
	jp	Z, .l00154
	bit	7, d
	jp	NZ, .l00155
	cp	a, a
	jp	.l00155
.l00154:
	bit	7, d
	jp	Z, .l00155
	scf
.l00155:
	jp	C, .l00124
.l00123:
;src/03-if.c:56: puts("j <= 0");
	ld	hl, ___str_9
	push	hl
	call	_puts
	add	sp, #2
.l00124:
;src/03-if.c:58: return;
.l00125:
;src/03-if.c:59: }
	ret
___str_0:
	DB "is true"
	DB $00
___str_1:
	DB "isn't true"
	DB $00
___str_2:
	DB "i > 0"
	DB $00
___str_3:
	DB "i >= 0"
	DB $00
___str_4:
	DB "i == 0"
	DB $00
___str_5:
	DB "j > 0"
	DB $00
___str_6:
	DB "j >= 0"
	DB $00
___str_7:
	DB "j == 0"
	DB $00
___str_8:
	DB "j < 0"
	DB $00
___str_9:
	DB "j <= 0"
	DB $00
	SECTION "src/03-if.c_CODE",CODE
	SECTION "CABS (ABS)",CODE

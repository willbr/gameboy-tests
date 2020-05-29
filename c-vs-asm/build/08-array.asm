;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	; MODULE 08_array
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
	GLOBAL _variable
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	SECTION "src/08-array.c_DATA",BSS
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
	SECTION "src/08-array.c_HOME",HOME
	SECTION "src/08-array.c_HOME",HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	SECTION "src/08-array.c_CODE",CODE
;src/08-array.c:3: void variable(void)
;	---------------------------------
; Function variable
; ---------------------------------
_variable::
	add	sp, #-7
;src/08-array.c:6: unsigned char face[] = {'a', 'b', 'c', 'd', '\0'};
	ld	hl, [sp+0]
	ld	a, l
	ld	d, h
	ld	hl, [sp+5]
	ld	[hl], a
	inc	hl
	ld	[hl], d
	dec	hl
	ld	a, [hl]
	inc	hl
	ld	h, [hl]
	ld	l, a
	ld	[hl], $61
	ld	hl, [sp+6]
	dec	hl
	ld	c, [hl]
	inc	hl
	ld	b, [hl]
	inc	bc
	ld	a, $62
	ld	[bc], a
	dec	hl
	ld	c, [hl]
	inc	hl
	ld	b, [hl]
	inc	bc
	inc	bc
	ld	a, $63
	ld	[bc], a
	dec	hl
	ld	c, [hl]
	inc	hl
	ld	b, [hl]
	inc	bc
	inc	bc
	inc	bc
	ld	a, $64
	ld	[bc], a
	dec	hl
	ld	e, [hl]
	inc	hl
	ld	d, [hl]
	ld	hl, $0004
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	[bc], a
;src/08-array.c:7: unsigned char face_length = sizeof(face) / sizeof(face[0]);
	ld	hl, [sp+5]
	ld	[hl], $05
;src/08-array.c:9: for (i = 0; i < face_length; ++i) {
	xor	a, a
	inc	hl
	ld	[hl], a
.l00108:
.l00110:
.l00112:
.l00114:
.l00116:
.l00103:
	ld	hl, [sp+6]
	ld	a, [hl]
	dec	hl
	sub	a, [hl]
	jp	C, .l00102
	jp	.l00101
.l00102:
;src/08-array.c:10: j = face[i];
	ld	hl, [sp+0]
	ld	c, l
	ld	b, h
	ld	hl, [sp+6]
	ld	l, [hl]
	ld	h, $00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, [bc]
	ld	hl, _j
	ld	[hl], a
.l00104:
;src/08-array.c:9: for (i = 0; i < face_length; ++i) {
	ld	hl, [sp+6]
	inc	[hl]
	jp	.l00103
.l00101:
;src/08-array.c:13: return;
.l00105:
;src/08-array.c:14: }
	add	sp, #7
	ret
	SECTION "src/08-array.c_CODE",CODE
	SECTION "CABS (ABS)",CODE

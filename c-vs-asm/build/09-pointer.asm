;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	; MODULE 09_pointer
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
	GLOBAL _add
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	SECTION "src/09-pointer.c_DATA",BSS
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
	SECTION "src/09-pointer.c_HOME",HOME
	SECTION "src/09-pointer.c_HOME",HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	SECTION "src/09-pointer.c_CODE",CODE
;src/09-pointer.c:10: void variable(void)
;	---------------------------------
; Function variable
; ---------------------------------
_variable::
	add	sp, #-2
;src/09-pointer.c:13: unsigned char j = 4;
	ld	hl, [sp+0]
	ld	[hl], $04
;src/09-pointer.c:14: unsigned char k = 9;
	inc	hl
	ld	[hl], $09
;src/09-pointer.c:16: i = add(&j, &k);
	ld	hl, [sp+1]
	ld	e, l
	ld	d, h
	ld	hl, [sp+0]
	ld	c, l
	ld	b, h
	push	de
	push	bc
	call	_add
	add	sp, #4
;src/09-pointer.c:18: return;
.l00101:
;src/09-pointer.c:19: }
	add	sp, #2
	ret
	SECTION "src/09-pointer.c_CODE",CODE
	SECTION "CABS (ABS)",CODE

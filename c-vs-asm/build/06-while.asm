;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	; MODULE 06_while
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
	SECTION "src/06-while.c_DATA",BSS
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
	SECTION "src/06-while.c_HOME",HOME
	SECTION "src/06-while.c_HOME",HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	SECTION "src/06-while.c_CODE",CODE
;src/06-while.c:3: void variable(void)
;	---------------------------------
; Function variable
; ---------------------------------
_variable::
;src/06-while.c:7: i = 0;
	xor	a, a
;src/06-while.c:9: while (i < 10) {
.l00107:
.l00109:
.l00111:
.l00113:
.l00115:
.l00101:
	cp	a, $0A
	jp	C, .l00102
	jp	.l00103
.l00102:
;src/06-while.c:10: j = i;
	ld	hl, _j
	ld	[hl], a
;src/06-while.c:11: ++i;
	inc	a
	jp	.l00101
.l00103:
;src/06-while.c:14: return;
.l00104:
;src/06-while.c:15: }
	ret
	SECTION "src/06-while.c_CODE",CODE
	SECTION "CABS (ABS)",CODE

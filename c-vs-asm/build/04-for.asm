;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	; MODULE 04_for
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
	SECTION "src/04-for.c_DATA",BSS
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
	SECTION "src/04-for.c_HOME",HOME
	SECTION "src/04-for.c_HOME",HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	SECTION "src/04-for.c_CODE",CODE
;src/04-for.c:3: void variable(void)
;	---------------------------------
; Function variable
; ---------------------------------
_variable::
;src/04-for.c:6: for (i = 0; i < 10; ++i) {
	xor	a, a
.l00106:
.l00107:
.l00108:
.l00109:
.l00110:
.l00102:
;src/04-for.c:7: j = i;
	ld	hl, _j
	ld	[hl], a
.l00103:
;src/04-for.c:6: for (i = 0; i < 10; ++i) {
	inc	a
	cp	a, $0A
	jp	C, .l00102
.l00101:
;src/04-for.c:10: return;
.l00104:
;src/04-for.c:11: }
	ret
	SECTION "src/04-for.c_CODE",CODE
	SECTION "CABS (ABS)",CODE

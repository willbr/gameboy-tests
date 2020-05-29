;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	; MODULE 05_do
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
	SECTION "src/05-do.c_DATA",BSS
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
	SECTION "src/05-do.c_HOME",HOME
	SECTION "src/05-do.c_HOME",HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	SECTION "src/05-do.c_CODE",CODE
;src/05-do.c:3: void variable(void)
;	---------------------------------
; Function variable
; ---------------------------------
_variable::
;src/05-do.c:7: i = 0;
	xor	a, a
;src/05-do.c:9: do {
.l00106:
.l00107:
.l00108:
.l00109:
.l00110:
.l00101:
;src/05-do.c:10: j = i;
	ld	hl, _j
	ld	[hl], a
;src/05-do.c:11: ++i;
	inc	a
.l00102:
;src/05-do.c:12: } while (i < 10);
	cp	a, $0A
	jp	C, .l00101
.l00103:
;src/05-do.c:14: return;
.l00104:
;src/05-do.c:15: }
	ret
	SECTION "src/05-do.c_CODE",CODE
	SECTION "CABS (ABS)",CODE

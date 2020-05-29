;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	; MODULE 10_goto
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
	GLOBAL _other_func
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	SECTION "src/10-goto.c_DATA",BSS
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
	SECTION "src/10-goto.c_HOME",HOME
	SECTION "src/10-goto.c_HOME",HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	SECTION "src/10-goto.c_CODE",CODE
;src/10-goto.c:5: void variable(void)
;	---------------------------------
; Function variable
; ---------------------------------
_variable::
;src/10-goto.c:7: if (i == 5) {
	ld	hl, _i
	ld	a, [hl]
	sub	a, $05
	jp	NZ,.l00114
	jp	.l00104
.l00114:
	jp	.l00105
.l00101:
;src/10-goto.c:8: goto one;
	jp	.l00104
.l00102:
;src/10-goto.c:10: goto two;
	jp	.l00105
.l00103:
;src/10-goto.c:13: one:
.l00104:
;src/10-goto.c:14: other_func(1);
	ld	hl, $0001
	push	hl
	call	_other_func
	add	sp, #2
;src/10-goto.c:15: goto three;
	jp	.l00106
;src/10-goto.c:17: two:
.l00105:
;src/10-goto.c:18: other_func(2);
	ld	hl, $0002
	push	hl
	call	_other_func
	add	sp, #2
;src/10-goto.c:21: three:
.l00106:
;src/10-goto.c:22: other_func(3);
	ld	hl, $0003
	push	hl
	call	_other_func
	add	sp, #2
;src/10-goto.c:24: return;
.l00107:
;src/10-goto.c:25: }
	ret
	SECTION "src/10-goto.c_CODE",CODE
	SECTION "CABS (ABS)",CODE

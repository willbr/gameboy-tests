;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	; MODULE 11_switch
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
	SECTION "src/11-switch.c_DATA",BSS
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
	SECTION "src/11-switch.c_HOME",HOME
	SECTION "src/11-switch.c_HOME",HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	SECTION "src/11-switch.c_CODE",CODE
;src/11-switch.c:5: void variable(void)
;	---------------------------------
; Function variable
; ---------------------------------
_variable::
;src/11-switch.c:7: switch (i) {
	ld	a, $04
	ld	hl, _i
	sub	a, [hl]
	jp	C, .l00108
	ld	c, [hl]
	ld	b, $00
	ld	hl, .l00115
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	[hl]
.l00115:
	jp	.l00101
	jp	.l00102
	jp	.l00103
	jp	.l00104
	jp	.l00105
;src/11-switch.c:8: case 0:
.l00101:
;src/11-switch.c:9: other_func(0);
	ld	hl, $0000
	push	hl
	call	_other_func
	add	sp, #2
;src/11-switch.c:10: break;
	jp	.l00108
;src/11-switch.c:11: case 1:
.l00102:
;src/11-switch.c:12: other_func(1);
	ld	hl, $0001
	push	hl
	call	_other_func
	add	sp, #2
;src/11-switch.c:13: break;
	jp	.l00108
;src/11-switch.c:14: case 2:
.l00103:
;src/11-switch.c:15: other_func(2);
	ld	hl, $0002
	push	hl
	call	_other_func
	add	sp, #2
;src/11-switch.c:16: break;
	jp	.l00108
;src/11-switch.c:17: case 3:
.l00104:
;src/11-switch.c:18: other_func(3);
	ld	hl, $0003
	push	hl
	call	_other_func
	add	sp, #2
;src/11-switch.c:19: break;
	jp	.l00108
;src/11-switch.c:20: case 4:
.l00105:
;src/11-switch.c:21: other_func(4);
	ld	hl, $0004
	push	hl
	call	_other_func
	add	sp, #2
;src/11-switch.c:22: break;
	jp	.l00108
;src/11-switch.c:23: default:
.l00106:
;src/11-switch.c:25: }
.l00107:
.l00108:
;src/11-switch.c:26: }
	ret
	SECTION "src/11-switch.c_CODE",CODE
	SECTION "CABS (ABS)",CODE

;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	; MODULE 01_variables
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
	GLOBAL _global_i
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	SECTION "src/01-variables.c_DATA",BSS
_global_i:
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
;src/01-variables.c:1: volatile unsigned char global_i = 5;
	ld	hl, _global_i
	ld	[hl], $05
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	SECTION "src/01-variables.c_HOME",HOME
	SECTION "src/01-variables.c_HOME",HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	SECTION "src/01-variables.c_CODE",CODE
;src/01-variables.c:3: void variable(void)
;	---------------------------------
; Function variable
; ---------------------------------
_variable::
	dec	sp
;src/01-variables.c:5: volatile unsigned char local_j = 123;
	ld	hl, [sp+0]
	ld	[hl], $7B
;src/01-variables.c:7: global_i = local_j;
	push	hl
	ld	a, [hl]
	ld	hl, _global_i
	ld	[hl], a
	pop	hl
;src/01-variables.c:9: ++local_j;
	ld	hl, [sp+0]
	inc	[hl]
;src/01-variables.c:11: global_i = local_j;
	push	hl
	ld	a, [hl]
	ld	hl, _global_i
	ld	[hl], a
	pop	hl
;src/01-variables.c:13: local_j = global_i;
	push	hl
	ld	hl, _global_i
	ld	a, [hl]
	ld	hl, [sp+2]
	ld	[hl], a
	pop	hl
;src/01-variables.c:15: local_j += 1;
	ld	hl, [sp+0]
	ld	a, [hl]
	inc	a
	ld	[hl], a
;src/01-variables.c:17: ++global_i;
	ld	hl, _global_i
	inc	[hl]
;src/01-variables.c:19: local_j = global_i;
	push	hl
	ld	a, [hl]
	ld	hl, [sp+2]
	ld	[hl], a
	pop	hl
;src/01-variables.c:21: return;
.l00101:
;src/01-variables.c:22: }
	inc	sp
	ret
	SECTION "src/01-variables.c_CODE",CODE
	SECTION "CABS (ABS)",CODE

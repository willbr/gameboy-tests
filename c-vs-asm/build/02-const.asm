;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	; MODULE 02_const
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
	SECTION "src/02-const.c_DATA",BSS
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
	SECTION "src/02-const.c_HOME",HOME
	SECTION "src/02-const.c_HOME",HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	SECTION "src/02-const.c_CODE",CODE
;src/02-const.c:3: void variable(void)
;	---------------------------------
; Function variable
; ---------------------------------
_variable::
	dec	sp
;src/02-const.c:5: volatile unsigned char local_j = 123;
	ld	hl, [sp+0]
	ld	[hl], $7B
;src/02-const.c:7: ++local_j;
	inc	[hl]
;src/02-const.c:9: local_j = global_i;
	ld	hl, _global_i
	ld	c, [hl]
	ld	hl, [sp+0]
	ld	[hl], c
;src/02-const.c:11: local_j += 1;
	ld	a, [hl]
	inc	a
	ld	[hl], a
;src/02-const.c:13: local_j = global_i;
	ld	[hl], c
;src/02-const.c:15: return;
.l00101:
;src/02-const.c:16: }
	inc	sp
	ret
_global_i:
	DB $05	; 5
	SECTION "src/02-const.c_CODE",CODE
	SECTION "CABS (ABS)",CODE

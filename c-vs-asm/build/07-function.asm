;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	; MODULE 07_function
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
	GLOBAL _list_i_limit
	GLOBAL _list_i
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	SECTION "src/07-function.c_DATA",BSS
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
	SECTION "src/07-function.c_HOME",HOME
	SECTION "src/07-function.c_HOME",HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	SECTION "src/07-function.c_CODE",CODE
;src/07-function.c:3: void list_i(void){
;	---------------------------------
; Function list_i
; ---------------------------------
_list_i::
;src/07-function.c:6: i = 0;
	xor	a, a
;src/07-function.c:8: while (i < 10) {
.l00107:
.l00109:
.l00111:
.l00113:
.l00115:
.l00101:
	cp	a, $0A
	jp	C, .l00102
	jp	.l00104
.l00102:
;src/07-function.c:9: j = i;
	ld	hl, _j
	ld	[hl], a
;src/07-function.c:10: ++i;
	inc	a
	jp	.l00101
.l00103:
.l00104:
;src/07-function.c:12: }
	ret
;src/07-function.c:15: void list_i_limit(unsigned char limit){
;	---------------------------------
; Function list_i_limit
; ---------------------------------
_list_i_limit::
;src/07-function.c:18: i = 0;
	ld	c, $00
;src/07-function.c:20: while (i < limit) {
.l00107:
.l00109:
.l00111:
.l00113:
.l00115:
.l00101:
	ld	a, c
	ld	hl, [sp+2]
	sub	a, [hl]
	jp	C, .l00102
	jp	.l00104
.l00102:
;src/07-function.c:21: j = i;
	ld	hl, _j
	ld	[hl], c
;src/07-function.c:22: ++i;
	inc	c
	jp	.l00101
.l00103:
.l00104:
;src/07-function.c:24: }
	ret
;src/07-function.c:28: void variable(void)
;	---------------------------------
; Function variable
; ---------------------------------
_variable::
;src/07-function.c:30: list_i();
	call	_list_i
;src/07-function.c:31: list_i_limit(123);
	ld	a, $7B
	push	af
	inc	sp
	call	_list_i_limit
	inc	sp
;src/07-function.c:33: return;
.l00101:
;src/07-function.c:34: }
	ret
	SECTION "src/07-function.c_CODE",CODE
	SECTION "CABS (ABS)",CODE

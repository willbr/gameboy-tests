;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	; MODULE main
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
	GLOBAL _main
	GLOBAL _test
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	SECTION "..\main.c_DATA",BSS
G$test$0_0$0==.
_test:
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	SECTION "..\main.c_HOME",HOME
	SECTION "..\main.c_HOME",HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	SECTION "..\main.c_CODE",CODE
	G$main$0$0	!equ .
	GLOBAL	G$main$0$0
	C$main.c$3$0_0$1	!equ .
	GLOBAL	C$main.c$3$0_0$1
;..\main.c:3: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$4$1_0$1	!equ .
	GLOBAL	C$main.c$4$1_0$1
;..\main.c:4: test = 0;
	ld	hl, _test
	ld	[hl], $00
.l00101:
	C$main.c$5$1_0$1	!equ .
	GLOBAL	C$main.c$5$1_0$1
;..\main.c:5: }
	C$main.c$5$1_0$1	!equ .
	GLOBAL	C$main.c$5$1_0$1
	XG$main$0$0	!equ .
	GLOBAL	XG$main$0$0
	ret
	SECTION "..\main.c_CODE",CODE
	SECTION "CABS (ABS)",CODE

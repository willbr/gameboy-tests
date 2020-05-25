;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _inc
	.globl _test
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$test$0_0$0==.
_test::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	G$inc$0$0	= .
	.globl	G$inc$0$0
	C$main.c$6$0_0$1	= .
	.globl	C$main.c$6$0_0$1
;main.c:6: void inc() {
;	---------------------------------
; Function inc
; ---------------------------------
_inc::
	C$main.c$7$1_0$1	= .
	.globl	C$main.c$7$1_0$1
;main.c:7: test += 1;
	ld	hl, #_test
	ld	a, (hl)
	inc	a
	ld	(hl), a
	C$main.c$8$1_0$1	= .
	.globl	C$main.c$8$1_0$1
;main.c:8: }
	C$main.c$8$1_0$1	= .
	.globl	C$main.c$8$1_0$1
	XG$inc$0$0	= .
	.globl	XG$inc$0$0
	ret
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$10$1_0$2	= .
	.globl	C$main.c$10$1_0$2
;main.c:10: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$11$1_0$2	= .
	.globl	C$main.c$11$1_0$2
;main.c:11: EI;
	ei
	C$main.c$12$1_0$2	= .
	.globl	C$main.c$12$1_0$2
;main.c:12: inc();
	call	_inc
	C$main.c$13$1_0$2	= .
	.globl	C$main.c$13$1_0$2
;main.c:13: test = 0;
	ld	hl, #_test
	ld	(hl), #0x00
	C$main.c$14$1_0$2	= .
	.globl	C$main.c$14$1_0$2
;main.c:14: inc();
	call	_inc
	C$main.c$15$1_0$2	= .
	.globl	C$main.c$15$1_0$2
;main.c:15: DI;
	di
	C$main.c$16$1_0$2	= .
	.globl	C$main.c$16$1_0$2
;main.c:16: inc();
	C$main.c$17$1_0$2	= .
	.globl	C$main.c$17$1_0$2
;main.c:17: }
	C$main.c$17$1_0$2	= .
	.globl	C$main.c$17$1_0$2
	XG$main$0$0	= .
	.globl	XG$main$0$0
	jp	_inc
	.area _CODE
	.area _CABS (ABS)

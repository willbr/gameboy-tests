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
	.globl _countdown_to_scroll
	.globl _cursor_position
	.globl _offset
	.globl _random_number
	.globl _init
	.globl _update_random_number
	.globl _print
	.globl _fill_vram
	.globl _wait_for_v_blank
	.globl _set_cursor
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
G$rSCX$0_0$0 == 0x00d0
_rSCX	=	0x00d0
G$LCD_STATUS$0_0$0 == 0xff41
_LCD_STATUS	=	0xff41
G$LCD_SCROLL_Y$0_0$0 == 0xff42
_LCD_SCROLL_Y	=	0xff42
G$LCD_Y_COORDINATE$0_0$0 == 0xff44
_LCD_Y_COORDINATE	=	0xff44
G$LCD_BG_PALETTE$0_0$0 == 0xff47
_LCD_BG_PALETTE	=	0xff47
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$random_number$0_0$0==.
_random_number::
	.ds 1
G$offset$0_0$0==.
_offset::
	.ds 1
G$cursor_position$0_0$0==.
_cursor_position::
	.ds 1
G$countdown_to_scroll$0_0$0==.
_countdown_to_scroll::
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
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$33$0_0$1	= .
	.globl	C$main.c$33$0_0$1
;main.c:33: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$35$1_0$1	= .
	.globl	C$main.c$35$1_0$1
;main.c:35: init();
	call	_init
	C$main.c$37$1_0$1	= .
	.globl	C$main.c$37$1_0$1
;main.c:37: while (1) {
00102$:
	C$main.c$38$2_0$2	= .
	.globl	C$main.c$38$2_0$2
;main.c:38: update_random_number();
	call	_update_random_number
	C$main.c$40$2_0$2	= .
	.globl	C$main.c$40$2_0$2
;main.c:40: offset = random_number & 1;
	ld	hl, #_random_number
	ld	a, (hl)
	and	a, #0x01
	ld	hl, #_offset
	C$main.c$41$2_0$2	= .
	.globl	C$main.c$41$2_0$2
;main.c:41: offset += 1;
	ld	(hl),a
	inc	a
	ld	(hl), a
	C$main.c$43$2_0$2	= .
	.globl	C$main.c$43$2_0$2
;main.c:43: print();
	call	_print
	jr	00102$
	C$main.c$45$1_0$1	= .
	.globl	C$main.c$45$1_0$1
;main.c:45: }
	C$main.c$45$1_0$1	= .
	.globl	C$main.c$45$1_0$1
	XG$main$0$0	= .
	.globl	XG$main$0$0
	ret
	G$init$0$0	= .
	.globl	G$init$0$0
	C$main.c$47$1_0$4	= .
	.globl	C$main.c$47$1_0$4
;main.c:47: void init() {
;	---------------------------------
; Function init
; ---------------------------------
_init::
	C$main.c$49$1_0$4	= .
	.globl	C$main.c$49$1_0$4
;main.c:49: }
	C$main.c$49$1_0$4	= .
	.globl	C$main.c$49$1_0$4
	XG$init$0$0	= .
	.globl	XG$init$0$0
	ret
	G$update_random_number$0$0	= .
	.globl	G$update_random_number$0$0
	C$main.c$51$1_0$6	= .
	.globl	C$main.c$51$1_0$6
;main.c:51: void update_random_number() {
;	---------------------------------
; Function update_random_number
; ---------------------------------
_update_random_number::
	C$main.c$53$1_0$6	= .
	.globl	C$main.c$53$1_0$6
;main.c:53: }
	C$main.c$53$1_0$6	= .
	.globl	C$main.c$53$1_0$6
	XG$update_random_number$0$0	= .
	.globl	XG$update_random_number$0$0
	ret
	G$print$0$0	= .
	.globl	G$print$0$0
	C$main.c$55$1_0$7	= .
	.globl	C$main.c$55$1_0$7
;main.c:55: void print() {
;	---------------------------------
; Function print
; ---------------------------------
_print::
	C$main.c$56$1_0$7	= .
	.globl	C$main.c$56$1_0$7
;main.c:56: fill_vram();
	call	_fill_vram
	C$main.c$57$1_0$7	= .
	.globl	C$main.c$57$1_0$7
;main.c:57: LCD_SCROLL_Y += 16;
	ldh	a, (_LCD_SCROLL_Y+0)
	add	a, #0x10
	ldh	(_LCD_SCROLL_Y+0),a
	C$main.c$58$1_0$7	= .
	.globl	C$main.c$58$1_0$7
;main.c:58: wait_for_v_blank();
	call	_wait_for_v_blank
	C$main.c$59$1_0$7	= .
	.globl	C$main.c$59$1_0$7
;main.c:59: set_cursor();
	C$main.c$60$1_0$7	= .
	.globl	C$main.c$60$1_0$7
;main.c:60: }
	C$main.c$60$1_0$7	= .
	.globl	C$main.c$60$1_0$7
	XG$print$0$0	= .
	.globl	XG$print$0$0
	jp	_set_cursor
	G$fill_vram$0$0	= .
	.globl	G$fill_vram$0$0
	C$main.c$62$1_0$9	= .
	.globl	C$main.c$62$1_0$9
;main.c:62: void fill_vram() {
;	---------------------------------
; Function fill_vram
; ---------------------------------
_fill_vram::
	C$main.c$64$1_0$9	= .
	.globl	C$main.c$64$1_0$9
;main.c:64: }
	C$main.c$64$1_0$9	= .
	.globl	C$main.c$64$1_0$9
	XG$fill_vram$0$0	= .
	.globl	XG$fill_vram$0$0
	ret
	G$wait_for_v_blank$0$0	= .
	.globl	G$wait_for_v_blank$0$0
	C$main.c$66$1_0$10	= .
	.globl	C$main.c$66$1_0$10
;main.c:66: void wait_for_v_blank() {
;	---------------------------------
; Function wait_for_v_blank
; ---------------------------------
_wait_for_v_blank::
	C$main.c$67$1_0$10	= .
	.globl	C$main.c$67$1_0$10
;main.c:67: while (LCD_Y_COORDINATE != 144) {};
00101$:
	ldh	a, (_LCD_Y_COORDINATE+0)
	sub	a, #0x90
	jr	NZ,00101$
	C$main.c$68$1_0$10	= .
	.globl	C$main.c$68$1_0$10
;main.c:68: }
	C$main.c$68$1_0$10	= .
	.globl	C$main.c$68$1_0$10
	XG$wait_for_v_blank$0$0	= .
	.globl	XG$wait_for_v_blank$0$0
	ret
	G$set_cursor$0$0	= .
	.globl	G$set_cursor$0$0
	C$main.c$70$1_0$13	= .
	.globl	C$main.c$70$1_0$13
;main.c:70: void set_cursor() {
;	---------------------------------
; Function set_cursor
; ---------------------------------
_set_cursor::
	C$main.c$72$1_0$13	= .
	.globl	C$main.c$72$1_0$13
;main.c:72: }
	C$main.c$72$1_0$13	= .
	.globl	C$main.c$72$1_0$13
	XG$set_cursor$0$0	= .
	.globl	XG$set_cursor$0$0
	ret
	.area _CODE
	.area _CABS (ABS)

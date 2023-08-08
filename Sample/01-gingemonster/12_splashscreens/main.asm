;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _printf
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _waitpad
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
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
;main.c:6: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:7: set_bkg_data(0, 114, mario_data);
	ld	de, #_mario_data
	push	de
	ld	hl, #0x7200
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:8: set_bkg_tiles(0, 0, 20, 18, mario_map);
	ld	de, #_mario_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:10: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:11: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:13: waitpad(J_START);
	ld	a, #0x80
	call	_waitpad
;main.c:15: printf("START OF MY GAME");
	ld	de, #___str_0
	push	de
	call	_printf
	pop	hl
;main.c:16: }
	ret
___str_0:
	.ascii "START OF MY GAME"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

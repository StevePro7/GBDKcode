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
	.globl _set_bkg_palette
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _backgroundpalette
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
;main.c:15: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:16: set_bkg_palette( 0, 4, &backgroundpalette[ 0 ] );
	ld	de, #_backgroundpalette
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_bkg_palette
	add	sp, #4
;main.c:19: set_bkg_data( 0, 6, BackgroundData );
	ld	de, #_BackgroundData
	push	de
	ld	hl, #0x600
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:22: VBK_REG = 1;
	ld	a, #0x01
	ldh	(_VBK_REG + 0), a
;main.c:25: set_bkg_tiles( 0, 0, BackgroundMapWidth, BackgroundMapHeight, BackgroundMapPLN1 );
	ld	de, #_BackgroundMapPLN1
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:28: VBK_REG = 0;
	xor	a, a
	ldh	(_VBK_REG + 0), a
;main.c:31: set_bkg_tiles( 0, 0, BackgroundMapWidth, BackgroundMapHeight, BackgroundMapPLN0 );
	ld	de, #_BackgroundMapPLN0
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
;main.c:34: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:35: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:37: while( 1 ) {
00102$:
;main.c:40: }
	jr	00102$
_backgroundpalette:
	.dw #0x7fff
	.dw #0x22e7
	.dw #0x19c4
	.dw #0x14e0
	.dw #0x7fff
	.dw #0x7bd6
	.dw #0x7740
	.dw #0x680a
	.dw #0x7bde
	.dw #0x6739
	.dw #0x739c
	.dw #0x5294
	.dw #0x7fff
	.dw #0x0193
	.dw #0x0157
	.dw #0x048e
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

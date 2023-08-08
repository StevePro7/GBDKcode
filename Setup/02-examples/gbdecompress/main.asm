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
	.globl _gb_decompress_bkg_data
	.globl _set_bkg_tiles
	.globl _wait_vbl_done
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
;main.c:14: void main( void )
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:23: gb_decompress_bkg_data( 0, monalisa_tiles_comp ); // first tile, pointer to comrpessed data
	ld	de, #_monalisa_tiles_comp
	push	de
	xor	a, a
	push	af
	inc	sp
	call	_gb_decompress_bkg_data
	add	sp, #3
;main.c:26: set_bkg_tiles( 0, 0, monalisa_mapWidth, monalisa_mapHeight, monalisa_mapPLN0 );
	ld	de, #_monalisa_mapPLN0
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:27: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:30: while( 1 )
00102$:
;main.c:36: wait_vbl_done();
	call	_wait_vbl_done
;main.c:38: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

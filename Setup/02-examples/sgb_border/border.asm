;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module border
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _set_sgb_border
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
;border.c:22: void main( void ) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;border.c:26: for( uint8_t i = 4; i != 0; i-- ) wait_vbl_done();
	ld	c, #0x04
00106$:
	ld	a, c
	or	a, a
	jr	Z, 00101$
	call	_wait_vbl_done
	dec	c
	jr	00106$
00101$:
;border.c:29: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;border.c:30: set_sgb_border( border_data_tiles, sizeof( border_data_tiles ), border_data_map, sizeof( border_data_map ), border_data_palettes, sizeof( border_data_palettes ) );
	ld	de, #0x0020
	push	de
	ld	de, #_border_data_palettes
	push	de
	ld	de, #0x0700
	push	de
	ld	de, #_border_data_map
	push	de
	ld	bc, #0x0d60
	ld	de, #_border_data_tiles
	call	_set_sgb_border
;border.c:31: while( 1 ) {
00103$:
;border.c:32: wait_vbl_done();
	call	_wait_vbl_done
;border.c:34: }
	jr	00103$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

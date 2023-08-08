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
	.globl _fadein
	.globl _fadeout
	.globl _performantdelay
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _waitpad
	.globl _i
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_i::
	.ds 1
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
;main.c:10: void performantdelay( UINT8 numloops ) {
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
	ld	c, a
;main.c:12: for( ii = 0; ii < numloops; ii++ ) {
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;main.c:13: wait_vbl_done();
	call	_wait_vbl_done
;main.c:12: for( ii = 0; ii < numloops; ii++ ) {
	inc	b
;main.c:15: }
	jr	00103$
;main.c:17: void fadeout() {
;	---------------------------------
; Function fadeout
; ---------------------------------
_fadeout::
;main.c:18: for( i = 0; i < 4; i++ ) {
	ld	hl, #_i
	ld	(hl), #0x00
00107$:
;main.c:19: switch( i ) {
	ld	a, (#_i)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_i)
	dec	a
	jr	Z, 00102$
	ld	a, (#_i)
	sub	a, #0x02
	jr	Z, 00103$
	ld	a, (#_i)
	sub	a, #0x03
	jr	Z, 00104$
	jr	00105$
;main.c:20: case 0:
00101$:
;main.c:21: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;main.c:22: break;
	jr	00105$
;main.c:23: case 1:
00102$:
;main.c:24: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG + 0), a
;main.c:25: break;
	jr	00105$
;main.c:26: case 2:
00103$:
;main.c:27: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG + 0), a
;main.c:28: break;
	jr	00105$
;main.c:29: case 3:
00104$:
;main.c:30: BGP_REG = 0xFF;
	ld	a, #0xff
	ldh	(_BGP_REG + 0), a
;main.c:32: }
00105$:
;main.c:33: performantdelay( 10 );
	ld	a, #0x0a
	call	_performantdelay
;main.c:18: for( i = 0; i < 4; i++ ) {
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00107$
;main.c:35: }
	ret
;main.c:37: void fadein() {
;	---------------------------------
; Function fadein
; ---------------------------------
_fadein::
;main.c:38: for( i = 0; i < 3; i++ ) {
	ld	hl, #_i
	ld	(hl), #0x00
00106$:
;main.c:39: switch( i ) {
	ld	a, (#_i)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_i)
	dec	a
	jr	Z, 00102$
	ld	a, (#_i)
	sub	a, #0x02
	jr	Z, 00103$
	jr	00104$
;main.c:40: case 0:
00101$:
;main.c:41: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG + 0), a
;main.c:42: break;
	jr	00104$
;main.c:43: case 1:
00102$:
;main.c:44: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG + 0), a
;main.c:45: break;
	jr	00104$
;main.c:46: case 2:
00103$:
;main.c:47: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;main.c:49: }
00104$:
;main.c:50: performantdelay( 10 );
	ld	a, #0x0a
	call	_performantdelay
;main.c:38: for( i = 0; i < 3; i++ ) {
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00106$
;main.c:52: }
	ret
;main.c:54: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:55: set_bkg_data( 0, 114, mario_data );
	ld	de, #_mario_data
	push	de
	ld	hl, #0x7200
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:56: set_bkg_tiles( 0, 0, 20, 18, mario_map );
	ld	de, #_mario_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:58: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:59: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:61: waitpad( J_START );
	ld	a, #0x80
	call	_waitpad
;main.c:63: fadeout();
	call	_fadeout
;main.c:65: set_bkg_data( 0, 4, MazeSprites );
	ld	de, #_MazeSprites
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:66: set_bkg_tiles( 0, 0, 20, 18, MazeMap );
	ld	de, #_MazeMap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	xor	a, a
	call	_set_bkg_tiles
	add	sp, #6
;main.c:68: fadein();
;main.c:70: }
	jp	_fadein
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

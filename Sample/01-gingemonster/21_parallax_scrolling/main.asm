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
	.globl _interruptLCD
	.globl _performantdelay
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _set_interrupts
	.globl _add_LCD
	.globl _backgroundoffset3x
	.globl _backgroundoffset2x
	.globl _backgroundoffset1x
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_backgroundoffset1x::
	.ds 1
_backgroundoffset2x::
	.ds 1
_backgroundoffset3x::
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
;main.c:9: void performantdelay( UINT8 numloops ) {
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
	ld	c, a
;main.c:11: for( i = 0; i < numloops; i++ ) {
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;main.c:12: wait_vbl_done();
	call	_wait_vbl_done
;main.c:11: for( i = 0; i < numloops; i++ ) {
	inc	b
;main.c:14: }
	jr	00103$
;main.c:16: void interruptLCD() {
;	---------------------------------
; Function interruptLCD
; ---------------------------------
_interruptLCD::
;main.c:17: switch( LYC_REG )
	ldh	a, (_LYC_REG + 0)
	or	a, a
	jr	Z, 00101$
	cp	a, #0x35
	jr	Z, 00102$
	sub	a, #0x6c
	jr	Z, 00103$
	ret
;main.c:19: case 0x00:
00101$:
;main.c:20: move_bkg( backgroundoffset1x, 0 );
	ld	a, (#_backgroundoffset1x)
	ldh	(_SCX_REG + 0), a
;C:/gbdk/include/gb/gb.h:1208: SCX_REG=x, SCY_REG=y;
	xor	a, a
	ldh	(_SCY_REG + 0), a
;main.c:21: LYC_REG = 0x35;
	ld	a, #0x35
	ldh	(_LYC_REG + 0), a
;main.c:22: break;
	ret
;main.c:23: case 0x35:
00102$:
;main.c:24: move_bkg( backgroundoffset2x, 0 );
	ld	a, (#_backgroundoffset2x)
	ldh	(_SCX_REG + 0), a
;C:/gbdk/include/gb/gb.h:1208: SCX_REG=x, SCY_REG=y;
	xor	a, a
	ldh	(_SCY_REG + 0), a
;main.c:25: LYC_REG = 0x6c;
	ld	a, #0x6c
	ldh	(_LYC_REG + 0), a
;main.c:26: break;
	ret
;main.c:27: case 0x6c:
00103$:
;main.c:28: move_bkg( backgroundoffset3x, 0 );
	ld	a, (#_backgroundoffset3x)
	ldh	(_SCX_REG + 0), a
;C:/gbdk/include/gb/gb.h:1208: SCX_REG=x, SCY_REG=y;
	xor	a, a
	ldh	(_SCY_REG + 0), a
;main.c:29: LYC_REG = 0x00;
	xor	a, a
	ldh	(_LYC_REG + 0), a
;main.c:31: }
;main.c:32: }
	ret
;main.c:34: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:35: backgroundoffset1x = 0;
	ld	hl, #_backgroundoffset1x
	ld	(hl), #0x00
;main.c:36: backgroundoffset2x = 0;
	ld	hl, #_backgroundoffset2x
	ld	(hl), #0x00
;main.c:37: backgroundoffset3x = 0;
	ld	hl, #_backgroundoffset3x
	ld	(hl), #0x00
;main.c:39: set_bkg_data( 0, 189, parallax_background_data );
	ld	de, #_parallax_background_data
	push	de
	ld	hl, #0xbd00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:40: set_bkg_tiles( 0, 0, 32, 18, parallax_background_map );
	ld	de, #_parallax_background_map
	push	de
	ld	hl, #0x1220
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:42: STAT_REG = 0x45; // enable LYC=LY interrupt so that we can set a specific line it will fire at
	ld	a, #0x45
	ldh	(_STAT_REG + 0), a
;main.c:43: LYC_REG = 0x00;
	ld	a, #0x00
	ldh	(_LYC_REG + 0), a
;C:/gbdk/include/gb/gb.h:743: __asm__("di");
	di
;main.c:46: add_LCD( interruptLCD );
	ld	de, #_interruptLCD
	push	de
	call	_add_LCD
	inc	sp
	inc	sp
;C:/gbdk/include/gb/gb.h:727: __asm__("ei");
	ei
;main.c:49: set_interrupts( VBL_IFLAG | LCD_IFLAG );
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;main.c:51: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:52: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:54: while( 1 ) {
00102$:
;main.c:55: backgroundoffset1x += 1;
	ld	hl, #_backgroundoffset1x
	inc	(hl)
	ld	a, (hl)
;main.c:56: backgroundoffset2x += 2;
	ld	hl, #_backgroundoffset2x
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
;main.c:57: backgroundoffset3x += 10;
	ld	hl, #_backgroundoffset3x
	ld	a, (hl)
	add	a, #0x0a
	ld	(hl), a
;main.c:59: performantdelay( 7 );
	ld	a, #0x07
	call	_performantdelay
;main.c:61: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

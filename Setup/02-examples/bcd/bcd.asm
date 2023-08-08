;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module bcd
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _bcd2text
	.globl _bcd_sub
	.globl _bcd_add
	.globl _uint2bcd
	.globl _font_set
	.globl _font_load
	.globl _font_init
	.globl _set_bkg_tiles
	.globl _len
	.globl _bcd3
	.globl _bcd2
	.globl _bcd
	.globl _buf
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_buf::
	.ds 10
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_bcd::
	.ds 4
_bcd2::
	.ds 4
_bcd3::
	.ds 4
_len::
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
;bcd.c:16: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;bcd.c:18: font_init();
	call	_font_init
;bcd.c:19: font_set( font_load( font_spect ) );
	ld	de, #_font_spect
	push	de
	call	_font_load
	pop	hl
	push	de
	call	_font_set
	pop	hl
;bcd.c:21: len = bcd2text( &bcd, 0x10, buf );
	ld	de, #_buf
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	ld	de, #_bcd
	push	de
	call	_bcd2text
	add	sp, #5
	ld	hl, #_len
	ld	(hl), e
;bcd.c:22: set_bkg_tiles( 5, 5, len, 1, buf );
	ld	de, #_buf
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bcd.c:24: bcd_add( &bcd, &bcd2 );
	ld	de, #_bcd2
	push	de
	ld	de, #_bcd
	push	de
	call	_bcd_add
	add	sp, #4
;bcd.c:26: len = bcd2text( &bcd, 0x10, buf );
	ld	de, #_buf
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	ld	de, #_bcd
	push	de
	call	_bcd2text
	add	sp, #5
	ld	hl, #_len
	ld	(hl), e
;bcd.c:27: set_bkg_tiles( 5, 6, len, 1, buf );
	ld	de, #_buf
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	ld	h, (hl)
	ld	l, #0x06
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bcd.c:29: bcd_sub( &bcd, &bcd3 );
	ld	de, #_bcd3
	push	de
	ld	de, #_bcd
	push	de
	call	_bcd_sub
	add	sp, #4
;bcd.c:31: len = bcd2text( &bcd, 0x10, buf );
	ld	de, #_buf
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	ld	de, #_bcd
	push	de
	call	_bcd2text
	add	sp, #5
	ld	hl, #_len
	ld	(hl), e
;bcd.c:32: set_bkg_tiles( 5, 7, len, 1, buf );
	ld	de, #_buf
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	ld	h, (hl)
	ld	l, #0x07
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bcd.c:34: uint2bcd( 12345, &bcd );
	ld	de, #_bcd
	push	de
	ld	de, #0x3039
	push	de
	call	_uint2bcd
	add	sp, #4
;bcd.c:36: len = bcd2text( &bcd, 0x10, buf );
	ld	de, #_buf
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	ld	de, #_bcd
	push	de
	call	_bcd2text
	add	sp, #5
	ld	hl, #_len
	ld	(hl), e
;bcd.c:37: set_bkg_tiles( 5, 8, len, 1, buf );
	ld	de, #_buf
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	ld	h, (hl)
	ld	l, #0x08
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bcd.c:38: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__bcd:
	.byte #0x40, #0x30, #0x20, #0x10	; 270544960
__xinit__bcd2:
	.byte #0x08, #0x07, #0x06, #0x05	; 84281096
__xinit__bcd3:
	.byte #0x11, #0x11, #0x11, #0x11	; 286331153
__xinit__len:
	.db #0x00	; 0
	.area _CABS (ABS)

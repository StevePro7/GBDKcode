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
	.globl _performantdelay
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
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
;main.c:8: void performantdelay( UINT8 numloops ) {
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
	ld	c, a
;main.c:10: for( i = 0; i < numloops; i++ ) {
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;main.c:11: wait_vbl_done();
	call	_wait_vbl_done
;main.c:10: for( i = 0; i < numloops; i++ ) {
	inc	b
;main.c:13: }
	jr	00103$
;main.c:15: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:17: set_bkg_data( 0, 4, BackgroundData );
	ld	de, #_BackgroundData
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:18: set_bkg_tiles( 0, 0, 20, 18, BackgroundMap );
	ld	de, #_BackgroundMap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:20: set_sprite_data( 0, 2, ExampleSprite );
	ld	de, #_ExampleSprite
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x00
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl), #0x4e
	inc	hl
	ld	(hl), #0x16
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl), #0x4e
	inc	hl
	ld	(hl), #0x2c
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl), #0x4e
	inc	hl
	ld	(hl), #0x42
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl), #0x4e
	inc	hl
	ld	(hl), #0x58
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl), #0x3b
	inc	hl
	ld	(hl), #0x1a
;C:/gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 7)
	ld	(hl), #0x20
	ld	hl, #(_shadow_OAM + 11)
	ld	(hl), #0x40
	ld	hl, #(_shadow_OAM + 15)
	ld	(hl), #0x60
	ld	hl, #(_shadow_OAM + 19)
	ld	(hl), #0xa0
;main.c:40: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:41: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:43: while( 1 ) {
00107$:
;main.c:44: switch( joypad() ) {
	call	_joypad
	ld	c, a
	dec	a
	jr	Z, 00102$
	ld	a,c
	cp	a,#0x02
	jr	Z, 00101$
	cp	a,#0x04
	jr	Z, 00103$
	sub	a, #0x08
	jr	Z, 00104$
	jr	00105$
;main.c:45: case J_LEFT:
00101$:
;C:/gbdk/include/gb/gb.h:1691: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+16
;C:/gbdk/include/gb/gb.h:1692: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	dec	a
	ld	(bc), a
;main.c:47: break;
	jr	00105$
;main.c:48: case J_RIGHT:
00102$:
;C:/gbdk/include/gb/gb.h:1691: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #(_shadow_OAM + 16)
;C:/gbdk/include/gb/gb.h:1692: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	inc	a
	ld	(bc), a
;main.c:50: break;
	jr	00105$
;main.c:51: case J_UP:
00103$:
;C:/gbdk/include/gb/gb.h:1691: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #(_shadow_OAM + 16)
;C:/gbdk/include/gb/gb.h:1692: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	dec	a
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;C:/gbdk/include/gb/gb.h:1658: return shadow_OAM[nb].prop;
	ld	a, (#(_shadow_OAM + 19) + 0)
;main.c:54: set_sprite_prop( 4, get_sprite_prop( 4 ) & ~S_PRIORITY );
	ld	c, a
	res	7, c
;C:/gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 19)
	ld	(hl), c
;main.c:55: break;
	jr	00105$
;main.c:56: case J_DOWN:
00104$:
;C:/gbdk/include/gb/gb.h:1691: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #(_shadow_OAM + 16)
;C:/gbdk/include/gb/gb.h:1692: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	inc	a
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;main.c:59: }
00105$:
;main.c:60: performantdelay( 2 );
	ld	a, #0x02
	call	_performantdelay
;main.c:62: }
	jr	00107$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

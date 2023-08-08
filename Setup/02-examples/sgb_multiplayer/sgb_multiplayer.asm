;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module sgb_multiplayer
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad_ex
	.globl _joypad_init
	.globl _sprite_data
	.globl _joypads
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_joypads::
	.ds 5
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_sprite_data::
	.ds 64
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
;sgb_multiplayer.c:14: void main( void ) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;sgb_multiplayer.c:15: BGP_REG = OBP0_REG = OBP1_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_OBP1_REG + 0), a
	ld	a, #0xe4
	ldh	(_OBP0_REG + 0), a
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;sgb_multiplayer.c:16: set_sprite_data( 0, 4, sprite_data );
	ld	de, #_sprite_data
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;sgb_multiplayer.c:17: for( uint8_t i = 0; i < 4; i++ ) {
	ld	c, #0x00
00126$:
	ld	a, c
	sub	a, #0x04
	jr	NC, 00101$
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	ld	(hl), c
;sgb_multiplayer.c:19: move_sprite( i, ( i << 3 ) + 64, 64 );
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x40
	ld	b, a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), b
;sgb_multiplayer.c:17: for( uint8_t i = 0; i < 4; i++ ) {
	inc	c
	jr	00126$
00101$:
;sgb_multiplayer.c:21: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;sgb_multiplayer.c:25: for( uint8_t i = 4; i != 0; i-- ) wait_vbl_done();
	ld	c, #0x04
00129$:
	ld	a, c
	or	a, a
	jr	Z, 00102$
	call	_wait_vbl_done
	dec	c
	jr	00129$
00102$:
;sgb_multiplayer.c:28: joypad_init( 4, &joypads );
	ld	de, #_joypads
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	call	_joypad_init
	add	sp, #3
;sgb_multiplayer.c:30: while( 1 ) {
00116$:
;sgb_multiplayer.c:32: joypad_ex( &joypads );
	ld	de, #_joypads
	call	_joypad_ex
;sgb_multiplayer.c:34: for( uint8_t i = 0; i < joypads.npads; i++ ) {
	ld	c, #0x00
00132$:
	ld	hl, #_joypads
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	NC, 00111$
;sgb_multiplayer.c:35: uint8_t joy = joypads.joypads[ i ];
	ld	hl, #(_joypads + 1)
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
;sgb_multiplayer.c:36: if( joy & J_LEFT ) scroll_sprite( i, -1, 0 );
	bit	1, b
	jr	Z, 00104$
;C:/gbdk/include/gb/gb.h:1691: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
;C:/gbdk/include/gb/gb.h:1692: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	dec	(hl)
	ld	a, (hl)
;sgb_multiplayer.c:36: if( joy & J_LEFT ) scroll_sprite( i, -1, 0 );
00104$:
;sgb_multiplayer.c:37: if( joy & J_RIGHT ) scroll_sprite( i, 1, 0 );
	bit	0, b
	jr	Z, 00106$
;C:/gbdk/include/gb/gb.h:1691: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
;C:/gbdk/include/gb/gb.h:1692: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
	ld	a, (hl)
;sgb_multiplayer.c:37: if( joy & J_RIGHT ) scroll_sprite( i, 1, 0 );
00106$:
;sgb_multiplayer.c:38: if( joy & J_UP ) scroll_sprite( i, 0, -1 );
	bit	2, b
	jr	Z, 00108$
;C:/gbdk/include/gb/gb.h:1691: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
;C:/gbdk/include/gb/gb.h:1692: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;sgb_multiplayer.c:38: if( joy & J_UP ) scroll_sprite( i, 0, -1 );
00108$:
;sgb_multiplayer.c:39: if( joy & J_DOWN ) scroll_sprite( i, 0, 1 );
	bit	3, b
	jr	Z, 00133$
;C:/gbdk/include/gb/gb.h:1691: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
;C:/gbdk/include/gb/gb.h:1692: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	inc	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;sgb_multiplayer.c:39: if( joy & J_DOWN ) scroll_sprite( i, 0, 1 );
00133$:
;sgb_multiplayer.c:34: for( uint8_t i = 0; i < joypads.npads; i++ ) {
	inc	c
	jr	00132$
00111$:
;sgb_multiplayer.c:42: if( joypads.joy0 & J_START ) {
	ld	a, (#(_joypads + 1) + 0)
	rlca
	jr	NC, 00114$
;sgb_multiplayer.c:43: for( uint8_t i = 0; i < 4; i++ ) move_sprite( i, ( i << 3 ) + 64, 64 );
	ld	c, #0x00
00135$:
	ld	a,c
	cp	a,#0x04
	jr	NC, 00114$
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x40
	ld	b, a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), b
;sgb_multiplayer.c:43: for( uint8_t i = 0; i < 4; i++ ) move_sprite( i, ( i << 3 ) + 64, 64 );
	inc	c
	jr	00135$
00114$:
;sgb_multiplayer.c:45: wait_vbl_done();
	call	_wait_vbl_done
;sgb_multiplayer.c:47: }
	jp	00116$
	.area _CODE
	.area _INITIALIZER
__xinit__sprite_data:
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0xa9	; 169
	.db #0xff	; 255
	.db #0x89	; 137
	.db #0xff	; 255
	.db #0x89	; 137
	.db #0xff	; 255
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0xb9	; 185
	.db #0xff	; 255
	.db #0x89	; 137
	.db #0xff	; 255
	.db #0x91	; 145
	.db #0xff	; 255
	.db #0xb9	; 185
	.db #0xff	; 255
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0x89	; 137
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0x89	; 137
	.db #0xff	; 255
	.db #0x5a	; 90	'Z'
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0xa9	; 169
	.db #0xff	; 255
	.db #0xa9	; 169
	.db #0xff	; 255
	.db #0xb9	; 185
	.db #0xff	; 255
	.db #0x89	; 137
	.db #0xff	; 255
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.area _CABS (ABS)

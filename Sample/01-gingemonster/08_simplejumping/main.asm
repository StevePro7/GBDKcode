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
	.globl _jump
	.globl _wouldhitsurface
	.globl _performantdelay
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _bloke
	.globl _floorYposition
	.globl _gravity
	.globl _currentspeedY
	.globl _jumping
	.globl _playerlocation
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_playerlocation::
	.ds 4
_jumping::
	.ds 1
_currentspeedY::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_gravity::
	.ds 1
_floorYposition::
	.ds 2
_bloke::
	.ds 128
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
;main.c:31: void performantdelay( UINT8 numloops ) {
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
	ld	c, a
;main.c:33: for( i = 0; i < numloops; i++ ) {
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;main.c:34: wait_vbl_done();
	call	_wait_vbl_done
;main.c:33: for( i = 0; i < numloops; i++ ) {
	inc	b
;main.c:36: }
	jr	00103$
;main.c:38: INT8 wouldhitsurface( INT16 projectedYPosition ) {
;	---------------------------------
; Function wouldhitsurface
; ---------------------------------
_wouldhitsurface::
	ld	c, e
	ld	b, d
;main.c:39: if( projectedYPosition >= floorYposition ) {
	ld	hl, #_floorYposition
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00110$
	bit	7, d
	jr	NZ, 00111$
	cp	a, a
	jr	00111$
00110$:
	bit	7, d
	jr	Z, 00111$
	scf
00111$:
	jr	C, 00102$
;main.c:41: return floorYposition;
	ld	a, (#_floorYposition)
	ret
00102$:
;main.c:43: return -1;
	ld	a, #0xff
;main.c:44: }
	ret
;main.c:46: void jump( UINT8 spriteid, UINT16 spritelocation[ 2 ] ) {
;	---------------------------------
; Function jump
; ---------------------------------
_jump::
	add	sp, #-9
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:49: if( jumping == 0 ) {
	ld	hl, #_jumping
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;main.c:50: jumping = 1;
	ld	(hl), #0x01
;main.c:51: currentspeedY = 10;
	ld	hl, #_currentspeedY
	ld	a, #0x0a
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00102$:
;main.c:55: currentspeedY = currentspeedY + gravity;
	ld	a, (#_gravity)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	hl, #_currentspeedY
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;main.c:57: spritelocation[ 1 ] = spritelocation[ 1 ] - currentspeedY;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_currentspeedY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ld	b, a
	ld	c, e
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	inc	hl
	ld	(hl), b
;main.c:59: possiblesurfaceY = wouldhitsurface( spritelocation[ 1 ] );
	ld	e, c
	ld	d, b
	call	_wouldhitsurface
	ldhl	sp,	#2
	ld	(hl), a
;main.c:61: if( possiblesurfaceY != -1 ) {
	ld	a, (hl)
	inc	a
	jr	Z, 00104$
;main.c:62: jumping = 0;
	ld	hl, #_jumping
	ld	(hl), #0x00
;main.c:63: move_sprite( spriteid, spritelocation[ 0 ], possiblesurfaceY );
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, #0x02
00121$:
	ldhl	sp,	#0
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00121$
	pop	de
	push	de
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#2
	ld	a, (hl+)
	inc	hl
	ld	(de), a
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	dec	hl
	ld	b, a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:63: move_sprite( spriteid, spritelocation[ 0 ], possiblesurfaceY );
	jr	00108$
00104$:
;main.c:66: move_sprite( spriteid, spritelocation[ 0 ], spritelocation[ 1 ] );
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ldhl	sp,	#8
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	c, l
	ld	b, h
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ldhl	sp,	#5
	ld	a, (hl-)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:66: move_sprite( spriteid, spritelocation[ 0 ], spritelocation[ 1 ] );
00108$:
;main.c:68: }
	add	sp, #9
	ret
;main.c:70: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	dec	sp
;main.c:72: set_sprite_data( 0, 8, bloke );   /* defines the sprite data */
	ld	de, #_bloke
	push	de
	ld	hl, #0x800
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;main.c:76: playerlocation[ 0 ] = 10;
	ld	hl, #_playerlocation
	ld	a, #0x0a
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:77: playerlocation[ 1 ] = floorYposition;
	ld	de, #(_playerlocation + 2)
	ld	hl, #_floorYposition
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:78: jumping = 0;
	ld	hl, #_jumping
	ld	(hl), #0x00
;main.c:80: move_sprite( 0, playerlocation[ 0 ], playerlocation[ 1 ] );
	ld	hl, #(_playerlocation + 2)
	ld	b, (hl)
	ld	hl, #_playerlocation
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:82: DISPLAY_ON;						// Turn on the display
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:83: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:85: while( 1 ) {
00109$:
;main.c:86: if( ( joypad() & J_A ) || jumping == 1 ) {
	call	_joypad
	bit	4, a
	jr	NZ, 00101$
	ld	a, (#_jumping)
	dec	a
	jr	NZ, 00102$
00101$:
;main.c:87: jump( 0, playerlocation );
	ld	de, #_playerlocation
	xor	a, a
	call	_jump
00102$:
;main.c:89: if( joypad() & J_LEFT ) {
	call	_joypad
	bit	1, a
	jr	Z, 00105$
;main.c:90: playerlocation[ 0 ] = playerlocation[ 0 ] - 2;
	ld	hl, #_playerlocation
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
	dec	bc
	ld	hl, #_playerlocation
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:91: move_sprite( 0, playerlocation[ 0 ], playerlocation[ 1 ] );
	ld	a, (#(_playerlocation + 2) + 0)
	ldhl	sp,	#0
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;main.c:91: move_sprite( 0, playerlocation[ 0 ], playerlocation[ 1 ] );
00105$:
;main.c:93: if( joypad() & J_RIGHT ) {
	call	_joypad
	rrca
	jr	NC, 00107$
;main.c:94: playerlocation[ 0 ] = playerlocation[ 0 ] + 2;
	ld	hl, #_playerlocation
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	hl, #_playerlocation
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:95: move_sprite( 0, playerlocation[ 0 ], playerlocation[ 1 ] );
	ld	a, (#(_playerlocation + 2) + 0)
	ldhl	sp,	#0
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;main.c:95: move_sprite( 0, playerlocation[ 0 ], playerlocation[ 1 ] );
00107$:
;main.c:97: performantdelay( 5 );
	ld	a, #0x05
	call	_performantdelay
	jr	00109$
;main.c:99: }
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__gravity:
	.db #0xfe	; -2
__xinit__floorYposition:
	.dw #0x008b
__xinit__bloke:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x44	; 68	'D'
	.db #0x74	; 116	't'
	.db #0x46	; 70	'F'
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x78	; 120	'x'
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x44	; 68	'D'
	.db #0x74	; 116	't'
	.db #0x46	; 70	'F'
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x78	; 120	'x'
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x44	; 68	'D'
	.db #0x74	; 116	't'
	.db #0x46	; 70	'F'
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x78	; 120	'x'
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x44	; 68	'D'
	.db #0x74	; 116	't'
	.db #0x46	; 70	'F'
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x78	; 120	'x'
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _CABS (ABS)

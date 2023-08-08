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
	.globl _movecharacter
	.globl _istouchingground
	.globl _isleftedgeofscreen
	.globl _performantdelay
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _gravity
	.globl _player
	.globl _blankmap
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_player::
	.ds 9
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_gravity::
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
;main.c:14: void performantdelay( UINT8 numloops ) {
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
	ld	c, a
;main.c:16: for( i = 0; i < numloops; i++ ) {
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;main.c:17: wait_vbl_done();
	call	_wait_vbl_done
;main.c:16: for( i = 0; i < numloops; i++ ) {
	inc	b
;main.c:19: }
	jr	00103$
_blankmap:
	.db #0x00	;  0
;main.c:21: UBYTE isleftedgeofscreen( UINT8 x ) {
;	---------------------------------
; Function isleftedgeofscreen
; ---------------------------------
_isleftedgeofscreen::
;main.c:22: return x == 8;
	sub	a, #0x08
	ld	a, #0x01
	ret	Z
	xor	a, a
;main.c:23: }
	ret
;main.c:25: UBYTE istouchingground( GameCharacter* character ) {
;	---------------------------------
; Function istouchingground
; ---------------------------------
_istouchingground::
	add	sp, #-12
	ldhl	sp,	#10
	ld	a, e
	ld	(hl+), a
;main.c:31: indexTLx = ( character->x - 8 ) / 8;
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, (hl)
	jr	Z, 00107$
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0xffff
	add	hl, de
	ld	c, l
	ld	b, h
00107$:
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
;main.c:32: indexTLy = ( character->y + character->height + 1 - 16 ) / 8;   // TODO problem is probably its calculating a non round number!
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	d, #0x00
	ld	e, a
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
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
	ld	hl, #0xfff1
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	dec	hl
	bit	7, (hl)
	jr	Z, 00108$
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0xfff8
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
00108$:
	ldhl	sp,	#9
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
;main.c:34: tileindexTL = 20 * indexTLy + indexTLx; // will have to change as level scrolls?
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, bc
;main.c:36: result = level01map[ tileindexTL ] != ( UBYTE ) blankmap[ 0 ]; // todo will have to look for specific tiles when we have platforms you can jump through
	ld	bc,#_level01map
	add	hl,bc
	ld	c, (hl)
	ld	a, (#_blankmap + 0)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	a, #0x01
	jr	Z, 00130$
	xor	a, a
00130$:
	xor	a, #0x01
	ld	b, a
;main.c:38: if( result ) {
	or	a, a
	jr	Z, 00104$
;main.c:41: if( character->velocityY != -10 ) {
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	sub	a, #0xf6
	jr	Z, 00102$
;main.c:42: character->velocityY = 0;
	xor	a, a
	ld	(de), a
;main.c:43: character->isjumping = 0; // stop falling
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	e, l
	ld	d, h
	xor	a, a
	ld	(de), a
00102$:
;main.c:46: character->y = indexTLy * 8 + character->height; // set character y to be surface y
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ld	c, a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, c
	ld	c, a
	pop	hl
	push	hl
	ld	(hl), c
00104$:
;main.c:50: return result;
	ld	a, b
;main.c:51: }
	add	sp, #12
	ret
;main.c:53: void movecharacter( GameCharacter* character ) {
;	---------------------------------
; Function movecharacter
; ---------------------------------
_movecharacter::
	add	sp, #-5
	ldhl	sp,	#3
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:54: UBYTE hasmoved = 0;
	ldhl	sp,	#0
	ld	(hl), #0x00
;main.c:58: if( character->velocityX != 0 && !( character->velocityX < 0 && isleftedgeofscreen( character->x ) ) ) { // TODO scroll camera as character gets to center?
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	or	a, a
	jr	Z, 00102$
	bit	7, l
	jr	Z, 00101$
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	a, l
	call	_isleftedgeofscreen
	pop	bc
	or	a, a
	jr	NZ, 00102$
00101$:
;main.c:59: character->x += character->velocityX;
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (bc)
	add	a, l
	ldhl	sp,	#3
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:60: character->velocityX += ( character->velocityX > 0 ? -character->currentFriction : character->currentFriction );
	ldhl	sp,	#1
	ld	a, c
	ld	(hl+), a
	ld	a, b
	ld	(hl+), a
	ld	a, (bc)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	b, a
	ld	e, c
	xor	a, a
	ld	d, a
	sub	a, c
	bit	7, e
	jr	Z, 00147$
	bit	7, d
	jr	NZ, 00148$
	cp	a, a
	jr	00148$
00147$:
	bit	7, d
	jr	Z, 00148$
	scf
00148$:
	jr	NC, 00115$
	xor	a, a
	sub	a, b
	ld	b, a
00115$:
	ld	a, b
	add	a, c
	ld	c, a
	ldhl	sp,	#1
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;main.c:61: hasmoved = 1;
	ldhl	sp,	#0
	ld	(hl), #0x01
00102$:
;main.c:63: if( character->velocityY > 4 ) {
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	e, c
	ld	a,#0x04
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00149$
	bit	7, d
	jr	NZ, 00150$
	cp	a, a
	jr	00150$
00149$:
	bit	7, d
	jr	Z, 00150$
	scf
00150$:
	jr	NC, 00106$
;main.c:65: character->velocityY = 4; // dont want it to fall more than 1 cell in a step
	ldhl	sp,	#1
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x04
00106$:
;main.c:67: if( !istouchingground( character ) || character->velocityY < 0 ) { // not falling and touching ground OR is moving up screen as part of jump
	ldhl	sp,	#3
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_istouchingground
;main.c:69: character->y += character->velocityY;
	ldhl	sp,	#3
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	dec	hl
	dec	hl
	inc	bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
;main.c:67: if( !istouchingground( character ) || character->velocityY < 0 ) { // not falling and touching ground OR is moving up screen as part of jump
	or	a, a
	jr	Z, 00107$
	bit	7, l
	jr	Z, 00108$
00107$:
;main.c:69: character->y += character->velocityY;
	ld	a, (bc)
	add	a, l
	ld	(bc), a
;main.c:70: character->velocityY += gravity;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_gravity
	ld	e, (hl)
	add	a, e
	ldhl	sp,	#1
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:71: hasmoved = 1;
	ldhl	sp,	#0
	ld	(hl), #0x01
00108$:
;main.c:76: if( hasmoved ) {
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00113$
;main.c:77: move_sprite( 0, character->x, character->y );
	ld	a, (bc)
	ld	c, a
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:77: move_sprite( 0, character->x, character->y );
00113$:
;main.c:79: }
	add	sp, #5
	ret
;main.c:81: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:82: set_bkg_data( 0, 2, levelsprites );
	ld	de, #_levelsprites
	push	de
	ld	hl, #0x200
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:83: set_bkg_tiles( 0, 0, 20, 18, level01map );
	ld	de, #_level01map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:84: set_sprite_data( 0, 1, man );   /* defines the sprite data */
	ld	de, #_man
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_data
	add	sp, #4
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;main.c:87: player.spriteid = 0;
	ld	hl, #(_player + 2)
	ld	(hl), #0x00
;main.c:88: player.x = 8;
	ld	hl, #_player
	ld	(hl), #0x08
;main.c:89: player.y = 144;
	ld	bc, #_player + 1
	ld	a, #0x90
	ld	(bc), a
;main.c:90: player.currentFriction = 2;
	ld	hl, #(_player + 5)
	ld	(hl), #0x02
;main.c:91: player.width = 8;
	ld	hl, #(_player + 6)
	ld	(hl), #0x08
;main.c:92: player.height = 8;
	ld	hl, #(_player + 7)
	ld	(hl), #0x08
;main.c:93: player.isjumping = 0;
	ld	hl, #(_player + 8)
	ld	(hl), #0x00
;main.c:95: move_sprite( 0, player.x, player.y );
	ld	a, (bc)
	ld	b, a
	ld	hl, #_player
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:97: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:98: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:99: DISPLAY_ON;						// Turn on the display
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:101: while( 1 ) {
00109$:
;main.c:102: if( ( joypad() & J_A ) && player.isjumping == 0 ) {
	call	_joypad
	bit	4, a
	jr	Z, 00102$
	ld	a, (#(_player + 8) + 0)
	or	a, a
	jr	NZ, 00102$
;main.c:103: player.velocityY = -10;
	ld	hl, #(_player + 4)
	ld	(hl), #0xf6
;main.c:104: player.isjumping = 1;
	ld	hl, #(_player + 8)
	ld	(hl), #0x01
00102$:
;main.c:106: if( joypad() & J_LEFT ) {
	call	_joypad
	ld	e, a
;main.c:107: player.velocityX = -2;
	ld	bc, #_player + 3
;main.c:106: if( joypad() & J_LEFT ) {
	bit	1, e
	jr	Z, 00105$
;main.c:107: player.velocityX = -2;
	ld	a, #0xfe
	ld	(bc), a
00105$:
;main.c:109: if( joypad() & J_RIGHT ) {
	call	_joypad
	rrca
	jr	NC, 00107$
;main.c:110: player.velocityX = 2;
	ld	a, #0x02
	ld	(bc), a
00107$:
;main.c:112: movecharacter( &player );
	ld	de, #_player
	call	_movecharacter
;main.c:113: performantdelay( 2 );
	ld	a, #0x02
	call	_performantdelay
;main.c:115: }
	jr	00109$
	.area _CODE
	.area _INITIALIZER
__xinit__gravity:
	.db #0x02	; 2
	.area _CABS (ABS)

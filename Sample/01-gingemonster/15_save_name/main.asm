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
	.globl _askfornamescreen
	.globl _sayhelloscreen
	.globl _resetcharactername
	.globl _isWithinKeyboard
	.globl _updateplayername
	.globl _drawplayername
	.globl _removefromplayername
	.globl _addtoplayername
	.globl _performantdelay
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _waitpadup
	.globl _joypad
	.globl _playerhasname
	.globl _i
	.globl _namecharacterindex
	.globl _keydown
	.globl _cursor
	.globl _playername
	.globl _maxcursory
	.globl _maxcursorx
	.globl _mincursory
	.globl _mincursorx
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_playername::
	.ds 18
_cursor::
	.ds 4
_keydown::
	.ds 1
_namecharacterindex::
	.ds 1
_i::
	.ds 1
_playerhasname::
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
;main.c:14: void performantdelay( UINT8 numloops ) {
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
	ld	c, a
;main.c:16: for( ii = 0; ii < numloops; ii++ ) {
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;main.c:17: wait_vbl_done();
	call	_wait_vbl_done
;main.c:16: for( ii = 0; ii < numloops; ii++ ) {
	inc	b
;main.c:19: }
	jr	00103$
_mincursorx:
	.db #0x0c	; 12
_mincursory:
	.db #0x50	; 80	'P'
_maxcursorx:
	.db #0x9c	; 156
_maxcursory:
	.db #0x80	; 128
;main.c:21: void addtoplayername( struct Cursor* cursor ) {
;	---------------------------------
; Function addtoplayername
; ---------------------------------
_addtoplayername::
	ld	c, e
	ld	b, d
;main.c:22: UINT8 characterindex = cursor->row * 10 + cursor->col + 1;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
	ld	e, l
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	inc	bc
	inc	bc
	ld	a, (bc)
	add	a, l
	ld	c, a
	inc	c
;main.c:24: if( namecharacterindex == 18 ) return;
	ld	a, (#_namecharacterindex)
	sub	a, #0x12
	ret	Z
;main.c:26: playername[ namecharacterindex ] = characterindex;
	ld	a, #<(_playername)
	ld	hl, #_namecharacterindex
	add	a, (hl)
	ld	e, a
	ld	a, #>(_playername)
	adc	a, #0x00
	ld	d, a
	ld	a, c
	ld	(de), a
;main.c:27: namecharacterindex++;
	inc	(hl)
;main.c:28: }
	ret
;main.c:30: void removefromplayername() {
;	---------------------------------
; Function removefromplayername
; ---------------------------------
_removefromplayername::
;main.c:31: if( namecharacterindex > 0 ) {
	ld	hl, #_namecharacterindex
	ld	a, (hl)
	or	a, a
	ret	Z
;main.c:32: namecharacterindex--;
	dec	(hl)
;main.c:33: playername[ namecharacterindex ] = 0;
	ld	bc, #_playername+0
	ld	a, c
	add	a, (hl)
	ld	c, a
	jr	NC, 00110$
	inc	b
00110$:
	xor	a, a
	ld	(bc), a
;main.c:35: }
	ret
;main.c:37: void drawplayername() {
;	---------------------------------
; Function drawplayername
; ---------------------------------
_drawplayername::
;main.c:38: set_bkg_tiles( 1, 4, 18, 1, playername );
	ld	de, #_playername
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0x401
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;main.c:39: }
	ret
;main.c:41: void updateplayername( struct Cursor* cursor ) {
;	---------------------------------
; Function updateplayername
; ---------------------------------
_updateplayername::
;main.c:42: if( cursor->col == 8 && cursor->row == 4 ) {
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	c, (hl)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, c
	sub	a, #0x08
	jr	NZ, 00106$
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00106$
;main.c:44: removefromplayername();
	call	_removefromplayername
;main.c:45: drawplayername();
	jp	_drawplayername
00106$:
;main.c:47: else if( cursor->col == 9 && cursor->row == 4 ) {
	ld	a, c
	sub	a, #0x09
	jr	NZ, 00102$
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00102$
;main.c:49: playerhasname = 1;
	ld	hl, #_playerhasname
	ld	(hl), #0x01
	ret
00102$:
;main.c:53: addtoplayername( cursor );
	call	_addtoplayername
;main.c:54: drawplayername();
;main.c:56: }
	jp	_drawplayername
;main.c:58: UBYTE isWithinKeyboard( UINT8 x, UINT8 y ) {
;	---------------------------------
; Function isWithinKeyboard
; ---------------------------------
_isWithinKeyboard::
	ld	c, a
;main.c:59: if( x == 140 && y == 144 || x == 156 && y == 144 ) {
	ld	a, e
	sub	a, #0x90
	ld	a, #0x01
	jr	Z, 00141$
	xor	a, a
00141$:
	ld	b, a
	ld	a, c
	sub	a,#0x8c
	jr	NZ, 00105$
	or	a,b
	jr	NZ, 00101$
00105$:
	ld	a, c
	sub	a,#0x9c
	jr	NZ, 00102$
	or	a,b
	jr	Z, 00102$
00101$:
;main.c:60: return 1;
	ld	a, #0x01
	ret
00102$:
;main.c:62: return x >= mincursorx && x <= maxcursorx && y >= mincursory && y <= maxcursory;
	ld	hl, #_mincursorx
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	C, 00108$
	ld	a, (#_maxcursorx)
	sub	a, c
	jr	C, 00108$
	ld	hl, #_mincursory
	ld	c, (hl)
	ld	a, e
	sub	a, c
	jr	C, 00108$
	ld	a, (#_maxcursory)
	sub	a, e
	jr	NC, 00109$
00108$:
	xor	a, a
	ret
00109$:
	ld	a, #0x01
;main.c:63: }
	ret
;main.c:65: void resetcharactername() {
;	---------------------------------
; Function resetcharactername
; ---------------------------------
_resetcharactername::
;main.c:66: for( i = 0; i != 18; i++ ) {
	ld	hl, #_i
	ld	(hl), #0x00
00102$:
;main.c:67: playername[ i ] = 0x00;
	ld	a, #<(_playername)
	ld	hl, #_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_playername)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
;main.c:66: for( i = 0; i != 18; i++ ) {
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x12
	jr	NZ, 00102$
;main.c:69: playerhasname = 0;
	ld	hl, #_playerhasname
	ld	(hl), #0x00
;main.c:70: }
	ret
;main.c:72: void sayhelloscreen() {
;	---------------------------------
; Function sayhelloscreen
; ---------------------------------
_sayhelloscreen::
;main.c:73: set_bkg_data( 0, 45, keyboarddata );
	ld	de, #_keyboarddata
	push	de
	ld	hl, #0x2d00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:75: set_bkg_tiles( 0, 0, 20, 18, welcomemap );
	ld	de, #_welcomemap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:77: drawplayername();
	call	_drawplayername
;main.c:79: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:80: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;main.c:81: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:82: }
	ret
;main.c:84: void askfornamescreen() {
;	---------------------------------
; Function askfornamescreen
; ---------------------------------
_askfornamescreen::
;main.c:85: resetcharactername();
	call	_resetcharactername
;main.c:87: set_sprite_data( 0, 1, sprites );
	ld	de, #_sprites
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_data
	add	sp, #4
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;main.c:90: cursor.x = 12;
	ld	hl, #_cursor
	ld	(hl), #0x0c
;main.c:91: cursor.y = 80;
	ld	hl, #(_cursor + 1)
	ld	(hl), #0x50
;main.c:92: cursor.col = 0;
	ld	hl, #(_cursor + 2)
	ld	(hl), #0x00
;main.c:93: cursor.row = 0;
	ld	hl, #(_cursor + 3)
	ld	(hl), #0x00
;main.c:94: move_sprite( 0, cursor.x, cursor.y );
	ld	hl, #(_cursor + 1)
	ld	b, (hl)
	ld	hl, #_cursor
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:96: set_bkg_data( 0, 45, keyboarddata );
	ld	de, #_keyboarddata
	push	de
	ld	hl, #0x2d00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:97: set_bkg_tiles( 0, 0, 20, 18, keyboardmap );
	ld	de, #_keyboardmap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;C:/gbdk/include/gb/gb.h:1222: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	add	a, #0xfc
	ldh	(_SCX_REG + 0), a
;main.c:100: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:101: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:102: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:104: while( !playerhasname ) {
00117$:
	ld	a, (#_playerhasname)
	or	a, a
	jp	NZ, 00119$
;main.c:105: if( keydown ) {
	ld	a, (#_keydown)
	or	a, a
	jr	Z, 00102$
;main.c:106: waitpadup();
	call	_waitpadup
;main.c:107: keydown = 0;
	ld	hl, #_keydown
	ld	(hl), #0x00
00102$:
;main.c:110: switch( joypad() ) {
	call	_joypad
	ld	c, a
	dec	a
	jp	Z,00112$
	ld	a,c
	cp	a,#0x02
	jr	Z, 00109$
	cp	a,#0x04
	jr	Z, 00103$
	cp	a,#0x08
	jr	Z, 00106$
	sub	a, #0x10
	jp	Z,00115$
	jp	00116$
;main.c:111: case J_UP:
00103$:
;main.c:112: if( isWithinKeyboard( cursor.x, cursor.y - 16 ) ) {
	ld	a, (#(_cursor + 1) + 0)
	add	a, #0xf0
	ld	b, a
	ld	hl, #_cursor
	ld	c, (hl)
	ld	e, b
	ld	a, c
	call	_isWithinKeyboard
	or	a, a
	jp	Z, 00116$
;main.c:113: cursor.y -= 16;
	ld	a, (#(_cursor + 1) + 0)
	add	a, #0xf0
	ld	(#(_cursor + 1)),a
;main.c:114: cursor.row--;
	ld	a, (#(_cursor + 3) + 0)
	dec	a
	ld	(#(_cursor + 3)),a
;C:/gbdk/include/gb/gb.h:1691: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
;C:/gbdk/include/gb/gb.h:1692: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0xf0
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;main.c:116: keydown = 1;
	ld	hl, #_keydown
	ld	(hl), #0x01
;main.c:118: break;
	jp	00116$
;main.c:119: case J_DOWN:
00106$:
;main.c:120: if( isWithinKeyboard( cursor.x, cursor.y + 16 ) ) {
	ld	a, (#(_cursor + 1) + 0)
	add	a, #0x10
	ld	b, a
	ld	hl, #_cursor
	ld	c, (hl)
	ld	e, b
	ld	a, c
	call	_isWithinKeyboard
	or	a, a
	jp	Z, 00116$
;main.c:121: cursor.y += 16;
	ld	a, (#(_cursor + 1) + 0)
	add	a, #0x10
	ld	(#(_cursor + 1)),a
;C:/gbdk/include/gb/gb.h:1691: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
;C:/gbdk/include/gb/gb.h:1692: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0x10
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;main.c:123: keydown = 1;
	ld	hl, #_keydown
	ld	(hl), #0x01
;main.c:124: cursor.row++;
	ld	a, (#(_cursor + 3) + 0)
	inc	a
	ld	(#(_cursor + 3)),a
;main.c:126: break;
	jr	00116$
;main.c:127: case J_LEFT:
00109$:
;main.c:128: if( isWithinKeyboard( cursor.x - 16, cursor.y ) ) {
	ld	hl, #(_cursor + 1)
	ld	b, (hl)
	ld	a, (#_cursor + 0)
	add	a, #0xf0
	ld	e, b
	call	_isWithinKeyboard
	or	a, a
	jr	Z, 00116$
;main.c:129: cursor.x -= 16;
	ld	a, (#_cursor + 0)
	add	a, #0xf0
	ld	(#_cursor),a
;C:/gbdk/include/gb/gb.h:1691: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
;C:/gbdk/include/gb/gb.h:1692: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	add	a, #0xf0
	ld	(bc), a
;main.c:131: keydown = 1;
	ld	hl, #_keydown
	ld	(hl), #0x01
;main.c:132: cursor.col--;
	ld	a, (#(_cursor + 2) + 0)
	dec	a
	ld	(#(_cursor + 2)),a
;main.c:134: break;
	jr	00116$
;main.c:135: case J_RIGHT:
00112$:
;main.c:136: if( isWithinKeyboard( cursor.x + 16, cursor.y ) ) {
	ld	hl, #(_cursor + 1)
	ld	c, (hl)
	ld	a, (#_cursor + 0)
	add	a, #0x10
	ld	e, c
	call	_isWithinKeyboard
	or	a, a
	jr	Z, 00116$
;main.c:137: cursor.x += 16;
	ld	a, (#_cursor + 0)
	add	a, #0x10
	ld	(#_cursor),a
;C:/gbdk/include/gb/gb.h:1691: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1692: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	add	a, #0x10
	ld	(bc), a
;main.c:139: keydown = 1;
	ld	hl, #_keydown
	ld	(hl), #0x01
;main.c:140: cursor.col++;
	ld	a, (#(_cursor + 2) + 0)
	inc	a
	ld	(#(_cursor + 2)),a
;main.c:142: break;
	jr	00116$
;main.c:143: case J_A:
00115$:
;main.c:144: updateplayername( &cursor );
	ld	de, #_cursor
	call	_updateplayername
;main.c:145: keydown = 1;
	ld	hl, #_keydown
	ld	(hl), #0x01
;main.c:147: }
00116$:
;main.c:149: performantdelay( 2 );
	ld	a, #0x02
	call	_performantdelay
	jp	00117$
00119$:
;C:/gbdk/include/gb/gb.h:1222: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	add	a, #0x04
	ldh	(_SCX_REG + 0), a
;main.c:152: return;
;main.c:153: }
	ret
;main.c:155: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:156: ENABLE_RAM_MBC1;
	ld	hl, #0x0000
	ld	(hl), #0x0a
;main.c:158: if( playername[ 0 ] > 0x28 ) {
	ld	hl, #_playername
	ld	c, (hl)
	ld	a, #0x28
	sub	a, c
	jr	NC, 00102$
;main.c:159: askfornamescreen();
	call	_askfornamescreen
00102$:
;main.c:162: sayhelloscreen();
	call	_sayhelloscreen
;main.c:164: DISABLE_RAM_MBC1;
	ld	hl, #0x0000
	ld	(hl), #0x00
;main.c:165: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module large_map
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _set_camera
	.globl _set_bkg_submap
	.globl _set_bkg_data
	.globl _display_off
	.globl _wait_vbl_done
	.globl _joypad
	.globl _redraw
	.globl _old_map_pos_y
	.globl _old_map_pos_x
	.globl _map_pos_y
	.globl _map_pos_x
	.globl _old_camera_y
	.globl _old_camera_x
	.globl _camera_y
	.globl _camera_x
	.globl _joy
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_joy::
	.ds 1
_camera_x::
	.ds 2
_camera_y::
	.ds 2
_old_camera_x::
	.ds 2
_old_camera_y::
	.ds 2
_map_pos_x::
	.ds 1
_map_pos_y::
	.ds 1
_old_map_pos_x::
	.ds 1
_old_map_pos_y::
	.ds 1
_redraw::
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
;large_map.c:21: void set_camera() {
;	---------------------------------
; Function set_camera
; ---------------------------------
_set_camera::
;large_map.c:23: SCY_REG = camera_y; SCX_REG = camera_x;
	ld	a, (#_camera_y)
	ldh	(_SCY_REG + 0), a
	ld	a, (#_camera_x)
	ldh	(_SCX_REG + 0), a
;large_map.c:25: map_pos_y = ( uint8_t ) ( camera_y >> 3u );
	ld	hl, #_camera_y
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ld	hl, #_map_pos_y
	ld	(hl), c
;large_map.c:26: if( map_pos_y != old_map_pos_y ) {
	ld	a, (hl)
	ld	hl, #_old_map_pos_y
	sub	a, (hl)
	jp	Z,00107$
;large_map.c:28: set_bkg_submap( map_pos_x, map_pos_y, MIN( 21u, bigmap_mapWidth - map_pos_x ), 1, bigmap_map, bigmap_mapWidth );
	ld	hl, #_map_pos_x
	ld	e, (hl)
	ld	d, #0x00
	ld	c, (hl)
	ld	a, #0xf7
	sub	a, e
	ld	e, a
	sbc	a, a
	sub	a, d
	ld	d, a
	ld	a, #0xf7
	sub	a, c
	ld	c, a
	rlca
	ld	a, #0x15
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	ld	a, #0x00
	rla
	ld	e, a
;large_map.c:27: if( camera_y < old_camera_y ) {
	push	de
	ld	de, #_camera_y
	ld	hl, #_old_camera_y
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00104$
;large_map.c:28: set_bkg_submap( map_pos_x, map_pos_y, MIN( 21u, bigmap_mapWidth - map_pos_x ), 1, bigmap_map, bigmap_mapWidth );
	ld	a, e
	or	a, a
	jr	Z, 00117$
	ld	bc, #0x0015
00117$:
	ld	a, c
	ld	h, #0xf7
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	de, #_bigmap_mapPLN0
	push	de
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	a, (#_map_pos_y)
	ld	h, a
	ld	a, (#_map_pos_x)
	ld	l, a
	push	hl
	call	_set_bkg_submap
	add	sp, #7
	jr	00105$
00104$:
;large_map.c:31: if( ( bigmap_mapHeight - 18u ) > map_pos_y ) set_bkg_submap( map_pos_x, map_pos_y + 18u, MIN( 21u, bigmap_mapWidth - map_pos_x ), 1, bigmap_map, bigmap_mapWidth );
	ld	a, (#_map_pos_y)
	sub	a, #0x30
	jr	NC, 00105$
	ld	a, e
	or	a, a
	jr	Z, 00119$
	ld	bc, #0x0015
00119$:
	ld	hl, #_map_pos_y
	ld	a, (hl)
	add	a, #0x12
	ld	h, #0xf7
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	de, #_bigmap_mapPLN0
	push	de
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	a, (#_map_pos_x)
	push	af
	inc	sp
	call	_set_bkg_submap
	add	sp, #7
00105$:
;large_map.c:33: old_map_pos_y = map_pos_y;
	ld	a, (#_map_pos_y)
	ld	(#_old_map_pos_y),a
00107$:
;large_map.c:36: map_pos_x = ( uint8_t ) ( camera_x >> 3u );
	ld	hl, #_camera_x
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ld	hl, #_map_pos_x
	ld	(hl), c
;large_map.c:37: if( map_pos_x != old_map_pos_x ) {
	ld	a, (hl)
	ld	hl, #_old_map_pos_x
	sub	a, (hl)
	jp	Z,00114$
;large_map.c:39: set_bkg_submap( map_pos_x, map_pos_y, 1, MIN( 19u, bigmap_mapHeight - map_pos_y ), bigmap_map, bigmap_mapWidth );
	ld	hl, #_map_pos_y
	ld	e, (hl)
	ld	d, #0x00
	ld	c, (hl)
	ld	a, #0x42
	sub	a, e
	ld	e, a
	sbc	a, a
	sub	a, d
	ld	d, a
	ld	a, #0x42
	sub	a, c
	ld	c, a
	rlca
	ld	a, #0x13
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	ld	a, #0x00
	rla
	ld	e, a
;large_map.c:38: if( camera_x < old_camera_x ) {
	push	de
	ld	de, #_camera_x
	ld	hl, #_old_camera_x
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00111$
;large_map.c:39: set_bkg_submap( map_pos_x, map_pos_y, 1, MIN( 19u, bigmap_mapHeight - map_pos_y ), bigmap_map, bigmap_mapWidth );
	ld	a, e
	or	a, a
	jr	Z, 00121$
	ld	bc, #0x0013
00121$:
	ld	a, c
	ld	h, #0xf7
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	de, #_bigmap_mapPLN0
	push	de
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	a, (#_map_pos_y)
	ld	h, a
	ld	a, (#_map_pos_x)
	ld	l, a
	push	hl
	call	_set_bkg_submap
	add	sp, #7
	jr	00112$
00111$:
;large_map.c:42: if( ( bigmap_mapWidth - 20u ) > map_pos_x ) set_bkg_submap( map_pos_x + 20u, map_pos_y, 1, MIN( 19u, bigmap_mapHeight - map_pos_y ), bigmap_map, bigmap_mapWidth );
	ld	a, (#_map_pos_x)
	sub	a, #0xe3
	jr	NC, 00112$
	ld	a, e
	or	a, a
	jr	Z, 00123$
	ld	bc, #0x0013
00123$:
	ld	hl, #_map_pos_x
	ld	a, (hl)
	add	a, #0x14
	ld	h, #0xf7
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	de, #_bigmap_mapPLN0
	push	de
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	hl, #_map_pos_y
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_submap
	add	sp, #7
00112$:
;large_map.c:44: old_map_pos_x = map_pos_x;
	ld	a, (#_map_pos_x)
	ld	(#_old_map_pos_x),a
00114$:
;large_map.c:47: old_camera_x = camera_x, old_camera_y = camera_y;
	ld	a, (#_camera_x)
	ld	(#_old_camera_x),a
	ld	a, (#_camera_x + 1)
	ld	(#_old_camera_x + 1),a
	ld	a, (#_camera_y)
	ld	(#_old_camera_y),a
	ld	a, (#_camera_y + 1)
	ld	(#_old_camera_y + 1),a
;large_map.c:48: }
	ret
;large_map.c:50: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;large_map.c:51: DISPLAY_OFF;
	call	_display_off
;large_map.c:52: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;large_map.c:53: set_bkg_data( 0, 241u, bigmap_tiles );
	ld	de, #_bigmap_tiles
	push	de
	ld	hl, #0xf100
	push	hl
	call	_set_bkg_data
	add	sp, #4
;large_map.c:55: map_pos_x = map_pos_y = 0;
	ld	hl, #_map_pos_y
	ld	(hl), #0x00
	ld	hl, #_map_pos_x
	ld	(hl), #0x00
;large_map.c:56: old_map_pos_x = old_map_pos_y = 255;
	ld	hl, #_old_map_pos_y
	ld	(hl), #0xff
	ld	hl, #_old_map_pos_x
	ld	(hl), #0xff
;large_map.c:57: set_bkg_submap( map_pos_x, map_pos_y, 20, 18, bigmap_map, bigmap_mapWidth );
	ld	a, #0xf7
	push	af
	inc	sp
	ld	de, #_bigmap_mapPLN0
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_submap
	add	sp, #7
;large_map.c:58: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;large_map.c:60: camera_x = camera_y = 0;
	xor	a, a
	ld	hl, #_camera_y
	ld	(hl+), a
	ld	(hl), a
	xor	a, a
	ld	hl, #_camera_x
	ld	(hl+), a
	ld	(hl), a
;large_map.c:61: old_camera_x = camera_x; old_camera_y = camera_y;
	xor	a, a
	ld	hl, #_old_camera_x
	ld	(hl+), a
	ld	(hl), a
	xor	a, a
	ld	hl, #_old_camera_y
	ld	(hl+), a
	ld	(hl), a
;large_map.c:63: redraw = FALSE;
	ld	hl, #_redraw
	ld	(hl), #0x00
;large_map.c:65: SCX_REG = camera_x; SCY_REG = camera_y;
	xor	a, a
	ldh	(_SCX_REG + 0), a
	xor	a, a
	ldh	(_SCY_REG + 0), a
;large_map.c:66: while( TRUE ) {
00123$:
;large_map.c:67: joy = joypad();
	call	_joypad
	ld	hl, #_joy
	ld	(hl), a
;large_map.c:69: if( joy & J_UP ) {
	ld	c, (hl)
	bit	2, c
	jr	Z, 00108$
;large_map.c:70: if( camera_y ) {
	ld	hl, #_camera_y + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00109$
;large_map.c:71: camera_y--;
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;large_map.c:72: redraw = TRUE;
	ld	hl, #_redraw
	ld	(hl), #0x01
	jr	00109$
00108$:
;large_map.c:75: else if( joy & J_DOWN ) {
	bit	3, c
	jr	Z, 00109$
;large_map.c:76: if( camera_y < camera_max_y ) {
	ld	hl, #_camera_y
	ld	a, (hl+)
	ld	e, (hl)
	sub	a, #0x80
	ld	a, e
	sbc	a, #0x01
	jr	NC, 00109$
;large_map.c:77: camera_y++;
	dec	hl
	inc	(hl)
	jr	NZ, 00179$
	inc	hl
	inc	(hl)
00179$:
;large_map.c:78: redraw = TRUE;
	ld	hl, #_redraw
	ld	(hl), #0x01
00109$:
;large_map.c:82: if( joy & J_LEFT ) {
	bit	1, c
	jr	Z, 00117$
;large_map.c:83: if( camera_x ) {
	ld	hl, #_camera_x + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00118$
;large_map.c:84: camera_x--;
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;large_map.c:85: redraw = TRUE;
	ld	hl, #_redraw
	ld	(hl), #0x01
	jr	00118$
00117$:
;large_map.c:88: else if( joy & J_RIGHT ) {
	bit	0, c
	jr	Z, 00118$
;large_map.c:89: if( camera_x < camera_max_x ) {
	ld	hl, #_camera_x
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0x18
	ld	a, b
	sbc	a, #0x07
	jr	NC, 00118$
;large_map.c:90: camera_x++;
	dec	hl
	inc	(hl)
	jr	NZ, 00182$
	inc	hl
	inc	(hl)
00182$:
;large_map.c:91: redraw = TRUE;
	ld	hl, #_redraw
	ld	(hl), #0x01
00118$:
;large_map.c:94: if( redraw ) {
	ld	a, (#_redraw)
	or	a, a
	jr	Z, 00120$
;large_map.c:95: wait_vbl_done();
	call	_wait_vbl_done
;large_map.c:96: set_camera();
	call	_set_camera
;large_map.c:97: redraw = FALSE;
	ld	hl, #_redraw
	ld	(hl), #0x00
	jp	00123$
00120$:
;large_map.c:99: else wait_vbl_done();
	call	_wait_vbl_done
;large_map.c:101: }
	jp	00123$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module sgb_pong
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _init_pad
	.globl _printf
	.globl _gotoxy
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad_ex
	.globl _joypad_init
	.globl _sprite_data
	.globl _spd_ballY
	.globl _spd_ballX
	.globl _ballY
	.globl _ballX
	.globl _player2_score
	.globl _player1_score
	.globl _player2
	.globl _player1
	.globl _joypads
	.globl _HUD
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_joypads::
	.ds 5
_player1::
	.ds 1
_player2::
	.ds 1
_player1_score::
	.ds 2
_player2_score::
	.ds 2
_ballX::
	.ds 1
_ballY::
	.ds 1
_spd_ballX::
	.ds 1
_spd_ballY::
	.ds 1
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
;sgb_pong.c:17: void init_pad( uint8_t n ) {
;	---------------------------------
; Function init_pad
; ---------------------------------
_init_pad::
;sgb_pong.c:18: set_sprite_tile( n << 2, n );
	ld	c, a
	add	a, a
	add	a, a
	ld	b, a
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), c
;sgb_pong.c:19: set_sprite_tile( ( n << 2 ) + 1, n );
	ld	e, b
	inc	e
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), c
;sgb_pong.c:20: set_sprite_tile( ( n << 2 ) + 2, n );
	inc	b
	inc	b
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	de, #_shadow_OAM+0
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), c
;sgb_pong.c:20: set_sprite_tile( ( n << 2 ) + 2, n );
;sgb_pong.c:21: }
	ret
;sgb_pong.c:52: void main( void ) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-3
;sgb_pong.c:54: BGP_REG = OBP0_REG = OBP1_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_OBP1_REG + 0), a
	ld	a, #0xe4
	ldh	(_OBP0_REG + 0), a
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;sgb_pong.c:57: set_sprite_data( 0, 4, sprite_data );
	ld	de, #_sprite_data
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;sgb_pong.c:60: init_pad( 0 );
	xor	a, a
	call	_init_pad
;sgb_pong.c:61: init_pad( 1 );
	ld	a, #0x01
	call	_init_pad
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x02
;sgb_pong.c:67: SHOW_BKG; SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;sgb_pong.c:70: if( joypad_init( 2, &joypads ) != 2 ) {
	ld	de, #_joypads
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_joypad_init
	add	sp, #3
	ld	a, e
	sub	a, #0x02
	jr	Z, 00102$
;sgb_pong.c:71: printf( " This program must\n  be executed  on\n   Super GameBoy" );
	ld	de, #___str_0
	push	de
	call	_printf
	pop	hl
;sgb_pong.c:72: return;
	jp	00155$
00102$:
;sgb_pong.c:76: player1 = 64, player2 = 64;
	ld	hl, #_player1
	ld	(hl), #0x40
	ld	hl, #_player2
	ld	(hl), #0x40
;sgb_pong.c:77: player1_score = player2_score = 0;
	xor	a, a
	ld	hl, #_player2_score
	ld	(hl+), a
	ld	(hl), a
	xor	a, a
	ld	hl, #_player1_score
	ld	(hl+), a
	ld	(hl), a
;sgb_pong.c:80: printf( HUD, player1_score, player2_score );
	ld	de, #0x0000
	push	de
	push	de
	ld	de, #_HUD
	push	de
	call	_printf
	add	sp, #6
;sgb_pong.c:83: ballX = INITBALLX, ballY = INITBALLY;
	ld	hl, #_ballX
	ld	(hl), #0x54
	ld	hl, #_ballY
	ld	(hl), #0x48
;sgb_pong.c:84: spd_ballX = 1, spd_ballY = 1;
	ld	hl, #_spd_ballX
	ld	(hl), #0x01
	ld	hl, #_spd_ballY
	ld	(hl), #0x01
;sgb_pong.c:86: while( 1 ) {
00143$:
;sgb_pong.c:88: joypad_ex( &joypads );
	ld	de, #_joypads
	call	_joypad_ex
;sgb_pong.c:91: if( joypads.joy0 & J_UP ) {
	ld	hl, #(_joypads + 1)
	ld	c, (hl)
;sgb_pong.c:92: player1 -= 2;
	ld	a, (#_player1)
;sgb_pong.c:91: if( joypads.joy0 & J_UP ) {
	bit	2, c
	jr	Z, 00110$
;sgb_pong.c:92: player1 -= 2;
	add	a, #0xfe
	ld	hl, #_player1
	ld	(hl), a
;sgb_pong.c:93: if( player1 < YMIN ) player1 = YMIN;
	ld	a, (hl)
	sub	a, #0x1c
	jr	NC, 00111$
	ld	(hl), #0x1c
	jr	00111$
00110$:
;sgb_pong.c:95: else if( joypads.joy0 & J_DOWN ) {
	bit	3, c
	jr	Z, 00111$
;sgb_pong.c:96: player1 += 2;
	add	a, #0x02
	ld	hl, #_player1
	ld	(hl), a
;sgb_pong.c:97: if( player1 > YMAX ) player1 = YMAX;
	ld	a, #0x64
	sub	a, (hl)
	jr	NC, 00111$
	ld	(hl), #0x64
00111$:
;sgb_pong.c:99: draw_pad( 0, PLAYER1_X, player1 );
	ld	hl, #_player1
	ld	c, (hl)
	ld	b, c
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x10
;sgb_pong.c:26: move_sprite( ( n << 2 ) + 1, x, y + 8 );
	ld	a, b
	add	a, #0x08
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 4)
	ld	(hl+), a
	ld	(hl), #0x10
;sgb_pong.c:27: move_sprite( ( n << 2 ) + 2, x, y + 16 );
	ld	a, b
	add	a, #0x10
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 8)
	ld	(hl+), a
	ld	(hl), #0x10
;sgb_pong.c:102: if( joypads.joy1 & J_UP ) {
	ld	hl, #(_joypads + 2)
	ld	c, (hl)
;sgb_pong.c:103: player2 -= 2;
	ld	a, (#_player2)
;sgb_pong.c:102: if( joypads.joy1 & J_UP ) {
	bit	2, c
	jr	Z, 00119$
;sgb_pong.c:103: player2 -= 2;
	add	a, #0xfe
	ld	hl, #_player2
	ld	(hl), a
;sgb_pong.c:104: if( player2 < YMIN ) player2 = YMIN;
	ld	a, (hl)
	sub	a, #0x1c
	jr	NC, 00120$
	ld	(hl), #0x1c
	jr	00120$
00119$:
;sgb_pong.c:106: else if( joypads.joy1 & J_DOWN ) {
	bit	3, c
	jr	Z, 00120$
;sgb_pong.c:107: player2 += 2;
	add	a, #0x02
	ld	hl, #_player2
	ld	(hl), a
;sgb_pong.c:108: if( player2 > YMAX ) player2 = YMAX;
	ld	a, #0x64
	sub	a, (hl)
	jr	NC, 00120$
	ld	(hl), #0x64
00120$:
;sgb_pong.c:110: draw_pad( 1, PLAYER2_X, player2 );
	ld	hl, #_player2
	ld	c, (hl)
	ld	b, c
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x98
;sgb_pong.c:26: move_sprite( ( n << 2 ) + 1, x, y + 8 );
	ld	a, b
	add	a, #0x08
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 20)
	ld	(hl+), a
	ld	(hl), #0x98
;sgb_pong.c:27: move_sprite( ( n << 2 ) + 2, x, y + 16 );
	ld	a, b
	add	a, #0x10
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 24)
	ld	(hl+), a
	ld	(hl), #0x98
;sgb_pong.c:113: ballX += spd_ballX, ballY += spd_ballY;
	ld	a, (#_ballX)
	ld	hl, #_spd_ballX
	add	a, (hl)
	ld	(#_ballX),a
	ld	a, (#_ballY)
	ld	hl, #_spd_ballY
	add	a, (hl)
	ld	hl, #_ballY
	ld	(hl), a
;sgb_pong.c:115: if( ( ballY < YMIN ) || ( ballY > ( YMAX + 24 ) ) ) {
	ld	a, (hl)
	sub	a, #0x1c
	jr	C, 00121$
	ld	a, #0x7c
	sub	a, (hl)
	jr	NC, 00122$
00121$:
;sgb_pong.c:116: spd_ballY = -spd_ballY;
	xor	a, a
	ld	hl, #_spd_ballY
	sub	a, (hl)
	ld	(hl), a
00122$:
;sgb_pong.c:120: if( ( ballY > player1 ) && ( ballY < ( player1 + 24 ) ) && ( spd_ballX < 0 ) )
	ld	a, (#_ballY)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
;sgb_pong.c:121: spd_ballX = -spd_ballX;
	xor	a, a
	ld	hl, #_spd_ballX
	sub	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
;sgb_pong.c:119: if( ballX < ( PLAYER1_X + 8 ) ) {
	ld	a, (#_ballX)
	sub	a, #0x18
	jr	NC, 00135$
;sgb_pong.c:120: if( ( ballY > player1 ) && ( ballY < ( player1 + 24 ) ) && ( spd_ballX < 0 ) )
	ld	a, (#_player1)
	ld	hl, #_ballY
	sub	a, (hl)
	jp	NC, 00136$
	ld	a, (#_player1)
	ld	b, #0x00
	add	a, #0x18
	ld	c, a
	jr	NC, 00267$
	inc	b
00267$:
	ldhl	sp,	#0
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00268$
	bit	7, d
	jr	NZ, 00269$
	cp	a, a
	jr	00269$
00268$:
	bit	7, d
	jr	Z, 00269$
	scf
00269$:
	jr	NC, 00136$
	ld	a, (#_spd_ballX)
	bit	7, a
	jr	Z, 00136$
;sgb_pong.c:121: spd_ballX = -spd_ballX;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_spd_ballX),a
	jr	00136$
00135$:
;sgb_pong.c:123: else if( ballX > ( PLAYER2_X - 8 ) ) {
	ld	a, #0x90
	ld	hl, #_ballX
	sub	a, (hl)
	jr	NC, 00136$
;sgb_pong.c:124: if( ( ballY > player2 ) && ( ballY < ( player2 + 24 ) ) && ( spd_ballX > 0 ) )
	ld	a, (#_player2)
	ld	hl, #_ballY
	sub	a, (hl)
	jr	NC, 00136$
	ld	a, (#_player2)
	ld	b, #0x00
	add	a, #0x18
	ld	c, a
	jr	NC, 00270$
	inc	b
00270$:
	ldhl	sp,	#0
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00271$
	bit	7, d
	jr	NZ, 00272$
	cp	a, a
	jr	00272$
00271$:
	bit	7, d
	jr	Z, 00272$
	scf
00272$:
	jr	NC, 00136$
	ld	hl, #_spd_ballX
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00273$
	bit	7, d
	jr	NZ, 00274$
	cp	a, a
	jr	00274$
00273$:
	bit	7, d
	jr	Z, 00274$
	scf
00274$:
	jr	NC, 00136$
;sgb_pong.c:125: spd_ballX = -spd_ballX;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_spd_ballX),a
00136$:
;sgb_pong.c:121: spd_ballX = -spd_ballX;
	xor	a, a
	ld	hl, #_spd_ballX
	sub	a, (hl)
	ld	c, a
;sgb_pong.c:128: if( ballX < PLAYER1_X ) {
	ld	hl, #_ballX
	ld	a, (hl)
	sub	a, #0x10
	jr	NC, 00140$
;sgb_pong.c:130: ballX = INITBALLX, ballY = INITBALLY;
	ld	(hl), #0x54
	ld	hl, #_ballY
	ld	(hl), #0x48
;sgb_pong.c:131: spd_ballX = -spd_ballX;
	ld	hl, #_spd_ballX
	ld	(hl), c
;sgb_pong.c:132: player2_score++;
	ld	hl, #_player2_score
	inc	(hl)
	jr	NZ, 00275$
	inc	hl
	inc	(hl)
00275$:
;sgb_pong.c:133: gotoxy( 0, 0 ); printf( HUD, player1_score, player2_score );
	xor	a, a
	rrca
	push	af
	call	_gotoxy
	pop	hl
	ld	hl, #_player2_score
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #_player1_score
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	de, #_HUD
	push	de
	call	_printf
	add	sp, #6
	jr	00141$
00140$:
;sgb_pong.c:135: else if( ballX > PLAYER2_X ) {
	ld	a, #0x98
	ld	hl, #_ballX
	sub	a, (hl)
	jr	NC, 00141$
;sgb_pong.c:137: ballX = INITBALLX, ballY = INITBALLY;
	ld	(hl), #0x54
	ld	hl, #_ballY
	ld	(hl), #0x48
;sgb_pong.c:138: spd_ballX = -spd_ballX;
	ld	hl, #_spd_ballX
	ld	(hl), c
;sgb_pong.c:139: player1_score++;
	ld	hl, #_player1_score
	inc	(hl)
	jr	NZ, 00276$
	inc	hl
	inc	(hl)
00276$:
;sgb_pong.c:140: gotoxy( 0, 0 ); printf( HUD, player1_score, player2_score );
	xor	a, a
	rrca
	push	af
	call	_gotoxy
	pop	hl
	ld	hl, #_player2_score
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #_player1_score
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	de, #_HUD
	push	de
	call	_printf
	add	sp, #6
00141$:
;sgb_pong.c:143: move_sprite( 3, ballX, ballY );
	ld	hl, #_ballY
	ld	c, (hl)
	ld	hl, #_ballX
	ld	b, (hl)
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;sgb_pong.c:146: wait_vbl_done();
	call	_wait_vbl_done
	jp	00143$
00155$:
;sgb_pong.c:148: }
	add	sp, #3
	ret
_HUD:
	.ascii " p1: %d   p2: %d"
	.db 0x00
___str_0:
	.ascii " This program must"
	.db 0x0a
	.ascii "  be executed  on"
	.db 0x0a
	.ascii "   Super GameBoy"
	.db 0x00
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

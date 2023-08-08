;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module phys
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
	.globl _Jump
	.globl _SpdY
	.globl _SpdX
	.globl _PosY
	.globl _PosX
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
_PosX::
	.ds 2
_PosY::
	.ds 2
_SpdX::
	.ds 2
_SpdY::
	.ds 2
_Jump::
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
;phys.c:29: void main( void ) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;phys.c:31: BGP_REG = OBP0_REG = OBP1_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_OBP1_REG + 0), a
	ld	a, #0xe4
	ldh	(_OBP0_REG + 0), a
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;phys.c:34: set_sprite_data( 0, 4, sprite_data );
	ld	de, #_sprite_data
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;phys.c:40: SHOW_BKG; SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;phys.c:43: joypad_init( 1, &joypads );
	ld	de, #_joypads
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	call	_joypad_init
	add	sp, #3
;phys.c:45: PosX = PosY = 64 << 4;
	ld	hl, #_PosY
	xor	a, a
	ld	(hl+), a
	ld	(hl), #0x04
	ld	hl, #_PosX
	xor	a, a
	ld	(hl+), a
	ld	(hl), #0x04
;phys.c:46: Jump = SpdX = SpdY = 0;
	xor	a, a
	ld	hl, #_SpdY
	ld	(hl+), a
	ld	(hl), a
	xor	a, a
	ld	hl, #_SpdX
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #_Jump
	ld	(hl), #0x00
;phys.c:48: while( 1 ) {
00137$:
;phys.c:50: joypad_ex( &joypads );
	ld	de, #_joypads
	call	_joypad_ex
;phys.c:53: if( joypads.joy0 & J_UP ) {
	ld	bc, #_joypads + 1
	ld	a, (bc)
	bit	2, a
	jr	Z, 00108$
;phys.c:54: SpdY -= 2;
	ld	hl, #_SpdY
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	dec	de
	ld	a, e
	ld	(hl+), a
;phys.c:55: if( SpdY < -64 ) SpdY = -64;
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, #0xc0
	ld	a, (hl)
	sbc	a, #0xff
	ld	d, (hl)
	ld	a, #0xff
	bit	7,a
	jr	Z, 00229$
	bit	7, d
	jr	NZ, 00230$
	cp	a, a
	jr	00230$
00229$:
	bit	7, d
	jr	Z, 00230$
	scf
00230$:
	jr	NC, 00109$
	ld	hl, #_SpdY
	ld	a, #0xc0
	ld	(hl+), a
	ld	(hl), #0xff
	jr	00109$
00108$:
;phys.c:57: else if( joypads.joy0 & J_DOWN ) {
	bit	3, a
	jr	Z, 00109$
;phys.c:58: SpdY += 2;
	ld	hl, #_SpdY
	ld	a, (hl)
	add	a, #0x02
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0x00
;phys.c:59: if( SpdY > 64 ) SpdY = 64;
	ld	(hl-), a
	ld	a, #0x40
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00232$
	bit	7, d
	jr	NZ, 00233$
	cp	a, a
	jr	00233$
00232$:
	bit	7, d
	jr	Z, 00233$
	scf
00233$:
	jr	NC, 00109$
	ld	hl, #_SpdY
	ld	a, #0x40
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00109$:
;phys.c:61: if( joypads.joy0 & J_LEFT ) {
	ld	a, (bc)
	bit	1, a
	jr	Z, 00117$
;phys.c:62: SpdX -= 2;
	ld	hl, #_SpdX
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	dec	de
	ld	a, e
	ld	(hl+), a
;phys.c:63: if( SpdX < -64 ) SpdX = -64;
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, #0xc0
	ld	a, (hl)
	sbc	a, #0xff
	ld	d, (hl)
	ld	a, #0xff
	bit	7,a
	jr	Z, 00235$
	bit	7, d
	jr	NZ, 00236$
	cp	a, a
	jr	00236$
00235$:
	bit	7, d
	jr	Z, 00236$
	scf
00236$:
	jr	NC, 00118$
	ld	hl, #_SpdX
	ld	a, #0xc0
	ld	(hl+), a
	ld	(hl), #0xff
	jr	00118$
00117$:
;phys.c:65: else if( joypads.joy0 & J_RIGHT ) {
	rrca
	jr	NC, 00118$
;phys.c:66: SpdX += 2;
	ld	hl, #_SpdX
	ld	a, (hl)
	add	a, #0x02
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0x00
;phys.c:67: if( SpdX > 64 ) SpdX = 64;
	ld	(hl-), a
	ld	a, #0x40
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00238$
	bit	7, d
	jr	NZ, 00239$
	cp	a, a
	jr	00239$
00238$:
	bit	7, d
	jr	Z, 00239$
	scf
00239$:
	jr	NC, 00118$
	ld	hl, #_SpdX
	ld	a, #0x40
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00118$:
;phys.c:69: if( ( joypads.joy0 & J_A ) && ( !Jump ) ) {
	ld	a, (bc)
	bit	4, a
	jr	Z, 00120$
	ld	hl, #_Jump
	ld	a, (hl)
	or	a, a
	jr	NZ, 00120$
;phys.c:70: Jump = 3;
	ld	(hl), #0x03
00120$:
;phys.c:74: if( Jump ) {
	ld	a, (#_Jump)
	or	a, a
	jr	Z, 00125$
;phys.c:75: SpdY -= 8;
	ld	hl, #_SpdY
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
;phys.c:76: if( SpdY < -32 ) SpdY = -32;
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, #0xe0
	ld	a, (hl)
	sbc	a, #0xff
	ld	d, (hl)
	ld	a, #0xff
	bit	7,a
	jr	Z, 00241$
	bit	7, d
	jr	NZ, 00242$
	cp	a, a
	jr	00242$
00241$:
	bit	7, d
	jr	Z, 00242$
	scf
00242$:
	jr	NC, 00123$
	ld	hl, #_SpdY
	ld	a, #0xe0
	ld	(hl+), a
	ld	(hl), #0xff
00123$:
;phys.c:77: Jump--;
	ld	hl, #_Jump
	dec	(hl)
00125$:
;phys.c:80: PosX += SpdX, PosY += SpdY;
	ld	hl, #_SpdX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_PosX
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
	ld	hl, #_SpdY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_PosY
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
;phys.c:84: move_sprite( 0, PosX >> 4, PosY >> 4 );
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ld	hl, #_PosX
	ld	a, (hl+)
	ld	b, a
	ld	e, (hl)
	srl	e
	rr	b
	srl	e
	rr	b
	srl	e
	rr	b
	srl	e
	rr	b
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;phys.c:87: if( SpdY >= 0 ) {
	ld	hl, #_SpdY + 1
	bit	7, (hl)
	jr	NZ, 00129$
;phys.c:88: if( SpdY ) SpdY--;
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00130$
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	jr	00130$
00129$:
;phys.c:90: else SpdY++;
	ld	hl, #_SpdY
	inc	(hl)
	jr	NZ, 00243$
	inc	hl
	inc	(hl)
00243$:
00130$:
;phys.c:91: if( SpdX >= 0 ) {
	ld	hl, #_SpdX + 1
	bit	7, (hl)
	jr	NZ, 00134$
;phys.c:92: if( SpdX ) SpdX--;
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00135$
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	jr	00135$
00134$:
;phys.c:94: else SpdX++;
	ld	hl, #_SpdX
	inc	(hl)
	jr	NZ, 00244$
	inc	hl
	inc	(hl)
00244$:
00135$:
;phys.c:97: wait_vbl_done();
	call	_wait_vbl_done
;phys.c:99: }
	jp	00137$
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

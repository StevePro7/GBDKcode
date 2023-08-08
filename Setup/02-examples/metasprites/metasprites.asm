;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module metasprites
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _hide_sprites_range
	.globl _fill_bkg_rect
	.globl _set_sprite_data
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad_ex
	.globl _joypad_init
	.globl _rot
	.globl _idx
	.globl _jitter
	.globl _hide
	.globl _PosF
	.globl _SpdY
	.globl _SpdX
	.globl _PosY
	.globl _PosX
	.globl _joypads
	.globl _pattern
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
_PosF::
	.ds 1
_hide::
	.ds 1
_jitter::
	.ds 1
_idx::
	.ds 1
_rot::
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
;metasprites.c:29: void main( void )
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-6
;metasprites.c:32: BGP_REG = OBP0_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_OBP0_REG + 0), a
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;metasprites.c:33: OBP1_REG = 0xE0;
	ld	a, #0xe0
	ldh	(_OBP1_REG + 0), a
;metasprites.c:36: fill_bkg_rect( 0, 0, 20, 18, 0 );
	xor	a, a
	ld	h, a
	ld	l, #0x12
	push	hl
	ld	a, #0x14
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	call	_fill_bkg_rect
	add	sp, #5
;metasprites.c:37: set_bkg_data( 0, 1, pattern );
	ld	de, #_pattern
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_data
	add	sp, #4
;metasprites.c:40: set_sprite_data( TILE_NUM_START, sizeof( sprite_tiles ) >> 4, sprite_tiles );
	ld	de, #_sprite_tiles
	push	de
	ld	hl, #0x3800
	push	hl
	call	_set_sprite_data
	add	sp, #4
;metasprites.c:43: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;metasprites.c:44: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;metasprites.c:48: SPRITES_8x16;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x04
	ldh	(_LCDC_REG + 0), a
;metasprites.c:54: joypad_init( 1, &joypads );
	ld	de, #_joypads
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	call	_joypad_init
	add	sp, #3
;metasprites.c:57: PosX = PosY = 64 << 4;
	ld	hl, #_PosY
	xor	a, a
	ld	(hl+), a
	ld	(hl), #0x04
	ld	hl, #_PosX
	xor	a, a
	ld	(hl+), a
	ld	(hl), #0x04
;metasprites.c:58: SpdX = SpdY = 0;
	xor	a, a
	ld	hl, #_SpdY
	ld	(hl+), a
	ld	(hl), a
	xor	a, a
	ld	hl, #_SpdX
	ld	(hl+), a
	ld	(hl), a
;metasprites.c:60: hide = 0;
	ld	hl, #_hide
	ld	(hl), #0x00
;metasprites.c:61: jitter = 0;
	ld	hl, #_jitter
	ld	(hl), #0x00
;metasprites.c:62: idx = 0;
	ld	hl, #_idx
	ld	(hl), #0x00
;metasprites.c:63: rot = 0;
	ld	hl, #_rot
	ld	(hl), #0x00
;metasprites.c:65: while( 1 )
00157$:
;metasprites.c:68: joypad_ex( &joypads );
	ld	de, #_joypads
	call	_joypad_ex
;metasprites.c:70: PosF = 0;
	ld	hl, #_PosF
	ld	(hl), #0x00
;metasprites.c:72: if( joypads.joy0 & J_UP )
	ld	hl, #(_joypads + 1)
	ld	c, (hl)
;metasprites.c:74: SpdY -= 2;
	ld	hl, #_SpdY
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;metasprites.c:77: PosF |= ACC_Y;
	ld	a, (#_PosF)
	or	a, #0x02
	ldhl	sp,	#5
	ld	(hl), a
;metasprites.c:72: if( joypads.joy0 & J_UP )
	bit	2, c
	jr	Z, 00108$
;metasprites.c:74: SpdY -= 2;
	dec	de
	dec	de
	ld	hl, #_SpdY
	ld	a, e
	ld	(hl+), a
;metasprites.c:75: if( SpdY < -32 )
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, #0xe0
	ld	a, (hl)
	sbc	a, #0xff
	ld	d, (hl)
	ld	a, #0xff
	bit	7,a
	jr	Z, 00331$
	bit	7, d
	jr	NZ, 00332$
	cp	a, a
	jr	00332$
00331$:
	bit	7, d
	jr	Z, 00332$
	scf
00332$:
	jr	NC, 00102$
;metasprites.c:76: SpdY = -32;
	ld	hl, #_SpdY
	ld	a, #0xe0
	ld	(hl+), a
	ld	(hl), #0xff
00102$:
;metasprites.c:77: PosF |= ACC_Y;
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(#_PosF),a
	jr	00109$
00108$:
;metasprites.c:79: else if( joypads.joy0 & J_DOWN )
	bit	3, c
	jr	Z, 00109$
;metasprites.c:81: SpdY += 2;
	inc	de
	inc	de
	ld	hl, #_SpdY
	ld	a, e
	ld	(hl+), a
;metasprites.c:82: if( SpdY > 32 )
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, b
	ld	d, #0x00
	ld	a, #0x20
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00334$
	bit	7, d
	jr	NZ, 00335$
	cp	a, a
	jr	00335$
00334$:
	bit	7, d
	jr	Z, 00335$
	scf
00335$:
	jr	NC, 00104$
;metasprites.c:83: SpdY = 32;
	ld	hl, #_SpdY
	ld	a, #0x20
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00104$:
;metasprites.c:84: PosF |= ACC_Y;
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(#_PosF),a
00109$:
;metasprites.c:87: if( joypads.joy0 & J_LEFT )
	ld	a, (#(_joypads + 1) + 0)
	ldhl	sp,	#2
	ld	(hl), a
;metasprites.c:89: SpdX -= 2;
	ld	a, (#_SpdX)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (#_SpdX + 1)
	ldhl	sp,	#4
	ld	(hl), a
;metasprites.c:92: PosF |= ACC_X;
	ld	a, (#_PosF)
	or	a, #0x01
	ldhl	sp,	#5
	ld	(hl), a
;metasprites.c:87: if( joypads.joy0 & J_LEFT )
	push	hl
	ldhl	sp,	#4
	bit	1, (hl)
	pop	hl
	jr	Z, 00117$
;metasprites.c:89: SpdX -= 2;
	ldhl	sp,#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
	dec	bc
	ld	hl, #_SpdX
	ld	a, c
	ld	(hl+), a
;metasprites.c:90: if( SpdX < -32 )
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, #0xe0
	ld	a, (hl)
	sbc	a, #0xff
	ld	d, (hl)
	ld	a, #0xff
	bit	7,a
	jr	Z, 00337$
	bit	7, d
	jr	NZ, 00338$
	cp	a, a
	jr	00338$
00337$:
	bit	7, d
	jr	Z, 00338$
	scf
00338$:
	jr	NC, 00111$
;metasprites.c:91: SpdX = -32;
	ld	hl, #_SpdX
	ld	a, #0xe0
	ld	(hl+), a
	ld	(hl), #0xff
00111$:
;metasprites.c:92: PosF |= ACC_X;
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(#_PosF),a
	jr	00118$
00117$:
;metasprites.c:94: else if( joypads.joy0 & J_RIGHT )
	push	hl
	ldhl	sp,	#4
	bit	0, (hl)
	pop	hl
	jr	Z, 00118$
;metasprites.c:96: SpdX += 2;
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	hl, #_SpdX
	ld	a, c
	ld	(hl+), a
;metasprites.c:97: if( SpdX > 32 )
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, b
	ld	d, #0x00
	ld	a, #0x20
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00340$
	bit	7, d
	jr	NZ, 00341$
	cp	a, a
	jr	00341$
00340$:
	bit	7, d
	jr	Z, 00341$
	scf
00341$:
	jr	NC, 00113$
;metasprites.c:98: SpdX = 32;
	ld	hl, #_SpdX
	ld	a, #0x20
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00113$:
;metasprites.c:99: PosF |= ACC_X;
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(#_PosF),a
00118$:
;metasprites.c:103: if( ( joypads.joy0 & J_A ) && ( !jitter ) )
	ld	a, (#(_joypads + 1) + 0)
	bit	4, a
	jr	Z, 00120$
	ld	a, (#_jitter)
	or	a, a
	jr	NZ, 00120$
;metasprites.c:105: hide = ( !hide );
	ld	hl, #_hide
	ld	a, (hl)
	sub	a,#0x01
	ld	a, #0x00
	rla
	ld	(hl), a
;metasprites.c:106: jitter = 20;
	ld	hl, #_jitter
	ld	(hl), #0x14
00120$:
;metasprites.c:110: if( ( joypads.joy0 & J_B ) && ( !jitter ) && ( !hide ) )
	ld	a, (#(_joypads + 1) + 0)
	bit	5, a
	jr	Z, 00125$
	ld	a, (#_jitter)
	or	a, a
	jr	NZ, 00125$
	ld	a, (#_hide)
	or	a, a
	jr	NZ, 00125$
;metasprites.c:112: idx++;
	ld	hl, #_idx
	inc	(hl)
;metasprites.c:113: if( idx >= ( sizeof( sprite_metasprites ) >> 1 ) )
	ld	a, (hl)
	sub	a, #0x05
	jr	C, 00123$
;metasprites.c:114: idx = 0;
	ld	(hl), #0x00
00123$:
;metasprites.c:115: jitter = 10;
	ld	hl, #_jitter
	ld	(hl), #0x0a
00125$:
;metasprites.c:119: if( ( joypads.joy0 & J_SELECT ) && ( !jitter ) && ( !hide ) )
	ld	a, (#(_joypads + 1) + 0)
	bit	6, a
	jr	Z, 00129$
	ld	a, (#_jitter)
	or	a, a
	jr	NZ, 00129$
	ld	a, (#_hide)
	or	a, a
	jr	NZ, 00129$
;metasprites.c:121: rot++;
	ld	hl, #_rot
	inc	(hl)
;metasprites.c:122: rot &= 3;
	ld	a, (hl)
	and	a, #0x03
	ld	(hl), a
;metasprites.c:123: jitter = 20;
	ld	hl, #_jitter
	ld	(hl), #0x14
00129$:
;metasprites.c:127: if( jitter )
	ld	hl, #_jitter
	ld	a, (hl)
	or	a, a
	jr	Z, 00133$
;metasprites.c:128: jitter--;
	dec	(hl)
00133$:
;metasprites.c:130: PosX += SpdX, PosY += SpdY;
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
	ld	(hl), a
;metasprites.c:132: uint8_t hiwater = 0;
	ldhl	sp,	#3
	ld	(hl), #0x00
;metasprites.c:142: hide_metasprite( sprite_metasprites[ idx ], SPR_NUM_START );
	ld	a, (#_idx)
	ld	c, #0x00
	add	a, a
	rl	c
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), c
;metasprites.c:141: if( hide )
	ld	a, (#_hide)
	or	a, a
	jr	Z, 00140$
;metasprites.c:142: hide_metasprite( sprite_metasprites[ idx ], SPR_NUM_START );
	ld	bc, #_sprite_metasprites+0
	pop	hl
	push	hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl)
;C:/gbdk/include/gb/metasprites.h:243: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), c
	inc	hl
	ld	(hl), a
;C:/gbdk/include/gb/metasprites.h:244: __hide_metasprite(base_sprite);
	xor	a, a
	push	af
	inc	sp
	call	___hide_metasprite
	inc	sp
;metasprites.c:142: hide_metasprite( sprite_metasprites[ idx ], SPR_NUM_START );
	jp	00141$
00140$:
;metasprites.c:147: hiwater = move_metasprite( sprite_metasprites[ idx ], TILE_NUM_START, SPR_NUM_START, ( PosX >> 4 ), ( PosY >> 4 ) );
	ld	hl, #_PosY
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	ld	hl, #_PosX
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
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;metasprites.c:144: switch( rot )
	ld	a, (#_rot)
	or	a, a
	jr	Z, 00134$
	ld	a, (#_rot)
	dec	a
	jr	Z, 00135$
	ld	a, (#_rot)
	sub	a, #0x02
	jp	Z,00136$
	ld	a, (#_rot)
	sub	a, #0x03
	jp	Z,00137$
	jp	00141$
;metasprites.c:146: case 0:
00134$:
;metasprites.c:147: hiwater = move_metasprite( sprite_metasprites[ idx ], TILE_NUM_START, SPR_NUM_START, ( PosX >> 4 ), ( PosY >> 4 ) );
	ld	de, #_sprite_metasprites
	pop	hl
	push	hl
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;C:/gbdk/include/gb/metasprites.h:140: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:/gbdk/include/gb/metasprites.h:141: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;C:/gbdk/include/gb/metasprites.h:142: return __move_metasprite(base_sprite, x, y);
	ldhl	sp,	#4
	ld	a, (hl+)
	push	af
	inc	sp
	ld	h, (hl)
	ld	l, #0x00
	push	hl
	call	___move_metasprite
	add	sp, #3
;metasprites.c:147: hiwater = move_metasprite( sprite_metasprites[ idx ], TILE_NUM_START, SPR_NUM_START, ( PosX >> 4 ), ( PosY >> 4 ) );
	ldhl	sp,	#3
	ld	(hl), e
;metasprites.c:148: break;
	jp	00141$
;metasprites.c:149: case 1:
00135$:
;metasprites.c:150: hiwater = move_metasprite_hflip( sprite_metasprites[ idx ], TILE_NUM_START, SPR_NUM_START, ( PosX >> 4 ), ( PosY >> 4 ) );
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #_sprite_metasprites
	pop	hl
	push	hl
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
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
;C:/gbdk/include/gb/metasprites.h:199: __current_metasprite = metasprite;
	ld	e, l
	ld	d, h
	ld	hl, #___current_metasprite
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:/gbdk/include/gb/metasprites.h:200: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;C:/gbdk/include/gb/metasprites.h:201: return __move_metasprite_hflip(base_sprite, x, y - ((LCDC_REG & 0x04U) ? 16 : 8) );
	ldh	a, (_LCDC_REG + 0)
	bit	2, a
	jr	Z, 00166$
	ld	de, #0x0010
	jr	00167$
00166$:
	ld	de, #0x0008
00167$:
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	sub	a, l
	push	af
	inc	sp
	push	bc
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	___move_metasprite_hflip
	add	sp, #3
;metasprites.c:150: hiwater = move_metasprite_hflip( sprite_metasprites[ idx ], TILE_NUM_START, SPR_NUM_START, ( PosX >> 4 ), ( PosY >> 4 ) );
	ldhl	sp,	#3
	ld	(hl), e
;metasprites.c:151: break;
	jp	00141$
;metasprites.c:152: case 2:
00136$:
;metasprites.c:153: hiwater = move_metasprite_hvflip( sprite_metasprites[ idx ], TILE_NUM_START, SPR_NUM_START, ( PosX >> 4 ), ( PosY >> 4 ) );
	ld	de, #_sprite_metasprites
	pop	hl
	push	hl
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;C:/gbdk/include/gb/metasprites.h:228: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:/gbdk/include/gb/metasprites.h:229: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;C:/gbdk/include/gb/metasprites.h:230: return __move_metasprite_hvflip(base_sprite, x - 8, y - ((LCDC_REG & 0x04U) ? 16 : 8));
	ldh	a, (_LCDC_REG + 0)
	bit	2, a
	jr	Z, 00168$
	ldhl	sp,	#2
	ld	a, #0x10
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	jr	00169$
00168$:
	ldhl	sp,	#2
	ld	a, #0x08
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00169$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(hl+), a
	ld	a, (hl-)
	sub	a, (hl)
	inc	hl
	ld	(hl+), a
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl-), a
	ld	a, (hl+)
	push	af
	inc	sp
	ld	h, (hl)
	ld	l, #0x00
	push	hl
	call	___move_metasprite_hvflip
	add	sp, #3
;metasprites.c:153: hiwater = move_metasprite_hvflip( sprite_metasprites[ idx ], TILE_NUM_START, SPR_NUM_START, ( PosX >> 4 ), ( PosY >> 4 ) );
	ldhl	sp,	#3
	ld	(hl), e
;metasprites.c:154: break;
	jr	00141$
;metasprites.c:155: case 3:
00137$:
;metasprites.c:156: hiwater = move_metasprite_vflip( sprite_metasprites[ idx ], TILE_NUM_START, SPR_NUM_START, ( PosX >> 4 ), ( PosY >> 4 ) );
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #_sprite_metasprites
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
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
;C:/gbdk/include/gb/metasprites.h:169: __current_metasprite = metasprite;
	ld	(hl-), a
	ld	a, (hl)
	ld	(#___current_metasprite),a
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(#___current_metasprite + 1),a
;C:/gbdk/include/gb/metasprites.h:170: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;C:/gbdk/include/gb/metasprites.h:171: return __move_metasprite_vflip(base_sprite, x - 8, y);
	ldhl	sp,	#3
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	h, (hl)
	ld	l, #0x00
	push	hl
	call	___move_metasprite_vflip
	add	sp, #3
;metasprites.c:156: hiwater = move_metasprite_vflip( sprite_metasprites[ idx ], TILE_NUM_START, SPR_NUM_START, ( PosX >> 4 ), ( PosY >> 4 ) );
	ldhl	sp,	#3
	ld	(hl), e
;metasprites.c:158: };
00141$:
;metasprites.c:161: hide_sprites_range( hiwater, 40 );
	ld	a, #0x28
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	call	_hide_sprites_range
	pop	hl
;metasprites.c:164: if( !( PosF & ACC_Y ) )
	ld	a, (#_PosF)
	ldhl	sp,	#3
	ld	(hl), a
	push	hl
	bit	1, (hl)
	pop	hl
	jr	NZ, 00148$
;metasprites.c:166: if( SpdY != 0 )
	ld	hl, #_SpdY + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00148$
;metasprites.c:168: if( SpdY > 0 )
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	ld	a, (#_SpdY + 1)
	ldhl	sp,	#5
	ld	(hl-), a
	xor	a, a
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00354$
	bit	7, d
	jr	NZ, 00355$
	cp	a, a
	jr	00355$
00354$:
	bit	7, d
	jr	Z, 00355$
	scf
00355$:
	jr	NC, 00143$
;metasprites.c:169: SpdY--;
	ld	hl, #_SpdY
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	jr	00148$
00143$:
;metasprites.c:171: SpdY++;
	ld	hl, #_SpdY
	inc	(hl)
	jr	NZ, 00356$
	inc	hl
	inc	(hl)
00356$:
00148$:
;metasprites.c:176: if( !( PosF & ACC_X ) )
	push	hl
	ldhl	sp,	#5
	bit	0, (hl)
	pop	hl
	jr	NZ, 00155$
;metasprites.c:178: if( SpdX != 0 )
	ld	hl, #_SpdX + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00155$
;metasprites.c:180: if( SpdX > 0 )
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00359$
	bit	7, d
	jr	NZ, 00360$
	cp	a, a
	jr	00360$
00359$:
	bit	7, d
	jr	Z, 00360$
	scf
00360$:
	jr	NC, 00150$
;metasprites.c:181: SpdX--;
	ld	hl, #_SpdX
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	jr	00155$
00150$:
;metasprites.c:183: SpdX++;
	ld	hl, #_SpdX
	inc	(hl)
	jr	NZ, 00361$
	inc	hl
	inc	(hl)
00361$:
00155$:
;metasprites.c:188: wait_vbl_done();
	call	_wait_vbl_done
	jp	00157$
;metasprites.c:190: }
	add	sp, #6
	ret
_pattern:
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module dscan
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _kirai
	.globl _enemys
	.globl _bombs
	.globl _player
	.globl _init_kirai
	.globl _init_enemy
	.globl _init_tama
	.globl _init_player
	.globl _init_screen
	.globl _init_score
	.globl _hide_msg
	.globl _show_pause
	.globl _show_gover
	.globl _show_level
	.globl _set_level
	.globl _show_score
	.globl _make_rnd
	.globl _set_bkg_attr
	.globl _set_sprite_attrb
	.globl _arand
	.globl _initarand
	.globl _set_sprite_palette
	.globl _set_bkg_palette
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _display_off
	.globl _waitpadup
	.globl _joypad
	.globl _delay
	.globl _k_left
	.globl _k_right
	.globl _rnd_kirai
	.globl _rnd_enemy
	.globl _ky
	.globl _kx
	.globl _kf
	.globl _ey
	.globl _ex
	.globl _ef
	.globl _ty
	.globl _tx
	.globl _tf
	.globl _ps
	.globl _pw
	.globl _pl
	.globl _pp
	.globl _px
	.globl _pf
	.globl _msg_tile
	.globl _msg_start
	.globl _msg_pause
	.globl _msg_gover
	.globl _msg_lv
	.globl _msg_1up
	.globl _obj_p
	.globl _bkg_p
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_msg_tile::
	.ds 64
_pf::
	.ds 1
_px::
	.ds 1
_pp::
	.ds 1
_pl::
	.ds 1
_pw::
	.ds 2
_ps::
	.ds 2
_tf::
	.ds 6
_tx::
	.ds 6
_ty::
	.ds 6
_ef::
	.ds 10
_ex::
	.ds 10
_ey::
	.ds 10
_kf::
	.ds 12
_kx::
	.ds 12
_ky::
	.ds 12
_rnd_enemy::
	.ds 1
_rnd_kirai::
	.ds 1
_k_right::
	.ds 1
_k_left::
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
;dscan.c:117: void set_sprite_attrb( uint8_t nb, uint8_t tile )
;	---------------------------------
; Function set_sprite_attrb
; ---------------------------------
_set_sprite_attrb::
	ld	c, a
;dscan.c:119: if(DEVICE_SUPPORTS_COLOR) {
	ld	a, (#__cpu)
	sub	a, #0x11
	ret	NZ
;C:/gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), e
;dscan.c:120: set_sprite_prop( nb, tile );
;dscan.c:122: }
	ret
_bkg_p:
	.dw #0x7fff
	.dw #0x6318
	.dw #0x4210
	.dw #0x0000
	.dw #0x7c00
	.dw #0x6400
	.dw #0x3c00
	.dw #0x001f
	.dw #0x7400
	.dw #0x5400
	.dw #0x3400
	.dw #0x001f
	.dw #0x6c00
	.dw #0x4c00
	.dw #0x2c00
	.dw #0x001f
	.dw #0x5c00
	.dw #0x4400
	.dw #0x2400
	.dw #0x001f
	.dw #0x4200
	.dw #0x6300
	.dw #0x0000
	.dw #0x001f
	.dw #0x5280
	.dw #0x7380
	.dw #0x7c00
	.dw #0x001f
	.dw #0x7fff
	.dw #0x7fe0
	.dw #0x0000
	.dw #0x7c00
_obj_p:
	.dw #0x7fff
	.dw #0x6318
	.dw #0x4a52
	.dw #0x0000
	.dw #0x7e58
	.dw #0x001f
	.dw #0x0000
	.dw #0x7fff
	.dw #0x7e58
	.dw #0x001f
	.dw #0x6318
	.dw #0x7fff
	.dw #0x7e58
	.dw #0x7fff
	.dw #0x03e0
	.dw #0x03ff
	.dw #0x7e58
	.dw #0x7fff
	.dw #0x7c00
	.dw #0x001f
	.dw #0x7e58
	.dw #0x001f
	.dw #0x0000
	.dw #0x7c00
	.dw #0x7fff
	.dw #0x6318
	.dw #0x4a52
	.dw #0x0000
	.dw #0x7fff
	.dw #0x6318
	.dw #0x4a52
	.dw #0x0000
_msg_1up:
	.dw __str_0
_msg_lv:
	.dw __str_1
_msg_gover:
	.dw __str_2
_msg_pause:
	.dw __str_3
_msg_start:
	.dw __str_4
__str_0:
	.ascii "1UP"
	.db 0x00
__str_1:
	.ascii "LV"
	.db 0x00
__str_2:
	.ascii "GAMEOVER"
	.db 0x00
__str_3:
	.ascii " PAUSE! "
	.db 0x00
__str_4:
	.ascii "        "
	.db 0x00
;dscan.c:125: void set_bkg_attr( uint8_t x, uint8_t y, uint8_t sx, uint8_t sy, unsigned char *d )
;	---------------------------------
; Function set_bkg_attr
; ---------------------------------
_set_bkg_attr::
	add	sp, #-4
	ldhl	sp,	#1
	ld	(hl-), a
;dscan.c:129: VBK_REG = VBK_ATTRIBUTES;	/* select palette bank */
;dscan.c:130: for( yy=0; yy<sy; yy++ ) {
	ld	a, e
	ld	(hl+), a
	inc	hl
	ld	a, #0x01
	ldh	(_VBK_REG + 0), a
	ld	(hl), #0x00
00107$:
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#7
	sub	a, (hl)
	jr	NC, 00102$
;dscan.c:131: for( xx=0; xx<sx; xx++ ) {
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#3
	ld	(hl), #0x00
00104$:
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#6
	sub	a, (hl)
	jr	NC, 00115$
;dscan.c:132: msg_tile[xx] = bkgCGB[(unsigned int)*d];
	push	de
	ld	de, #_msg_tile
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	ld	a, (de)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	a, #<(_bkgCGB)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #>(_bkgCGB)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	ld	(bc), a
;dscan.c:133: d++;
	inc	de
;dscan.c:131: for( xx=0; xx<sx; xx++ ) {
	ldhl	sp,	#3
	inc	(hl)
	jr	00104$
00115$:
	ldhl	sp,	#8
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;dscan.c:135: set_bkg_tiles( x, y+yy, sx, 1, msg_tile );
	ldhl	sp,	#0
	ld	a, (hl+)
	inc	hl
	add	a, (hl)
	ld	de, #_msg_tile
	push	de
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#9
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;dscan.c:130: for( yy=0; yy<sy; yy++ ) {
	ldhl	sp,	#2
	inc	(hl)
	jr	00107$
00102$:
;dscan.c:137: VBK_REG = VBK_TILES;		/* select data bank */
	ld	a, #0x00
	ldh	(_VBK_REG + 0), a
;dscan.c:138: }
	add	sp, #4
	pop	hl
	add	sp, #4
	jp	(hl)
;dscan.c:140: uint8_t make_rnd( uint8_t i )
;	---------------------------------
; Function make_rnd
; ---------------------------------
_make_rnd::
	ld	c, a
;dscan.c:142: return( arand()%(i+1) );
	push	bc
	call	_arand
	pop	bc
	ld	b, #0x00
	inc	bc
	ld	d, #0x00
	call	__modsint
	ld	a, c
;dscan.c:143: }
	ret
;dscan.c:145: void show_score( uint16_t s )
;	---------------------------------
; Function show_score
; ---------------------------------
_show_score::
	add	sp, #-11
	ldhl	sp,	#8
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;dscan.c:151: f = 0; m = 10000;
	ldhl	sp,	#6
	ld	(hl), #0x00
	ld	de, #0x2710
;dscan.c:152: for( i=0; i<5; i++ ) {
	ldhl	sp,	#10
	ld	(hl), #0x00
00106$:
;dscan.c:153: n = s/m; s = s%m; m = m/10;
	push	de
	ld	c, e
	ld	b, d
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__divuint
	pop	de
	ldhl	sp,	#7
	ld	a, c
	ld	(hl+), a
	push	de
	ld	c, e
	ld	b, d
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__moduint
	pop	de
	ldhl	sp,	#8
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ld	bc, #0x000a
	call	__divuint
	ld	e, c
	ld	d, b
;dscan.c:154: if( (n==0)&&(f==0) ) {
	ldhl	sp,	#7
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;dscan.c:155: score[i] = 0x20;      /* ' ' */
	push	de
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	ld	(hl), #0x20
	jr	00107$
00102$:
;dscan.c:157: f = 1;
	ldhl	sp,	#6
	ld	(hl), #0x01
;dscan.c:158: score[i] = 0x30+n;    /* '0' - '9' */
	push	de
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	ldhl	sp,	#7
	ld	a, (hl)
	add	a, #0x30
	ld	(bc), a
00107$:
;dscan.c:152: for( i=0; i<5; i++ ) {
	ldhl	sp,	#10
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x05
	jr	C, 00106$
;dscan.c:161: score[5] = 0x30;      /* '0' */
	ldhl	sp,	#5
	ld	(hl), #0x30
;dscan.c:162: set_bkg_tiles( 4, 0, 6, 1, score );
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x106
	push	hl
	ld	hl, #0x04
	push	hl
	call	_set_bkg_tiles
;dscan.c:163: }
	add	sp, #17
	ret
;dscan.c:165: void set_level( uint8_t i )
;	---------------------------------
; Function set_level
; ---------------------------------
_set_level::
;dscan.c:168: if( i < 9 ) {
	ld	c, a
	sub	a, #0x09
	jr	NC, 00102$
;dscan.c:169: rnd_enemy = 100-(i*12); /*  1% - */
	ld	a, c
	add	a, a
	add	a, c
	add	a, a
	add	a, a
	ld	b, a
	ld	a, #0x64
	sub	a, b
	ld	(#_rnd_enemy),a
;dscan.c:170: rnd_kirai = 50-(i*6);   /*  2% - */
	ld	a, c
	add	a, a
	add	a, c
	add	a, a
	ld	c, a
	ld	a, #0x32
	sub	a, c
	ld	(#_rnd_kirai),a
	ret
00102$:
;dscan.c:172: rnd_enemy = 0;      /* 100 % */
	ld	hl, #_rnd_enemy
	ld	(hl), #0x00
;dscan.c:173: rnd_kirai = 0;      /* 100 % */
	ld	hl, #_rnd_kirai
	ld	(hl), #0x00
;dscan.c:175: }
	ret
;dscan.c:177: void show_level( uint8_t i )
;	---------------------------------
; Function show_level
; ---------------------------------
_show_level::
	dec	sp
	dec	sp
	ld	c, a
;dscan.c:182: level[0] = 0x31+i;
	ld	b, c
;dscan.c:181: if( i < 9 ) {
	ld	a, c
	sub	a, #0x09
	jr	NC, 00102$
;dscan.c:182: level[0] = 0x31+i;
	ld	a, b
	add	a, #0x31
	ldhl	sp,	#0
	ld	(hl), a
	jr	00103$
00102$:
;dscan.c:184: level[0] = 0x41+i-9;
	ld	a, b
	add	a, #0x38
	ldhl	sp,	#0
	ld	(hl), a
00103$:
;dscan.c:186: set_bkg_tiles( 19, 0, 1, 1, level );
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0x13
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;dscan.c:187: set_level( i );
	ld	a, c
;dscan.c:188: }
	call	_set_level
	pop	hl
	ret
;dscan.c:190: void show_gover()
;	---------------------------------
; Function show_gover
; ---------------------------------
_show_gover::
;dscan.c:192: set_bkg_tiles(  6, 9, 8, 1, (unsigned char *)msg_gover );
	ld	hl, #_msg_gover
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #0x108
	push	hl
	ld	hl, #0x906
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;dscan.c:193: pf = DEF_PF;
	ld	hl, #_pf
	ld	(hl), #0x08
;dscan.c:194: }
	ret
;dscan.c:196: void show_pause()
;	---------------------------------
; Function show_pause
; ---------------------------------
_show_pause::
;dscan.c:198: set_bkg_tiles(  6, 9, 8, 1, (unsigned char *)msg_pause );
	ld	hl, #_msg_pause
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #0x108
	push	hl
	ld	hl, #0x906
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;dscan.c:199: }
	ret
;dscan.c:201: void hide_msg()
;	---------------------------------
; Function hide_msg
; ---------------------------------
_hide_msg::
;dscan.c:203: set_bkg_tiles(  6, 9, 8, 1, (unsigned char *)msg_start );
	ld	hl, #_msg_start
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #0x108
	push	hl
	ld	hl, #0x906
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;dscan.c:204: }
	ret
;dscan.c:206: void init_score()
;	---------------------------------
; Function init_score
; ---------------------------------
_init_score::
;dscan.c:208: ps = 0;
	xor	a, a
	ld	hl, #_ps
	ld	(hl+), a
	ld	(hl), a
;dscan.c:209: show_score( ps );
	ld	de, #0x0000
	call	_show_score
;dscan.c:210: pp = 0; pl = 0;
	ld	hl, #_pp
	ld	(hl), #0x00
	ld	hl, #_pl
	ld	(hl), #0x00
;dscan.c:211: show_level( pl );
	xor	a, a
;dscan.c:212: }
	jp	_show_level
;dscan.c:214: void init_screen()
;	---------------------------------
; Function init_screen
; ---------------------------------
_init_screen::
;dscan.c:218: if( DEVICE_SUPPORTS_COLOR ) {
	ld	a, (#__cpu)
	sub	a, #0x11
	jp	NZ,00102$
;dscan.c:220: set_bkg_palette( BKGF_CGB_PAL0, 1, &bkg_p[ 0 ] );
	ld	de, #_bkg_p
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_palette
	add	sp, #4
;dscan.c:221: set_bkg_palette( BKGF_CGB_PAL1, 1, &bkg_p[ 4 ] );
	ld	de, #(_bkg_p + 8)
	push	de
	ld	hl, #0x101
	push	hl
	call	_set_bkg_palette
	add	sp, #4
;dscan.c:222: set_bkg_palette( BKGF_CGB_PAL2, 1, &bkg_p[ 8 ] );
	ld	de, #(_bkg_p + 16)
	push	de
	ld	hl, #0x102
	push	hl
	call	_set_bkg_palette
	add	sp, #4
;dscan.c:223: set_bkg_palette( BKGF_CGB_PAL3, 1, &bkg_p[ 12 ] );
	ld	de, #(_bkg_p + 24)
	push	de
	ld	hl, #0x103
	push	hl
	call	_set_bkg_palette
	add	sp, #4
;dscan.c:224: set_bkg_palette( BKGF_CGB_PAL4, 1, &bkg_p[ 16 ] );
	ld	de, #(_bkg_p + 32)
	push	de
	ld	hl, #0x104
	push	hl
	call	_set_bkg_palette
	add	sp, #4
;dscan.c:225: set_bkg_palette( BKGF_CGB_PAL5, 1, &bkg_p[ 20 ] );
	ld	de, #(_bkg_p + 40)
	push	de
	ld	hl, #0x105
	push	hl
	call	_set_bkg_palette
	add	sp, #4
;dscan.c:226: set_bkg_palette( BKGF_CGB_PAL6, 1, &bkg_p[ 24 ] );
	ld	de, #(_bkg_p + 48)
	push	de
	ld	hl, #0x106
	push	hl
	call	_set_bkg_palette
	add	sp, #4
;dscan.c:227: set_bkg_palette( BKGF_CGB_PAL7, 1, &bkg_p[ 28 ] );
	ld	de, #(_bkg_p + 56)
	push	de
	ld	hl, #0x107
	push	hl
	call	_set_bkg_palette
	add	sp, #4
;dscan.c:228: set_sprite_palette( OAMF_CGB_PAL0, 1, &obj_p[ 0 ] );
	ld	de, #_obj_p
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_palette
	add	sp, #4
;dscan.c:229: set_sprite_palette( OAMF_CGB_PAL1, 1, &obj_p[ 4 ] );
	ld	de, #(_obj_p + 8)
	push	de
	ld	hl, #0x101
	push	hl
	call	_set_sprite_palette
	add	sp, #4
;dscan.c:230: set_sprite_palette( OAMF_CGB_PAL2, 1, &obj_p[ 8 ] );
	ld	de, #(_obj_p + 16)
	push	de
	ld	hl, #0x102
	push	hl
	call	_set_sprite_palette
	add	sp, #4
;dscan.c:231: set_sprite_palette( OAMF_CGB_PAL3, 1, &obj_p[ 12 ] );
	ld	de, #(_obj_p + 24)
	push	de
	ld	hl, #0x103
	push	hl
	call	_set_sprite_palette
	add	sp, #4
;dscan.c:232: set_sprite_palette( OAMF_CGB_PAL4, 1, &obj_p[ 16 ] );
	ld	de, #(_obj_p + 32)
	push	de
	ld	hl, #0x104
	push	hl
	call	_set_sprite_palette
	add	sp, #4
;dscan.c:233: set_sprite_palette( OAMF_CGB_PAL5, 1, &obj_p[ 20 ] );
	ld	de, #(_obj_p + 40)
	push	de
	ld	hl, #0x105
	push	hl
	call	_set_sprite_palette
	add	sp, #4
;dscan.c:234: set_sprite_palette( OAMF_CGB_PAL6, 1, &obj_p[ 24 ] );
	ld	de, #(_obj_p + 48)
	push	de
	ld	hl, #0x106
	push	hl
	call	_set_sprite_palette
	add	sp, #4
;dscan.c:235: set_sprite_palette( OAMF_CGB_PAL7, 1, &obj_p[ 28 ] );
	ld	de, #(_obj_p + 56)
	push	de
	ld	hl, #0x107
	push	hl
	call	_set_sprite_palette
	add	sp, #4
;dscan.c:238: set_bkg_attr( 0, 0, 20, 18, bkg_c );
	ld	de, #_bkg_c
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	ld	e, a
	call	_set_bkg_attr
;dscan.c:239: set_bkg_tiles( 0, 0, 20, 18, bkg_c );
	ld	de, #_bkg_c
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
	jr	00103$
00102$:
;dscan.c:242: set_bkg_tiles( 0, 0, 20, 18, bkg_m );
	ld	de, #_bkg_m
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
00103$:
;dscan.c:245: pw = 50;
	ld	hl, #_pw
	ld	a, #0x32
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;dscan.c:246: set_bkg_data( 0, 96, bkg );
	ld	de, #_bkg
	push	de
	ld	hl, #0x6000
	push	hl
	call	_set_bkg_data
	add	sp, #4
;dscan.c:247: set_bkg_tiles( 0, 0, 3, 1, ( unsigned char * ) msg_1up );
	ld	hl, #_msg_1up
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #0x103
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;dscan.c:248: set_bkg_tiles( 16, 0, 2, 1, ( unsigned char * ) msg_lv );
	ld	hl, #_msg_lv
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #0x102
	push	hl
	ld	hl, #0x10
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;dscan.c:249: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;dscan.c:250: SPRITES_8x8;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfb
	ldh	(_LCDC_REG + 0), a
;dscan.c:251: set_sprite_data( 0, 128, fore );
	ld	de, #_fore
	push	de
	ld	hl, #0x8000
	push	hl
	call	_set_sprite_data
	add	sp, #4
;dscan.c:252: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;dscan.c:253: for( n = 0; n < 40; n++ ) {
	ld	c, #0x00
00107$:
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
	ld	(hl), #0x1e
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;dscan.c:253: for( n = 0; n < 40; n++ ) {
	inc	c
	ld	a, c
	sub	a, #0x28
	jr	C, 00107$
;dscan.c:257: }
	ret
;dscan.c:259: void init_player()
;	---------------------------------
; Function init_player
; ---------------------------------
_init_player::
;dscan.c:261: pf = 0; px = DEF_PX;
	ld	hl, #_pf
	ld	(hl), #0x00
	ld	hl, #_px
	ld	(hl), #0x50
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;dscan.c:263: set_sprite_attrb( 0, foreCGB[0] );
	ld	hl, #_foreCGB
	ld	e, (hl)
	xor	a, a
	call	_set_sprite_attrb
;dscan.c:264: move_sprite( 0, px, DEF_PY );
	ld	hl, #_px
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x28
	ld	(hl+), a
	ld	(hl), c
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x01
;dscan.c:266: set_sprite_attrb( 1, foreCGB[1] );
	ld	hl, #_foreCGB + 1
	ld	e, (hl)
	ld	a, #0x01
	call	_set_sprite_attrb
;dscan.c:267: move_sprite( 1, px+8, DEF_PY );
	ld	a, (#_px)
	add	a, #0x08
	ld	c, a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl), #0x28
	inc	hl
	ld	(hl), c
;dscan.c:267: move_sprite( 1, px+8, DEF_PY );
;dscan.c:268: }
	ret
;dscan.c:270: void init_tama()
;	---------------------------------
; Function init_tama
; ---------------------------------
_init_tama::
	add	sp, #-6
;dscan.c:274: for( i=0; i<MAX_TT; i++ ) {
	ldhl	sp,	#5
	ld	(hl), #0x00
00104$:
;dscan.c:275: tf[i] = 0;
	ld	de, #_tf
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;dscan.c:276: tx[i] = i*4+DEF_TX;
	ld	de, #_tx
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#5
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, #0x4a
	pop	hl
	push	hl
	ld	(hl), a
;dscan.c:277: ty[i] = DEF_TY;
	ld	de, #_ty
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x1a
;dscan.c:278: set_sprite_tile( i+DEF_TS, tf[i]+DEF_TC );
	ld	a, (bc)
	add	a, #0x02
	ld	e, a
	ldhl	sp,	#5
	ld	a, (hl-)
	add	a, #0x02
	ld	(hl), a
	ld	d, (hl)
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), e
;dscan.c:279: set_sprite_attrb( i+DEF_TS, foreCGB[tf[i]+DEF_TC] );
	ld	a, (bc)
	ld	b, #0x00
	ld	c, a
	inc	bc
	inc	bc
	ld	hl, #_foreCGB
	add	hl, bc
	ld	e, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	call	_set_sprite_attrb
;dscan.c:280: move_sprite( i+DEF_TS, tx[i], ty[i] );
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;dscan.c:274: for( i=0; i<MAX_TT; i++ ) {
	ldhl	sp,	#5
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x06
	jp	C, 00104$
;dscan.c:282: }
	add	sp, #6
	ret
;dscan.c:284: void init_enemy()
;	---------------------------------
; Function init_enemy
; ---------------------------------
_init_enemy::
	add	sp, #-7
;dscan.c:288: for( i=0; i<MAX_ET; i++ ) {
	ldhl	sp,	#6
	ld	(hl), #0x00
00106$:
;dscan.c:289: ef[i] = 0;
	ld	de, #_ef
	ldhl	sp,	#6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;dscan.c:290: ex[i] = 0;
	ld	de, #_ex
	ldhl	sp,	#6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	(hl), #0x00
	push	hl
;dscan.c:291: ey[i] = 0;
	ld	de, #_ey
	ldhl	sp,	#6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;dscan.c:292: set_sprite_tile( i*2+DEF_ES0, DEF_SP );
	ldhl	sp,	#6
	ld	a, (hl-)
	add	a, a
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x08
	ldhl	sp,	#2
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
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
	ld	(hl), #0x1e
;dscan.c:293: set_sprite_tile( i*2+DEF_ES1, DEF_SP );
	ldhl	sp,	#5
	ld	a, (hl-)
	dec	hl
	add	a, #0x09
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
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
	ld	(hl), #0x1e
;dscan.c:294: move_sprite( i*2+DEF_ES0, ex[i], ey[i] );
	ld	a, (bc)
	ldhl	sp,	#4
	ld	(hl+), a
	pop	de
	push	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#2
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	(de), a
	inc	de
;dscan.c:295: move_sprite( i*2+DEF_ES1, ex[i], ey[i] );
	ld	a, (hl-)
	dec	hl
	ld	(de), a
	ld	a, (bc)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;dscan.c:288: for( i=0; i<MAX_ET; i++ ) {
	ldhl	sp,	#6
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x0a
	jp	C, 00106$
;dscan.c:297: }
	add	sp, #7
	ret
;dscan.c:299: void init_kirai()
;	---------------------------------
; Function init_kirai
; ---------------------------------
_init_kirai::
	add	sp, #-4
;dscan.c:303: for( i = 0; i < MAX_KT; i++ ) {
	ld	c, #0x00
00104$:
;dscan.c:304: kf[ i ] = 0;
	ld	hl, #_kf
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;dscan.c:305: kx[ i ] = DEF_KX;
	ld	de, #_kx
	ld	l, c
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	(hl), #0x00
	push	hl
;dscan.c:306: ky[ i ] = DEF_KY;
	ld	a, #<(_ky)
	add	a, c
	ld	e, a
	ld	a, #>(_ky)
	adc	a, #0x00
	ld	d, a
	xor	a, a
	ld	(de), a
;dscan.c:307: set_sprite_tile( i + DEF_KS, DEF_SP );
	ld	a, c
	add	a, #0x1c
	ldhl	sp,	#2
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), #0x1e
;dscan.c:308: move_sprite( i + DEF_KS, kx[ i ], ky[ i ] );
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#3
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	(hl-), a
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	e, l
	ld	d, h
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(de), a
;dscan.c:303: for( i = 0; i < MAX_KT; i++ ) {
	inc	c
	ld	a, c
	sub	a, #0x0c
	jr	C, 00104$
;dscan.c:310: }
	add	sp, #4
	ret
;dscan.c:313: void player()
;	---------------------------------
; Function player
; ---------------------------------
_player::
	dec	sp
;dscan.c:319: key = joypad();
	call	_joypad
	ldhl	sp,	#0
	ld	(hl), a
;dscan.c:321: if( key & J_START ) {
	push	hl
	bit	7, (hl)
	pop	hl
	jp	Z,00136$
;dscan.c:322: if( pf == DEF_PF ) {
	ld	a, (#_pf)
	sub	a, #0x08
	jr	NZ, 00133$
;dscan.c:324: seed = DIV_REG;
	ldh	a, (_DIV_REG + 0)
	ld	c, a
	ld	b, #0x00
;dscan.c:325: waitpadup();
	call	_waitpadup
;dscan.c:326: seed |= ( ( uint16_t ) DIV_REG << 8 );
	ldh	a, (_DIV_REG + 0)
	ld	e, a
	xor	a, a
	or	a, c
	ld	c, a
	ld	a, e
	or	a, b
	ld	b, a
;dscan.c:327: initarand( seed );
	push	bc
	call	_initarand
	pop	hl
;dscan.c:328: hide_msg();
	call	_hide_msg
;dscan.c:329: init_score();
	call	_init_score
;dscan.c:330: init_player();
	call	_init_player
;dscan.c:331: init_tama();
	call	_init_tama
;dscan.c:332: init_enemy();
	call	_init_enemy
;dscan.c:333: init_kirai();
	call	_init_kirai
;dscan.c:334: delay( 500 );
	ld	de, #0x01f4
	inc	sp
	jp	_delay
	jp	00179$
00133$:
;dscan.c:337: show_pause();
	call	_show_pause
;dscan.c:338: waitpadup();
	call	_waitpadup
;dscan.c:339: key = joypad();
	call	_joypad
	ld	c, a
;dscan.c:340: while( !( key & J_START ) ) {
00129$:
	bit	7, c
	jp	NZ,00131$
;dscan.c:341: key = joypad();
	call	_joypad
	ld	c, a
;dscan.c:342: if( key & J_DOWN ) {
	bit	3, c
	jr	Z, 00127$
;dscan.c:343: if( pl > 0 )
	ld	hl, #_pl
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;dscan.c:344: pl--;
	dec	(hl)
00102$:
;dscan.c:345: show_level( pl );
	push	bc
	ld	a, (#_pl)
	call	_show_level
	pop	bc
;dscan.c:346: waitpadup();
	call	_waitpadup
	jr	00129$
00127$:
;dscan.c:348: else if( key & J_UP ) {
	bit	2, c
	jr	Z, 00124$
;dscan.c:349: if( pl < 8 )
	ld	hl, #_pl
	ld	a, (hl)
	sub	a, #0x08
	jr	NC, 00104$
;dscan.c:350: pl++;
	inc	(hl)
00104$:
;dscan.c:351: show_level( pl );
	push	bc
	ld	a, (#_pl)
	call	_show_level
	pop	bc
;dscan.c:352: waitpadup();
	call	_waitpadup
	jr	00129$
00124$:
;dscan.c:354: else if( key & J_LEFT ) {
	bit	1, c
	jr	Z, 00121$
;dscan.c:355: while( joypad() & J_LEFT ) {
00107$:
	call	_joypad
	bit	1, a
	jr	Z, 00109$
;dscan.c:356: if( pw > 0 )
	ld	hl, #_pw + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00106$
;dscan.c:357: pw--;
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	dec	de
	ld	(hl), e
	inc	hl
	ld	(hl), d
00106$:
;dscan.c:358: show_score( pw );
	push	bc
	ld	hl, #_pw
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_show_score
	ld	de, #0x00fa
	call	_delay
	pop	bc
	jr	00107$
00109$:
;dscan.c:361: show_score( ps );
	push	bc
	ld	hl, #_ps
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_show_score
	pop	bc
	jr	00129$
00121$:
;dscan.c:363: else if( key & J_RIGHT ) {
	bit	0, c
	jr	Z, 00118$
;dscan.c:364: while( joypad() & J_RIGHT ) {
00112$:
	call	_joypad
	rrca
	jr	NC, 00114$
;dscan.c:365: if( pw < 99 )
	ld	hl, #_pw
	ld	a, (hl+)
	ld	b, a
	ld	e, (hl)
	sub	a, #0x63
	ld	a, e
	sbc	a, #0x00
	jr	NC, 00111$
;dscan.c:366: pw++;
	dec	hl
	inc	(hl)
	jr	NZ, 00352$
	inc	hl
	inc	(hl)
00352$:
00111$:
;dscan.c:367: show_score( pw );
	push	bc
	ld	hl, #_pw
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_show_score
	ld	de, #0x00fa
	call	_delay
	pop	bc
	jr	00112$
00114$:
;dscan.c:370: show_score( ps );
	push	bc
	ld	hl, #_ps
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_show_score
	pop	bc
	jp	00129$
00118$:
;dscan.c:372: else if( key & J_SELECT ) {
	bit	6, c
	jp	Z,00129$
;dscan.c:373: i = k_right;
	ld	hl, #_k_right
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
;dscan.c:374: k_right = k_left;
	ld	a, (_k_left)
	ld	(_k_right), a
;dscan.c:375: k_left = i;
	ld	a, l
	ld	(_k_left), a
;dscan.c:376: waitpadup();
	call	_waitpadup
	jp	00129$
00131$:
;dscan.c:379: waitpadup();
	call	_waitpadup
;dscan.c:380: hide_msg();
	call	_hide_msg
;dscan.c:381: delay( 500 );
	ld	de, #0x01f4
	inc	sp
;dscan.c:383: return;
	jp	_delay
00136$:
;dscan.c:387: if( pf > 1 ) {
	ld	a, #0x01
	ld	hl, #_pf
	sub	a, (hl)
	jr	NC, 00141$
;dscan.c:388: if( pf < DEF_PF ) {
	ld	a, (hl)
	sub	a, #0x08
	jr	NC, 00138$
;dscan.c:389: set_sprite_tile( 0, pf * 2 + DEF_PC0 );
	ld	a, (hl)
	add	a, a
	add	a, #0x0e
	ld	c, a
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;dscan.c:390: set_sprite_attrb( 0, foreCGB[ pf * 2 + DEF_PC0 ] );
	ld	hl, #_pf
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	bc, #0x000e
	add	hl, bc
	ld	de, #_foreCGB
	add	hl, de
	ld	e, (hl)
	xor	a, a
	call	_set_sprite_attrb
;dscan.c:391: set_sprite_tile( 1, pf * 2 + DEF_PC1 );
	ld	a, (#_pf)
	add	a, a
	add	a, #0x0f
	ld	c, a
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), c
;dscan.c:392: set_sprite_attrb( 1, foreCGB[ pf * 2 + DEF_PC1 ] );
	ld	hl, #_pf
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	bc, #0x000f
	add	hl, bc
	ld	de, #_foreCGB
	add	hl, de
	ld	e, (hl)
	ld	a, #0x01
	call	_set_sprite_attrb
;dscan.c:393: pf++;
	ld	hl, #_pf
	inc	(hl)
	jp	00179$
00138$:
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x1e
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x1e
;dscan.c:398: show_gover();
	inc	sp
;dscan.c:400: return;
	jp	_show_gover
00141$:
;dscan.c:404: if( ( key&J_LEFT ) && ( px > MIN_PX ) ) {
	push	hl
	ldhl	sp,	#2
	bit	1, (hl)
	pop	hl
	jr	Z, 00146$
	ld	a, #0x30
	ld	hl, #_px
	sub	a, (hl)
	jr	NC, 00146$
;dscan.c:405: px--;
	dec	(hl)
;dscan.c:406: move_sprite( 0, px, DEF_PY ); move_sprite( 1, px + 8, DEF_PY );
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x28
	ld	(hl+), a
	ld	(hl), c
;dscan.c:406: move_sprite( 0, px, DEF_PY ); move_sprite( 1, px + 8, DEF_PY );
	ld	a, (#_px)
	add	a, #0x08
	ld	c, a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x28
	ld	(hl+), a
	ld	(hl), c
;dscan.c:406: move_sprite( 0, px, DEF_PY ); move_sprite( 1, px + 8, DEF_PY );
	jr	00147$
00146$:
;dscan.c:408: else if( ( key&J_RIGHT ) && ( px < MAX_PX ) ) {
	push	hl
	ldhl	sp,	#2
	bit	0, (hl)
	pop	hl
	jr	Z, 00147$
	ld	hl, #_px
	ld	a, (hl)
	sub	a, #0x70
	jr	NC, 00147$
;dscan.c:409: px++;
	inc	(hl)
;dscan.c:410: move_sprite( 0, px, DEF_PY ); move_sprite( 1, px + 8, DEF_PY );
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x28
	ld	(hl+), a
	ld	(hl), c
;dscan.c:410: move_sprite( 0, px, DEF_PY ); move_sprite( 1, px + 8, DEF_PY );
	ld	a, (#_px)
	add	a, #0x08
	ld	c, a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x28
	ld	(hl+), a
	ld	(hl), c
;dscan.c:410: move_sprite( 0, px, DEF_PY ); move_sprite( 1, px + 8, DEF_PY );
00147$:
;dscan.c:413: if( key & k_left ) {  /* change J_B to J_A */
	ldhl	sp,	#0
	ld	a, (hl)
	ld	hl, #_k_left
	and	a,(hl)
	jr	Z, 00165$
;dscan.c:414: if( pf == 0 ) {
	ld	hl, #_pf
	ld	a, (hl)
	or	a, a
	jp	NZ, 00179$
;dscan.c:415: pf = 1;
	ld	(hl), #0x01
;dscan.c:416: for( i = 0; i < MAX_TT; i++ ) {
	ld	c, #0x00
	ld	e, c
00175$:
;dscan.c:417: if( tf[ i ] == 0 ) {
	ld	hl, #_tf
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00176$
;dscan.c:418: tf[ i ] = 1; tx[ i ] = px - 4; ty[ i ] = DEF_PY;
	ld	(hl), #0x01
	ld	a, #<(_tx)
	add	a, c
	ld	e, a
	ld	a, #>(_tx)
	adc	a, #0x00
	ld	d, a
	ld	a, (#_px)
	add	a, #0xfc
	ld	(de), a
	ld	hl, #_ty
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x28
;dscan.c:419: break;
	jr	00179$
00176$:
;dscan.c:416: for( i = 0; i < MAX_TT; i++ ) {
	inc	e
	ld	a,e
	ld	c,a
	sub	a, #0x06
	jr	C, 00175$
	jr	00179$
00165$:
;dscan.c:424: else if( key & k_right ) {  /* change J_A to J_B */
	ldhl	sp,	#0
	ld	a, (hl)
	ld	hl, #_k_right
	and	a,(hl)
	jr	Z, 00162$
;dscan.c:425: if( pf == 0 ) {
	ld	hl, #_pf
	ld	a, (hl)
	or	a, a
	jr	NZ, 00179$
;dscan.c:426: pf = 1;
	ld	(hl), #0x01
;dscan.c:427: for( i = 0; i < MAX_TT; i++ ) {
	ld	c, #0x00
	ld	e, c
00177$:
;dscan.c:428: if( tf[ i ] == 0 ) {
	ld	hl, #_tf
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00178$
;dscan.c:429: tf[ i ] = 1; tx[ i ] = px + 12; ty[ i ] = DEF_PY;
	ld	(hl), #0x01
	ld	a, #<(_tx)
	add	a, c
	ld	e, a
	ld	a, #>(_tx)
	adc	a, #0x00
	ld	d, a
	ld	a, (#_px)
	add	a, #0x0c
	ld	(de), a
	ld	hl, #_ty
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x28
;dscan.c:430: break;
	jr	00179$
00178$:
;dscan.c:427: for( i = 0; i < MAX_TT; i++ ) {
	inc	e
	ld	a,e
	ld	c,a
	sub	a, #0x06
	jr	C, 00177$
	jr	00179$
00162$:
;dscan.c:435: else if( pf == 1 ) {
	ld	a, (#_pf)
	dec	a
	jr	NZ, 00179$
;dscan.c:436: pf = 0;
	ld	hl, #_pf
	ld	(hl), #0x00
00179$:
;dscan.c:438: }
	inc	sp
	ret
;dscan.c:441: void bombs()
;	---------------------------------
; Function bombs
; ---------------------------------
_bombs::
	add	sp, #-9
;dscan.c:445: for( i = 0; i < MAX_TT; i++ ) {
	ldhl	sp,	#8
	ld	(hl), #0x00
00109$:
;dscan.c:446: if( tf[ i ] != 0 ) {
	ld	de, #_tf
	ldhl	sp,	#8
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00110$
;dscan.c:447: ty[ i ]++;
	inc	hl
	ld	de, #_ty
	ld	l, (hl)
	ld	h, #0x00
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
	ld	c, a
	inc	c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
;dscan.c:448: if( ty[ i ] > MAX_TY ) {
	ld	a, #0x90
	sub	a, c
	jr	NC, 00102$
;dscan.c:449: tf[ i ] = 0; tx[ i ] = i * 4 + DEF_TX; ty[ i ] = DEF_TY;
	pop	hl
	ld	(hl), #0x00
	push	hl
	ld	de, #_tx
	ldhl	sp,	#8
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, #0x4a
	ld	(bc), a
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x1a
	jr	00103$
00102$:
;dscan.c:452: tf[ i ] = 3 - tf[ i ];
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	ld	a, #0x03
	sub	a, c
	ld	c, a
	pop	hl
	push	hl
	ld	(hl), c
00103$:
;dscan.c:454: set_sprite_tile( i + DEF_TS, tf[ i ] + DEF_TC );
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x02
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, #0x02
	ldhl	sp,	#5
	ld	(hl), a
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	de, #_shadow_OAM+0
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ldhl	sp,	#6
	ld	a, c
	ld	(hl+), a
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
;dscan.c:455: set_sprite_attrb( i + DEF_TS, foreCGB[ tf[ i ] + DEF_TC ] );
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (hl-)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #_foreCGB
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
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ld	a, (hl-)
	dec	hl
	ld	e, a
	ld	a, (hl)
	call	_set_sprite_attrb
;dscan.c:456: move_sprite( i + DEF_TS, tx[ i ], ty[ i ] );
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl+), a
	ld	de, #_tx
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	ld	a, #0x02
00129$:
	ldhl	sp,	#4
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00129$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
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
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
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
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(de), a
;dscan.c:456: move_sprite( i + DEF_TS, tx[ i ], ty[ i ] );
00110$:
;dscan.c:445: for( i = 0; i < MAX_TT; i++ ) {
	ldhl	sp,	#8
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x06
	jp	C, 00109$
;dscan.c:459: }
	add	sp, #9
	ret
;dscan.c:462: void enemys()
;	---------------------------------
; Function enemys
; ---------------------------------
_enemys::
	add	sp, #-19
;dscan.c:466: for( i = 0; i < MAX_ET; i++ ) {
	ldhl	sp,	#17
	ld	(hl), #0x00
00319$:
;dscan.c:467: if( ef[ i ] == 1 ) {
	ld	de, #_ef
	ldhl	sp,	#17
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;dscan.c:473: set_sprite_tile( i * 2 + DEF_ES0, DEF_SP );
	ldhl	sp,	#17
	ld	a, (hl-)
	add	a, a
	ld	(hl), a
	ld	a, (hl+)
	inc	hl
	add	a, #0x08
	ld	(hl), a
;dscan.c:467: if( ef[ i ] == 1 ) {
	ldhl	sp,	#13
	ld	a, (hl)
	dec	a
	jp	NZ,00240$
;dscan.c:469: ex[ i ]--;
	ld	de, #_ex
	ldhl	sp,	#17
	ld	l, (hl)
	ld	h, #0x00
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
	ld	c, a
	dec	c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
;dscan.c:470: if( ( pl > 0 ) && ( ey[ i ] < SPEED_EY ) )  ex[ i ]--;
	ld	a, (#_pl)
	or	a, a
	jr	Z, 00102$
	ld	de, #_ey
	ldhl	sp,	#17
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	sub	a, #0x52
	jr	NC, 00102$
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	dec	c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
00102$:
;dscan.c:469: ex[ i ]--;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;dscan.c:471: if( ex[ i ] <= MIN_EX ) {
	ld	a, #0x04
	sub	a, c
	jr	C, 00145$
;dscan.c:472: ef[ i ] = 0;
	ldhl	sp,	#14
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;dscan.c:473: set_sprite_tile( i * 2 + DEF_ES0, DEF_SP );
	ldhl	sp,	#18
	ld	e, (hl)
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	bc, #_shadow_OAM+0
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x1e
;dscan.c:474: set_sprite_tile( i * 2 + DEF_ES1, DEF_SP );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
	ld	e, a
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	bc, #_shadow_OAM+0
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x1e
;dscan.c:474: set_sprite_tile( i * 2 + DEF_ES1, DEF_SP );
	jp	00320$
00145$:
;dscan.c:478: if( ex[ i ] < MIN_SX * 8 + 13 ) {
	ld	a, c
	sub	a, #0x35
	jr	NC, 00120$
;dscan.c:479: set_sprite_tile( i * 2 + DEF_ES0, DEF_1EC0 );
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x20
;dscan.c:480: set_sprite_tile( i * 2 + DEF_ES1, DEF_1EC1 );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x30
;dscan.c:480: set_sprite_tile( i * 2 + DEF_ES1, DEF_1EC1 );
	jp	00121$
00120$:
;dscan.c:482: else if( ex[ i ] < MIN_SX * 8 + 20 ) {
	ld	a, c
	sub	a, #0x3c
	jr	NC, 00117$
;dscan.c:483: set_sprite_tile( i * 2 + DEF_ES0, DEF_1EC0 );
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x20
;dscan.c:484: set_sprite_tile( i * 2 + DEF_ES1, DEF_1EC1 + ( ex[ i ] - MIN_SX * 8 - 13 ) );
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xfb
	ld	c, a
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
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
;dscan.c:484: set_sprite_tile( i * 2 + DEF_ES1, DEF_1EC1 + ( ex[ i ] - MIN_SX * 8 - 13 ) );
	jp	00121$
00117$:
;dscan.c:487: set_sprite_tile( i * 2 + DEF_ES0, DEF_1EC0 + ( ex[ i ] - MIN_SX * 8 - 20 ) );
	ld	b, c
;dscan.c:486: else if( ex[ i ] < MIN_SX * 8 + 28 ) {
	ld	a, c
	sub	a, #0x44
	jr	NC, 00114$
;dscan.c:487: set_sprite_tile( i * 2 + DEF_ES0, DEF_1EC0 + ( ex[ i ] - MIN_SX * 8 - 20 ) );
	ld	a, b
	add	a, #0xe4
	ld	c, a
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
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
;dscan.c:488: set_sprite_tile( i * 2 + DEF_ES1, DEF_1EC1 + 8 );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x38
;dscan.c:488: set_sprite_tile( i * 2 + DEF_ES1, DEF_1EC1 + 8 );
	jp	00121$
00114$:
;dscan.c:490: else if( ex[ i ] < MAX_SX * 8 + 13 ) {
	ld	a, c
	sub	a, #0x85
	jr	NC, 00111$
;dscan.c:491: set_sprite_tile( i * 2 + DEF_ES0, DEF_1EC0 + 8 );
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x28
;dscan.c:492: set_sprite_tile( i * 2 + DEF_ES1, DEF_1EC1 + 8 );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x38
;dscan.c:492: set_sprite_tile( i * 2 + DEF_ES1, DEF_1EC1 + 8 );
	jr	00121$
00111$:
;dscan.c:494: else if( ex[ i ] < MAX_SX * 8 + 20 ) {
	ld	a, c
	sub	a, #0x8c
	jr	NC, 00108$
;dscan.c:495: set_sprite_tile( i * 2 + DEF_ES0, DEF_1EC0 + 8 );
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x28
;dscan.c:496: set_sprite_tile( i * 2 + DEF_ES1, DEF_1EC1 + ( ex[ i ] - MAX_SX * 8 - 12 ) + 7 );
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xb3
	ld	c, a
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
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
;dscan.c:496: set_sprite_tile( i * 2 + DEF_ES1, DEF_1EC1 + ( ex[ i ] - MAX_SX * 8 - 12 ) + 7 );
	jr	00121$
00108$:
;dscan.c:498: else if( ex[ i ] < MAX_SX * 8 + 28 ) {
	ld	a, c
	sub	a, #0x94
	jr	NC, 00105$
;dscan.c:499: set_sprite_tile( i * 2 + DEF_ES0, DEF_1EC0 + ( ex[ i ] - MAX_SX * 8 - 20 ) + 8 );
	ld	a, b
	add	a, #0x9c
	ld	c, a
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	de, #_shadow_OAM+0
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
;dscan.c:500: set_sprite_tile( i * 2 + DEF_ES1, DEF_1EC1 );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x30
;dscan.c:500: set_sprite_tile( i * 2 + DEF_ES1, DEF_1EC1 );
	jr	00121$
00105$:
;dscan.c:503: set_sprite_tile( i * 2 + DEF_ES0, DEF_1EC0 );
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x20
;dscan.c:504: set_sprite_tile( i * 2 + DEF_ES1, DEF_1EC1 );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x30
;dscan.c:504: set_sprite_tile( i * 2 + DEF_ES1, DEF_1EC1 );
00121$:
;dscan.c:507: move_sprite( i * 2 + DEF_ES0, ex[ i ] - SUB_EX0, ey[ i ] );
	ld	de, #_ey
	ldhl	sp,	#17
	ld	l, (hl)
	ld	h, #0x00
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
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xec
	ldhl	sp,	#15
	ld	(hl+), a
	inc	hl
	ld	a, (hl+)
	add	a, a
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x08
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	ldhl	sp,	#16
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
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
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;dscan.c:508: move_sprite( i * 2 + DEF_ES1, ex[ i ] - SUB_EX1, ey[ i ] );
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xf4
	ldhl	sp,	#16
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	add	a, #0x09
	ldhl	sp,	#7
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#16
	ld	a, (hl)
	ld	(bc), a
;dscan.c:510: for( j = 0; j < MAX_TT; j++ ) {
	ldhl	sp,	#6
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	ldhl	sp,	#18
	ld	(hl), #0x00
00315$:
;dscan.c:511: if( tf[ j ] != 0 ) {
	ld	de, #_tf
	ldhl	sp,	#18
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jp	Z, 00316$
;dscan.c:512: if( ( ty[ j ] > ey[ i ] - 2 ) && ( ty[ j ] < ey[ i ] + 2 ) ) {
	ld	de, #_ty
	ldhl	sp,	#18
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,#4
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	c, a
	pop	af
	ldhl	sp,	#0
	ld	(hl), c
	inc	hl
	ld	(hl), #0x00
	pop	bc
	push	bc
	dec	bc
	dec	bc
	ldhl	sp,	#15
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00700$
	bit	7, d
	jr	NZ, 00701$
	cp	a, a
	jr	00701$
00700$:
	bit	7, d
	jr	Z, 00701$
	scf
00701$:
	jp	NC, 00316$
	pop	bc
	push	bc
	inc	bc
	inc	bc
	ldhl	sp,	#15
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00702$
	bit	7, d
	jr	NZ, 00703$
	cp	a, a
	jr	00703$
00702$:
	bit	7, d
	jr	Z, 00703$
	scf
00703$:
	jp	NC, 00316$
;dscan.c:513: if( ( tx[ j ] > ( ex[ i ] - SUB_EX0 - 5 ) ) && ( tx[ j ] < ( ex[ i ] - SUB_EX1 + 5 ) ) ) {
	ld	de, #_tx
	ldhl	sp,	#18
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;dscan.c:469: ex[ i ]--;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
;dscan.c:513: if( ( tx[ j ] > ( ex[ i ] - SUB_EX0 - 5 ) ) && ( tx[ j ] < ( ex[ i ] - SUB_EX1 + 5 ) ) ) {
	ld	e, a
	ld	d, #0x00
	ld	a, e
	add	a, #0xe7
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	adc	a, #0xff
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	b, #0x00
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	jp	NC, 00316$
	ld	hl, #0xfff9
	add	hl, de
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jp	NC, 00316$
;dscan.c:515: tf[ j ] = 0; tx[ j ] = j * 4 + DEF_TX; ty[ j ] = DEF_TY;
	ldhl	sp,	#10
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	ldhl	sp,	#18
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, #0x4a
	ld	c, a
	ldhl	sp,	#14
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	ldhl	sp,	#12
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x1a
;dscan.c:516: set_sprite_tile( j + DEF_TS, tf[ j ] + DEF_TC );
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x02
	ld	c, a
	ldhl	sp,	#18
	ld	a, (hl-)
	dec	hl
	add	a, #0x02
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
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
;dscan.c:517: set_sprite_attrb( j + DEF_TS, foreCGB[ tf[ j ] + DEF_TC ] );
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, #0x00
	ld	c, a
	inc	bc
	inc	bc
	ld	hl, #_foreCGB
	add	hl, bc
	ld	e, (hl)
	ldhl	sp,	#16
	ld	a, (hl)
	call	_set_sprite_attrb
;dscan.c:518: move_sprite( j + DEF_TS, tx[ j ], ty[ j ] );
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;dscan.c:519: ef[ i ] = 3;
	ld	de, #_ef
	ldhl	sp,	#17
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	(hl), #0x03
;dscan.c:520: set_sprite_tile( i * 2 + DEF_ES0, ef[ i ] * 2 + DEF_BC1 );
	ld	a, (bc)
	add	a, a
	add	a, #0x04
	ld	e, a
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#8
	ld	l, (hl)
	ld	d, #0x00
	ld	h, d
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), e
;dscan.c:521: set_sprite_attrb( i * 2 + DEF_ES0, foreCGB[ ef[ i ] * 2 + DEF_BC1 ] );
	ld	a, (bc)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	de, #_foreCGB
	add	hl, de
	ld	e, (hl)
	push	bc
	ldhl	sp,	#8
	ld	a, (hl)
	call	_set_sprite_attrb
	pop	bc
;dscan.c:522: set_sprite_tile( i * 2 + DEF_ES1, ef[ i ] * 2 + DEF_BC2 );
	ld	a, (bc)
	add	a, a
	add	a, #0x05
	ld	e, a
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#9
	ld	l, (hl)
	ld	d, #0x00
	ld	h, d
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), e
;dscan.c:523: set_sprite_attrb( i * 2 + DEF_ES1, foreCGB[ ef[ i ] * 2 + DEF_BC2 ] );
	ld	a, (bc)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	bc, #0x0005
	add	hl, bc
	ld	de, #_foreCGB
	add	hl, de
	ld	e, (hl)
	ldhl	sp,	#7
	ld	a, (hl)
	call	_set_sprite_attrb
00316$:
;dscan.c:510: for( j = 0; j < MAX_TT; j++ ) {
	ldhl	sp,	#18
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x06
	jp	C, 00315$
;dscan.c:528: if( make_rnd( rnd_kirai ) == 0 ) {
	ld	a, (#_rnd_kirai)
	call	_make_rnd
	or	a, a
	jp	NZ, 00320$
;dscan.c:469: ex[ i ]--;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
;dscan.c:513: if( ( tx[ j ] > ( ex[ i ] - SUB_EX0 - 5 ) ) && ( tx[ j ] < ( ex[ i ] - SUB_EX1 + 5 ) ) ) {
	ld	c, a
	ld	b, #0x00
	ld	a, c
;dscan.c:529: if( ( ( ex[ i ] - SUB_EX0 ) > MIN_PX ) && ( ( ex[ i ] - SUB_EX0 ) < MAX_PX ) ) {
	add	a, #0xec
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	a, #0x30
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jp	NC, 00320$
	ld	a, c
	sub	a, #0x70
	ld	a, b
	sbc	a, #0x00
	jp	NC, 00320$
;dscan.c:530: if( kf[ i ] == 0 ) {
	ld	de, #_kf
	ldhl	sp,	#17
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	NZ, 00137$
;dscan.c:532: kf[ i ] = 1;
	ld	a, #0x01
	ld	(bc), a
;dscan.c:533: kx[ i ] = ex[ i ] - SUB_EX0 + 4;
	ld	de, #_kx
	ldhl	sp,	#17
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xf0
	ld	(bc), a
;dscan.c:534: ky[ i ] = ey[ i ] - 4;
	ld	de, #_ky
	ldhl	sp,	#17
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xfc
	ld	(bc), a
	jp	00320$
00137$:
;dscan.c:536: else if( kf[ i + 1 ] == 0 ) {
	ldhl	sp,	#17
	ld	e, (hl)
	ld	a, e
	inc	a
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	hl, #_kf
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	NZ, 00134$
;dscan.c:538: kf[ i + 1 ] = 1;
	ld	(hl), #0x01
;dscan.c:539: kx[ i + 1 ] = ex[ i ] - SUB_EX0 + 4;
	ld	hl, #_kx
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xf0
	ldhl	sp,	#15
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;dscan.c:540: ky[ i + 1 ] = ey[ i ] - 4;
	ld	hl, #_ky
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xfc
	ld	(bc), a
	jp	00320$
00134$:
;dscan.c:542: else if( kf[ i + 2 ] == 0 ) {
	ld	a, e
	inc	a
	inc	a
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	hl, #_kf
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	NZ, 00320$
;dscan.c:544: kf[ i + 2 ] = 1;
	ld	(hl), #0x01
;dscan.c:545: kx[ i + 2 ] = ex[ i ] - SUB_EX0 + 4;
	ld	hl, #_kx
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xf0
	ldhl	sp,	#15
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;dscan.c:546: ky[ i + 2 ] = ey[ i ] - 4;
	ld	hl, #_ky
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xfc
	ld	(bc), a
	jp	00320$
00240$:
;dscan.c:563: if( i == 9 ) {
	ldhl	sp,	#17
	ld	a, (hl)
	sub	a, #0x09
	ld	a, #0x01
	jr	Z, 00705$
	xor	a, a
00705$:
	ldhl	sp,	#11
;dscan.c:552: else if( ef[ i ] == 2 ) {
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	sub	a, #0x02
	jp	NZ,00237$
;dscan.c:554: ex[ i ]++;
	ld	de, #_ex
	ldhl	sp,	#17
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
;dscan.c:555: if( ( pl > 0 ) && ( ey[ i ] < SPEED_EY ) )  ex[ i ]++;
	ld	a, (#_pl)
	or	a, a
	jr	Z, 00148$
	ld	de, #_ey
	ldhl	sp,	#17
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	sub	a, #0x52
	jr	NC, 00148$
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
00148$:
;dscan.c:554: ex[ i ]++;
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#12
	ld	(hl), a
;dscan.c:556: if( ex[ i ] >= MAX_EX ) {
	ld	a, (hl)
	sub	a, #0xc8
	jr	C, 00212$
;dscan.c:557: ef[ i ] = 0;
	inc	hl
	inc	hl
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;dscan.c:558: set_sprite_tile( i * 2 + DEF_ES0, DEF_SP );
	ldhl	sp,	#18
	ld	e, (hl)
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	bc, #_shadow_OAM+0
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x1e
;dscan.c:559: set_sprite_tile( i * 2 + DEF_ES1, DEF_SP );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
	ld	e, a
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	bc, #_shadow_OAM+0
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x1e
;dscan.c:559: set_sprite_tile( i * 2 + DEF_ES1, DEF_SP );
	jp	00320$
00212$:
;dscan.c:564: if( ex[ i ] < MIN_SX * 8 + 13 ) {
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, #0x35
	ld	a, #0x00
	rla
	ld	c, a
;dscan.c:568: else if( ex[ i ] < MIN_SX * 8 + 20 ) {
	ld	a, (hl)
	sub	a, #0x3c
	ld	a, #0x00
	rla
	ld	b, a
;dscan.c:572: else if( ex[ i ] < MIN_SX * 8 + 28 ) {
	ld	a, (hl+)
	sub	a, #0x44
	ld	a, #0x00
	rla
;dscan.c:573: set_sprite_tile( i * 2 + DEF_ES0, DEF_XEC0 + ( ex[ i ] - MIN_SX * 8 - 20 ) );
	ld	(hl-), a
	ld	e, (hl)
;dscan.c:576: else if( ex[ i ] < MAX_SX * 8 + 13 ) {
	ld	a, (hl+)
	inc	hl
	sub	a, #0x85
	ld	a, #0x00
	rla
;dscan.c:580: else if( ex[ i ] < MAX_SX * 8 + 20 ) {
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	sub	a, #0x8c
	ld	a, #0x00
	rla
	ldhl	sp,	#15
	ld	(hl), a
;dscan.c:584: else if( ex[ i ] < MAX_SX * 8 + 28 ) {
	ldhl	sp,	#12
;dscan.c:563: if( i == 9 ) {
	ld	a, (hl-)
	sub	a, #0x94
	ld	a, #0x00
	rla
	ld	d, a
	ld	a, (hl)
	or	a, a
	jp	Z, 00187$
;dscan.c:564: if( ex[ i ] < MIN_SX * 8 + 13 ) {
	ld	a, c
	or	a, a
	jr	Z, 00166$
;dscan.c:565: set_sprite_tile( i * 2 + DEF_ES0, DEF_XEC0 );
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x60
;dscan.c:566: set_sprite_tile( i * 2 + DEF_ES1, DEF_XEC1 );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x70
;dscan.c:566: set_sprite_tile( i * 2 + DEF_ES1, DEF_XEC1 );
	jp	00188$
00166$:
;dscan.c:568: else if( ex[ i ] < MIN_SX * 8 + 20 ) {
	ld	a, b
	or	a, a
	jr	Z, 00163$
;dscan.c:569: set_sprite_tile( i * 2 + DEF_ES0, DEF_XEC0 );
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x60
;dscan.c:570: set_sprite_tile( i * 2 + DEF_ES1, DEF_XEC1 + ( ex[ i ] - MIN_SX * 8 - 13 ) );
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x3b
	ld	c, a
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	de, #_shadow_OAM+0
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
;dscan.c:570: set_sprite_tile( i * 2 + DEF_ES1, DEF_XEC1 + ( ex[ i ] - MIN_SX * 8 - 13 ) );
	jp	00188$
00163$:
;dscan.c:572: else if( ex[ i ] < MIN_SX * 8 + 28 ) {
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	Z, 00160$
;dscan.c:573: set_sprite_tile( i * 2 + DEF_ES0, DEF_XEC0 + ( ex[ i ] - MIN_SX * 8 - 20 ) );
	ld	a, e
	add	a, #0x24
	ld	c, a
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	de, #_shadow_OAM+0
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
;dscan.c:574: set_sprite_tile( i * 2 + DEF_ES1, DEF_XEC1 + 8 );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x78
;dscan.c:574: set_sprite_tile( i * 2 + DEF_ES1, DEF_XEC1 + 8 );
	jp	00188$
00160$:
;dscan.c:576: else if( ex[ i ] < MAX_SX * 8 + 13 ) {
	ldhl	sp,	#14
	ld	a, (hl)
	or	a, a
	jr	Z, 00157$
;dscan.c:577: set_sprite_tile( i * 2 + DEF_ES0, DEF_XEC0 + 8 );
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x68
;dscan.c:578: set_sprite_tile( i * 2 + DEF_ES1, DEF_XEC1 + 8 );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x78
;dscan.c:578: set_sprite_tile( i * 2 + DEF_ES1, DEF_XEC1 + 8 );
	jp	00188$
00157$:
;dscan.c:580: else if( ex[ i ] < MAX_SX * 8 + 20 ) {
	ldhl	sp,	#15
	ld	a, (hl)
	or	a, a
	jr	Z, 00154$
;dscan.c:581: set_sprite_tile( i * 2 + DEF_ES0, DEF_XEC0 + 8 );
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x68
;dscan.c:582: set_sprite_tile( i * 2 + DEF_ES1, DEF_XEC1 + ( ex[ i ] - MAX_SX * 8 - 12 ) + 7 );
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xf3
	ld	c, a
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	de, #_shadow_OAM+0
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
;dscan.c:582: set_sprite_tile( i * 2 + DEF_ES1, DEF_XEC1 + ( ex[ i ] - MAX_SX * 8 - 12 ) + 7 );
	jp	00188$
00154$:
;dscan.c:584: else if( ex[ i ] < MAX_SX * 8 + 28 ) {
	ld	a, d
	or	a, a
	jr	Z, 00151$
;dscan.c:585: set_sprite_tile( i * 2 + DEF_ES0, DEF_XEC0 + ( ex[ i ] - MAX_SX * 8 - 20 ) + 8 );
	ld	a, e
	add	a, #0xdc
	ld	c, a
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	de, #_shadow_OAM+0
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
;dscan.c:586: set_sprite_tile( i * 2 + DEF_ES1, DEF_XEC1 );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x70
;dscan.c:586: set_sprite_tile( i * 2 + DEF_ES1, DEF_XEC1 );
	jp	00188$
00151$:
;dscan.c:589: set_sprite_tile( i * 2 + DEF_ES0, DEF_XEC0 );
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x60
;dscan.c:590: set_sprite_tile( i * 2 + DEF_ES1, DEF_XEC1 );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x70
;dscan.c:590: set_sprite_tile( i * 2 + DEF_ES1, DEF_XEC1 );
	jp	00188$
00187$:
;dscan.c:594: if( ex[ i ] < MIN_SX * 8 + 13 ) {
	ld	a, c
	or	a, a
	jr	Z, 00184$
;dscan.c:595: set_sprite_tile( i * 2 + DEF_ES0, DEF_2EC0 );
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x40
;dscan.c:596: set_sprite_tile( i * 2 + DEF_ES1, DEF_2EC1 );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x50
;dscan.c:596: set_sprite_tile( i * 2 + DEF_ES1, DEF_2EC1 );
	jp	00188$
00184$:
;dscan.c:598: else if( ex[ i ] < MIN_SX * 8 + 20 ) {
	ld	a, b
	or	a, a
	jr	Z, 00181$
;dscan.c:599: set_sprite_tile( i * 2 + DEF_ES0, DEF_2EC0 );
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x40
;dscan.c:600: set_sprite_tile( i * 2 + DEF_ES1, DEF_2EC1 + ( ex[ i ] - MIN_SX * 8 - 13 ) );
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x1b
	ld	c, a
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	de, #_shadow_OAM+0
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
;dscan.c:600: set_sprite_tile( i * 2 + DEF_ES1, DEF_2EC1 + ( ex[ i ] - MIN_SX * 8 - 13 ) );
	jp	00188$
00181$:
;dscan.c:602: else if( ex[ i ] < MIN_SX * 8 + 28 ) {
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	Z, 00178$
;dscan.c:603: set_sprite_tile( i * 2 + DEF_ES0, DEF_2EC0 + ( ex[ i ] - MIN_SX * 8 - 20 ) );
	inc	e
	inc	e
	inc	e
	inc	e
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), e
;dscan.c:604: set_sprite_tile( i * 2 + DEF_ES1, DEF_2EC1 + 8 );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x58
;dscan.c:604: set_sprite_tile( i * 2 + DEF_ES1, DEF_2EC1 + 8 );
	jp	00188$
00178$:
;dscan.c:606: else if( ex[ i ] < MAX_SX * 8 + 13 ) {
	ldhl	sp,	#14
	ld	a, (hl)
	or	a, a
	jr	Z, 00175$
;dscan.c:607: set_sprite_tile( i * 2 + DEF_ES0, DEF_2EC0 + 8 );
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x48
;dscan.c:608: set_sprite_tile( i * 2 + DEF_ES1, DEF_2EC1 + 8 );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x58
;dscan.c:608: set_sprite_tile( i * 2 + DEF_ES1, DEF_2EC1 + 8 );
	jr	00188$
00175$:
;dscan.c:610: else if( ex[ i ] < MAX_SX * 8 + 20 ) {
	ldhl	sp,	#15
	ld	a, (hl)
	or	a, a
	jr	Z, 00172$
;dscan.c:611: set_sprite_tile( i * 2 + DEF_ES0, DEF_2EC0 + 8 );
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x48
;dscan.c:612: set_sprite_tile( i * 2 + DEF_ES1, DEF_2EC1 + ( ex[ i ] - MAX_SX * 8 - 12 ) + 7 );
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xd3
	ld	c, a
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	de, #_shadow_OAM+0
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
;dscan.c:612: set_sprite_tile( i * 2 + DEF_ES1, DEF_2EC1 + ( ex[ i ] - MAX_SX * 8 - 12 ) + 7 );
	jr	00188$
00172$:
;dscan.c:614: else if( ex[ i ] < MAX_SX * 8 + 28 ) {
	ld	a, d
	or	a, a
	jr	Z, 00169$
;dscan.c:615: set_sprite_tile( i * 2 + DEF_ES0, DEF_2EC0 + ( ex[ i ] - MAX_SX * 8 - 20 ) + 8 );
	ld	a, e
	add	a, #0xbc
	ld	c, a
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	de, #_shadow_OAM+0
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
;dscan.c:616: set_sprite_tile( i * 2 + DEF_ES1, DEF_2EC1 );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x50
;dscan.c:616: set_sprite_tile( i * 2 + DEF_ES1, DEF_2EC1 );
	jr	00188$
00169$:
;dscan.c:619: set_sprite_tile( i * 2 + DEF_ES0, DEF_2EC0 );
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x40
;dscan.c:620: set_sprite_tile( i * 2 + DEF_ES1, DEF_2EC1 );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x50
;dscan.c:620: set_sprite_tile( i * 2 + DEF_ES1, DEF_2EC1 );
00188$:
;dscan.c:624: move_sprite( i * 2 + DEF_ES0, ex[ i ] - SUB_EX0, ey[ i ] );
	ld	de, #_ey
	ldhl	sp,	#17
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xec
	ldhl	sp,	#15
	ld	(hl+), a
	inc	hl
	ld	a, (hl+)
	add	a, a
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x08
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (hl)
	ldhl	sp,	#16
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
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
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;dscan.c:625: move_sprite( i * 2 + DEF_ES1, ex[ i ] - SUB_EX1, ey[ i ] );
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xf4
	ldhl	sp,	#16
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	add	a, #0x09
	ldhl	sp,	#8
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#16
	ld	a, (hl)
	ld	(bc), a
;dscan.c:627: for( j = 0; j < MAX_TT; j++ ) {
	ldhl	sp,	#7
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	ldhl	sp,	#18
	ld	(hl), #0x00
00317$:
;dscan.c:628: if( tf[ j ] != 0 ) {
	ld	de, #_tf
	ldhl	sp,	#18
	ld	l, (hl)
	ld	h, #0x00
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
	or	a, a
	jp	Z, 00318$
;dscan.c:629: if( ( ty[ j ] > ey[ i ] - 2 ) && ( ty[ j ] < ey[ i ] + 2 ) ) {
	ld	de, #_ty
	ldhl	sp,	#18
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,#5
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	c, a
	pop	af
	ldhl	sp,	#13
	ld	(hl), c
	inc	hl
	ld	(hl), #0x00
	dec	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	dec	bc
	dec	bc
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00708$
	bit	7, d
	jr	NZ, 00709$
	cp	a, a
	jr	00709$
00708$:
	bit	7, d
	jr	Z, 00709$
	scf
00709$:
	jp	NC, 00318$
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	inc	bc
	inc	bc
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00710$
	bit	7, d
	jr	NZ, 00711$
	cp	a, a
	jr	00711$
00710$:
	bit	7, d
	jr	Z, 00711$
	scf
00711$:
	jp	NC, 00318$
;dscan.c:630: if( ( tx[ j ] > ( ex[ i ] - SUB_EX0 - 5 ) ) && ( tx[ j ] < ( ex[ i ] - SUB_EX1 + 5 ) ) ) {
	ld	de, #_tx
	ldhl	sp,	#18
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;dscan.c:554: ex[ i ]++;
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
;dscan.c:630: if( ( tx[ j ] > ( ex[ i ] - SUB_EX0 - 5 ) ) && ( tx[ j ] < ( ex[ i ] - SUB_EX1 + 5 ) ) ) {
	ld	d, #0x00
	ld	e, a
	add	a, #0xe7
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	adc	a, #0xff
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	b, #0x00
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	jp	NC, 00318$
	ld	hl, #0xfff9
	add	hl, de
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jp	NC, 00318$
;dscan.c:632: tf[ j ] = 0; tx[ j ] = j * 4 + DEF_TX; ty[ j ] = DEF_TY;
	ldhl	sp,	#1
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	ldhl	sp,	#18
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, #0x4a
	ld	c, a
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x1a
;dscan.c:633: set_sprite_tile( j + DEF_TS, tf[ j ] + DEF_TC );
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x02
	ld	c, a
	ldhl	sp,	#18
	ld	a, (hl)
	add	a, #0x02
	ldhl	sp,	#15
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	de, #_shadow_OAM+0
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
	ld	e, l
	ld	d, h
	ld	a, c
	ld	(de), a
;dscan.c:634: set_sprite_attrb( j + DEF_TS, foreCGB[ tf[ j ] + DEF_TC ] );
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, #0x00
	ld	c, a
	inc	bc
	inc	bc
	ld	hl, #_foreCGB
	add	hl, bc
	ld	e, (hl)
	ldhl	sp,	#15
	ld	a, (hl)
	call	_set_sprite_attrb
;dscan.c:635: move_sprite( j + DEF_TS, tx[ j ], ty[ j ] );
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#16
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	de, #_shadow_OAM+0
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ldhl	sp,	#16
;dscan.c:636: ef[ i ] = 3;
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
	ld	de, #_ef
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	(hl), #0x03
;dscan.c:637: set_sprite_tile( i * 2 + DEF_ES0, ef[ i ] * 2 + DEF_BC1 );
	ld	a, (bc)
	add	a, a
	add	a, #0x04
	ld	e, a
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#9
	ld	l, (hl)
	ld	d, #0x00
	ld	h, d
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), e
;dscan.c:638: set_sprite_attrb( i * 2 + DEF_ES0, foreCGB[ ef[ i ] * 2 + DEF_BC1 ] );
	ld	a, (bc)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	de, #_foreCGB
	add	hl, de
	ld	e, (hl)
	push	bc
	ldhl	sp,	#9
	ld	a, (hl)
	call	_set_sprite_attrb
	pop	bc
;dscan.c:639: set_sprite_tile( i * 2 + DEF_ES1, ef[ i ] * 2 + DEF_BC2 );
	ld	a, (bc)
	add	a, a
	add	a, #0x05
	ld	e, a
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#10
	ld	l, (hl)
	ld	d, #0x00
	ld	h, d
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), e
;dscan.c:640: set_sprite_attrb( i * 2 + DEF_ES1, foreCGB[ ef[ i ] * 2 + DEF_BC2 ] );
	ld	a, (bc)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	bc, #0x0005
	add	hl, bc
	ld	de, #_foreCGB
	add	hl, de
	ld	e, (hl)
	ldhl	sp,	#8
	ld	a, (hl)
	call	_set_sprite_attrb
00318$:
;dscan.c:627: for( j = 0; j < MAX_TT; j++ ) {
	ldhl	sp,	#18
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x06
	jp	C, 00317$
;dscan.c:645: if( make_rnd( rnd_kirai ) == 0 ) {
	ld	a, (#_rnd_kirai)
	call	_make_rnd
	or	a, a
	jp	NZ, 00320$
;dscan.c:554: ex[ i ]++;
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
;dscan.c:630: if( ( tx[ j ] > ( ex[ i ] - SUB_EX0 - 5 ) ) && ( tx[ j ] < ( ex[ i ] - SUB_EX1 + 5 ) ) ) {
	ldhl	sp,	#15
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#16
	ld	a, (hl-)
	dec	hl
;dscan.c:646: if( ( ( ex[ i ] - SUB_EX0 ) > MIN_PX ) && ( ( ex[ i ] - SUB_EX0 ) < MAX_PX ) ) {
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0014
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#16
	ld	(hl-), a
	ld	(hl), e
	ld	a, #0x30
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jp	NC, 00320$
	ldhl	sp,	#15
	ld	a, (hl+)
	sub	a, #0x70
	ld	a, (hl)
	sbc	a, #0x00
	jp	NC, 00320$
;dscan.c:647: if( kf[ i ] == 0 ) {
	inc	hl
	ld	de, #_kf
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	NZ, 00204$
;dscan.c:649: kf[ i ] = 1;
	ld	a, #0x01
	ld	(bc), a
;dscan.c:650: kx[ i ] = ex[ i ] - SUB_EX0 + 4;
	ld	de, #_kx
	ldhl	sp,	#17
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xf0
	ld	(bc), a
;dscan.c:651: ky[ i ] = ey[ i ] - 4;
	ld	de, #_ky
	ldhl	sp,	#17
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xfc
	ld	(bc), a
	jp	00320$
00204$:
;dscan.c:653: else if( kf[ i + 1 ] == 0 ) {
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	(hl), a
	ld	a, (hl)
	inc	a
	ldhl	sp,	#13
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	ld	de, #_kf
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	NZ, 00201$
;dscan.c:655: kf[ i + 1 ] = 1;
	ld	a, #0x01
	ld	(bc), a
;dscan.c:656: kx[ i + 1 ] = ex[ i ] - SUB_EX0 + 4;
	ld	de, #_kx
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl), a
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xf0
	ld	c, a
	ldhl	sp,	#15
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;dscan.c:657: ky[ i + 1 ] = ey[ i ] - 4;
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_ky
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl), a
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#18
	ld	(hl), a
	ld	a, (hl)
	add	a, #0xfc
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (hl)
	ld	(de), a
	jp	00320$
00201$:
;dscan.c:659: else if( kf[ i + 2 ] == 0 ) {
	ldhl	sp,	#18
	ld	a, (hl)
	inc	a
	inc	a
	ldhl	sp,	#13
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	ld	de, #_kf
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jp	NZ, 00320$
;dscan.c:661: kf[ i + 2 ] = 1;
	ld	a, #0x01
	ld	(bc), a
;dscan.c:662: kx[ i + 2 ] = ex[ i ] - SUB_EX0 + 4;
	ld	de, #_kx
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl), a
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xf0
	ld	c, a
	ldhl	sp,	#15
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;dscan.c:663: ky[ i + 2 ] = ey[ i ] - 4;
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_ky
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl), a
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xfc
	ld	c, a
	ldhl	sp,	#15
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	jp	00320$
00237$:
;dscan.c:669: else if( ef[ i ] >= 3 ) {
	ldhl	sp,	#13
	ld	a, (hl)
	sub	a, #0x03
	jp	C, 00234$
;dscan.c:670: if( ef[ i ] > 4 ) {
	ld	a, #0x04
	sub	a, (hl)
	jr	NC, 00218$
;dscan.c:671: ef[ i ] = 0;
	inc	hl
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;dscan.c:672: set_sprite_tile( i * 2 + DEF_ES0, DEF_SP );
	ldhl	sp,	#18
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x1e
;dscan.c:673: set_sprite_tile( i * 2 + DEF_ES1, DEF_SP );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
	ld	c, a
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x1e
;dscan.c:675: ps += 100; show_score( ps ); pp++;
	ld	hl, #_ps
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;dscan.c:674: if( i == 9 ) {
	ldhl	sp,	#17
	ld	a, (hl)
	sub	a, #0x09
	jr	NZ, 00215$
;dscan.c:675: ps += 100; show_score( ps ); pp++;
	ld	hl, #0x0064
	add	hl, bc
	ld	c, l
	ld	a, h
	ld	hl, #_ps
	ld	(hl), c
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_show_score
	ld	hl, #_pp
	inc	(hl)
;dscan.c:676: set_level( pl - 1 );
	ld	hl, #_pl
	ld	c, (hl)
	dec	c
	ld	a, c
	call	_set_level
	jp	00320$
00215$:
;dscan.c:679: ps += ( i + 1 ); show_score( ps ); pp++;
	ldhl	sp,	#17
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	add	hl, bc
	ld	c, l
	ld	a, h
	ld	hl, #_ps
	ld	(hl), c
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_show_score
	ld	hl, #_pp
	inc	(hl)
	jp	00320$
00218$:
;dscan.c:683: set_sprite_tile( i * 2 + DEF_ES0, ef[ i ] * 2 + DEF_BC1 );
	ldhl	sp,	#13
	ld	a, (hl)
	add	a, a
	add	a, #0x04
	ld	c, a
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
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
;dscan.c:684: set_sprite_attrb( i * 2 + DEF_ES0, foreCGB[ ef[ i ] * 2 + DEF_BC1 ] );
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	ld	bc, #0x0004
	add	hl, bc
	ld	de, #_foreCGB
	add	hl, de
	ld	e, (hl)
	ldhl	sp,	#18
	ld	a, (hl)
	call	_set_sprite_attrb
;dscan.c:685: set_sprite_tile( i * 2 + DEF_ES1, ef[ i ] * 2 + DEF_BC2 );
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	add	a, a
	add	a, #0x05
	ld	c, a
	ld	a, (hl)
	add	a, #0x09
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
;dscan.c:686: set_sprite_attrb( i * 2 + DEF_ES1, foreCGB[ ef[ i ] * 2 + DEF_BC2 ] );
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	de, #_foreCGB
	add	hl, de
	ld	e, (hl)
	ld	a, b
	call	_set_sprite_attrb
;dscan.c:687: ef[ i ]++;
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
	jp	00320$
00234$:
;dscan.c:695: ey[ i ] = i*DEF_EH + DEF_EY;
	ldhl	sp,	#17
	ld	a, (hl)
	ld	c, a
	add	a, a
	add	a, a
	add	a, c
	add	a, a
	add	a, #0x34
	ldhl	sp,	#13
	ld	(hl), a
;dscan.c:696: ef[ i ] = i % 2 + 1;
	ldhl	sp,	#17
	ld	a, (hl)
	and	a, #0x01
	ld	c, a
	inc	c
;dscan.c:690: else if( i == 9 ) {
	ldhl	sp,	#11
	ld	a, (hl)
	or	a, a
	jp	Z, 00231$
;dscan.c:691: if( pp > 20 ) {
	ld	a, #0x14
	ld	hl, #_pp
	sub	a, (hl)
	jp	NC, 00320$
;dscan.c:692: pp = 0;
	ld	(hl), #0x00
;dscan.c:693: pl++; show_level( pl );
	ld	hl, #_pl
	inc	(hl)
	push	bc
	ld	a, (hl)
	call	_show_level
	pop	bc
;dscan.c:695: ey[ i ] = i*DEF_EH + DEF_EY;
	ld	de, #_ey
	ldhl	sp,	#17
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
;dscan.c:696: ef[ i ] = i % 2 + 1;
	ld	a, (hl+)
	ld	(de), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;dscan.c:697: ex[ i ] = MIN_EX;
	ld	de, #_ex
	ldhl	sp,	#17
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	(hl), #0x04
;dscan.c:698: set_sprite_tile( i * 2 + DEF_ES0, DEF_XEC0 );
	ldhl	sp,	#18
	ld	e, (hl)
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x60
;dscan.c:699: set_sprite_attrb( i * 2 + DEF_ES0, foreCGB[ DEF_XEC0 ] );
	ld	hl, #(_foreCGB + 96)
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	ld	e, l
	ldhl	sp,	#20
	ld	a, (hl)
	call	_set_sprite_attrb
	pop	bc
;dscan.c:700: set_sprite_tile( i * 2 + DEF_ES1, DEF_XEC1 );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
	ld	(hl), a
	ld	e, (hl)
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x70
;dscan.c:701: set_sprite_attrb( i * 2 + DEF_ES1, foreCGB[ DEF_XEC1 ] );
	ld	hl, #(_foreCGB + 112)
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	ld	e, l
	ldhl	sp,	#18
	ld	a, (hl)
	call	_set_sprite_attrb
	pop	bc
;dscan.c:702: move_sprite( i * 2 + DEF_ES0, ex[ i ] - SUB_EX0, ey[ i ] );
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	ld	a, (bc)
	add	a, #0xec
	ld	(hl), a
	ldhl	sp,	#18
	ld	e, (hl)
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_shadow_OAM)
	ld	e, a
	ld	a, h
	adc	a, #>(_shadow_OAM)
	ld	d, a
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;dscan.c:703: move_sprite( i * 2 + DEF_ES1, ex[ i ] - SUB_EX1, ey[ i ] );
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#18
	ld	(hl-), a
	dec	hl
	ld	a, (bc)
	add	a, #0xf4
	ld	c, a
	ld	b, (hl)
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ldhl	sp,	#18
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;dscan.c:703: move_sprite( i * 2 + DEF_ES1, ex[ i ] - SUB_EX1, ey[ i ] );
	jp	00320$
00231$:
;dscan.c:706: else if( make_rnd( rnd_enemy ) == 0 ) {
	push	bc
	ld	a, (#_rnd_enemy)
	call	_make_rnd
	pop	bc
	or	a, a
	jp	NZ, 00320$
;dscan.c:707: if( !( ( pl < 4 ) && ( i == 0 ) ) ) {
	ld	a, (#_pl)
	sub	a, #0x04
	jr	NC, 00225$
	ldhl	sp,	#17
	ld	a, (hl)
	or	a, a
	jp	Z, 00320$
00225$:
;dscan.c:709: ey[ i ] = i*DEF_EH + DEF_EY;
	ld	de, #_ey
	ldhl	sp,	#17
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
;dscan.c:710: ef[ i ] = i % 2 + 1;
	ld	a, (hl+)
	ld	(de), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;dscan.c:711: if( ef[ i ] == 1 ) {
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	a
	jr	NZ, 00223$
;dscan.c:712: ex[ i ] = MAX_EX;
	inc	hl
	inc	hl
	ld	de, #_ex
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	(hl), #0xc8
;dscan.c:713: set_sprite_tile( i * 2 + DEF_ES0, DEF_1EC0 );
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x20
;dscan.c:714: set_sprite_attrb( i * 2 + DEF_ES0, foreCGB[ DEF_1EC0 ] );
	ld	hl, #(_foreCGB + 32)
	ld	e, (hl)
	ldhl	sp,	#18
	ld	a, (hl)
	call	_set_sprite_attrb
;dscan.c:715: set_sprite_tile( i * 2 + DEF_ES1, DEF_1EC1 );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
	ld	c, a
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, c
	ld	de, #_shadow_OAM+0
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
	ld	(hl), #0x30
;dscan.c:716: set_sprite_attrb( i * 2 + DEF_ES1, foreCGB[ DEF_1EC1 ] );
	ld	hl, #(_foreCGB + 48)
	ld	e, (hl)
	ld	a, c
	call	_set_sprite_attrb
	jr	00224$
00223$:
;dscan.c:719: ex[ i ] = MIN_EX;
	ld	de, #_ex
	ldhl	sp,	#17
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x04
;dscan.c:720: set_sprite_tile( i * 2 + DEF_ES0, DEF_2EC0 );
	ldhl	sp,	#18
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x40
;dscan.c:721: set_sprite_attrb( i * 2 + DEF_ES0, foreCGB[ DEF_2EC0 ] );
	ld	hl, #(_foreCGB + 64)
	ld	e, (hl)
	ldhl	sp,	#18
	ld	a, (hl)
	call	_set_sprite_attrb
;dscan.c:722: set_sprite_tile( i * 2 + DEF_ES1, DEF_2EC1 );
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x09
	ld	c, a
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, c
	ld	de, #_shadow_OAM+0
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
	ld	(hl), #0x50
;dscan.c:723: set_sprite_attrb( i * 2 + DEF_ES1, foreCGB[ DEF_2EC1 ] );
	ld	hl, #(_foreCGB + 80)
	ld	e, (hl)
	ld	a, c
	call	_set_sprite_attrb
00224$:
;dscan.c:725: move_sprite( i * 2 + DEF_ES0, ex[ i ] - SUB_EX0, ey[ i ] );
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#15
	ld	(hl+), a
	inc	hl
	ld	de, #_ex
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	add	a, #0xec
	ldhl	sp,	#16
	ld	(hl+), a
	ld	a, (hl+)
	add	a, a
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x08
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;dscan.c:726: move_sprite( i * 2 + DEF_ES1, ex[ i ] - SUB_EX1, ey[ i ] );
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#16
	ld	(hl+), a
	inc	hl
	ld	a, (bc)
	add	a, #0xf4
	ld	c, a
	ld	a, (hl)
	add	a, #0x09
	ld	b, a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
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
	ld	e, l
	ld	d, h
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ldhl	sp,	#16
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;dscan.c:726: move_sprite( i * 2 + DEF_ES1, ex[ i ] - SUB_EX1, ey[ i ] );
00320$:
;dscan.c:466: for( i = 0; i < MAX_ET; i++ ) {
	ldhl	sp,	#17
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x0a
	jp	C, 00319$
;dscan.c:730: }
	add	sp, #19
	ret
;dscan.c:733: void kirai()
;	---------------------------------
; Function kirai
; ---------------------------------
_kirai::
	add	sp, #-11
;dscan.c:737: for( i = 0; i < MAX_KT; i++ ) {
	ldhl	sp,	#10
	ld	(hl), #0x00
00119$:
;dscan.c:738: if( kf[ i ] != 0 ) {
	ld	de, #_kf
	ldhl	sp,	#10
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#9
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00120$
;dscan.c:739: ky[ i ]--;
	inc	hl
	ld	de, #_ky
	ld	l, (hl)
	ld	h, #0x00
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
	ld	c, a
	dec	c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
;dscan.c:740: if( kf[ i ] >= 3 ) {
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	sub	a, #0x03
	jp	C, 00112$
;dscan.c:741: kf[ i ]++;
	inc	c
	pop	hl
	push	hl
	ld	(hl), c
;dscan.c:742: if( ( kx[ i ] > ( px - 5 ) ) && ( kx[ i ] < ( px + 12 ) ) ) {
	ld	de, #_kx
	ldhl	sp,	#10
	ld	l, (hl)
	ld	h, #0x00
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
	ldhl	sp,	#9
	ld	(hl), a
	ld	a, (#_px)
	ldhl	sp,	#6
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	c, e
	ldhl	sp,	#9
	ld	a, (hl-)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00164$
	bit	7, d
	jr	NZ, 00165$
	cp	a, a
	jr	00165$
00164$:
	bit	7, d
	jr	Z, 00165$
	scf
00165$:
	jr	NC, 00104$
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#8
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00166$
	bit	7, d
	jr	NZ, 00167$
	cp	a, a
	jr	00167$
00166$:
	bit	7, d
	jr	Z, 00167$
	scf
00167$:
	jr	NC, 00104$
;dscan.c:743: if( pf < 2 ) {
	ld	hl, #_pf
	ld	a, (hl)
	sub	a, #0x02
	jr	NC, 00104$
;dscan.c:745: pf = 2;
	ld	(hl), #0x02
00104$:
;dscan.c:748: if( kf[ i ] >= 6 ) {
	pop	de
	push	de
	ld	a, (de)
	sub	a, #0x06
	jr	C, 00113$
;dscan.c:749: kf[ i ] = 0; kx[ i ] = DEF_KX; ky[ i ] = DEF_KY;
	pop	hl
	ld	(hl), #0x00
	push	hl
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	jr	00113$
00112$:
;dscan.c:752: else if( ky[ i ] <= MIN_KY ) {
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ld	a, #0x29
	sub	a, b
	jr	C, 00109$
;dscan.c:753: kf[ i ] = 3;
	pop	hl
	ld	(hl), #0x03
	push	hl
	jr	00113$
00109$:
;dscan.c:756: kf[ i ] = 3 - kf[ i ];
	ld	a, #0x03
	sub	a, c
	ld	c, a
	pop	hl
	push	hl
	ld	(hl), c
00113$:
;dscan.c:758: set_sprite_tile( i + DEF_KS, kf[ i ] + DEF_KC );
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x04
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#10
	ld	a, (hl)
	add	a, #0x1c
	ldhl	sp,	#7
	ld	(hl), a
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	de, #_shadow_OAM+0
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ldhl	sp,	#8
	ld	a, c
	ld	(hl+), a
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(de), a
;dscan.c:759: set_sprite_attrb( i + DEF_KS, foreCGB[ kf[ i ] + DEF_KC ] );
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#9
	ld	(hl), a
	ld	a, (hl-)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_foreCGB
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ld	a, (hl-)
	dec	hl
	ld	e, a
	ld	a, (hl)
	call	_set_sprite_attrb
;dscan.c:760: move_sprite( i + DEF_KS, kx[ i ], ky[ i ] );
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#9
	ld	(hl+), a
	ld	de, #_kx
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	ld	a, #0x02
00168$:
	ldhl	sp,	#6
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00168$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
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
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
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
	ldhl	sp,	#8
	ld	a, (hl)
	ld	(de), a
;dscan.c:760: move_sprite( i + DEF_KS, kx[ i ], ky[ i ] );
00120$:
;dscan.c:737: for( i = 0; i < MAX_KT; i++ ) {
	ldhl	sp,	#10
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x0c
	jp	C, 00119$
;dscan.c:763: }
	add	sp, #11
	ret
;dscan.c:768: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;C:/gbdk/include/gb/gb.h:743: __asm__("di");
	di
;dscan.c:771: DISPLAY_OFF;
	call	_display_off
;dscan.c:773: initarand( ( ( uint16_t ) DIV_REG << 8 ) );
	ldh	a, (_DIV_REG + 0)
	ld	c, #0x00
	ld	b, a
	push	bc
	call	_initarand
	pop	hl
;dscan.c:775: init_screen();
	call	_init_screen
;dscan.c:776: init_score();
	call	_init_score
;dscan.c:777: init_player();
	call	_init_player
;dscan.c:778: init_tama();
	call	_init_tama
;dscan.c:779: init_enemy();
	call	_init_enemy
;dscan.c:780: init_kirai();
	call	_init_kirai
;dscan.c:781: show_gover();
	call	_show_gover
;dscan.c:782: k_right = J_A;
	ld	hl, #_k_right
	ld	(hl), #0x10
;dscan.c:783: k_left = J_B;
	ld	hl, #_k_left
	ld	(hl), #0x20
;dscan.c:784: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;C:/gbdk/include/gb/gb.h:727: __asm__("ei");
	ei
;dscan.c:787: while( 1 ) {
00102$:
;dscan.c:788: delay( pw );
	ld	hl, #_pw
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_delay
;dscan.c:789: player();
	call	_player
;dscan.c:790: bombs();
	call	_bombs
;dscan.c:791: enemys();
	call	_enemys
;dscan.c:792: kirai();
	call	_kirai
;dscan.c:794: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

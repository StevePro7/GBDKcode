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
	.globl _handle_input
	.globl _update_display
	.globl _init_display
	.globl _sgb_sound_effect
	.globl _gotoxy
	.globl _puts
	.globl _printf
	.globl _sgb_transfer
	.globl _sgb_check
	.globl _wait_vbl_done
	.globl _joypad
	.globl _sfx_num_b
	.globl _sfx_num_a
	.globl _sgb_sfx_b_vol
	.globl _sgb_sfx_b_pitch
	.globl _sgb_sfx_a_vol
	.globl _sgb_sfx_a_pitch
	.globl _keys_last
	.globl _keys
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_sgb_buf:
	.ds 20
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_keys::
	.ds 1
_keys_last::
	.ds 1
_sgb_sfx_a_pitch::
	.ds 1
_sgb_sfx_a_vol::
	.ds 1
_sgb_sfx_b_pitch::
	.ds 1
_sgb_sfx_b_vol::
	.ds 1
_sfx_num_a::
	.ds 1
_sfx_num_b::
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
;main.c:35: void sgb_sound_effect( uint8_t sfx_a, uint8_t sfx_b ) {
;	---------------------------------
; Function sgb_sound_effect
; ---------------------------------
_sgb_sound_effect::
	ld	d, a
;main.c:36: sgb_buf[ 0 ] = ( SGB_SOUND << 3 ) | 1;  // 1 is number of packets to transfer
	ld	bc, #_sgb_buf+0
	ld	a, #0x41
	ld	(bc), a
;main.c:37: sgb_buf[ 1 ] = sfx_a;  // Effect A
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	(hl), d
;main.c:38: sgb_buf[ 2 ] = sfx_b;  // Effect B
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	(hl), e
;main.c:39: sgb_buf[ 3 ] = sgb_sfx_a_pitch | ( sgb_sfx_a_vol << 2 ) | ( sgb_sfx_b_pitch << 4 ) | ( sgb_sfx_b_vol << 6 );
	ld	a, (#_sgb_sfx_a_vol)
	add	a, a
	add	a, a
	ld	hl, #_sgb_sfx_a_pitch
	or	a, (hl)
	ld	e, a
	ld	a, (#_sgb_sfx_b_pitch)
	swap	a
	and	a, #0xf0
	or	a, e
	ld	e, a
	ld	a, (#_sgb_sfx_b_vol)
	rrca
	rrca
	and	a, #0xc0
	or	a, e
	ld	(#(_sgb_buf + 3)),a
;main.c:40: sgb_buf[ 4 ] = SGB_MUSIC_SCORE_CODE_NONE; // Must be zero if not used
	ld	hl, #(_sgb_buf + 4)
	ld	(hl), #0x00
;main.c:41: sgb_transfer( sgb_buf );
	push	bc
	call	_sgb_transfer
	pop	hl
;main.c:42: }
	ret
;main.c:49: void init_display() {
;	---------------------------------
; Function init_display
; ---------------------------------
_init_display::
;main.c:50: gotoxy( 0, 1 );
	xor	a, a
	inc	a
	push	af
	call	_gotoxy
	pop	hl
;main.c:51: printf( "SGB BUILT-IN SFX" );
	ld	de, #___str_0
	push	de
	call	_printf
	pop	hl
;main.c:53: gotoxy( 0, DISP_SFX_A_START );
	ld	hl, #0x300
	push	hl
	call	_gotoxy
	pop	hl
;main.c:57: printf( " TYPE: UP / DOWN\n" );
	ld	de, #___str_19
	call	_puts
;main.c:59: gotoxy( 0, DISP_SFX_B_START );
	ld	a, #0x0a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_gotoxy
	pop	de
;main.c:63: printf( " TYPE: LEFT / RIGHT\n" );
	ld	de, #___str_22
;main.c:64: }
	jp	_puts
___str_0:
	.ascii "SGB BUILT-IN SFX"
	.db 0x00
___str_19:
	.ascii "SFX A:"
	.db 0x0a
	.ascii " PLAY: A"
	.db 0x0a
	.ascii " STOP: SELECT + A"
	.db 0x0a
	.ascii " TYPE: UP / DOWN"
	.db 0x00
___str_22:
	.ascii "SFX B:"
	.db 0x0a
	.ascii " PLAY: B"
	.db 0x0a
	.ascii " STOP: SELECT + B"
	.db 0x0a
	.ascii " TYPE: LEFT / RIGHT"
	.db 0x00
;main.c:68: void update_display( void ) {
;	---------------------------------
; Function update_display
; ---------------------------------
_update_display::
;main.c:70: gotoxy( 7u, DISP_SFX_A_START );
	ld	hl, #0x307
	push	hl
	call	_gotoxy
	pop	hl
;main.c:71: printf( "0x%hx", ( uint8_t ) sfx_num_a );
	ld	a, (#_sfx_num_a)
	push	af
	inc	sp
	ld	de, #___str_23
	push	de
	call	_printf
	add	sp, #3
;main.c:72: gotoxy( 1u, DISP_SFX_A_START + 4u );
	ld	hl, #0x701
	push	hl
	call	_gotoxy
	pop	hl
;main.c:73: printf( "%s", ( const char * ) sgb_sfx_names_table_a[ sfx_num_a ] );
	ld	bc, #_sgb_sfx_names_table_a+0
	ld	hl, #_sfx_num_a
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #___str_24
	push	de
	call	_printf
	add	sp, #4
;main.c:76: gotoxy( 7u, DISP_SFX_B_START );
	ld	hl, #0xa07
	push	hl
	call	_gotoxy
	pop	hl
;main.c:77: printf( "0x%hx", ( uint8_t ) sfx_num_b );
	ld	a, (#_sfx_num_b)
	push	af
	inc	sp
	ld	de, #___str_23
	push	de
	call	_printf
	add	sp, #3
;main.c:78: gotoxy( 1u, DISP_SFX_B_START + 4u );
	ld	hl, #0xe01
	push	hl
	call	_gotoxy
	pop	hl
;main.c:79: printf( "%s", ( const char * ) sgb_sfx_names_table_b[ sfx_num_b ] );
	ld	bc, #_sgb_sfx_names_table_b+0
	ld	hl, #_sfx_num_b
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #___str_24
	push	de
	call	_printf
	add	sp, #4
;main.c:80: }
	ret
___str_23:
	.ascii "0x%hx"
	.db 0x00
___str_24:
	.ascii "%s"
	.db 0x00
;main.c:84: void handle_input( void ) {
;	---------------------------------
; Function handle_input
; ---------------------------------
_handle_input::
	dec	sp
;main.c:86: bool display_update_queued = false;
	ldhl	sp,	#0
	ld	(hl), #0x00
;main.c:89: switch( ( keys ^ keys_last ) & keys ) {
	ld	a, (#_keys)
	ld	hl, #_keys_last
	xor	a, (hl)
	ld	hl, #_keys
	and	a, (hl)
	cp	a, #0x01
	jr	Z, 00115$
	cp	a, #0x02
	jr	Z, 00118$
	cp	a, #0x04
	jr	Z, 00109$
	cp	a, #0x08
	jr	Z, 00112$
;main.c:92: case J_A: if( keys & J_SELECT ) {
	ld	c, (hl)
	push	af
	ld	a, c
	and	a, #0x40
	ld	c, a
	ld	b, #0x00
	pop	af
;main.c:89: switch( ( keys ^ keys_last ) & keys ) {
	cp	a, #0x10
	jr	Z, 00101$
	sub	a, #0x20
	jr	Z, 00105$
	jr	00121$
;main.c:92: case J_A: if( keys & J_SELECT ) {
00101$:
	ld	a, b
	or	a, c
	jr	Z, 00103$
;main.c:94: sgb_sound_effect( SGB_SND_EFFECT_STOP, SGB_SND_EFFECT_EMPTY );
	ld	e, #0x00
	ld	a, #0x80
	call	_sgb_sound_effect
	jr	00121$
00103$:
;main.c:98: sgb_sound_effect( sfx_num_a, SGB_SND_EFFECT_EMPTY );
	ld	e, #0x00
	ld	a, (#_sfx_num_a)
	call	_sgb_sound_effect
;main.c:100: break;
	jr	00121$
;main.c:103: case J_B: if( keys & J_SELECT ) {
00105$:
	ld	a, b
	or	a, c
	jr	Z, 00107$
;main.c:105: sgb_sound_effect( SGB_SND_EFFECT_EMPTY, SGB_SND_EFFECT_STOP );
	ld	e, #0x80
	xor	a, a
	call	_sgb_sound_effect
	jr	00121$
00107$:
;main.c:109: sgb_sound_effect( SGB_SND_EFFECT_EMPTY, sfx_num_b );
	ld	hl, #_sfx_num_b
	ld	e, (hl)
	xor	a, a
	call	_sgb_sound_effect
;main.c:111: break;
	jr	00121$
;main.c:115: case ( J_UP ): sfx_num_a++;
00109$:
	ld	hl, #_sfx_num_a
	inc	(hl)
;main.c:116: if( sfx_num_a > SGB_SND_EFFECT_A_MAX ) sfx_num_a = SGB_SND_EFFECT_A_MIN;
	ld	a, #0x30
	sub	a, (hl)
	jr	NC, 00111$
	ld	(hl), #0x01
00111$:
;main.c:117: display_update_queued = true;
	ldhl	sp,	#0
	ld	(hl), #0x01
;main.c:118: break;
	jr	00121$
;main.c:120: case ( J_DOWN ): sfx_num_a--;
00112$:
	ld	hl, #_sfx_num_a
	dec	(hl)
;main.c:121: if( sfx_num_a < SGB_SND_EFFECT_A_MIN ) sfx_num_a = SGB_SND_EFFECT_A_MAX;
	ld	a, (hl)
	sub	a, #0x01
	jr	NC, 00114$
	ld	(hl), #0x30
00114$:
;main.c:122: display_update_queued = true;
	ldhl	sp,	#0
	ld	(hl), #0x01
;main.c:123: break;
	jr	00121$
;main.c:125: case ( J_RIGHT ): sfx_num_b++;
00115$:
	ld	hl, #_sfx_num_b
	inc	(hl)
;main.c:126: if( sfx_num_b > SGB_SND_EFFECT_B_MAX ) sfx_num_b = SGB_SND_EFFECT_B_MIN;
	ld	a, #0x19
	sub	a, (hl)
	jr	NC, 00117$
	ld	(hl), #0x01
00117$:
;main.c:127: display_update_queued = true;
	ldhl	sp,	#0
	ld	(hl), #0x01
;main.c:128: break;
	jr	00121$
;main.c:130: case ( J_LEFT ): sfx_num_b--;
00118$:
	ld	hl, #_sfx_num_b
	dec	(hl)
;main.c:131: if( sfx_num_b < SGB_SND_EFFECT_B_MIN ) sfx_num_b = SGB_SND_EFFECT_B_MAX;
	ld	a, (hl)
	sub	a, #0x01
	jr	NC, 00120$
	ld	(hl), #0x19
00120$:
;main.c:132: display_update_queued = true;
	ldhl	sp,	#0
	ld	(hl), #0x01
;main.c:134: }
00121$:
;main.c:136: if( display_update_queued )
	ldhl	sp,	#0
	bit	0, (hl)
	jr	Z, 00124$
;main.c:137: update_display();
	inc	sp
	jp	_update_display
00124$:
;main.c:138: }
	inc	sp
	ret
;main.c:141: void main( void ) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:145: for( uint8_t i = 4; i != 0; i-- ) wait_vbl_done();
	ld	c, #0x04
00109$:
	ld	a, c
	or	a, a
	jr	Z, 00101$
	call	_wait_vbl_done
	dec	c
	jr	00109$
00101$:
;main.c:147: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:149: if( sgb_check() ) {
	call	_sgb_check
	ld	a, e
	or	a, a
	jr	Z, 00106$
;main.c:151: init_display();
	call	_init_display
;main.c:152: update_display();
	call	_update_display
;main.c:154: while( 1 ) {
00103$:
;main.c:155: wait_vbl_done();
	call	_wait_vbl_done
;main.c:157: keys_last = keys;
	ld	a, (#_keys)
	ld	(#_keys_last),a
;main.c:158: keys = joypad();
	call	_joypad
	ld	(#_keys),a
;main.c:160: handle_input();
	call	_handle_input
	jr	00103$
00106$:
;main.c:164: printf( "NO SGB DETECTED" );
	ld	de, #___str_25
	push	de
	call	_printf
	pop	hl
;main.c:167: }
	ret
___str_25:
	.ascii "NO SGB DETECTED"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit__keys:
	.db #0x00	; 0
__xinit__keys_last:
	.db #0x00	; 0
__xinit__sgb_sfx_a_pitch:
	.db #0x03	; 3
__xinit__sgb_sfx_a_vol:
	.db #0x02	; 2
__xinit__sgb_sfx_b_pitch:
	.db #0x03	; 3
__xinit__sgb_sfx_b_vol:
	.db #0x02	; 2
__xinit__sfx_num_a:
	.db #0x01	; 1
__xinit__sfx_num_b:
	.db #0x01	; 1
	.area _CABS (ABS)

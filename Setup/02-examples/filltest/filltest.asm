;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module filltest
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _linetest
	.globl _color
	.globl _gotogxy
	.globl _getpix
	.globl _circle
	.globl _box
	.globl _line
	.globl _plot_point
	.globl _gprintf
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;filltest.c:8: void linetest( uint8_t x, uint8_t y, uint8_t w ) {
;	---------------------------------
; Function linetest
; ---------------------------------
_linetest::
	add	sp, #-11
	ldhl	sp,	#8
	ld	(hl-), a
	ld	(hl), e
;filltest.c:9: color( DKGREY, WHITE, SOLID );
	xor	a, a
	rrca
	push	af
	xor	a, a
	ld	a, #0x02
	push	af
	inc	sp
	call	_color
	add	sp, #3
;filltest.c:10: for( int i = -w; i <= w; i++ ) line( x, y, x + i, y - w );
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	de, #0x0000
	ld	(hl), e
	pop	hl
	push	hl
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#13
	sub	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
00106$:
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
	ldhl	sp,	#0
	ld	e, l
	ld	d, h
	ldhl	sp,	#9
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00163$
	bit	7, d
	jr	NZ, 00164$
	cp	a, a
	jr	00164$
00163$:
	bit	7, d
	jr	Z, 00164$
	scf
00164$:
	jr	C, 00101$
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	add	a, (hl)
	dec	hl
	dec	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_line
	add	sp, #4
	ldhl	sp,	#9
	inc	(hl)
	jr	NZ, 00106$
	inc	hl
	inc	(hl)
	jr	00106$
00101$:
;filltest.c:11: for( int i = -w; i <= w; i++ ) line( x, y, x + w, y + i );
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#13
	add	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
00109$:
	ldhl	sp,	#7
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	ldhl	sp,	#0
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
	jr	C, 00102$
	ld	a, c
	ldhl	sp,	#9
	add	a, (hl)
	inc	hl
	push	bc
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_line
	add	sp, #4
	pop	bc
	inc	bc
	jr	00109$
00102$:
;filltest.c:12: for( int i = -w; i <= w; i++ ) line( x, y, x + i, y + w );
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#13
	add	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
00112$:
	ldhl	sp,	#0
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00168$
	bit	7, d
	jr	NZ, 00169$
	cp	a, a
	jr	00169$
00168$:
	bit	7, d
	jr	Z, 00169$
	scf
00169$:
	jr	C, 00103$
	ld	a, c
	ldhl	sp,	#5
	add	a, (hl)
	push	bc
	ldhl	sp,	#12
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_line
	add	sp, #4
	pop	bc
	inc	bc
	jr	00112$
00103$:
;filltest.c:13: for( int i = -w; i <= w; i++ ) line( x, y, x - w, y + i );
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#13
	sub	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
00115$:
	ldhl	sp,	#0
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	ld	e, a
	bit	7, e
	jr	Z, 00170$
	bit	7, d
	jr	NZ, 00171$
	cp	a, a
	jr	00171$
00170$:
	bit	7, d
	jr	Z, 00171$
	scf
00171$:
	jr	C, 00117$
	ld	a, c
	ldhl	sp,	#9
	add	a, (hl)
	inc	hl
	push	bc
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_line
	add	sp, #4
	pop	bc
	inc	bc
	jr	00115$
00117$:
;filltest.c:14: }
	add	sp, #11
	pop	hl
	inc	sp
	jp	(hl)
;filltest.c:16: void main( void )
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-7
;filltest.c:19: c = 0;
	ld	c, #0x00
;filltest.c:21: for( a = 0; a <= 15; a++ ) {
	ldhl	sp,	#4
	ld	(hl), #0x00
;filltest.c:22: for( b = 0; b <= 15; b++ ) {
00125$:
	ldhl	sp,	#5
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x00
00108$:
;filltest.c:23: gotogxy( b, a );
	ldhl	sp,	#4
	ld	a, (hl+)
	inc	hl
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_gotogxy
	pop	hl
;filltest.c:24: d = a / 4;
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	dec	hl
	bit	7, (hl)
	jr	Z, 00120$
	pop	de
	push	de
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
00120$:
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	ld	(hl), c
;filltest.c:25: e = b / 4;
	ldhl	sp,	#6
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	bit	7, b
	jr	Z, 00121$
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
00121$:
	ld	b, l
	sra	h
	rr	b
	sra	h
	rr	b
;filltest.c:26: if( d == e ) {
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00102$
;filltest.c:27: d = 3 - e;
	ld	c, b
	ld	a, #0x03
	sub	a, c
	ldhl	sp,	#3
	ld	(hl), a
00102$:
;filltest.c:29: color( d, e, SOLID );
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	call	_color
	add	sp, #3
;filltest.c:30: gprintf( "%c", c++ );
	ldhl	sp,	#5
	ld	c, (hl)
	ld	b, #0x00
	inc	(hl)
	push	bc
	ld	de, #___str_0
	push	de
	call	_gprintf
	add	sp, #4
;filltest.c:22: for( b = 0; b <= 15; b++ ) {
	ldhl	sp,	#6
	inc	(hl)
	ld	a, #0x0f
	sub	a, (hl)
	jp	NC, 00108$
;filltest.c:21: for( a = 0; a <= 15; a++ ) {
	dec	hl
	ld	a, (hl-)
	ld	c, a
	inc	(hl)
	ld	a, #0x0f
	sub	a, (hl)
	jp	NC, 00125$
;filltest.c:35: color( LTGREY, WHITE, SOLID );
	xor	a, a
	rrca
	push	af
	xor	a, a
	ld	a, #0x01
	push	af
	inc	sp
	call	_color
	add	sp, #3
;filltest.c:36: circle( 140, 20, 15, M_FILL );
	ld	hl, #0x10f
	push	hl
	ld	hl, #0x148c
	push	hl
	call	_circle
	add	sp, #4
;filltest.c:37: color( BLACK, WHITE, SOLID );
	xor	a, a
	rrca
	push	af
	xor	a, a
	ld	a, #0x03
	push	af
	inc	sp
	call	_color
	add	sp, #3
;filltest.c:38: circle( 140, 20, 10, M_NOFILL );
	ld	hl, #0x0a
	push	hl
	ld	hl, #0x148c
	push	hl
	call	_circle
	add	sp, #4
;filltest.c:39: color( DKGREY, WHITE, XOR );
	ld	a, #0x02
	push	af
	inc	sp
	ld	hl, #0x02
	push	hl
	call	_color
	add	sp, #3
;filltest.c:40: circle( 120, 40, 30, M_FILL );
	ld	hl, #0x11e
	push	hl
	ld	hl, #0x2878
	push	hl
	call	_circle
	add	sp, #4
;filltest.c:41: line( 0, 0, 159, 143 );
	ld	hl, #0x8f9f
	push	hl
	xor	a, a
	rrca
	push	af
	call	_line
	add	sp, #4
;filltest.c:42: color( BLACK, LTGREY, SOLID );
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	call	_color
	add	sp, #3
;filltest.c:43: box( 0, 130, 40, 143, M_NOFILL );
	ld	hl, #0x8f
	push	hl
	ld	hl, #0x2882
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_box
	add	sp, #5
;filltest.c:44: box( 50, 130, 90, 143, M_FILL );
	ld	hl, #0x18f
	push	hl
	ld	hl, #0x5a82
	push	hl
	ld	a, #0x32
	push	af
	inc	sp
	call	_box
	add	sp, #5
;filltest.c:47: linetest( 130, 100, 20 );
	ld	a, #0x14
	push	af
	inc	sp
	ld	e, #0x64
	ld	a, #0x82
	call	_linetest
;filltest.c:50: for( c = 0; c <= 143; c++ ) {
	ld	e, #0x00
;filltest.c:51: for( b = 0; b <= 142; b++ ) {
00131$:
	ld	d, #0x00
;filltest.c:52: for( a = 0; a <= 159; a++ ) {
00129$:
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
00112$:
;filltest.c:53: color( getpix( a, b + 1 ), WHITE, SOLID );
	ld	a, d
	inc	a
	push	hl
	push	de
	push	af
	ld	a, l
	inc	sp
	push	af
	inc	sp
	call	_getpix
	pop	hl
	ld	b, e
	xor	a, a
	rrca
	push	af
	push	bc
	inc	sp
	call	_color
	add	sp, #3
	pop	de
	pop	hl
;filltest.c:54: plot_point( a, b );
	push	hl
	push	de
	ld	e, l
	push	de
	call	_plot_point
	pop	hl
	pop	de
	pop	hl
;filltest.c:52: for( a = 0; a <= 159; a++ ) {
	inc	l
	ld	a, #0x9f
	sub	a, l
	jr	NC, 00112$
;filltest.c:56: color( WHITE, WHITE, SOLID );
	push	de
	xor	a, a
	rrca
	push	af
	xor	a, a
	push	af
	inc	sp
	call	_color
	add	sp, #3
	pop	de
;filltest.c:51: for( b = 0; b <= 142; b++ ) {
	inc	d
	ld	a, #0x8e
	sub	a, d
	jr	NC, 00129$
;filltest.c:58: line( 0, 143, 159, 143 );
	push	de
	ld	hl, #0x8f9f
	push	hl
	ld	hl, #0x8f00
	push	hl
	call	_line
	add	sp, #4
	pop	de
;filltest.c:50: for( c = 0; c <= 143; c++ ) {
	inc	e
	ld	a, #0x8f
	sub	a, e
	jr	NC, 00131$
;filltest.c:60: }
	add	sp, #7
	ret
___str_0:
	.ascii "%c"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module rpn
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _read_op
	.globl _top
	.globl _pop
	.globl _push
	.globl _isdigit
	.globl _gets
	.globl _puts
	.globl _printf
	.globl _n
	.globl _pos
	.globl _s
	.globl _stack
	.globl _sp
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_sp::
	.ds 1
_stack::
	.ds 80
_s::
	.ds 40
_pos::
	.ds 1
_n::
	.ds 2
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
;rpn.c:16: void push(int16_t l)
;	---------------------------------
; Function push
; ---------------------------------
_push::
	push	de
;rpn.c:18: if(sp < STACKSIZE)
	ld	hl, #_sp
	ld	a, (hl)
	sub	a, #0x28
	jr	NC, 00102$
;rpn.c:19: stack[sp++] = l;
	ld	bc, #_stack+0
	ld	e, (hl)
	inc	(hl)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	jr	00104$
00102$:
;rpn.c:21: puts("Stack full");
	ld	de, #___str_0
	inc	sp
	inc	sp
	jp	_puts
00104$:
;rpn.c:22: }
	inc	sp
	inc	sp
	ret
___str_0:
	.ascii "Stack full"
	.db 0x00
;rpn.c:24: int16_t pop(void)
;	---------------------------------
; Function pop
; ---------------------------------
_pop::
;rpn.c:26: if(sp > 0)
	ld	hl, #_sp
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;rpn.c:27: return stack[--sp];
	ld	bc, #_stack+0
	dec	(hl)
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
	ret
00102$:
;rpn.c:29: puts("Stack empty");
	ld	de, #___str_1
	call	_puts
;rpn.c:30: return 0;
	ld	bc, #0x0000
;rpn.c:31: }
	ret
___str_1:
	.ascii "Stack empty"
	.db 0x00
;rpn.c:33: int16_t top(void)
;	---------------------------------
; Function top
; ---------------------------------
_top::
;rpn.c:35: if(sp > 0)
	ld	hl, #_sp
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;rpn.c:36: return stack[sp-1];
	ld	bc, #_stack+0
	ld	a, (hl)
	dec	a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
00102$:
;rpn.c:38: puts("Stack empty");
	ld	de, #___str_2
	call	_puts
;rpn.c:39: return 0;
	ld	bc, #0x0000
;rpn.c:40: }
	ret
___str_2:
	.ascii "Stack empty"
	.db 0x00
;rpn.c:42: int8_t read_op( void )
;	---------------------------------
; Function read_op
; ---------------------------------
_read_op::
;rpn.c:44: if( pos == 0 ) {
	ld	a, (#_pos)
	or	a, a
	jr	NZ, 00118$
;rpn.c:45: gets( s );
	ld	de, #_s
	push	de
	call	_gets
	pop	hl
;rpn.c:48: while( s[ pos ] == ' ' || s[ pos ] == '\t' )
00118$:
00104$:
	ld	a, #<(_s)
	ld	hl, #_pos
	add	a, (hl)
	ld	c, a
	ld	a, #>(_s)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	c, a
	sub	a, #0x20
	jr	Z, 00105$
	ld	a, c
	sub	a, #0x09
	jr	NZ, 00106$
00105$:
;rpn.c:49: pos++;
	ld	hl, #_pos
	inc	(hl)
	jr	00104$
00106$:
;rpn.c:51: if( s[ pos ] == '\0' ) {
	ld	a, c
	or	a, a
	jr	NZ, 00108$
;rpn.c:52: pos = 0;
	ld	hl, #_pos
	ld	(hl), #0x00
;rpn.c:53: return( '\n' );
	ld	a, #0x0a
	ret
00108$:
;rpn.c:56: if( !isdigit( s[ pos ] ) )
	ld	a, c
	call	_isdigit
	bit	0,a
	jr	NZ, 00110$
;rpn.c:57: return( s[ pos++ ] );
	ld	hl, #_pos
	ld	c, (hl)
	inc	(hl)
	ld	hl, #_s
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ret
00110$:
;rpn.c:59: n = s[ pos ] - '0';
	ld	a, #<(_s)
	ld	hl, #_pos
	add	a, (hl)
	ld	c, a
	ld	a, #>(_s)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	a, c
	add	a, #0xd0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	hl, #_n
	ld	(hl), c
	inc	hl
	ld	(hl), a
;rpn.c:60: while( isdigit( s[ ++pos ] ) )
00111$:
	ld	hl, #_pos
	inc	(hl)
	ld	a, #<(_s)
	add	a, (hl)
	ld	c, a
	ld	a, #>(_s)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	call	_isdigit
	bit	0,a
	jr	Z, 00113$
;rpn.c:61: n = 10 * n + s[ pos ] - '0';
	ld	hl, #_n
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	a, #<(_s)
	ld	hl, #_pos
	add	a, (hl)
	ld	e, a
	ld	a, #>(_s)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	bc, #0xffd0
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #_n
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00111$
00113$:
;rpn.c:63: return NUMBER;
	ld	a, #0x30
;rpn.c:64: }
	ret
;rpn.c:66: void main( void )
;	---------------------------------
; Function main
; ---------------------------------
_main::
	dec	sp
;rpn.c:71: puts( "RPN Calculator" );
	ld	de, #___str_3
	call	_puts
;rpn.c:72: sp = 0;
	ld	hl, #_sp
	ld	(hl), #0x00
;rpn.c:73: pos = 0;
	ld	hl, #_pos
	ld	(hl), #0x00
;rpn.c:75: while( ( type = read_op() ) != 0 ) {
00111$:
	call	_read_op
	ld	c, a
	ldhl	sp,	#0
	ld	a,c
;rpn.c:76: switch( type ) {
	ld	(hl),a
	or	a,a
	jp	Z,00114$
	sub	a, #0x0a
	jp	Z,00109$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x2a
	jr	Z, 00103$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x2b
	jr	Z, 00102$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x2d
	jr	Z, 00104$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x2f
	jr	Z, 00105$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x30
	jr	NZ, 00111$
;rpn.c:78: push( n );
	ld	hl, #_n
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_push
;rpn.c:79: break;
	jr	00111$
;rpn.c:80: case '+':
00102$:
;rpn.c:81: push( pop() + pop() );
	call	_pop
	push	bc
	call	_pop
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	pop	bc
	add	hl, bc
	ld	e, l
	ld	d, h
	call	_push
;rpn.c:82: break;
	jr	00111$
;rpn.c:83: case '*':
00103$:
;rpn.c:84: push( pop() * pop() );
	call	_pop
	push	bc
	call	_pop
	pop	de
	call	__mulint
	ld	e, c
	ld	d, b
	call	_push
;rpn.c:85: break;
	jr	00111$
;rpn.c:86: case '-':
00104$:
;rpn.c:87: op2 = pop();
	call	_pop
;rpn.c:88: push( pop() - op2 );
	push	bc
	call	_pop
	ld	e, c
	ld	d, b
	pop	bc
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ld	d, a
	call	_push
;rpn.c:89: break;
	jr	00111$
;rpn.c:90: case '/':
00105$:
;rpn.c:91: op2 = pop();
	call	_pop
;rpn.c:92: if( op2 != 0 )
	ld	a, b
	or	a, c
	jr	Z, 00107$
;rpn.c:93: push( pop() / op2 );
	push	bc
	call	_pop
	ld	e, c
	ld	d, b
	pop	bc
	call	__divsint
	ld	e, c
	ld	d, b
	call	_push
	jp	00111$
00107$:
;rpn.c:95: puts( "Divide by 0" );
	ld	de, #___str_4
	call	_puts
;rpn.c:96: break;
	jp	00111$
;rpn.c:97: case '\n':
00109$:
;rpn.c:98: printf( "==> %d\n", top() );
	call	_top
	push	bc
	ld	de, #___str_5
	push	de
	call	_printf
	add	sp, #4
;rpn.c:100: }
	jp	00111$
00114$:
;rpn.c:102: }
	inc	sp
	ret
___str_3:
	.ascii "RPN Calculator"
	.db 0x00
___str_4:
	.ascii "Divide by 0"
	.db 0x00
___str_5:
	.ascii "==> %d"
	.db 0x0a
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

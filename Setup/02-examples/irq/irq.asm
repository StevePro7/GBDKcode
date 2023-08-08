;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module irq
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _print_counter
	.globl _tim
	.globl _vbl
	.globl _printf
	.globl _posy
	.globl _gotoxy
	.globl _set_interrupts
	.globl _delay
	.globl _add_TIM
	.globl _add_VBL
	.globl _tim_cnt
	.globl _vbl_cnt
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_vbl_cnt::
	.ds 2
_tim_cnt::
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
;irq.c:11: void vbl()
;	---------------------------------
; Function vbl
; ---------------------------------
_vbl::
;irq.c:14: vbl_cnt++;
	ld	hl, #_vbl_cnt
	inc	(hl)
	ret	NZ
	inc	hl
	inc	(hl)
;irq.c:15: }
	ret
;irq.c:17: void tim()
;	---------------------------------
; Function tim
; ---------------------------------
_tim::
;irq.c:20: tim_cnt++;
	ld	hl, #_tim_cnt
	inc	(hl)
	ret	NZ
	inc	hl
	inc	(hl)
;irq.c:21: }
	ret
;irq.c:23: void print_counter()
;	---------------------------------
; Function print_counter
; ---------------------------------
_print_counter::
;irq.c:30: }
	di
;irq.c:29: cnt = tim_cnt;
	ld	hl, #_tim_cnt
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ei
;irq.c:32: printf( " TIM %u", cnt );
	push	bc
	ld	de, #___str_0
	push	de
	call	_printf
	add	sp, #4
;irq.c:33: gotoxy( 9, posy() );
	call	_posy
	ld	h, e
	ld	l, #0x09
	push	hl
	call	_gotoxy
	pop	hl
;irq.c:38: }
	di
;irq.c:37: cnt = vbl_cnt;
	ld	hl, #_vbl_cnt
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ei
;irq.c:40: printf( "- VBL %u\n", cnt );
	push	bc
	ld	de, #___str_1
	push	de
	call	_printf
	add	sp, #4
;irq.c:41: }
	ret
___str_0:
	.ascii " TIM %u"
	.db 0x00
___str_1:
	.ascii "- VBL %u"
	.db 0x0a
	.db 0x00
;irq.c:43: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;irq.c:50: }
	di
;irq.c:47: vbl_cnt = tim_cnt = 0;
	xor	a, a
	ld	hl, #_tim_cnt
	ld	(hl+), a
	ld	(hl), a
	xor	a, a
	ld	hl, #_vbl_cnt
	ld	(hl+), a
	ld	(hl), a
;irq.c:48: add_VBL( vbl );
	ld	de, #_vbl
	push	de
	call	_add_VBL
	pop	hl
;irq.c:49: add_TIM( tim );
	ld	de, #_tim
	push	de
	call	_add_TIM
	pop	hl
	ei
;irq.c:53: TMA_REG = 0x00U;
	ld	a, #0x00
	ldh	(_TMA_REG + 0), a
;irq.c:55: TAC_REG = 0x04U;
	ld	a, #0x04
	ldh	(_TAC_REG + 0), a
;irq.c:57: set_interrupts( VBL_IFLAG | TIM_IFLAG );
	ld	a, #0x05
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;irq.c:59: while( 1 ) {
00102$:
;irq.c:60: print_counter();
	call	_print_counter
;irq.c:61: delay( 1000UL );
	ld	de, #0x03e8
	call	_delay
;irq.c:63: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

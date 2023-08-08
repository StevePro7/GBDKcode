;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module rand
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _memset
	.globl _puts
	.globl _plot
	.globl _arand
	.globl _initarand
	.globl _rand
	.globl _waitpadup
	.globl _waitpad
	.globl _accua
	.globl _accu
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_accu::
	.ds 80
_accua::
	.ds 80
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
;rand.c:23: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
	dec	sp
;rand.c:25: uint8_t r, s, t = 0, u = 0;
	ld	c, #0x00
	ldhl	sp,	#0
;rand.c:28: memset(accu, 0, sizeof(accu));
	ld	de, #0x0050
	ld	(hl), d
	push	de
	ld	de, #0x0000
	push	de
	ld	de, #_accu
	push	de
	call	_memset
	add	sp, #6
;rand.c:29: memset(accua, 0, sizeof(accua));
	ld	de, #0x0050
	push	de
	ld	de, #0x0000
	push	de
	ld	de, #_accua
	push	de
	call	_memset
	add	sp, #6
;rand.c:33: puts("Push any key (1)");
	push	bc
	ld	de, #___str_3
	call	_puts
	pop	bc
;rand.c:34: waitpad(0xFF);
	ld	a, #0xff
	call	_waitpad
;rand.c:35: waitpadup();
	call	_waitpadup
;rand.c:36: seed = DIV_REG;
	ldh	a, (_DIV_REG + 0)
	ld	e, a
	ld	d, #0x00
;rand.c:37: puts("Push any key (2)");
	push	bc
	push	de
	ld	de, #___str_2
	call	_puts
	pop	de
	pop	bc
;rand.c:38: waitpad(0xFF);
	push	de
	ld	a, #0xff
	call	_waitpad
	pop	de
;rand.c:39: waitpadup();
	call	_waitpadup
;rand.c:40: seed |= (uint16_t)DIV_REG << 8;
	ldh	a, (_DIV_REG + 0)
	ld	b, #0x00
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	or	a, e
	ld	e, a
	ld	a, l
	or	a, d
;rand.c:43: initarand(seed);
	push	bc
	ld	d, a
	push	de
	call	_initarand
	pop	hl
	pop	bc
;rand.c:45: do {
00106$:
;rand.c:46: r = rand();
	push	bc
	call	_rand
	pop	bc
	ld	b, e
;rand.c:47: s = arand();
	push	bc
	call	_arand
	pop	bc
;rand.c:49: if(r < 80) {
	ld	a, b
	sub	a, #0x50
	jr	NC, 00102$
;rand.c:50: t = ++accu[r];
	ld	a, #<(_accu)
	add	a, b
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_accu)
	adc	a, #0x00
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	inc	(hl)
	ld	c, (hl)
;rand.c:51: plot(r, 144-t, LTGREY, SOLID);
	ld	d, c
	ld	a, #0x90
	sub	a, d
	push	bc
	push	de
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_plot
	add	sp, #4
	pop	de
	pop	bc
00102$:
;rand.c:53: if(s < 80) {
	ld	a, e
	sub	a, #0x50
	jr	NC, 00107$
;rand.c:54: u = ++accua[s];
	ld	hl, #_accua
	ld	d, #0x00
	add	hl, de
	inc	(hl)
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;rand.c:55: plot(s+80, 144-u, DKGREY, SOLID);
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x90
	sub	a, l
	ld	b, a
	ld	a, e
	add	a, #0x50
	push	bc
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x02
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_plot
	add	sp, #4
	pop	bc
00107$:
;rand.c:58: while(t != 144 && u != 144); 
	ld	a, c
	sub	a, #0x90
	jr	Z, 00109$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x90
	jr	NZ, 00106$
00109$:
;rand.c:59: }
	inc	sp
	ret
___str_2:
	.ascii "Push any key (2)"
	.db 0x00
___str_3:
	.ascii "Getting seed"
	.db 0x0a
	.ascii "Push any key (1)"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

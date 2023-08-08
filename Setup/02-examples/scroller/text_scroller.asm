;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module text_scroller
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _scanline_isr
	.globl _printf
	.globl _get_bkg_xy_addr
	.globl _set_vram_byte
	.globl _wait_vbl_done
	.globl _set_interrupts
	.globl _add_LCD
	.globl _scroller_next_char
	.globl _scroller_x
	.globl _scanline_offsets
	.globl _limit
	.globl _base
	.globl _scroller_vram_addr
	.globl _scroller_text
	.globl _scanline_offsets_tbl
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_scroller_vram_addr::
	.ds 2
_base::
	.ds 2
_limit::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
___EMU_PROFILER_INIT:
	.ds 2
_scanline_offsets::
	.ds 2
_scroller_x::
	.ds 1
_scroller_next_char::
	.ds 2
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
;text_scroller.c:16: void scanline_isr() {
;	---------------------------------
; Function scanline_isr
; ---------------------------------
_scanline_isr::
;text_scroller.c:17: switch( LYC_REG ) {
	ldh	a, (_LYC_REG + 0)
	or	a, a
	jr	Z, 00101$
	cp	a, #0x77
	jr	Z, 00102$
	sub	a, #0x7f
	jr	Z, 00103$
	ret
;text_scroller.c:18: case 0:
00101$:
;text_scroller.c:19: SCX_REG = 0;
	xor	a, a
	ldh	(_SCX_REG + 0), a
;text_scroller.c:20: LYC_REG = SCROLL_POS_PIX_START;
	ld	a, #0x77
	ldh	(_LYC_REG + 0), a
;text_scroller.c:21: break;
	ret
;text_scroller.c:22: case SCROLL_POS_PIX_START:
00102$:
;text_scroller.c:23: SCX_REG = scroller_x;
	ld	a, (#_scroller_x)
	ldh	(_SCX_REG + 0), a
;text_scroller.c:24: LYC_REG = SCROLL_POS_PIX_END;
	ld	a, #0x7f
	ldh	(_LYC_REG + 0), a
;text_scroller.c:25: break;
	ret
;text_scroller.c:26: case SCROLL_POS_PIX_END:
00103$:
;text_scroller.c:27: SCX_REG = LYC_REG = 0;
	xor	a, a
	ldh	(_LYC_REG + 0), a
	xor	a, a
	ldh	(_SCX_REG + 0), a
;text_scroller.c:29: }
;text_scroller.c:30: }
	ret
_scanline_offsets_tbl:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
;text_scroller.c:41: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;text_scroller.c:42: printf( "Scrolling %d chars", sizeof( scroller_text ) - 1 );
	ld	de, #0x0168
	push	de
	ld	de, #___str_0
	push	de
	call	_printf
	add	sp, #4
;text_scroller.c:47: }
	di
;text_scroller.c:45: STAT_REG |= STATF_LYC; LYC_REG = 0;
	ldh	a, (_STAT_REG + 0)
	or	a, #0x40
	ldh	(_STAT_REG + 0), a
	xor	a, a
	ldh	(_LYC_REG + 0), a
;text_scroller.c:46: add_LCD( scanline_isr );
	ld	de, #_scanline_isr
	push	de
	call	_add_LCD
	pop	hl
	ei
;text_scroller.c:48: set_interrupts( VBL_IFLAG | LCD_IFLAG );
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;text_scroller.c:50: scroller_vram_addr = get_bkg_xy_addr( 20, SCROLL_POS );
	ld	hl, #0xf14
	push	hl
	call	_get_bkg_xy_addr
	pop	hl
	ld	hl, #_scroller_vram_addr
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;text_scroller.c:51: set_vram_byte( scroller_vram_addr, *scroller_next_char - 0x20 );
	ld	hl, #_scroller_next_char
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	add	a, #0xe0
	push	af
	inc	sp
	ld	hl, #_scroller_vram_addr
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_set_vram_byte
	add	sp, #3
;text_scroller.c:53: base = ( uint16_t ) scroller_vram_addr & 0xffe0;
	ld	hl, #_scroller_vram_addr
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	and	a, #0xe0
	ld	hl, #_base
	ld	(hl+), a
;text_scroller.c:54: limit = base + 0x20;
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x20
	ld	c, a
	ld	a, b
	adc	a, #0x00
	ld	hl, #_limit
	ld	(hl), c
	inc	hl
	ld	(hl), a
;text_scroller.c:56: while( 1 ) {
00108$:
;text_scroller.c:57: scroller_x++;
	ld	hl, #_scroller_x
	inc	(hl)
;text_scroller.c:58: if( ( scroller_x & 0x07 ) == 0 ) {
	ld	a, (hl)
	and	a, #0x07
	jr	NZ, 00106$
;text_scroller.c:60: scroller_next_char++;
	ld	hl, #_scroller_next_char
	inc	(hl)
	jr	NZ, 00136$
	inc	hl
	inc	(hl)
00136$:
;text_scroller.c:61: if( *scroller_next_char == 0 ) scroller_next_char = scroller_text;
	ld	hl, #_scroller_next_char
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	or	a, a
	jr	NZ, 00102$
	dec	hl
	ld	a, #<(_scroller_text)
	ld	(hl+), a
	ld	(hl), #>(_scroller_text)
00102$:
;text_scroller.c:64: scroller_vram_addr++;
	ld	hl, #_scroller_vram_addr
	inc	(hl)
	jr	NZ, 00137$
	inc	hl
	inc	(hl)
00137$:
;text_scroller.c:65: if( scroller_vram_addr == ( uint8_t * ) limit ) scroller_vram_addr = ( uint8_t * ) base;
	ld	hl, #_limit
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_scroller_vram_addr
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00104$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00104$
	ld	a, (#_base)
	ld	(#_scroller_vram_addr),a
	ld	a, (#_base + 1)
	ld	(#_scroller_vram_addr + 1),a
00104$:
;text_scroller.c:68: set_vram_byte( scroller_vram_addr, *scroller_next_char - 0x20 );
	ld	hl, #_scroller_next_char
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	add	a, #0xe0
	push	af
	inc	sp
	ld	hl, #_scroller_vram_addr
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_set_vram_byte
	add	sp, #3
00106$:
;text_scroller.c:70: wait_vbl_done();
	call	_wait_vbl_done
;text_scroller.c:72: }
	jr	00108$
_scroller_text:
	.ascii "This is a text scroller demo for GBDK-2020. You can use idea"
	.ascii "s, that are shown in this demo, to make different parallax e"
	.ascii "ffects, scrolling of tilemaps which are larger than 32x32 ti"
	.ascii "les and TEXT SCROLLERS, of course! Need to write something e"
	.ascii "lse to make this text longer than 256 characters. The quick "
	.ascii "red fox jumps over the lazy brown dog. 0123456789.          "
	.db 0x00
___str_0:
	.ascii "Scrolling %d chars"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit____EMU_PROFILER_INIT:
	.dw _EMU_profiler_message
__xinit__scanline_offsets:
	.dw _scanline_offsets_tbl
__xinit__scroller_x:
	.db #0x00	; 0
__xinit__scroller_next_char:
	.dw _scroller_text
	.area _CABS (ABS)

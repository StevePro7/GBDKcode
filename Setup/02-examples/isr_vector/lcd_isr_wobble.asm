;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module lcd_isr_wobble
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b___func_blank_tile_data
	.globl ___func_blank_tile_data
	.globl b___func_logo_map
	.globl ___func_logo_map
	.globl b___func_logo_tiles_data
	.globl ___func_logo_tiles_data
	.globl _main
	.globl _scanline_isr
	.globl _fill_bkg_rect
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _set_interrupts
	.globl _scanline_offsets
	.globl _scanline_offsets_tbl
	.globl _init_gfx
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
_scanline_offsets::
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
;lcd_isr_wobble.c:17: void scanline_isr() CRITICAL INTERRUPT {
;	---------------------------------
; Function scanline_isr
; ---------------------------------
_scanline_isr::
	push	af
	push bc
	push de
	push hl
;lcd_isr_wobble.c:18: SCX_REG = scanline_offsets[ LY_REG & ( uint8_t ) 7 ];
	ldh	a, (_LY_REG + 0)
	and	a, #0x07
	ld	c, a
	ld	hl, #_scanline_offsets
	ld	a, (hl+)
	add	a, c
	ld	c, a
	ld	a, (hl)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ldh	(_SCX_REG + 0), a
;lcd_isr_wobble.c:19: }
	pop	hl
	pop de
	pop bc
	pop af
	reti
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
;lcd_isr_wobble.c:30: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;lcd_isr_wobble.c:33: init_gfx();
	call	_init_gfx
;lcd_isr_wobble.c:36: STAT_REG = STATF_MODE00;
	ld	a, #0x08
	ldh	(_STAT_REG + 0), a
;lcd_isr_wobble.c:37: set_interrupts( VBL_IFLAG | LCD_IFLAG );
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;lcd_isr_wobble.c:40: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;lcd_isr_wobble.c:42: while( TRUE ) {
00102$:
;lcd_isr_wobble.c:43: wait_vbl_done();
	call	_wait_vbl_done
;lcd_isr_wobble.c:44: scanline_offsets = &scanline_offsets_tbl[ ( uint8_t ) ( sys_time >> 2 ) & 0x07u ];
	ld	hl, #_sys_time
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	srl	b
	rr	c
	srl	b
	rr	c
	ld	a, c
	and	a, #0x07
	ld	b, #0x00
	add	a, #<(_scanline_offsets_tbl)
	ld	c, a
	ld	a, b
	adc	a, #>(_scanline_offsets_tbl)
	ld	hl, #_scanline_offsets
	ld	(hl), c
	inc	hl
	ld	(hl), a
;lcd_isr_wobble.c:46: }
	jr	00102$
;lcd_isr_wobble.c:53: INCBIN(logo_tiles_data, "res/gbdk2020.bin") // Variable name to use, Path to file
;	---------------------------------
; Function __func_logo_tiles_data
; ---------------------------------
	b___func_logo_tiles_data	= 0
___func_logo_tiles_data::
_logo_tiles_data::
1$:
	.incbin "res/gbdk2020.bin" 
2$:
	___size_logo_tiles_data = (2$-1$) 
	.globl ___size_logo_tiles_data 
	.local b___func_logo_tiles_data 
	___bank_logo_tiles_data = b___func_logo_tiles_data 
	.globl ___bank_logo_tiles_data 
;lcd_isr_wobble.c:56: INCBIN(logo_map, "res/gbdk2020_map.bin")
;	---------------------------------
; Function __func_logo_map
; ---------------------------------
	b___func_logo_map	= 0
___func_logo_map::
_logo_map::
1$:
	.incbin "res/gbdk2020_map.bin" 
2$:
	___size_logo_map = (2$-1$) 
	.globl ___size_logo_map 
	.local b___func_logo_map 
	___bank_logo_map = b___func_logo_map 
	.globl ___bank_logo_map 
;lcd_isr_wobble.c:59: INCBIN(blank_tile_data, "res/blanktile.bin")
;	---------------------------------
; Function __func_blank_tile_data
; ---------------------------------
	b___func_blank_tile_data	= 0
___func_blank_tile_data::
_blank_tile_data::
1$:
	.incbin "res/blanktile.bin" 
2$:
	___size_blank_tile_data = (2$-1$) 
	.globl ___size_blank_tile_data 
	.local b___func_blank_tile_data 
	___bank_blank_tile_data = b___func_blank_tile_data 
	.globl ___bank_blank_tile_data 
;lcd_isr_wobble.c:74: void init_gfx() {
;	---------------------------------
; Function init_gfx
; ---------------------------------
_init_gfx::
;lcd_isr_wobble.c:76: set_bkg_data( 0x80u, 1u, blank_tile_data ); // The first 0x80u here is the tile ID
	ld	de, #_blank_tile_data
	push	de
	ld	hl, #0x180
	push	hl
	call	_set_bkg_data
	add	sp, #4
;lcd_isr_wobble.c:77: fill_bkg_rect( 0u, 0u, DEVICE_SCREEN_BUFFER_WIDTH, DEVICE_SCREEN_BUFFER_HEIGHT, 0x80u );   // The last 0x80u here is the tile ID 
	ld	hl, #0x8020
	push	hl
	ld	a, #0x20
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	call	_fill_bkg_rect
	add	sp, #5
;lcd_isr_wobble.c:81: set_bkg_data( 0u, INCBIN_SIZE( logo_tiles_data ) / TILE_BYTES, logo_tiles_data );
	ld	bc, #_logo_tiles_data+0
	ld	de, #___size_logo_tiles_data+0
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	ld	a, e
	push	bc
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;lcd_isr_wobble.c:84: logo_map );
;lcd_isr_wobble.c:82: set_bkg_tiles( LOGO_MAP_X, LOGO_MAP_Y,
	ld	de, #_logo_map
	push	de
	ld	hl, #0xc07
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;lcd_isr_wobble.c:85: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__scanline_offsets:
	.dw _scanline_offsets_tbl
	.area _CABS (ABS)
	.org 0x0048
___ISR_VECTOR_STAT:
	.db #0xc3	; 195
	.dw _scanline_isr

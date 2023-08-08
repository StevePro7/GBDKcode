;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module lcd_isr_wobble
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _scanline_isr
	.globl _printf
	.globl _wait_vbl_done
	.globl _set_interrupts
	.globl _add_LCD
	.globl _scanline_offsets
	.globl _scanline_offsets_tbl
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
___EMU_PROFILER_INIT:
	.ds 2
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
;lcd_isr_wobble.c:10: void scanline_isr() {
;	---------------------------------
; Function scanline_isr
; ---------------------------------
_scanline_isr::
;lcd_isr_wobble.c:11: SCX_REG = scanline_offsets[ LY_REG & ( uint8_t ) 7 ];
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
;lcd_isr_wobble.c:12: }
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
;lcd_isr_wobble.c:15: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;lcd_isr_wobble.c:16: printf( "This is\na wobble\ntest\nfor DMG\n|\n|\n|\n|\n|" );
	ld	de, #___str_0
	push	de
	call	_printf
	pop	hl
;lcd_isr_wobble.c:21: }
	di
;lcd_isr_wobble.c:19: STAT_REG = STATF_MODE01 | STATF_MODE00;
	ld	a, #0x18
	ldh	(_STAT_REG + 0), a
;lcd_isr_wobble.c:20: add_LCD( scanline_isr );
	ld	de, #_scanline_isr
	push	de
	call	_add_LCD
	pop	hl
	ei
;lcd_isr_wobble.c:22: set_interrupts( VBL_IFLAG | LCD_IFLAG );
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;lcd_isr_wobble.c:24: while( 1 ) {
00102$:
;lcd_isr_wobble.c:25: wait_vbl_done();
	call	_wait_vbl_done
;lcd_isr_wobble.c:26: scanline_offsets = &scanline_offsets_tbl[ ( uint8_t ) ( sys_time >> 2 ) & 0x07u ];
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
;lcd_isr_wobble.c:28: }
	jr	00102$
___str_0:
	.ascii "This is"
	.db 0x0a
	.ascii "a wobble"
	.db 0x0a
	.ascii "test"
	.db 0x0a
	.ascii "for DMG"
	.db 0x0a
	.ascii "|"
	.db 0x0a
	.ascii "|"
	.db 0x0a
	.ascii "|"
	.db 0x0a
	.ascii "|"
	.db 0x0a
	.ascii "|"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit____EMU_PROFILER_INIT:
	.dw _EMU_profiler_message
__xinit__scanline_offsets:
	.dw _scanline_offsets_tbl
	.area _CABS (ABS)

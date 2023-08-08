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
	.globl _interruptLCD
	.globl _font_set
	.globl _font_load
	.globl _font_init
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _set_interrupts
	.globl _add_LCD
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
;main.c:7: void interruptLCD(){
;	---------------------------------
; Function interruptLCD
; ---------------------------------
_interruptLCD::
;main.c:8: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;main.c:9: }
	ret
;main.c:11: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:14: STAT_REG = 0x45;
	ld	a, #0x45
	ldh	(_STAT_REG + 0), a
;main.c:15: LYC_REG = 0x08;  //  Fire LCD Interupt on the 8th scan line (just first row)
	ld	a, #0x08
	ldh	(_LYC_REG + 0), a
;C:/gbdk/include/gb/gb.h:743: __asm__("di");
	di
;main.c:19: font_init();
	call	_font_init
;main.c:20: min_font = font_load(font_min); // 36 tile
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
;main.c:21: font_set(min_font);
	push	de
	call	_font_set
	pop	hl
;main.c:23: set_bkg_data(37, 7, backgroundtiles);
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x725
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:24: set_bkg_tiles(0, 0, 40, 18, backgroundmap);
	ld	de, #_backgroundmap
	push	de
	ld	hl, #0x1228
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:26: set_win_tiles(0,0,5,1,windowmap);
	ld	de, #_windowmap
	push	de
	ld	hl, #0x105
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;C:/gbdk/include/gb/gb.h:1468: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;main.c:29: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:30: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:31: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:33: add_LCD(interruptLCD);
	ld	de, #_interruptLCD
	push	de
	call	_add_LCD
	inc	sp
	inc	sp
;C:/gbdk/include/gb/gb.h:727: __asm__("ei");
	ei
;main.c:35: set_interrupts(VBL_IFLAG | LCD_IFLAG);    
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;main.c:37: while(1){
00102$:
;main.c:38: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;C:/gbdk/include/gb/gb.h:1222: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	inc	a
	ldh	(_SCX_REG + 0), a
;main.c:40: wait_vbl_done();
	call	_wait_vbl_done
;main.c:42: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

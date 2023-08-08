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
	.globl _gbt_update
	.globl _gbt_loop
	.globl _gbt_play
	.globl _wait_vbl_done
	.globl _set_interrupts
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
;main.c:5: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;C:/gbdk/include/gb/gb.h:743: __asm__("di");
	di
;main.c:9: gbt_play( song_Data, 2, 7 );
	ld	a, #0x07
	push	af
	inc	sp
	ld	a, #0x02
	ld	de, #_song_Data
	call	_gbt_play
;main.c:10: gbt_loop( 1 );
	ld	a, #0x01
	call	_gbt_loop
;main.c:12: set_interrupts( VBL_IFLAG );
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;C:/gbdk/include/gb/gb.h:727: __asm__("ei");
	ei
;main.c:15: while( 1 )
00102$:
;main.c:17: wait_vbl_done();
	call	_wait_vbl_done
;main.c:21: gbt_update(); // This will change to ROM bank 1.
	call	_gbt_update
;main.c:23: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

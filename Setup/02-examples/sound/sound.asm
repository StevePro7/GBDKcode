;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module sound
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _wait_event
	.globl _dump_registers
	.globl _play_music
	.globl _draw_screen
	.globl _update_value
	.globl _current_value
	.globl _NR52
	.globl _NR51
	.globl _NR50
	.globl _NR44
	.globl _NR43
	.globl _NR42
	.globl _NR41
	.globl _NR34
	.globl _NR33
	.globl _NR32
	.globl _NR31
	.globl _NR30
	.globl _NR24
	.globl _NR23
	.globl _NR22
	.globl _NR21
	.globl _NR14
	.globl _NR13
	.globl _NR12
	.globl _NR11
	.globl _NR10
	.globl _println
	.globl _printn
	.globl _print
	.globl _clss
	.globl _puts
	.globl _printf
	.globl _setchar
	.globl _gotoxy
	.globl _wait_vbl_done
	.globl _waitpadup
	.globl _joypad
	.globl _delay
	.globl _s
	.globl _params_array
	.globl _keys
	.globl _previous_keys
	.globl _soundReg
	.globl _params
	.globl _params_4
	.globl _params_3
	.globl _params_2
	.globl _params_1
	.globl _params_0
	.globl _music
	.globl _frequencies
	.globl _hex
	.globl _show_register_channel
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_params::
	.ds 2
_soundReg::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_previous_keys::
	.ds 1
_keys::
	.ds 1
_params_array::
	.ds 10
_s::
	.ds 132
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
;sound.c:33: void clss()  {
;	---------------------------------
; Function clss
; ---------------------------------
_clss::
;sound.c:35: for(i = 0; i < 18; ++i) {
	ld	b, #0x00
00102$:
;sound.c:36: gotoxy(0, i);
	push	bc
	push	bc
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_gotoxy
	pop	hl
	ld	de, #___str_0
	push	de
	call	_printf
	pop	hl
	pop	bc
;sound.c:35: for(i = 0; i < 18; ++i) {
	inc	b
	ld	a, b
	sub	a, #0x12
	jr	C, 00102$
;sound.c:39: }
	ret
___str_0:
	.ascii "                    "
	.db 0x00
;sound.c:41: void print(const char* str) {
;	---------------------------------
; Function print
; ---------------------------------
_print::
;sound.c:42: printf("%s", str);
	push	de
	ld	de, #___str_1
	push	de
	call	_printf
	add	sp, #4
;sound.c:43: }
	ret
___str_1:
	.ascii "%s"
	.db 0x00
;sound.c:46: void printn( uint16_t n, uint8_t base, uint8_t sign ) {
;	---------------------------------
; Function printn
; ---------------------------------
_printn::
;sound.c:48: if( base == 16u ) {
	sub	a, #0x10
	jr	NZ, 00102$
;sound.c:49: printf( "%c", hex[ 0x000Fu & ( n >> 4u ) ] );
	ld	c, e
	ld	b, d
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ld	a, c
	and	a, #0x0f
	ld	c, a
	ld	b, #0x00
	ld	hl, #_hex
	add	hl, bc
	ld	a, (hl)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	push	de
	push	bc
	ld	bc, #___str_2
	push	bc
	call	_printf
	add	sp, #4
	pop	de
;sound.c:50: printf( "%c", hex[ 0x000Fu & ( n ) ] );
	ld	a, e
	and	a, #0x0f
	ld	c, a
	ld	b, #0x00
	ld	hl, #_hex
	add	hl, bc
	ld	a, (hl)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	push	bc
	ld	de, #___str_2
	push	de
	call	_printf
	add	sp, #4
	jr	00104$
00102$:
;sound.c:53: printf( "%d", n );
	push	de
	ld	de, #___str_3
	push	de
	call	_printf
	add	sp, #4
00104$:
;sound.c:55: }
	pop	hl
	inc	sp
	jp	(hl)
_hex:
	.ascii "0123456789ABCDEF"
	.db 0x00
___str_2:
	.ascii "%c"
	.db 0x00
___str_3:
	.ascii "%d"
	.db 0x00
;sound.c:58: void println( uint16_t n, uint8_t base, uint8_t sign ) {
;	---------------------------------
; Function println
; ---------------------------------
_println::
	ld	c, a
;sound.c:59: printn( n, base, sign );
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_printn
;sound.c:60: printf( "\n" );
	ld	de, #___str_6
	call	_puts
;sound.c:61: }
	pop	hl
	inc	sp
	jp	(hl)
___str_6:
	.db 0x00
;sound.c:327: uint8_t NR10() {
;	---------------------------------
; Function NR10
; ---------------------------------
_NR10::
;sound.c:328: return soundReg->mode1.sweepShifts | ( soundReg->mode1.sweepMode << 3 ) | ( soundReg->mode1.sweepTime << 4 );
	ld	hl, #_soundReg
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_soundReg + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	c, (hl)
	ld	e, l
	ld	d, h
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	de
	inc	de
	ld	a, (de)
	add	a, a
	add	a, a
	add	a, a
	or	a, c
	ld	c, a
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	or	a, c
;sound.c:329: }
	ret
_frequencies:
	.dw #0x002c
	.dw #0x009c
	.dw #0x0106
	.dw #0x016b
	.dw #0x01c9
	.dw #0x0223
	.dw #0x0277
	.dw #0x02c6
	.dw #0x0312
	.dw #0x0356
	.dw #0x039b
	.dw #0x03da
	.dw #0x0416
	.dw #0x044e
	.dw #0x0483
	.dw #0x04b5
	.dw #0x04e5
	.dw #0x0511
	.dw #0x053b
	.dw #0x0563
	.dw #0x0589
	.dw #0x05ac
	.dw #0x05ce
	.dw #0x05ed
	.dw #0x060a
	.dw #0x0627
	.dw #0x0642
	.dw #0x065b
	.dw #0x0672
	.dw #0x0689
	.dw #0x069e
	.dw #0x06b2
	.dw #0x06c4
	.dw #0x06d6
	.dw #0x06e7
	.dw #0x06f7
	.dw #0x0706
	.dw #0x0714
	.dw #0x0721
	.dw #0x072d
	.dw #0x0739
	.dw #0x0744
	.dw #0x074f
	.dw #0x0759
	.dw #0x0762
	.dw #0x076b
	.dw #0x0773
	.dw #0x077b
	.dw #0x0783
	.dw #0x078a
	.dw #0x0790
	.dw #0x0797
	.dw #0x079d
	.dw #0x07a2
	.dw #0x07a7
	.dw #0x07ac
	.dw #0x07b1
	.dw #0x07b6
	.dw #0x07ba
	.dw #0x07be
	.dw #0x07c1
	.dw #0x07c4
	.dw #0x07c8
	.dw #0x07cb
	.dw #0x07ce
	.dw #0x07d1
	.dw #0x07d4
	.dw #0x07d6
	.dw #0x07d9
	.dw #0x07db
	.dw #0x07dd
	.dw #0x07df
_music:
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2d	; 45
	.db #0x2d	; 45
	.db #0x2b	; 43
	.db #0x48	; 72	'H'
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x24	; 36
	.db #0x48	; 72	'H'
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2d	; 45
	.db #0x2d	; 45
	.db #0x2b	; 43
	.db #0x48	; 72	'H'
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x24	; 36
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
_params_0:
	.dw __str_7
	.dw #0x0000
	.dw __str_8
	.dw #0x0001
	.dw __str_9
	.dw #0x0001
	.dw __str_10
	.dw #0x0001
	.dw __str_11
	.dw #0x0007
	.dw __str_12
	.dw #0x0007
	.dw #0x0000
	.dw #0x0000
_params_1:
	.dw __str_13
	.dw #0x0000
	.dw __str_14
	.dw #0x0007
	.dw __str_15
	.dw #0x0001
	.dw __str_16
	.dw #0x0007
	.dw __str_17
	.dw #0x0003
	.dw __str_18
	.dw #0x003f
	.dw __str_19
	.dw #0x000f
	.dw __str_20
	.dw #0x0001
	.dw __str_21
	.dw #0x0007
	.dw __str_22
	.dw #0x07ff
	.dw __str_23
	.dw #0x0001
	.dw __str_24
	.dw #0x0001
	.dw __str_25
	.dw #0x0001
	.dw __str_26
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
_params_2:
	.dw __str_27
	.dw #0x0000
	.dw __str_17
	.dw #0x0003
	.dw __str_18
	.dw #0x003f
	.dw __str_19
	.dw #0x000f
	.dw __str_20
	.dw #0x0001
	.dw __str_28
	.dw #0x0007
	.dw __str_22
	.dw #0x07ff
	.dw __str_23
	.dw #0x0001
	.dw __str_24
	.dw #0x0001
	.dw __str_25
	.dw #0x0001
	.dw __str_26
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
_params_3:
	.dw __str_29
	.dw #0x0000
	.dw __str_30
	.dw #0x0001
	.dw __str_18
	.dw #0x00ff
	.dw __str_31
	.dw #0x0003
	.dw __str_22
	.dw #0x07ff
	.dw __str_23
	.dw #0x0001
	.dw __str_24
	.dw #0x0001
	.dw __str_25
	.dw #0x0001
	.dw __str_26
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
_params_4:
	.dw __str_32
	.dw #0x0000
	.dw __str_18
	.dw #0x003f
	.dw __str_19
	.dw #0x000f
	.dw __str_20
	.dw #0x0001
	.dw __str_28
	.dw #0x0007
	.dw __str_33
	.dw #0x000f
	.dw __str_34
	.dw #0x0001
	.dw __str_35
	.dw #0x0007
	.dw __str_23
	.dw #0x0001
	.dw __str_24
	.dw #0x0001
	.dw __str_25
	.dw #0x0001
	.dw __str_26
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
__str_7:
	.ascii "Main Controls"
	.db 0x00
__str_8:
	.ascii "All On/Off"
	.db 0x00
__str_9:
	.ascii "Vin->SO1"
	.db 0x00
__str_10:
	.ascii "Vin->SO2"
	.db 0x00
__str_11:
	.ascii "SO1 Volume"
	.db 0x00
__str_12:
	.ascii "SO2 Volume"
	.db 0x00
__str_13:
	.ascii "Sound Mode #1"
	.db 0x00
__str_14:
	.ascii "Swp Time"
	.db 0x00
__str_15:
	.ascii "Swp Mode"
	.db 0x00
__str_16:
	.ascii "Swp Shifts"
	.db 0x00
__str_17:
	.ascii "Pat Duty"
	.db 0x00
__str_18:
	.ascii "Sound Len"
	.db 0x00
__str_19:
	.ascii "Env Init"
	.db 0x00
__str_20:
	.ascii "Env Mode"
	.db 0x00
__str_21:
	.ascii "Env Nb Swp"
	.db 0x00
__str_22:
	.ascii "Frequency"
	.db 0x00
__str_23:
	.ascii "Cons Sel"
	.db 0x00
__str_24:
	.ascii "Out to SO1"
	.db 0x00
__str_25:
	.ascii "Out to SO2"
	.db 0x00
__str_26:
	.ascii "On/Off"
	.db 0x00
__str_27:
	.ascii "Sound Mode #2"
	.db 0x00
__str_28:
	.ascii "Env Nb Step"
	.db 0x00
__str_29:
	.ascii "Sound Mode #3"
	.db 0x00
__str_30:
	.ascii "Sound On/Off"
	.db 0x00
__str_31:
	.ascii "Sel Out Level"
	.db 0x00
__str_32:
	.ascii "Sound Mode #4"
	.db 0x00
__str_33:
	.ascii "Poly Cnt Freq"
	.db 0x00
__str_34:
	.ascii "Poly Cnt Step"
	.db 0x00
__str_35:
	.ascii "Poly Cnt Div"
	.db 0x00
;sound.c:331: uint8_t NR11() {
;	---------------------------------
; Function NR11
; ---------------------------------
_NR11::
;sound.c:332: return soundReg->mode1.soundLength | ( soundReg->mode1.patternDuty << 6 );
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0008
	add	hl, bc
	ld	e, (hl)
	ld	hl, #0x000a
	add	hl, bc
	ld	a, (hl)
	rrca
	rrca
	and	a, #0xc0
	or	a, e
;sound.c:333: }
	ret
;sound.c:335: uint8_t NR12() {
;	---------------------------------
; Function NR12
; ---------------------------------
_NR12::
;sound.c:336: return soundReg->mode1.envNbSweep | ( soundReg->mode1.envMode << 3 ) | ( soundReg->mode1.envInitialValue << 4 );
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x000c
	add	hl, bc
	ld	e, (hl)
	ld	hl, #0x000e
	add	hl, bc
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	or	a, e
	ld	e, a
	ld	hl, #0x0010
	add	hl, bc
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	or	a, e
;sound.c:337: }
	ret
;sound.c:339: uint8_t NR13() {
;	---------------------------------
; Function NR13
; ---------------------------------
_NR13::
;sound.c:340: return soundReg->mode1.frequencyLow;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0012
	add	hl, bc
	ld	a, (hl)
;sound.c:341: }
	ret
;sound.c:343: uint8_t NR14() {
;	---------------------------------
; Function NR14
; ---------------------------------
_NR14::
;sound.c:344: return soundReg->mode1.frequencyHigh | ( soundReg->mode1.counter_ConsSel << 6 ) | ( soundReg->mode1.restart << 7 );
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0014
	add	hl, bc
	ld	e, (hl)
	ld	hl, #0x0018
	add	hl, bc
	ld	a, (hl)
	rrca
	rrca
	and	a, #0xc0
	or	a, e
	ld	e, a
	ld	hl, #0x001a
	add	hl, bc
	ld	a, (hl)
	rrca
	and	a, #0x80
	or	a, e
;sound.c:345: }
	ret
;sound.c:348: uint8_t NR21() {
;	---------------------------------
; Function NR21
; ---------------------------------
_NR21::
;sound.c:349: return soundReg->mode2.soundLength | ( soundReg->mode2.patternDuty << 6 );
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x001e
	add	hl, bc
	ld	e, (hl)
	ld	hl, #0x0020
	add	hl, bc
	ld	a, (hl)
	rrca
	rrca
	and	a, #0xc0
	or	a, e
;sound.c:350: }
	ret
;sound.c:352: uint8_t NR22() {
;	---------------------------------
; Function NR22
; ---------------------------------
_NR22::
;sound.c:353: return soundReg->mode2.envNbStep | (soundReg->mode2.envMode << 3) | (soundReg->mode2.envInitialValue << 4);
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0022
	add	hl, bc
	ld	e, (hl)
	ld	hl, #0x0024
	add	hl, bc
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	or	a, e
	ld	e, a
	ld	hl, #0x0026
	add	hl, bc
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	or	a, e
;sound.c:354: }
	ret
;sound.c:356: uint8_t NR23() {
;	---------------------------------
; Function NR23
; ---------------------------------
_NR23::
;sound.c:357: return soundReg->mode2.frequencyLow;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0028
	add	hl, bc
	ld	a, (hl)
;sound.c:358: }
	ret
;sound.c:360: uint8_t NR24() {
;	---------------------------------
; Function NR24
; ---------------------------------
_NR24::
;sound.c:361: return soundReg->mode2.frequencyHigh | ( soundReg->mode2.counter_ConsSel << 6 ) | ( soundReg->mode2.restart << 7 );
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x002a
	add	hl, bc
	ld	e, (hl)
	ld	hl, #0x002e
	add	hl, bc
	ld	a, (hl)
	rrca
	rrca
	and	a, #0xc0
	or	a, e
	ld	e, a
	ld	hl, #0x0030
	add	hl, bc
	ld	a, (hl)
	rrca
	and	a, #0x80
	or	a, e
;sound.c:362: }
	ret
;sound.c:365: uint8_t NR30() {
;	---------------------------------
; Function NR30
; ---------------------------------
_NR30::
;sound.c:366: return soundReg->mode3.on_Off << 7;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0034
	add	hl, bc
	ld	a, (hl)
	rrca
	and	a, #0x80
;sound.c:367: }
	ret
;sound.c:369: uint8_t NR31() {
;	---------------------------------
; Function NR31
; ---------------------------------
_NR31::
;sound.c:370: return soundReg->mode3.soundLength;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0036
	add	hl, bc
	ld	a, (hl)
;sound.c:371: }
	ret
;sound.c:373: uint8_t NR32() {
;	---------------------------------
; Function NR32
; ---------------------------------
_NR32::
;sound.c:374: return soundReg->mode3.selOutputLevel << 5;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x003a
	add	hl, bc
	ld	a, (hl)
	swap	a
	rlca
	and	a, #0xe0
;sound.c:375: }
	ret
;sound.c:377: uint8_t NR33() {
;	---------------------------------
; Function NR33
; ---------------------------------
_NR33::
;sound.c:378: return soundReg->mode3.frequencyLow;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x003e
	add	hl, bc
	ld	a, (hl)
;sound.c:379: }
	ret
;sound.c:381: uint8_t NR34() {
;	---------------------------------
; Function NR34
; ---------------------------------
_NR34::
;sound.c:382: return soundReg->mode3.frequencyHigh | ( soundReg->mode3.counter_ConsSel << 6 ) | ( soundReg->mode3.restart << 7 );
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0040
	add	hl, bc
	ld	e, (hl)
	ld	hl, #0x0044
	add	hl, bc
	ld	a, (hl)
	rrca
	rrca
	and	a, #0xc0
	or	a, e
	ld	e, a
	ld	hl, #0x0046
	add	hl, bc
	ld	a, (hl)
	rrca
	and	a, #0x80
	or	a, e
;sound.c:383: }
	ret
;sound.c:386: uint8_t NR41() {
;	---------------------------------
; Function NR41
; ---------------------------------
_NR41::
;sound.c:387: return soundReg->mode4.soundLength;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x004a
	add	hl, bc
	ld	a, (hl)
;sound.c:388: }
	ret
;sound.c:390: uint8_t NR42() {
;	---------------------------------
; Function NR42
; ---------------------------------
_NR42::
;sound.c:391: return soundReg->mode4.envNbStep | ( soundReg->mode4.envMode << 3 ) | ( soundReg->mode4.envInitialValue << 4 );
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x004e
	add	hl, bc
	ld	e, (hl)
	ld	hl, #0x0050
	add	hl, bc
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	or	a, e
	ld	e, a
	ld	hl, #0x0052
	add	hl, bc
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	or	a, e
;sound.c:392: }
	ret
;sound.c:394: uint8_t NR43() {
;	---------------------------------
; Function NR43
; ---------------------------------
_NR43::
;sound.c:395: return soundReg->mode4.polyCounterDiv | ( soundReg->mode4.polyCounterStep << 3 ) | ( soundReg->mode4.polyCounterFreq << 4 );
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0054
	add	hl, bc
	ld	e, (hl)
	ld	hl, #0x0056
	add	hl, bc
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	or	a, e
	ld	e, a
	ld	hl, #0x0058
	add	hl, bc
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	or	a, e
;sound.c:396: }
	ret
;sound.c:398: uint8_t NR44() {
;	---------------------------------
; Function NR44
; ---------------------------------
_NR44::
;sound.c:399: return ( soundReg->mode4.counter_ConsSel << 6 ) | ( soundReg->mode4.restart << 7 );
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x005c
	add	hl, bc
	ld	a, (hl)
	rrca
	rrca
	and	a, #0xc0
	ld	e, a
	ld	hl, #0x005e
	add	hl, bc
	ld	a, (hl)
	rrca
	and	a, #0x80
	or	a, e
;sound.c:400: }
	ret
;sound.c:403: uint8_t NR50() {
;	---------------------------------
; Function NR50
; ---------------------------------
_NR50::
;sound.c:404: return soundReg->control.SO1_OutputLevel | ( soundReg->control.Vin_SO1 << 3u ) | ( soundReg->control.SO2_OutputLevel << 4u ) |
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0060
	add	hl, bc
	ld	e, (hl)
	ld	hl, #0x0062
	add	hl, bc
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	or	a, e
	ld	e, a
	ld	hl, #0x0064
	add	hl, bc
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	or	a, e
	ld	e, a
;sound.c:405: ( soundReg->control.Vin_SO2 << 7u );
	ld	hl, #0x0066
	add	hl, bc
	ld	a, (hl)
	rrca
	and	a, #0x80
	or	a, e
;sound.c:406: }
	ret
;sound.c:408: uint8_t NR51() {
;	---------------------------------
; Function NR51
; ---------------------------------
_NR51::
;sound.c:409: return soundReg->control.Sound1_To_SO1 | ( soundReg->control.Sound2_To_SO1 << 1 ) | ( soundReg->control.Sound3_To_SO1 << 2 ) |
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0068
	add	hl, bc
	ld	e, (hl)
	ld	hl, #0x006a
	add	hl, bc
	ld	a, (hl)
	add	a, a
	or	a, e
	ld	e, a
	ld	hl, #0x006c
	add	hl, bc
	ld	a, (hl)
	add	a, a
	add	a, a
	or	a, e
	ld	e, a
;sound.c:410: ( soundReg->control.Sound4_To_SO1 << 3 ) | ( soundReg->control.Sound1_To_SO2 << 4 ) | ( soundReg->control.Sound2_To_SO2 << 5 ) |
	ld	hl, #0x006e
	add	hl, bc
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	or	a, e
	ld	e, a
	ld	hl, #0x0070
	add	hl, bc
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	or	a, e
	ld	e, a
	ld	hl, #0x0072
	add	hl, bc
	ld	a, (hl)
	swap	a
	rlca
	and	a, #0xe0
	or	a, e
	ld	e, a
;sound.c:411: ( soundReg->control.Sound3_To_SO2 << 6 ) | ( soundReg->control.Sound4_To_SO2 << 7 );
	ld	hl, #0x0074
	add	hl, bc
	ld	a, (hl)
	rrca
	rrca
	and	a, #0xc0
	or	a, e
	ld	e, a
	ld	hl, #0x0076
	add	hl, bc
	ld	a, (hl)
	rrca
	and	a, #0x80
	or	a, e
;sound.c:412: }
	ret
;sound.c:414: uint8_t NR52() {
;	---------------------------------
; Function NR52
; ---------------------------------
_NR52::
;sound.c:415: return soundReg->control.global_On_Off << 7;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0082
	add	hl, bc
	ld	a, (hl)
	rrca
	and	a, #0x80
;sound.c:416: }
	ret
;sound.c:419: uint16_t current_value( uint8_t mode, uint8_t line )
;	---------------------------------
; Function current_value
; ---------------------------------
_current_value::
;sound.c:421: if( mode == 0 ) {
	ld	c, a
	or	a, a
	jr	NZ, 00168$
;sound.c:422: switch( line )
	ld	a, #0x04
	sub	a, e
	jp	C, 00169$
	ld	d, #0x00
	ld	hl, #00377$
	add	hl, de
	add	hl, de
;sound.c:424: case 0: // global_On_Off
	jp	(hl)
00377$:
	jr	00101$
	jr	00102$
	jr	00103$
	jr	00104$
	jr	00105$
00101$:
;sound.c:425: return soundReg->control.global_On_Off;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0082
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:426: case 1: // Vin_SO1
00102$:
;sound.c:427: return soundReg->control.Vin_SO1;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0062
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:428: case 2: // Vin_SO2
00103$:
;sound.c:429: return soundReg->control.Vin_SO2;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0066
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:430: case 3: // SO1_OutputLevel
00104$:
;sound.c:431: return soundReg->control.SO1_OutputLevel;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0060
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:432: case 4: // SO2_OutputLevel
00105$:
;sound.c:433: return soundReg->control.SO2_OutputLevel;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0064
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:434: }
00168$:
;sound.c:436: else if( mode == 1 ) {
	ld	a, c
	dec	a
	jp	NZ,00165$
;sound.c:437: switch( line )
	ld	a, e
	or	a, a
	jr	Z, 00107$
	ld	a, e
	dec	a
	jr	Z, 00108$
	ld	a,e
	cp	a,#0x02
	jr	Z, 00109$
	cp	a,#0x03
	jr	Z, 00110$
	cp	a,#0x04
	jr	Z, 00111$
	cp	a,#0x05
	jr	Z, 00112$
	cp	a,#0x06
	jr	Z, 00113$
	cp	a,#0x07
	jp	Z,00114$
	cp	a,#0x08
	jp	Z,00116$
	cp	a,#0x09
	jp	Z,00117$
	cp	a,#0x0a
	jp	Z,00118$
	cp	a,#0x0b
	jp	Z,00119$
	cp	a,#0x0c
	jp	Z,00120$
	sub	a, #0x21
	jr	Z, 00116$
	jp	00169$
;sound.c:439: case 0: // sweepTime
00107$:
;sound.c:440: return soundReg->mode1.sweepTime;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0004
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:441: case 1: // sweepMode
00108$:
;sound.c:442: return soundReg->mode1.sweepMode;
	ld	hl, #_soundReg
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_soundReg + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:443: case 2: // sweepShifts
00109$:
;sound.c:444: return soundReg->mode1.sweepShifts;
	ld	hl, #_soundReg
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_soundReg + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:445: case 3: // patternDuty
00110$:
;sound.c:446: return soundReg->mode1.patternDuty;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x000a
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:447: case 4: // soundLength
00111$:
;sound.c:448: return soundReg->mode1.soundLength;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0008
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:449: case 5: // envInitialValue
00112$:
;sound.c:450: return soundReg->mode1.envInitialValue;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0010
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:451: case 6: // envMode
00113$:
;sound.c:452: return soundReg->mode1.envMode;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x000e
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:453: case 7: // envNbSweep
00114$:
;sound.c:454: return soundReg->mode1.envNbSweep;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x000c
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:456: case FREQUENCY:
00116$:
;sound.c:457: return ( soundReg->mode1.frequencyHigh << 8 ) | soundReg->mode1.frequencyLow;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0014
	add	hl, bc
	ld	a, (hl+)
	ld	b, a
	ld	c, #0x00
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0012
	add	hl, de
	ld	a, (hl+)
	ld	l, (hl)
;	spillPairReg hl
	or	a, c
	ld	c, a
	ld	a, l
	or	a, b
	ld	b, a
	ret
;sound.c:458: case 9: // counter_ConsSel
00117$:
;sound.c:459: return soundReg->mode1.counter_ConsSel;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0018
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:460: case 10: // Sound1_To_SO1
00118$:
;sound.c:461: return soundReg->control.Sound1_To_SO1;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0068
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:462: case 11: // Sound1_To_SO2
00119$:
;sound.c:463: return soundReg->control.Sound1_To_SO2;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0070
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:464: case 12: // Sound1_On_Off
00120$:
;sound.c:465: return soundReg->control.Sound1_On_Off;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0078
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:466: }
00165$:
;sound.c:468: else if( mode == 2 ) {
	ld	a, c
;sound.c:469: switch( line )
	sub	a,#0x02
	jp	NZ,00162$
	or	a,e
	jr	Z, 00122$
	ld	a, e
	dec	a
	jr	Z, 00123$
	ld	a,e
	cp	a,#0x02
	jr	Z, 00124$
	cp	a,#0x03
	jr	Z, 00125$
	cp	a,#0x04
	jr	Z, 00126$
	cp	a,#0x05
	jr	Z, 00128$
	cp	a,#0x06
	jr	Z, 00129$
	cp	a,#0x07
	jp	Z,00130$
	cp	a,#0x08
	jp	Z,00131$
	cp	a,#0x09
	jp	Z,00132$
	sub	a, #0x21
	jr	Z, 00128$
	jp	00169$
;sound.c:471: case 0: // patternDuty
00122$:
;sound.c:472: return soundReg->mode2.patternDuty;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0020
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:473: case 1: // soundLength
00123$:
;sound.c:474: return soundReg->mode2.soundLength;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x001e
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:475: case 2: // envInitialValue
00124$:
;sound.c:476: return soundReg->mode2.envInitialValue;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0026
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:477: case 3: // envMode
00125$:
;sound.c:478: return soundReg->mode2.envMode;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0024
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:479: case 4: // envNbStep
00126$:
;sound.c:480: return soundReg->mode2.envNbStep;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0022
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:482: case FREQUENCY:
00128$:
;sound.c:483: return ( soundReg->mode2.frequencyHigh << 8 ) | soundReg->mode2.frequencyLow;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x002a
	add	hl, bc
	ld	a, (hl+)
	ld	b, a
	ld	c, #0x00
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0028
	add	hl, de
	ld	a, (hl+)
	ld	l, (hl)
;	spillPairReg hl
	or	a, c
	ld	c, a
	ld	a, l
	or	a, b
	ld	b, a
	ret
;sound.c:484: case 6: // counter_ConsSel
00129$:
;sound.c:485: return soundReg->mode2.counter_ConsSel;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x002e
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:486: case 7: // Sound2_To_SO1
00130$:
;sound.c:487: return soundReg->control.Sound2_To_SO1;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x006a
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:488: case 8: // Sound2_To_SO2
00131$:
;sound.c:489: return soundReg->control.Sound2_To_SO2;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0072
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:490: case 9: // Sound2_On_Off
00132$:
;sound.c:491: return soundReg->control.Sound2_On_Off;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x007a
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:492: }
00162$:
;sound.c:494: else if( mode == 3 ) {
	ld	a, c
;sound.c:495: switch( line )
	sub	a,#0x03
	jp	NZ,00159$
	or	a,e
	jr	Z, 00134$
	ld	a, e
	dec	a
	jr	Z, 00135$
	ld	a,e
	cp	a,#0x02
	jr	Z, 00136$
	cp	a,#0x03
	jr	Z, 00138$
	cp	a,#0x04
	jr	Z, 00139$
	cp	a,#0x05
	jr	Z, 00140$
	cp	a,#0x06
	jr	Z, 00141$
	cp	a,#0x07
	jr	Z, 00142$
	sub	a, #0x21
	jr	Z, 00138$
	jp	00169$
;sound.c:497: case 0: // on_Off
00134$:
;sound.c:498: return soundReg->mode3.on_Off;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0034
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:499: case 1: // soundLength
00135$:
;sound.c:500: return soundReg->mode3.soundLength;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0036
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:501: case 2: // selOutputLevel
00136$:
;sound.c:502: return soundReg->mode3.selOutputLevel;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x003a
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:504: case FREQUENCY:
00138$:
;sound.c:505: return ( soundReg->mode3.frequencyHigh << 8 ) | soundReg->mode3.frequencyLow;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0040
	add	hl, bc
	ld	a, (hl+)
	ld	b, a
	ld	c, #0x00
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x003e
	add	hl, de
	ld	a, (hl+)
	ld	l, (hl)
;	spillPairReg hl
	or	a, c
	ld	c, a
	ld	a, l
	or	a, b
	ld	b, a
	ret
;sound.c:506: case 4: // counter_ConsSel
00139$:
;sound.c:507: return soundReg->mode3.counter_ConsSel;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0044
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:508: case 5: // Sound3_To_SO1
00140$:
;sound.c:509: return soundReg->control.Sound3_To_SO1;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x006c
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:510: case 6: // Sound3_To_SO2
00141$:
;sound.c:511: return soundReg->control.Sound3_To_SO2;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0074
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:512: case 7: // Sound3_On_Off
00142$:
;sound.c:513: return soundReg->control.Sound3_On_Off;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x007c
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:514: }
00159$:
;sound.c:516: else if( mode == 4 ) {
	ld	a, c
	sub	a, #0x04
	jp	NZ,00169$
;sound.c:517: switch( line )
	ld	a, #0x0a
	sub	a, e
	jp	C, 00169$
	ld	d, #0x00
	ld	hl, #00420$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
00420$:
	jp	00144$
	jp	00145$
	jp	00146$
	jp	00147$
	jp	00148$
	jp	00149$
	jp	00150$
	jp	00151$
	jp	00152$
	jp	00153$
	jp	00154$
;sound.c:519: case 0: // soundLength
00144$:
;sound.c:520: return soundReg->mode4.soundLength;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x004a
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:521: case 1: // envInitialValue
00145$:
;sound.c:522: return soundReg->mode4.envInitialValue;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0052
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:523: case 2: // envMode
00146$:
;sound.c:524: return soundReg->mode4.envMode;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0050
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:525: case 3: // envNbStep
00147$:
;sound.c:526: return soundReg->mode4.envNbStep;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x004e
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:527: case 4: // polyCounterFreq
00148$:
;sound.c:528: return soundReg->mode4.polyCounterFreq;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0058
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:529: case 5: // polyCounterStep
00149$:
;sound.c:530: return soundReg->mode4.polyCounterStep;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0056
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:531: case 6: // polyCounterDiv
00150$:
;sound.c:532: return soundReg->mode4.polyCounterDiv;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0054
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:533: case 7: // counter_ConsSel
00151$:
;sound.c:534: return soundReg->mode4.counter_ConsSel;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x005c
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:535: case 8: // Sound4_To_SO1
00152$:
;sound.c:536: return soundReg->control.Sound4_To_SO1;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x006e
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:537: case 9: // Sound4_To_SO2
00153$:
;sound.c:538: return soundReg->control.Sound4_To_SO2;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0076
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:539: case 10: // Sound4_On_Off
00154$:
;sound.c:540: return soundReg->control.Sound4_On_Off;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x007e
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ret
;sound.c:541: }
00169$:
;sound.c:543: return 0;
	ld	bc, #0x0000
;sound.c:544: }
	ret
;sound.c:546: void update_value( uint8_t mode, uint8_t line, uint16_t value )
;	---------------------------------
; Function update_value
; ---------------------------------
_update_value::
;	spillPairReg hl
;	spillPairReg hl
;sound.c:548: if( mode == 0 ) {
	ld	l, a
	ld	b, e
;sound.c:549: switch( line )
	or	a,a
	jp	NZ,00174$
	or	a,b
	jr	Z, 00101$
	ld	a, b
	dec	a
	jr	Z, 00102$
	ld	a,b
	cp	a,#0x02
	jr	Z, 00103$
	cp	a,#0x03
	jr	Z, 00104$
	cp	a,#0x04
	jr	Z, 00105$
	cp	a,#0x20
	jp	Z,00107$
	sub	a, #0x21
	jp	Z,00106$
	jp	00176$
;sound.c:551: case 0: // global_On_Off
00101$:
;sound.c:552: soundReg->control.global_On_Off = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0082
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:553: NR52_REG = NR52();
	call	_NR52
	ldh	(_NR52_REG + 0), a
;sound.c:554: break;
	jp	00176$
;sound.c:555: case 1: // Vin_SO1
00102$:
;sound.c:556: soundReg->control.Vin_SO1 = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0062
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:557: NR50_REG = NR50();
	call	_NR50
	ldh	(_NR50_REG + 0), a
;sound.c:558: break;
	jp	00176$
;sound.c:559: case 2: // Vin_SO2
00103$:
;sound.c:560: soundReg->control.Vin_SO2 = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0066
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:561: NR50_REG = NR50();
	call	_NR50
	ldh	(_NR50_REG + 0), a
;sound.c:562: break;
	jp	00176$
;sound.c:563: case 3: // SO1_OutputLevel
00104$:
;sound.c:564: soundReg->control.SO1_OutputLevel = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0060
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:565: NR50_REG = NR50();
	call	_NR50
	ldh	(_NR50_REG + 0), a
;sound.c:566: break;
	jp	00176$
;sound.c:567: case 4: // SO2_OutputLevel
00105$:
;sound.c:568: soundReg->control.SO2_OutputLevel = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0064
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:569: NR50_REG = NR50();
	call	_NR50
	ldh	(_NR50_REG + 0), a
;sound.c:570: break;
	jp	00176$
;sound.c:571: case FREQUENCY:
00106$:
;sound.c:572: update_value( 1, FREQUENCY, value );
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	e, #0x21
	ld	a, #0x01
	call	_update_value
;sound.c:573: update_value( 2, FREQUENCY, value );
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	e, #0x21
	ld	a, #0x02
	call	_update_value
;sound.c:574: update_value( 3, FREQUENCY, value );
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	e, #0x21
	ld	a, #0x03
	call	_update_value
;sound.c:575: break;
	jp	00176$
;sound.c:576: case PLAY: // restart
00107$:
;sound.c:577: update_value( 1, FREQUENCY, current_value( 1, FREQUENCY ) );
	ld	e, #0x21
	ld	a, #0x01
	call	_current_value
	push	bc
	ld	e, #0x21
	ld	a, #0x01
	call	_update_value
;sound.c:578: update_value( 2, FREQUENCY, current_value( 2, FREQUENCY ) );
	ld	e, #0x21
	ld	a, #0x02
	call	_current_value
	push	bc
	ld	e, #0x21
	ld	a, #0x02
	call	_update_value
;sound.c:579: update_value( 3, FREQUENCY, current_value( 3, FREQUENCY ) );
	ld	e, #0x21
	ld	a, #0x03
	call	_current_value
	push	bc
	ld	e, #0x21
	ld	a, #0x03
	call	_update_value
;sound.c:580: soundReg->mode1.restart = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x001a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:581: soundReg->mode2.restart = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0030
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:582: soundReg->mode3.restart = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0046
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:583: soundReg->mode4.restart = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x005e
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:584: NR14_REG = NR14();
	call	_NR14
	ldh	(_NR14_REG + 0), a
;sound.c:585: NR24_REG = NR24();
	call	_NR24
	ldh	(_NR24_REG + 0), a
;sound.c:586: NR34_REG = NR34();
	call	_NR34
	ldh	(_NR34_REG + 0), a
;sound.c:587: NR44_REG = NR44();
	call	_NR44
	ldh	(_NR44_REG + 0), a
;sound.c:588: soundReg->mode1.restart = 0;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x001a
	add	hl, bc
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;sound.c:589: soundReg->mode2.restart = 0;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0030
	add	hl, bc
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;sound.c:590: soundReg->mode3.restart = 0;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0046
	add	hl, bc
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;sound.c:591: soundReg->mode4.restart = 0;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x005e
	add	hl, bc
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;sound.c:593: }
	jp	00176$
00174$:
;sound.c:595: else if( mode == 1 ) {
	ld	a, l
	dec	a
	jp	NZ,00171$
;sound.c:596: switch( line )
	ld	a, b
	or	a, a
	jr	Z, 00109$
	ld	a, b
	dec	a
	jr	Z, 00110$
	ld	a,b
	cp	a,#0x02
	jr	Z, 00111$
	cp	a,#0x03
	jp	Z,00112$
	cp	a,#0x04
	jp	Z,00113$
	cp	a,#0x05
	jp	Z,00114$
	cp	a,#0x06
	jp	Z,00115$
	cp	a,#0x07
	jp	Z,00116$
	cp	a,#0x08
	jp	Z,00118$
	cp	a,#0x09
	jp	Z,00119$
	cp	a,#0x0a
	jp	Z,00120$
	cp	a,#0x0b
	jp	Z,00121$
	cp	a,#0x0c
	jp	Z,00122$
	cp	a,#0x20
	jp	Z,00123$
	sub	a, #0x21
	jp	Z,00118$
	jp	00176$
;sound.c:598: case 0: // sweepTime
00109$:
;sound.c:599: soundReg->mode1.sweepTime = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:600: NR10_REG = NR10();
	call	_NR10
	ldh	(_NR10_REG + 0), a
;sound.c:601: break;
	jp	00176$
;sound.c:602: case 1: // sweepMode
00110$:
;sound.c:603: soundReg->mode1.sweepMode = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:604: NR10_REG = NR10();
	call	_NR10
	ldh	(_NR10_REG + 0), a
;sound.c:605: break;
	jp	00176$
;sound.c:606: case 2: // sweepShifts
00111$:
;sound.c:607: soundReg->mode1.sweepShifts = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:608: NR10_REG = NR10();
	call	_NR10
	ldh	(_NR10_REG + 0), a
;sound.c:609: break;
	jp	00176$
;sound.c:610: case 3: // patternDuty
00112$:
;sound.c:611: soundReg->mode1.patternDuty = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x0a
	ld	c, a
	jr	NC, 00507$
	inc	b
00507$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:612: NR11_REG = NR11();
	call	_NR11
	ldh	(_NR11_REG + 0), a
;sound.c:613: break;
	jp	00176$
;sound.c:614: case 4: // soundLength
00113$:
;sound.c:615: soundReg->mode1.soundLength = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x08
	ld	c, a
	jr	NC, 00508$
	inc	b
00508$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:616: NR11_REG = NR11();
	call	_NR11
	ldh	(_NR11_REG + 0), a
;sound.c:617: break;
	jp	00176$
;sound.c:618: case 5: // envInitialValue
00114$:
;sound.c:619: soundReg->mode1.envInitialValue = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x10
	ld	c, a
	jr	NC, 00509$
	inc	b
00509$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:620: NR12_REG = NR12();
	call	_NR12
	ldh	(_NR12_REG + 0), a
;sound.c:621: break;
	jp	00176$
;sound.c:622: case 6: // envMode
00115$:
;sound.c:623: soundReg->mode1.envMode = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x0e
	ld	c, a
	jr	NC, 00510$
	inc	b
00510$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:624: NR12_REG = NR12();
	call	_NR12
	ldh	(_NR12_REG + 0), a
;sound.c:625: break;
	jp	00176$
;sound.c:626: case 7: // envNbSweep
00116$:
;sound.c:627: soundReg->mode1.envNbSweep = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x0c
	ld	c, a
	jr	NC, 00511$
	inc	b
00511$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:628: NR12_REG = NR12();
	call	_NR12
	ldh	(_NR12_REG + 0), a
;sound.c:629: break;
	jp	00176$
;sound.c:631: case FREQUENCY:
00118$:
;sound.c:632: soundReg->mode1.frequencyHigh = value >> 8;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0014
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;sound.c:633: soundReg->mode1.frequencyLow = 0xFF & value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0012
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	d, #0x00
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;sound.c:634: NR13_REG = NR13();
	call	_NR13
	ldh	(_NR13_REG + 0), a
;sound.c:635: NR14_REG = NR14();
	call	_NR14
	ldh	(_NR14_REG + 0), a
;sound.c:636: break;
	jp	00176$
;sound.c:637: case 9: // counter_ConsSel
00119$:
;sound.c:638: soundReg->mode1.counter_ConsSel = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x18
	ld	c, a
	jr	NC, 00512$
	inc	b
00512$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:639: NR14_REG = NR14();
	call	_NR14
	ldh	(_NR14_REG + 0), a
;sound.c:640: break;
	jp	00176$
;sound.c:641: case 10: // Sound1_To_SO1
00120$:
;sound.c:642: soundReg->control.Sound1_To_SO1 = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x68
	ld	c, a
	jr	NC, 00513$
	inc	b
00513$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:643: NR51_REG = NR51();
	call	_NR51
	ldh	(_NR51_REG + 0), a
;sound.c:644: break;
	jp	00176$
;sound.c:645: case 11: // Sound1_To_SO2
00121$:
;sound.c:646: soundReg->control.Sound1_To_SO2 = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x70
	ld	c, a
	jr	NC, 00514$
	inc	b
00514$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:647: NR51_REG = NR51();
	call	_NR51
	ldh	(_NR51_REG + 0), a
;sound.c:648: break;
	jp	00176$
;sound.c:649: case 12: // Sound1_On_Off
00122$:
;sound.c:650: soundReg->control.Sound1_On_Off = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x78
	ld	c, a
	jr	NC, 00515$
	inc	b
00515$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:651: NR52_REG = NR52();
	call	_NR52
	ldh	(_NR52_REG + 0), a
;sound.c:652: break;
	jp	00176$
;sound.c:653: case PLAY: // restart
00123$:
;sound.c:654: update_value( mode, FREQUENCY, current_value( mode, FREQUENCY ) );
	push	hl
	ld	e, #0x21
	ld	a, l
	call	_current_value
	pop	hl
	push	bc
	ld	e, #0x21
	ld	a, l
	call	_update_value
;sound.c:655: soundReg->mode1.restart = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x1a
	ld	c, a
	jr	NC, 00516$
	inc	b
00516$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:656: NR14_REG = NR14();
	call	_NR14
	ldh	(_NR14_REG + 0), a
;sound.c:657: soundReg->mode1.restart = 0;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x001a
	add	hl, bc
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;sound.c:659: }
	jp	00176$
00171$:
;sound.c:661: else if( mode == 2 ) {
	ld	a, l
;sound.c:662: switch( line )
	sub	a,#0x02
	jp	NZ,00168$
	or	a,b
	jr	Z, 00125$
	ld	a, b
	dec	a
	jr	Z, 00126$
	ld	a,b
	cp	a,#0x02
	jr	Z, 00127$
	cp	a,#0x03
	jr	Z, 00128$
	cp	a,#0x04
	jp	Z,00129$
	cp	a,#0x05
	jp	Z,00131$
	cp	a,#0x06
	jp	Z,00132$
	cp	a,#0x07
	jp	Z,00133$
	cp	a,#0x08
	jp	Z,00134$
	cp	a,#0x09
	jp	Z,00135$
	cp	a,#0x20
	jp	Z,00136$
	sub	a, #0x21
	jp	Z,00131$
	jp	00176$
;sound.c:664: case 0: // patternDuty
00125$:
;sound.c:665: soundReg->mode2.patternDuty = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x20
	ld	c, a
	jr	NC, 00531$
	inc	b
00531$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:666: NR21_REG = NR21();
	call	_NR21
	ldh	(_NR21_REG + 0), a
;sound.c:667: break;
	jp	00176$
;sound.c:668: case 1: // soundLength
00126$:
;sound.c:669: soundReg->mode2.soundLength = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x1e
	ld	c, a
	jr	NC, 00532$
	inc	b
00532$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:670: NR21_REG = NR21();
	call	_NR21
	ldh	(_NR21_REG + 0), a
;sound.c:671: break;
	jp	00176$
;sound.c:672: case 2: // envInitialValue
00127$:
;sound.c:673: soundReg->mode2.envInitialValue = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x26
	ld	c, a
	jr	NC, 00533$
	inc	b
00533$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:674: NR22_REG = NR22();
	call	_NR22
	ldh	(_NR22_REG + 0), a
;sound.c:675: break;
	jp	00176$
;sound.c:676: case 3: // envMode
00128$:
;sound.c:677: soundReg->mode2.envMode = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x24
	ld	c, a
	jr	NC, 00534$
	inc	b
00534$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:678: NR22_REG = NR22();
	call	_NR22
	ldh	(_NR22_REG + 0), a
;sound.c:679: break;
	jp	00176$
;sound.c:680: case 4: // envNbStep
00129$:
;sound.c:681: soundReg->mode2.envNbStep = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x22
	ld	c, a
	jr	NC, 00535$
	inc	b
00535$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:682: NR22_REG = NR22();
	call	_NR22
	ldh	(_NR22_REG + 0), a
;sound.c:683: break;
	jp	00176$
;sound.c:685: case FREQUENCY:
00131$:
;sound.c:686: soundReg->mode2.frequencyHigh = value >> 8;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x002a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;sound.c:687: soundReg->mode2.frequencyLow = 0xFF & value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0028
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	d, #0x00
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;sound.c:688: NR23_REG = NR23();
	call	_NR23
	ldh	(_NR23_REG + 0), a
;sound.c:689: NR24_REG = NR24();
	call	_NR24
	ldh	(_NR24_REG + 0), a
;sound.c:690: break;
	jp	00176$
;sound.c:691: case 6: // counter_ConsSel
00132$:
;sound.c:692: soundReg->mode2.counter_ConsSel = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x2e
	ld	c, a
	jr	NC, 00536$
	inc	b
00536$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:693: NR24_REG = NR24();
	call	_NR24
	ldh	(_NR24_REG + 0), a
;sound.c:694: break;
	jp	00176$
;sound.c:695: case 7: // Sound2_To_SO1
00133$:
;sound.c:696: soundReg->control.Sound2_To_SO1 = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x6a
	ld	c, a
	jr	NC, 00537$
	inc	b
00537$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:697: NR51_REG = NR51();
	call	_NR51
	ldh	(_NR51_REG + 0), a
;sound.c:698: break;
	jp	00176$
;sound.c:699: case 8: // Sound2_To_SO2
00134$:
;sound.c:700: soundReg->control.Sound2_To_SO2 = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x72
	ld	c, a
	jr	NC, 00538$
	inc	b
00538$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:701: NR51_REG = NR51();
	call	_NR51
	ldh	(_NR51_REG + 0), a
;sound.c:702: break;
	jp	00176$
;sound.c:703: case 9: // Sound2_On_Off
00135$:
;sound.c:704: soundReg->control.Sound2_On_Off = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x7a
	ld	c, a
	jr	NC, 00539$
	inc	b
00539$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:705: NR52_REG = NR52();
	call	_NR52
	ldh	(_NR52_REG + 0), a
;sound.c:706: break;
	jp	00176$
;sound.c:707: case PLAY: // restart
00136$:
;sound.c:708: update_value( mode, FREQUENCY, current_value( mode, FREQUENCY ) );
	push	hl
	ld	e, #0x21
	ld	a, l
	call	_current_value
	pop	hl
	push	bc
	ld	e, #0x21
	ld	a, l
	call	_update_value
;sound.c:709: soundReg->mode2.restart = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x30
	ld	c, a
	jr	NC, 00540$
	inc	b
00540$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:710: NR24_REG = NR24();
	call	_NR24
	ldh	(_NR24_REG + 0), a
;sound.c:711: soundReg->mode2.restart = 0;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0030
	add	hl, bc
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;sound.c:713: }
	jp	00176$
00168$:
;sound.c:715: else if( mode == 3 ) {
	ld	a, l
;sound.c:716: switch( line )
	sub	a,#0x03
	jp	NZ,00165$
	or	a,b
	jr	Z, 00138$
	ld	a, b
	dec	a
	jr	Z, 00139$
	ld	a,b
	cp	a,#0x02
	jr	Z, 00140$
	cp	a,#0x03
	jr	Z, 00142$
	cp	a,#0x04
	jp	Z,00143$
	cp	a,#0x05
	jp	Z,00144$
	cp	a,#0x06
	jp	Z,00145$
	cp	a,#0x07
	jp	Z,00146$
	cp	a,#0x20
	jp	Z,00147$
	sub	a, #0x21
	jr	Z, 00142$
	jp	00176$
;sound.c:718: case 0: // on_Off
00138$:
;sound.c:719: soundReg->mode3.on_Off = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x34
	ld	c, a
	jr	NC, 00553$
	inc	b
00553$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:720: NR30_REG = NR30();
	call	_NR30
	ldh	(_NR30_REG + 0), a
;sound.c:721: break;
	jp	00176$
;sound.c:722: case 1: // soundLength
00139$:
;sound.c:723: soundReg->mode3.soundLength = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x36
	ld	c, a
	jr	NC, 00554$
	inc	b
00554$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:724: NR31_REG = NR31();
	call	_NR31
	ldh	(_NR31_REG + 0), a
;sound.c:725: break;
	jp	00176$
;sound.c:726: case 2: // selOutputLevel
00140$:
;sound.c:727: soundReg->mode3.selOutputLevel = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x3a
	ld	c, a
	jr	NC, 00555$
	inc	b
00555$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:728: NR32_REG = NR32();
	call	_NR32
	ldh	(_NR32_REG + 0), a
;sound.c:729: break;
	jp	00176$
;sound.c:731: case FREQUENCY:
00142$:
;sound.c:732: soundReg->mode3.frequencyHigh = value >> 8;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0040
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;sound.c:733: soundReg->mode3.frequencyLow = 0xFF & value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x003e
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	d, #0x00
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;sound.c:734: NR33_REG = NR33();
	call	_NR33
	ldh	(_NR33_REG + 0), a
;sound.c:735: NR34_REG = NR34();
	call	_NR34
	ldh	(_NR34_REG + 0), a
;sound.c:736: break;
	jp	00176$
;sound.c:737: case 4: // counter_ConsSel
00143$:
;sound.c:738: soundReg->mode3.counter_ConsSel = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x44
	ld	c, a
	jr	NC, 00556$
	inc	b
00556$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:739: NR34_REG = NR34();
	call	_NR34
	ldh	(_NR34_REG + 0), a
;sound.c:740: break;
	jp	00176$
;sound.c:741: case 5: // Sound3_To_SO1
00144$:
;sound.c:742: soundReg->control.Sound3_To_SO1 = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x6c
	ld	c, a
	jr	NC, 00557$
	inc	b
00557$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:743: NR51_REG = NR51();
	call	_NR51
	ldh	(_NR51_REG + 0), a
;sound.c:744: break;
	jp	00176$
;sound.c:745: case 6: // Sound3_To_SO2
00145$:
;sound.c:746: soundReg->control.Sound3_To_SO2 = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x74
	ld	c, a
	jr	NC, 00558$
	inc	b
00558$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:747: NR51_REG = NR51();
	call	_NR51
	ldh	(_NR51_REG + 0), a
;sound.c:748: break;
	jp	00176$
;sound.c:749: case 7: // Sound3_On_Off
00146$:
;sound.c:750: soundReg->control.Sound3_On_Off = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x7c
	ld	c, a
	jr	NC, 00559$
	inc	b
00559$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:751: NR52_REG = NR52();
	call	_NR52
	ldh	(_NR52_REG + 0), a
;sound.c:752: break;
	jp	00176$
;sound.c:753: case PLAY: // restart
00147$:
;sound.c:754: update_value( mode, FREQUENCY, current_value( mode, FREQUENCY ) );
	push	hl
	ld	e, #0x21
	ld	a, l
	call	_current_value
	pop	hl
	push	bc
	ld	e, #0x21
	ld	a, l
	call	_update_value
;sound.c:755: soundReg->mode3.restart = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x46
	ld	c, a
	jr	NC, 00560$
	inc	b
00560$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:756: NR34_REG = NR34();
	call	_NR34
	ldh	(_NR34_REG + 0), a
;sound.c:757: soundReg->mode3.restart = 0;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0046
	add	hl, bc
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;sound.c:759: }
	jp	00176$
00165$:
;sound.c:761: else if( mode == 4 ) {
	ld	a, l
;sound.c:762: switch( line )
	sub	a,#0x04
	jp	NZ,00176$
	or	a,b
	jr	Z, 00149$
	ld	a, b
	dec	a
	jr	Z, 00150$
	ld	a,b
	cp	a,#0x02
	jr	Z, 00151$
	cp	a,#0x03
	jr	Z, 00152$
	cp	a,#0x04
	jp	Z,00153$
	cp	a,#0x05
	jp	Z,00154$
	cp	a,#0x06
	jp	Z,00155$
	cp	a,#0x07
	jp	Z,00156$
	cp	a,#0x08
	jp	Z,00157$
	cp	a,#0x09
	jp	Z,00158$
	cp	a,#0x0a
	jp	Z,00159$
	sub	a, #0x20
	jp	Z,00160$
	jp	00176$
;sound.c:764: case 0: // soundLength
00149$:
;sound.c:765: soundReg->mode4.soundLength = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x4a
	ld	c, a
	jr	NC, 00575$
	inc	b
00575$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:766: NR41_REG = NR41();
	call	_NR41
	ldh	(_NR41_REG + 0), a
;sound.c:767: break;
	jp	00176$
;sound.c:768: case 1: // envInitialValue
00150$:
;sound.c:769: soundReg->mode4.envInitialValue = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x52
	ld	c, a
	jr	NC, 00576$
	inc	b
00576$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:770: NR42_REG = NR42();
	call	_NR42
	ldh	(_NR42_REG + 0), a
;sound.c:771: break;
	jp	00176$
;sound.c:772: case 2: // envMode
00151$:
;sound.c:773: soundReg->mode4.envMode = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x50
	ld	c, a
	jr	NC, 00577$
	inc	b
00577$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:774: NR42_REG = NR42();
	call	_NR42
	ldh	(_NR42_REG + 0), a
;sound.c:775: break;
	jp	00176$
;sound.c:776: case 3: // envNbStep
00152$:
;sound.c:777: soundReg->mode4.envNbStep = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x4e
	ld	c, a
	jr	NC, 00578$
	inc	b
00578$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:778: NR42_REG = NR42();
	call	_NR42
	ldh	(_NR42_REG + 0), a
;sound.c:779: break;
	jp	00176$
;sound.c:780: case 4: // polyCounterFreq
00153$:
;sound.c:781: soundReg->mode4.polyCounterFreq = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x58
	ld	c, a
	jr	NC, 00579$
	inc	b
00579$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:782: NR43_REG = NR43();
	call	_NR43
	ldh	(_NR43_REG + 0), a
;sound.c:783: break;
	jp	00176$
;sound.c:784: case 5: // polyCounterStep
00154$:
;sound.c:785: soundReg->mode4.polyCounterStep = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x56
	ld	c, a
	jr	NC, 00580$
	inc	b
00580$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:786: NR43_REG = NR43();
	call	_NR43
	ldh	(_NR43_REG + 0), a
;sound.c:787: break;
	jp	00176$
;sound.c:788: case 6: // polyCounterDiv
00155$:
;sound.c:789: soundReg->mode4.polyCounterDiv = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x54
	ld	c, a
	jr	NC, 00581$
	inc	b
00581$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:790: NR43_REG = NR43();
	call	_NR43
	ldh	(_NR43_REG + 0), a
;sound.c:791: break;
	jp	00176$
;sound.c:792: case 7: // counter_ConsSel
00156$:
;sound.c:793: soundReg->mode4.counter_ConsSel = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x5c
	ld	c, a
	jr	NC, 00582$
	inc	b
00582$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:794: NR44_REG = NR44();
	call	_NR44
	ldh	(_NR44_REG + 0), a
;sound.c:795: break;
	jr	00176$
;sound.c:796: case 8: // Sound4_To_SO1
00157$:
;sound.c:797: soundReg->control.Sound4_To_SO1 = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x6e
	ld	c, a
	jr	NC, 00583$
	inc	b
00583$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:798: NR51_REG = NR51();
	call	_NR51
	ldh	(_NR51_REG + 0), a
;sound.c:799: break;
	jr	00176$
;sound.c:800: case 9: // Sound4_To_SO2
00158$:
;sound.c:801: soundReg->control.Sound4_To_SO2 = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x76
	ld	c, a
	jr	NC, 00584$
	inc	b
00584$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:802: NR51_REG = NR51();
	call	_NR51
	ldh	(_NR51_REG + 0), a
;sound.c:803: break;
	jr	00176$
;sound.c:804: case 10: // Sound4_On_Off
00159$:
;sound.c:805: soundReg->control.Sound4_On_Off = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x7e
	ld	c, a
	jr	NC, 00585$
	inc	b
00585$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:806: NR52_REG = NR52();
	call	_NR52
	ldh	(_NR52_REG + 0), a
;sound.c:807: break;
	jr	00176$
;sound.c:808: case PLAY: // restart
00160$:
;sound.c:809: soundReg->mode4.restart = value;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x5e
	ld	c, a
	jr	NC, 00586$
	inc	b
00586$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sound.c:810: NR44_REG = NR44();
	call	_NR44
	ldh	(_NR44_REG + 0), a
;sound.c:811: soundReg->mode4.restart = 0;
	ld	hl, #_soundReg
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x005e
	add	hl, bc
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;sound.c:813: }
00176$:
;sound.c:815: }
	pop	hl
	pop	af
	jp	(hl)
;sound.c:817: uint8_t draw_screen( uint8_t mode )
;	---------------------------------
; Function draw_screen
; ---------------------------------
_draw_screen::
	add	sp, #-5
	ldhl	sp,	#3
	ld	(hl), a
;sound.c:821: clss();
	call	_clss
;sound.c:822: gotoxy( FIRST_X, TITLE_Y );
	ld	hl, #0x01
	push	hl
	call	_gotoxy
	pop	hl
;sound.c:823: print( params[ 0 ].name );
	ld	hl, #_params
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_params + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	call	_print
;sound.c:825: for( i = 0; params[ i + 1 ].name; i++ ) {
	ldhl	sp,	#4
	ld	(hl), #0x00
00103$:
	ldhl	sp,	#4
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	sla	c
	rl	b
	sla	c
	rl	b
	inc	sp
	inc	sp
	ld	e, c
	ld	d, b
	push	de
	ld	hl, #_params
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;sound.c:826: gotoxy( FIRST_X, FIRST_Y + i );
	ldhl	sp,	#4
	ld	e, (hl)
;sound.c:825: for( i = 0; params[ i + 1 ].name; i++ ) {
	ld	a, b
	or	a, c
	jr	Z, 00101$
;sound.c:826: gotoxy( FIRST_X, FIRST_Y + i );
	dec	hl
	dec	hl
	ld	a, e
	add	a, #0x02
	ld	(hl), a
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_gotoxy
	pop	hl
;sound.c:827: print( params[ i + 1 ].name );
	pop	de
	push	de
	ld	hl, #_params
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	call	_print
;sound.c:828: gotoxy( VAL_X, FIRST_Y + i );
	ldhl	sp,	#2
	ld	h, (hl)
	ld	l, #0x0f
	push	hl
	call	_gotoxy
	pop	hl
;sound.c:829: println( current_value( mode, i ), 10, UNSIGNED );
	ldhl	sp,	#4
	ld	a, (hl-)
	ld	e, a
	ld	a, (hl)
	call	_current_value
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x0a
	ld	e, c
	ld	d, b
	call	_println
;sound.c:825: for( i = 0; params[ i + 1 ].name; i++ ) {
	ldhl	sp,	#4
	inc	(hl)
	jr	00103$
00101$:
;sound.c:832: return i - 1;
	ld	a, e
	dec	a
;sound.c:833: }
	add	sp, #5
	ret
;sound.c:836: void play_music( uint8_t mode )
;	---------------------------------
; Function play_music
; ---------------------------------
_play_music::
	ld	c, a
;sound.c:840: while( music[ i ] != END ) {
	ld	b, #0x00
00103$:
	ld	a, #<(_music)
	add	a, b
	ld	e, a
	ld	a, #>(_music)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	cp	a, #0x49
	ret	Z
;sound.c:841: if( music[ i ] != SILENCE ) {
	cp	a, #0x48
	jr	Z, 00102$
;sound.c:842: update_value( mode, FREQUENCY, frequencies[ music[ i ] ] );
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	ld	de, #_frequencies
	add	hl, de
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ld	e, #0x21
	ld	a, c
	call	_update_value
	pop	bc
;sound.c:843: update_value( mode, PLAY, 1 );
	push	bc
	ld	de, #0x0001
	push	de
	ld	e, #0x20
	ld	a, c
	call	_update_value
	pop	bc
00102$:
;sound.c:845: delay( 500 );
	push	bc
	ld	de, #0x01f4
	call	_delay
	pop	bc
;sound.c:846: i++;
	inc	b
;sound.c:848: }
	jr	00103$
;sound.c:851: void show_register_channel( uint8_t mode ) {
;	---------------------------------
; Function show_register_channel
; ---------------------------------
_show_register_channel::
	ld	c, a
;sound.c:853: switch( mode ) {
	ld	a, #0x04
	sub	a, c
	ret	C
	ld	b, #0x00
	ld	hl, #00114$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00114$:
	jp	00105$
	jp	00101$
	jp	00102$
	jp	00103$
	jp	00104$
;sound.c:854: case 1:
00101$:
;sound.c:855: gotoxy( 0, 16 );
	ld	hl, #0x1000
	push	hl
	call	_gotoxy
	pop	hl
;sound.c:856: print( "NR10-14:" );
	ld	de, #___str_36
	call	_print
;sound.c:858: gotoxy( 1, 17 ); // Last line
	ld	a, #0x11
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_gotoxy
	pop	hl
;sound.c:859: printn( NR10(), 16, UNSIGNED ); print( ", " );
	call	_NR10
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_37
	call	_print
;sound.c:860: printn( NR11(), 16, UNSIGNED ); print( ", " );
	call	_NR11
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_37
	call	_print
;sound.c:861: printn( NR12(), 16, UNSIGNED ); print( ", " );
	call	_NR12
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_37
	call	_print
;sound.c:862: printn( NR13(), 16, UNSIGNED ); print( ", " );
	call	_NR13
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_37
	call	_print
;sound.c:863: printn( 0x80 | NR14(), 16, UNSIGNED );
	call	_NR14
	set	7, a
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
;sound.c:865: break;
	ret
;sound.c:867: case 2:
00102$:
;sound.c:868: gotoxy( 0, 16 );
	ld	hl, #0x1000
	push	hl
	call	_gotoxy
	pop	hl
;sound.c:869: print( "NR21-24:" );
	ld	de, #___str_38
	call	_print
;sound.c:871: gotoxy( 1, 17 ); // Last line
	ld	a, #0x11
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_gotoxy
	pop	hl
;sound.c:872: printn( NR21(), 16, UNSIGNED ); print( ", " );
	call	_NR21
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_37
	call	_print
;sound.c:873: printn( NR22(), 16, UNSIGNED ); print( ", " );
	call	_NR22
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_37
	call	_print
;sound.c:874: printn( NR23(), 16, UNSIGNED ); print( ", " );
	call	_NR23
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_37
	call	_print
;sound.c:875: printn( 0x80 | NR24(), 16, UNSIGNED );
	call	_NR24
	set	7, a
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
;sound.c:877: break;
	ret
;sound.c:879: case 3:
00103$:
;sound.c:880: gotoxy( 0, 16 );
	ld	hl, #0x1000
	push	hl
	call	_gotoxy
	pop	hl
;sound.c:881: print( "NR30-34:" );
	ld	de, #___str_39
	call	_print
;sound.c:883: gotoxy( 1, 17 ); // Last line
	ld	a, #0x11
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_gotoxy
	pop	hl
;sound.c:884: printn( NR30(), 16, UNSIGNED ); print( ", " );
	call	_NR30
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_37
	call	_print
;sound.c:885: printn( NR31(), 16, UNSIGNED ); print( ", " );
	call	_NR31
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_37
	call	_print
;sound.c:886: printn( NR32(), 16, UNSIGNED ); print( ", " );
	call	_NR32
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_37
	call	_print
;sound.c:887: printn( NR33(), 16, UNSIGNED ); print( ", " );
	call	_NR33
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_37
	call	_print
;sound.c:888: printn( 0x80 | NR34(), 16, UNSIGNED );
	call	_NR34
	set	7, a
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
;sound.c:890: break;
	ret
;sound.c:892: case 4:
00104$:
;sound.c:893: gotoxy( 0, 16 );
	ld	hl, #0x1000
	push	hl
	call	_gotoxy
	pop	hl
;sound.c:894: print( "NR41-44:" );
	ld	de, #___str_40
	call	_print
;sound.c:896: gotoxy( 1, 17 ); // Last line
	ld	a, #0x11
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_gotoxy
	pop	hl
;sound.c:897: printn( NR41(), 16, UNSIGNED ); print( ", " );
	call	_NR41
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_37
	call	_print
;sound.c:898: printn( NR42(), 16, UNSIGNED ); print( ", " );
	call	_NR42
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_37
	call	_print
;sound.c:899: printn( NR43(), 16, UNSIGNED ); print( ", " );
	call	_NR43
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_37
	call	_print
;sound.c:900: printn( 0x80 | NR44(), 16, UNSIGNED );
	call	_NR44
	set	7, a
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
;sound.c:902: break;
	ret
;sound.c:904: case 0:
00105$:
;sound.c:905: gotoxy( 0, 16 );
	ld	hl, #0x1000
	push	hl
	call	_gotoxy
	pop	hl
;sound.c:906: print( "NR50-52:" );
	ld	de, #___str_41
	call	_print
;sound.c:908: gotoxy( 1, 17 ); // Last line
	ld	a, #0x11
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_gotoxy
	pop	hl
;sound.c:909: printn( NR50(), 16, UNSIGNED ); print( ", " );
	call	_NR50
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_37
	call	_print
;sound.c:910: printn( NR51(), 16, UNSIGNED ); print( ", " );
	call	_NR51
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_37
	call	_print
;sound.c:911: printn( NR52(), 16, UNSIGNED ); print( ", " );
	call	_NR52
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_37
;sound.c:915: }
;sound.c:916: }
	jp	_print
___str_36:
	.ascii "NR10-14:"
	.db 0x00
___str_37:
	.ascii ", "
	.db 0x00
___str_38:
	.ascii "NR21-24:"
	.db 0x00
___str_39:
	.ascii "NR30-34:"
	.db 0x00
___str_40:
	.ascii "NR41-44:"
	.db 0x00
___str_41:
	.ascii "NR50-52:"
	.db 0x00
;sound.c:919: void dump_registers()
;	---------------------------------
; Function dump_registers
; ---------------------------------
_dump_registers::
;sound.c:921: clss();
	call	_clss
;sound.c:922: gotoxy( FIRST_X, TITLE_Y );
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_gotoxy
	pop	hl
;sound.c:923: print( "Register Dump\n\n" );
	ld	de, #___str_42
	call	_print
;sound.c:925: print( "NR10:" ); println( NR10(), 16, UNSIGNED );
	ld	de, #___str_43
	call	_print
	call	_NR10
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_println
;sound.c:926: print( "NR11:" ); printn( NR11(), 16, UNSIGNED );        print( " NR21:" ); println( NR21(), 16, UNSIGNED );
	ld	de, #___str_44
	call	_print
	call	_NR11
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_45
	call	_print
	call	_NR21
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_println
;sound.c:927: print( "NR12:" ); printn( NR12(), 16, UNSIGNED );        print( " NR22:" ); println( NR22(), 16, UNSIGNED );
	ld	de, #___str_46
	call	_print
	call	_NR12
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_47
	call	_print
	call	_NR22
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_println
;sound.c:928: print( "NR13:" ); printn( NR13(), 16, UNSIGNED );        print( " NR23:" ); println( NR23(), 16, UNSIGNED );
	ld	de, #___str_48
	call	_print
	call	_NR13
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_49
	call	_print
	call	_NR23
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_println
;sound.c:929: print( "NR14:" ); printn( 0x80 | NR14(), 16, UNSIGNED ); print( " NR24:" ); println( 0x80 | NR24(), 16, UNSIGNED );
	ld	de, #___str_50
	call	_print
	call	_NR14
	set	7, a
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_51
	call	_print
	call	_NR24
	set	7, a
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_println
;sound.c:930: printf( "\n" );
	ld	de, #___str_53
	call	_puts
;sound.c:932: print( "NR30:" ); println( NR30(), 16, UNSIGNED );
	ld	de, #___str_54
	call	_print
	call	_NR30
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_println
;sound.c:933: print( "NR31:" ); printn( NR31(), 16, UNSIGNED );        print( " NR41:" ); println( NR41(), 16, UNSIGNED );
	ld	de, #___str_55
	call	_print
	call	_NR31
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_56
	call	_print
	call	_NR41
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_println
;sound.c:934: print( "NR32:" ); printn( NR32(), 16, UNSIGNED );        print( " NR42:" ); println( NR42(), 16, UNSIGNED );
	ld	de, #___str_57
	call	_print
	call	_NR32
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_58
	call	_print
	call	_NR42
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_println
;sound.c:935: print( "NR33:" ); printn( NR33(), 16, UNSIGNED );        print( " NR43:" ); println( NR43(), 16, UNSIGNED );
	ld	de, #___str_59
	call	_print
	call	_NR33
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_60
	call	_print
	call	_NR43
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_println
;sound.c:936: print( "NR34:" ); printn( 0x80 | NR34(), 16, UNSIGNED ); print( " NR44:" ); println( 0x80 | NR44(), 16, UNSIGNED );
	ld	de, #___str_61
	call	_print
	call	_NR34
	set	7, a
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_printn
	ld	de, #___str_62
	call	_print
	call	_NR44
	set	7, a
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_println
;sound.c:937: printf( "\n" );
	ld	de, #___str_53
	call	_puts
;sound.c:939: print( "NR50:" ); println( NR50(), 16, UNSIGNED );
	ld	de, #___str_64
	call	_print
	call	_NR50
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_println
;sound.c:940: print( "NR51:" ); println( NR51(), 16, UNSIGNED );
	ld	de, #___str_65
	call	_print
	call	_NR51
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_println
;sound.c:941: print( "NR52:" ); println( NR52(), 16, UNSIGNED );
	ld	de, #___str_66
	call	_print
	call	_NR52
	ld	e, a
	xor	a, a
	ld	d, a
	push	af
	inc	sp
	ld	a, #0x10
	call	_println
;sound.c:942: }
	ret
___str_42:
	.ascii "Register Dump"
	.db 0x0a
	.db 0x0a
	.db 0x00
___str_43:
	.ascii "NR10:"
	.db 0x00
___str_44:
	.ascii "NR11:"
	.db 0x00
___str_45:
	.ascii " NR21:"
	.db 0x00
___str_46:
	.ascii "NR12:"
	.db 0x00
___str_47:
	.ascii " NR22:"
	.db 0x00
___str_48:
	.ascii "NR13:"
	.db 0x00
___str_49:
	.ascii " NR23:"
	.db 0x00
___str_50:
	.ascii "NR14:"
	.db 0x00
___str_51:
	.ascii " NR24:"
	.db 0x00
___str_53:
	.db 0x00
___str_54:
	.ascii "NR30:"
	.db 0x00
___str_55:
	.ascii "NR31:"
	.db 0x00
___str_56:
	.ascii " NR41:"
	.db 0x00
___str_57:
	.ascii "NR32:"
	.db 0x00
___str_58:
	.ascii " NR42:"
	.db 0x00
___str_59:
	.ascii "NR33:"
	.db 0x00
___str_60:
	.ascii " NR43:"
	.db 0x00
___str_61:
	.ascii "NR34:"
	.db 0x00
___str_62:
	.ascii " NR44:"
	.db 0x00
___str_64:
	.ascii "NR50:"
	.db 0x00
___str_65:
	.ascii "NR51:"
	.db 0x00
___str_66:
	.ascii "NR52:"
	.db 0x00
;sound.c:944: void wait_event( uint8_t mode )
;	---------------------------------
; Function wait_event
; ---------------------------------
_wait_event::
	add	sp, #-12
	ldhl	sp,	#8
	ld	(hl), a
;sound.c:950: while( 1 ) {
00165$:
;sound.c:951: params = params_array[ mode ];
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	pop	bc
	push	bc
	sla	c
	rl	b
	ld	hl, #_params_array
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_params
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;sound.c:952: last_y = draw_screen( mode ) + FIRST_Y;
	ldhl	sp,	#8
	ld	a, (hl)
	call	_draw_screen
	add	a, #0x02
	ldhl	sp,	#2
	ld	(hl), a
;sound.c:953: y = FIRST_Y;
	ldhl	sp,	#9
;sound.c:954: gotoxy( ARROW_X, y );
	ld	(hl), #0x02
	ld	hl, #0x200
	push	hl
	call	_gotoxy
	pop	hl
;sound.c:955: setchar( ARROW_CHAR );
	ld	a, #0x3e
	push	af
	inc	sp
	call	_setchar
	inc	sp
;sound.c:957: show_register_channel( mode );
	ldhl	sp,	#8
	ld	a, (hl)
	call	_show_register_channel
;sound.c:959: while( 1 ) {
00162$:
;sound.c:960: if( KEY_TICKED( J_UP ) ) {
	ld	a, (#_keys)
	ldhl	sp,	#11
	ld	(hl), a
	ld	hl, #_previous_keys
	ld	c, (hl)
	push	hl
	ldhl	sp,	#13
	bit	2, (hl)
	pop	hl
	jr	Z, 00158$
	bit	2, c
	jr	NZ, 00158$
;sound.c:961: gotoxy( ARROW_X, y ); setchar( SPACE_CHAR );
	ldhl	sp,	#9
	ld	h, (hl)
	ld	l, #0x00
	push	hl
	call	_gotoxy
	pop	hl
	ld	a, #0x20
	push	af
	inc	sp
	call	_setchar
	inc	sp
;sound.c:962: if( --y < FIRST_Y )
	ldhl	sp,	#9
	dec	(hl)
	ld	a, (hl)
	sub	a, #0x02
	jr	NC, 00102$
;sound.c:963: y = last_y;
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
00102$:
;sound.c:964: gotoxy( ARROW_X, y ); setchar( ARROW_CHAR );
	ldhl	sp,	#9
	ld	h, (hl)
	ld	l, #0x00
	push	hl
	call	_gotoxy
	pop	hl
	ld	a, #0x3e
	push	af
	inc	sp
	call	_setchar
	inc	sp
	jp	00159$
00158$:
;sound.c:967: else if( KEY_TICKED( J_DOWN ) ) {
	push	hl
	ldhl	sp,	#13
	bit	3, (hl)
	pop	hl
	jr	Z, 00154$
	bit	3, c
	jr	NZ, 00154$
;sound.c:968: gotoxy( ARROW_X, y ); setchar( SPACE_CHAR );
	ldhl	sp,	#9
	ld	h, (hl)
	ld	l, #0x00
	push	hl
	call	_gotoxy
	pop	hl
	ld	a, #0x20
	push	af
	inc	sp
	call	_setchar
	inc	sp
;sound.c:969: if( ++y > last_y )
	ldhl	sp,	#9
	inc	(hl)
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#9
	sub	a, (hl)
	jr	NC, 00104$
;sound.c:970: y = FIRST_Y;
	ld	(hl), #0x02
00104$:
;sound.c:971: gotoxy( ARROW_X, y ); setchar( ARROW_CHAR );
	ldhl	sp,	#9
	ld	h, (hl)
	ld	l, #0x00
	push	hl
	call	_gotoxy
	pop	hl
	ld	a, #0x3e
	push	af
	inc	sp
	call	_setchar
	inc	sp
	jp	00159$
00154$:
;sound.c:975: l = current_value( mode, y - FIRST_Y );
	ldhl	sp,	#9
	ld	a, (hl)
	add	a, #0xfe
	ldhl	sp,	#3
	ld	(hl), a
;sound.c:974: else if( KEY_TICKED( J_LEFT ) ) {
	push	hl
	ldhl	sp,	#13
	bit	1, (hl)
	pop	hl
	jp	Z,00150$
	bit	1, c
	jp	NZ,00150$
;sound.c:975: l = current_value( mode, y - FIRST_Y );
	ldhl	sp,	#3
	ld	e, (hl)
	ldhl	sp,	#8
	ld	a, (hl)
	call	_current_value
	ldhl	sp,	#10
	ld	a, c
;sound.c:976: if( l != 0 ) {
	ld	(hl+), a
	ld	(hl), b
	or	a, b
	jp	Z, 00116$
;sound.c:960: if( KEY_TICKED( J_UP ) ) {
	ld	a, (#_keys)
;sound.c:977: if( KEY_PRESSED( J_A ) && KEY_PRESSED( J_B ) )
	push	af
	and	a, #0x10
	ld	e, a
	ld	d, #0x00
	pop	af
	and	a, #0x20
	ldhl	sp,	#6
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, d
	or	a, e
	jr	Z, 00112$
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00112$
;sound.c:978: l = 0;
	xor	a, a
	ldhl	sp,	#10
	ld	(hl+), a
	ld	(hl), a
	jr	00113$
00112$:
;sound.c:980: l = ( l > 10 ) ? ( l - 10 ) : 0;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;sound.c:979: else if( KEY_PRESSED( J_A ) )
	ld	a, d
	or	a, e
	jr	Z, 00109$
;sound.c:980: l = ( l > 10 ) ? ( l - 10 ) : 0;
	ld	a, #0x0a
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00169$
	ld	a, c
	add	a, #0xf6
	ld	e, a
	ld	a, b
	adc	a, #0xff
	jr	00170$
00169$:
	xor	a, a
	ld	e, a
00170$:
	ldhl	sp,	#10
	ld	(hl), e
	inc	hl
	ld	(hl), a
	jr	00113$
00109$:
;sound.c:981: else if( KEY_PRESSED( J_B ) )
	ldhl	sp,	#7
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00106$
;sound.c:982: l = ( l > 100 ) ? ( l - 100 ) : 0;
	ld	a, #0x64
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00171$
	ld	de, #0x0064
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#11
	ld	(hl-), a
	ld	(hl), e
	jr	00113$
00171$:
	xor	a, a
	ldhl	sp,	#10
	ld	(hl+), a
	ld	(hl), a
	jr	00113$
00106$:
;sound.c:984: l--;
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
00113$:
;sound.c:985: update_value( mode, y - FIRST_Y, l );
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#5
	ld	e, (hl)
	ldhl	sp,	#10
	ld	a, (hl)
	call	_update_value
00116$:
;sound.c:987: gotoxy( VAL_X, y ); print( "    " );
	ldhl	sp,	#9
	ld	h, (hl)
	ld	l, #0x0f
	push	hl
	call	_gotoxy
	pop	hl
	ld	de, #___str_67
	call	_print
;sound.c:988: gotoxy( VAL_X, y ); println( l, 10, UNSIGNED );
	ldhl	sp,	#9
	ld	h, (hl)
	ld	l, #0x0f
	push	hl
	call	_gotoxy
	pop	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x0a
	ldhl	sp,	#11
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_println
;sound.c:990: show_register_channel( mode );
	ldhl	sp,	#8
	ld	a, (hl)
	call	_show_register_channel
	jp	00159$
00150$:
;sound.c:993: else if( KEY_TICKED( J_RIGHT ) ) {
	push	hl
	ldhl	sp,	#13
	bit	0, (hl)
	pop	hl
	jp	Z,00146$
	bit	0, c
	jp	NZ,00146$
;sound.c:994: l = current_value( mode, y - FIRST_Y );
	ldhl	sp,	#3
	ld	e, (hl)
	ldhl	sp,	#8
	ld	a, (hl)
	call	_current_value
	ldhl	sp,	#10
	ld	a, c
	ld	(hl+), a
;sound.c:995: m = params[ y - ( FIRST_Y - 1 ) ].max;
	ld	a, b
	ld	(hl-), a
	dec	hl
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	dec	hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	a, c
	ld	hl, #_params
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	adc	a, (hl)
	ld	b, a
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;sound.c:996: if( l != m ) {
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00341$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	Z, 00132$
00341$:
;sound.c:960: if( KEY_TICKED( J_UP ) ) {
	ld	a, (#_keys)
;sound.c:977: if( KEY_PRESSED( J_A ) && KEY_PRESSED( J_B ) )
	push	af
	and	a, #0x10
	ldhl	sp,	#6
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	pop	af
	and	a, #0x20
	ld	(hl+), a
;sound.c:997: if( KEY_PRESSED( J_A ) && KEY_PRESSED( J_B ) ) {
	xor	a, a
	ld	(hl-), a
	dec	hl
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00128$
	ldhl	sp,	#7
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00128$
;sound.c:998: l = m;
	ldhl	sp,	#10
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00129$
00128$:
;sound.c:980: l = ( l > 10 ) ? ( l - 10 ) : 0;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;sound.c:1000: else if( KEY_PRESSED( J_A ) ) {
	ldhl	sp,	#5
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00125$
;sound.c:1001: l += 10;
	ld	hl, #0x000a
	add	hl, de
	ld	e, l
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), e
	inc	hl
;sound.c:1002: if( l > m )
	ld	(hl-), a
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	NC, 00129$
;sound.c:1003: l = m;
	ldhl	sp,	#10
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00129$
00125$:
;sound.c:1005: else if( KEY_PRESSED( J_B ) ) {
	ldhl	sp,	#7
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00122$
;sound.c:1006: l += 100;
	ld	hl, #0x0064
	add	hl, de
	ld	e, l
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), e
	inc	hl
;sound.c:1007: if( l > m )
	ld	(hl-), a
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	NC, 00129$
;sound.c:1008: l = m;
	ldhl	sp,	#10
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00129$
00122$:
;sound.c:1011: l++;
	ldhl	sp,	#10
	inc	(hl)
	jr	NZ, 00342$
	inc	hl
	inc	(hl)
00342$:
00129$:
;sound.c:1012: update_value( mode, y - FIRST_Y, l );
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#5
	ld	e, (hl)
	ldhl	sp,	#10
	ld	a, (hl)
	call	_update_value
00132$:
;sound.c:1014: gotoxy( VAL_X, y ); print( "    " );
	ldhl	sp,	#9
	ld	h, (hl)
	ld	l, #0x0f
	push	hl
	call	_gotoxy
	pop	hl
	ld	de, #___str_67
	call	_print
;sound.c:1015: gotoxy( VAL_X, y ); println( l, 10, UNSIGNED );
	ldhl	sp,	#9
	ld	h, (hl)
	ld	l, #0x0f
	push	hl
	call	_gotoxy
	pop	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x0a
	ldhl	sp,	#11
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_println
;sound.c:1017: show_register_channel( mode );
	ldhl	sp,	#8
	ld	a, (hl)
	call	_show_register_channel
	jr	00159$
00146$:
;sound.c:977: if( KEY_PRESSED( J_A ) && KEY_PRESSED( J_B ) )
	ldhl	sp,	#11
	ld	a, (hl)
	and	a, #0x10
	ld	b, #0x00
;sound.c:1020: else if( KEY_TICKED( J_START ) ) {
	push	hl
	bit	7, (hl)
	pop	hl
	jr	Z, 00142$
	bit	7, c
	jr	NZ, 00142$
;sound.c:1021: if( KEY_PRESSED( J_A ) )
	or	a, b
	jr	Z, 00134$
;sound.c:1022: play_music( mode );
	ldhl	sp,	#8
	ld	a, (hl)
	call	_play_music
	jr	00159$
00134$:
;sound.c:1024: update_value( mode, PLAY, 1 );
	ld	de, #0x0001
	push	de
	ld	e, #0x20
	ldhl	sp,	#10
	ld	a, (hl)
	call	_update_value
	jr	00159$
00142$:
;sound.c:1027: else if( KEY_PRESSED( J_SELECT ) ) {
	push	hl
	ldhl	sp,	#13
	bit	6, (hl)
	pop	hl
	jr	Z, 00159$
;sound.c:1028: if( KEY_PRESSED( J_A ) )
	or	a, b
	jr	Z, 00137$
;sound.c:1029: dump_registers();
	call	_dump_registers
	jr	00138$
00137$:
;sound.c:1031: mode = ( mode + 1 ) % NB_MODES;
	pop	de
	push	de
	inc	de
	ld	bc, #0x0005
	call	__modsint
	ldhl	sp,	#8
	ld	(hl), c
00138$:
;sound.c:1033: waitpadup();
	call	_waitpadup
;sound.c:1034: keys = 0;
	ld	hl, #_keys
	ld	(hl), #0x00
;sound.c:1035: break;
	jp	00165$
00159$:
;sound.c:1037: wait_vbl_done();
	call	_wait_vbl_done
;sound.c:1038: UPDATE_KEYS();
	ld	a, (#_keys)
	ld	(#_previous_keys),a
	call	_joypad
	ld	(#_keys),a
	jp	00162$
;sound.c:1041: }
	add	sp, #12
	ret
___str_67:
	.ascii "    "
	.db 0x00
;sound.c:1043: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;sound.c:1049: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;sound.c:1051: soundReg = &s;
	ld	hl, #_soundReg
	ld	(hl), #<(_s)
	inc	hl
	ld	(hl), #>(_s)
;sound.c:1052: NR10_REG = NR10();
	call	_NR10
	ldh	(_NR10_REG + 0), a
;sound.c:1053: NR11_REG = NR11();
	call	_NR11
	ldh	(_NR11_REG + 0), a
;sound.c:1054: NR12_REG = NR12();
	call	_NR12
	ldh	(_NR12_REG + 0), a
;sound.c:1055: NR13_REG = NR13();
	call	_NR13
	ldh	(_NR13_REG + 0), a
;sound.c:1056: NR14_REG = NR14();
	call	_NR14
	ldh	(_NR14_REG + 0), a
;sound.c:1058: NR21_REG = NR21();
	call	_NR21
	ldh	(_NR21_REG + 0), a
;sound.c:1059: NR22_REG = NR22();
	call	_NR22
	ldh	(_NR22_REG + 0), a
;sound.c:1060: NR23_REG = NR23();
	call	_NR23
	ldh	(_NR23_REG + 0), a
;sound.c:1061: NR24_REG = NR24();
	call	_NR24
	ldh	(_NR24_REG + 0), a
;sound.c:1063: NR30_REG = NR30();
	call	_NR30
	ldh	(_NR30_REG + 0), a
;sound.c:1064: NR31_REG = NR31();
	call	_NR31
	ldh	(_NR31_REG + 0), a
;sound.c:1065: NR32_REG = NR32();
	call	_NR32
	ldh	(_NR32_REG + 0), a
;sound.c:1066: NR33_REG = NR33();
	call	_NR33
	ldh	(_NR33_REG + 0), a
;sound.c:1067: NR34_REG = NR34();
	call	_NR34
	ldh	(_NR34_REG + 0), a
;sound.c:1069: NR41_REG = NR41();
	call	_NR41
	ldh	(_NR41_REG + 0), a
;sound.c:1070: NR42_REG = NR42();
	call	_NR42
	ldh	(_NR42_REG + 0), a
;sound.c:1071: NR43_REG = NR43();
	call	_NR43
	ldh	(_NR43_REG + 0), a
;sound.c:1072: NR44_REG = NR44();
	call	_NR44
	ldh	(_NR44_REG + 0), a
;sound.c:1074: NR50_REG = NR50();
	call	_NR50
	ldh	(_NR50_REG + 0), a
;sound.c:1075: NR51_REG = NR51();
	call	_NR51
	ldh	(_NR51_REG + 0), a
;sound.c:1076: NR52_REG = NR52();
	call	_NR52
	ldh	(_NR52_REG + 0), a
;sound.c:1078: clss();
	call	_clss
;sound.c:1080: wait_event( 1 );
	ld	a, #0x01
;sound.c:1081: }
	jp	_wait_event
	.area _CODE
	.area _INITIALIZER
__xinit__previous_keys:
	.db #0x00	; 0
__xinit__keys:
	.db #0x00	;  0
__xinit__params_array:
	.dw _params_0
	.dw _params_1
	.dw _params_2
	.dw _params_3
	.dw _params_4
__xinit__s:
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0002
	.dw #0x0003
	.dw #0x0000
	.dw #0x0004
	.dw #0x0073
	.dw #0x0006
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0002
	.dw #0x0004
	.dw #0x0000
	.dw #0x0008
	.dw #0x00d7
	.dw #0x0006
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0003
	.dw #0x0000
	.dw #0x00d6
	.dw #0x0006
	.dw #0x0000
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x003a
	.dw #0x0000
	.dw #0x0001
	.dw #0x0000
	.dw #0x000a
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0000
	.dw #0x0007
	.dw #0x0000
	.dw #0x0007
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.area _CABS (ABS)

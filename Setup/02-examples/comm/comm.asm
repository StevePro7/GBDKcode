;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module comm
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _puts
	.globl _printf
	.globl _set_interrupts
	.globl _waitpadup
	.globl _waitpad
	.globl _joypad
	.globl _receive_byte
	.globl _send_byte
	.globl _nowait_int_handler
	.globl _add_SIO
	.globl _str
	.globl _buffer
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_buffer::
	.ds 32
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_str::
	.ds 13
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
;comm.c:8: void main( void )
;	---------------------------------
; Function main
; ---------------------------------
_main::
	dec	sp
;comm.c:18: puts( "  SELECT : Receive" );
	ld	de, #___str_20
	call	_puts
;comm.c:23: }
	di
;comm.c:22: add_SIO( nowait_int_handler );    // disable waiting VRAM state before return
	ld	de, #_nowait_int_handler
	push	de
	call	_add_SIO
	pop	hl
	ei
;comm.c:24: set_interrupts( SIO_IFLAG );          // disable other interrupts. note: this disables sprite movement
	ld	a, #0x08
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;comm.c:26: while( 1 ) 
	ldhl	sp,	#0
	ld	(hl), #0x00
00157$:
;comm.c:28: i = waitpad( J_A | J_B | J_START | J_SELECT );
	ld	a, #0xf0
	call	_waitpad
	ld	c, a
;comm.c:29: waitpadup();
	call	_waitpadup
;comm.c:31: if( i == J_A )
	ld	a, c
	sub	a, #0x10
	jr	NZ, 00154$
;comm.c:34: printf( "Sending b... " );
	ld	de, #___str_6
	push	de
	call	_printf
	pop	hl
;comm.c:35: _io_out = n++;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(#__io_out),a
	ldhl	sp,	#0
	inc	(hl)
;comm.c:36: send_byte();
	call	_send_byte
;comm.c:38: while( ( _io_status == IO_SENDING ) && ( joypad() == 0 ) );
00102$:
	ld	a, (#__io_status)
	dec	a
	jr	NZ, 00104$
	call	_joypad
	or	a, a
	jr	Z, 00102$
00104$:
;comm.c:39: if( _io_status == IO_IDLE )
	ld	a, (#__io_status)
	or	a, a
	jr	NZ, 00106$
;comm.c:40: printf( "OK\n" );
	ld	de, #___str_8
	call	_puts
	jp	00155$
00106$:
;comm.c:42: printf( "#%d\n", _io_status );
	ld	hl, #__io_status
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	de, #___str_9
	push	de
	call	_printf
	add	sp, #4
	jp	00155$
00154$:
;comm.c:44: else if( i == J_B )
	ld	a, c
	sub	a, #0x20
	jr	NZ, 00151$
;comm.c:47: printf( "Receiving b... " );
	ld	de, #___str_10
	push	de
	call	_printf
	pop	hl
;comm.c:48: receive_byte();
	call	_receive_byte
;comm.c:50: while( ( _io_status == IO_RECEIVING ) && ( joypad() == 0 ) );
00109$:
	ld	a, (#__io_status)
	sub	a, #0x02
	jr	NZ, 00111$
	call	_joypad
	or	a, a
	jr	Z, 00109$
00111$:
;comm.c:51: if( _io_status == IO_IDLE )
	ld	a, (#__io_status)
	or	a, a
	jr	NZ, 00113$
;comm.c:52: printf( "OK\n%d\n", _io_in );
	ld	hl, #__io_in
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	de, #___str_11
	push	de
	call	_printf
	add	sp, #4
	jp	00155$
00113$:
;comm.c:54: printf( "#%d\n", _io_status );
	ld	hl, #__io_status
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	de, #___str_9
	push	de
	call	_printf
	add	sp, #4
	jp	00155$
00151$:
;comm.c:56: else if( i == J_START ) {
	ld	a, c
	sub	a, #0x80
	jr	NZ, 00148$
;comm.c:58: printf( "Sending s... " );
	ld	de, #___str_12
	push	de
	call	_printf
	pop	hl
;comm.c:59: s = str;
	ld	de, #_str+0
;comm.c:60: while( 1 ) {
00128$:
;comm.c:61: _io_out = *s;
	ld	a, (de)
	ld	(#__io_out),a
;comm.c:62: do {
00120$:
;comm.c:63: send_byte();
	push	de
	call	_send_byte
	pop	de
;comm.c:65: while( ( _io_status == IO_SENDING ) && ( joypad() == 0 ) );
00116$:
	ld	a, (#__io_status)
	dec	a
	jr	NZ, 00121$
	push	de
	call	_joypad
	pop	de
	or	a, a
	jr	Z, 00116$
00121$:
;comm.c:66: } while( ( _io_status != IO_IDLE ) && ( joypad() == 0 ) );
	ld	a, (#__io_status)
	or	a, a
	jr	Z, 00122$
	push	de
	call	_joypad
	pop	de
	or	a, a
	jr	Z, 00120$
00122$:
;comm.c:67: if( _io_status != IO_IDLE ) {
	ld	hl, #__io_status
	ld	a, (hl)
	or	a, a
	jr	Z, 00124$
;comm.c:68: printf( "#%d\n", _io_status );
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	de, #___str_9
	push	de
	call	_printf
	add	sp, #4
;comm.c:69: break;
	jr	00129$
00124$:
;comm.c:71: if( *s == 0 ) break;
	ld	a, (de)
	or	a, a
	jr	Z, 00129$
;comm.c:72: s++;
	inc	de
	jr	00128$
00129$:
;comm.c:74: if( _io_status == IO_IDLE ) printf( "OK\n" );
	ld	a, (#__io_status)
	or	a, a
	jr	NZ, 00155$
	ld	de, #___str_8
	call	_puts
	jr	00155$
00148$:
;comm.c:76: else if( i == J_SELECT )
	ld	a, c
	sub	a, #0x40
	jr	NZ, 00155$
;comm.c:79: printf( "Receiving s... " );
	ld	de, #___str_14
	push	de
	call	_printf
	pop	hl
;comm.c:80: s = buffer;
	ld	bc, #_buffer
;comm.c:81: while( 1 ) {
00141$:
;comm.c:82: receive_byte();
	push	bc
	call	_receive_byte
	pop	bc
;comm.c:84: while( ( _io_status == IO_RECEIVING ) && ( joypad() == 0 ) );
00133$:
	ld	a, (#__io_status)
	sub	a, #0x02
	jr	NZ, 00135$
	call	_joypad
	or	a, a
	jr	Z, 00133$
00135$:
;comm.c:85: if( _io_status != IO_IDLE ) {
	ld	hl, #__io_status
	ld	a, (hl)
	or	a, a
	jr	Z, 00137$
;comm.c:86: printf( "#%d\n", _io_status );
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	de, #___str_9
	push	de
	call	_printf
	add	sp, #4
;comm.c:87: break;
	jr	00142$
00137$:
;comm.c:89: *s = _io_in;
	ld	a, (#__io_in)
	ld	(bc), a
;comm.c:90: if( *s == 0 ) break;
	ld	a, (bc)
	or	a, a
	jr	Z, 00142$
;comm.c:91: s++;
	inc	bc
	jr	00141$
00142$:
;comm.c:93: if( _io_status == IO_IDLE ) printf( "OK\n%s\n", buffer );
	ld	a, (#__io_status)
	or	a, a
	jr	NZ, 00155$
	ld	de, #_buffer
	push	de
	ld	de, #___str_15
	push	de
	call	_printf
	add	sp, #4
00155$:
;comm.c:96: waitpadup();
	call	_waitpadup
	jp	00157$
;comm.c:98: }
	inc	sp
	ret
___str_6:
	.ascii "Sending b... "
	.db 0x00
___str_8:
	.ascii "OK"
	.db 0x00
___str_9:
	.ascii "#%d"
	.db 0x0a
	.db 0x00
___str_10:
	.ascii "Receiving b... "
	.db 0x00
___str_11:
	.ascii "OK"
	.db 0x0a
	.ascii "%d"
	.db 0x0a
	.db 0x00
___str_12:
	.ascii "Sending s... "
	.db 0x00
___str_14:
	.ascii "Receiving s... "
	.db 0x00
___str_15:
	.ascii "OK"
	.db 0x0a
	.ascii "%s"
	.db 0x0a
	.db 0x00
___str_20:
	.ascii "Byte"
	.db 0x0a
	.ascii "  A      : Send"
	.db 0x0a
	.ascii "  B      : Receive"
	.db 0x0a
	.ascii "String"
	.db 0x0a
	.ascii "  START  : Send"
	.db 0x0a
	.ascii "  SELECT : Receive"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit__str:
	.ascii "Hello World!"
	.db 0x00
	.area _CABS (ABS)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module paint
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _run
	.globl _menu
	.globl _splash
	.globl _reset_icon
	.globl _change_icon
	.globl _set_icon
	.globl _move_menu_cursor
	.globl _move_cursor
	.globl _set_cursor
	.globl _switch_data
	.globl _plot
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _waitpadup
	.globl _joypad
	.globl _cursor_y
	.globl _cursor_x
	.globl _menu_cursor_pos
	.globl _current_cursor
	.globl _current_mode
	.globl _current_color
	.globl _current_tool
	.globl _data_buffer
	.globl _modes
	.globl _colors
	.globl _cursors_data
	.globl _cursors
	.globl _selected_data
	.globl _data
	.globl _icons
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_data_buffer::
	.ds 768
_current_tool::
	.ds 1
_current_color::
	.ds 1
_current_mode::
	.ds 1
_current_cursor::
	.ds 1
_menu_cursor_pos::
	.ds 1
_cursor_x::
	.ds 1
_cursor_y::
	.ds 1
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
;paint.c:262: void set_cursor()
;	---------------------------------
; Function set_cursor
; ---------------------------------
_set_cursor::
	add	sp, #-5
;paint.c:266: i = 0;
;paint.c:267: for( x = 0; x < cursors[ current_cursor ].w; x++ )
	ld	bc, #0x0
00111$:
	ld	hl, #_current_cursor
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl,#_cursors + 1
	add	hl,de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
	ld	a, b
	sub	a, e
	jr	NC, 00123$
;paint.c:268: for( y = 0; y < cursors[ current_cursor ].h; y++ ) {
	ldhl	sp,	#4
	ld	(hl), #0x00
00108$:
	ld	hl, #_current_cursor
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #_cursors
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	inc	de
	inc	de
	ld	a, (de)
	ld	e, a
	ld	a, (hl)
	sub	a, e
	jr	NC, 00124$
;paint.c:271: cursors_data[ cursors[ current_cursor ].data_idx + i ] );
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	e, c
	ld	d, #0x00
	ld	l, a
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_cursors_data
	add	hl, de
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	a, c
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
	pop	de
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	sla	e
	rl	d
	sla	e
	rl	d
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	ld	(hl), c
;C:/gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	inc	hl
	ld	(hl), #0x10
;paint.c:274: i++;
	inc	c
;paint.c:268: for( y = 0; y < cursors[ current_cursor ].h; y++ ) {
	ldhl	sp,	#4
	inc	(hl)
	jr	00108$
00124$:
;paint.c:267: for( x = 0; x < cursors[ current_cursor ].w; x++ )
	inc	b
	jp	00111$
00123$:
00114$:
;paint.c:277: for( ; i < 4; i++ ) {
	ld	a, c
	sub	a, #0x04
	jr	NC, 00116$
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;paint.c:277: for( ; i < 4; i++ ) {
	inc	c
	jr	00114$
00116$:
;paint.c:280: }
	add	sp, #5
	ret
_icons:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x0e	; 14
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x1c	; 28
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x0a	; 10
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x0e	; 14
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x05	; 5
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x0b	; 11
	.db #0x10	; 16
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x0d	; 13
	.db #0x0a	; 10
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x2b	; 43
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x2d	; 45
	.db #0x02	; 2
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x2e	; 46
	.db #0x03	; 3
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x11	; 17
	.db #0x0e	; 14
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x03	; 3
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x00	; 0
_data:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x7e	; 126
	.db #0x02	; 2
	.db #0x7d	; 125
	.db #0x05	; 5
	.db #0x7b	; 123
	.db #0x0a	; 10
	.db #0x77	; 119	'w'
	.db #0x14	; 20
	.db #0x7f	; 127
	.db #0x18	; 24
	.db #0x7f	; 127
	.db #0x27	; 39
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x0d	; 13
	.db #0xf6	; 246
	.db #0x15	; 21
	.db #0xee	; 238
	.db #0x29	; 41
	.db #0xde	; 222
	.db #0x51	; 81	'Q'
	.db #0xbe	; 190
	.db #0xa1	; 161
	.db #0x7e	; 126
	.db #0x41	; 65	'A'
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x7e	; 126
	.db #0x02	; 2
	.db #0x7d	; 125
	.db #0x0d	; 13
	.db #0x7f	; 127
	.db #0x1e	; 30
	.db #0x7f	; 127
	.db #0x1e	; 30
	.db #0x7f	; 127
	.db #0x1d	; 29
	.db #0x7f	; 127
	.db #0x11	; 17
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x0d	; 13
	.db #0xf6	; 246
	.db #0x15	; 21
	.db #0xee	; 238
	.db #0x29	; 41
	.db #0xde	; 222
	.db #0x51	; 81	'Q'
	.db #0xbe	; 190
	.db #0xa1	; 161
	.db #0x7e	; 126
	.db #0x41	; 65	'A'
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x02	; 2
	.db #0x7e	; 126
	.db #0x0c	; 12
	.db #0x7d	; 125
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x1d	; 29
	.db #0x7f	; 127
	.db #0x1b	; 27
	.db #0x7f	; 127
	.db #0x19	; 25
	.db #0x7f	; 127
	.db #0x18	; 24
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0x41	; 65	'A'
	.db #0x7e	; 126
	.db #0x21	; 33
	.db #0xbe	; 190
	.db #0x71	; 113	'q'
	.db #0x5e	; 94
	.db #0xe9	; 233
	.db #0xae	; 174
	.db #0xc5	; 197
	.db #0x5e	; 94
	.db #0x89	; 137
	.db #0xbe	; 190
	.db #0x11	; 17
	.db #0xfe	; 254
	.db #0xa1	; 161
	.db #0xfe	; 254
	.db #0x41	; 65	'A'
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x7e	; 126
	.db #0x02	; 2
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x08	; 8
	.db #0x7f	; 127
	.db #0x1f	; 31
	.db #0x71	; 113	'q'
	.db #0x11	; 17
	.db #0x7f	; 127
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xf9	; 249
	.db #0x1e	; 30
	.db #0x19	; 25
	.db #0x2e	; 46
	.db #0x29	; 41
	.db #0x5e	; 94
	.db #0x51	; 81	'Q'
	.db #0xbe	; 190
	.db #0xa1	; 161
	.db #0x7e	; 126
	.db #0x41	; 65	'A'
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x7f	; 127
	.db #0x10	; 16
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x7f	; 127
	.db #0x04	; 4
	.db #0x7f	; 127
	.db #0x02	; 2
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0x41	; 65	'A'
	.db #0xfe	; 254
	.db #0x21	; 33
	.db #0xfe	; 254
	.db #0x11	; 17
	.db #0xfe	; 254
	.db #0x09	; 9
	.db #0xfe	; 254
	.db #0x05	; 5
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x1e	; 30
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0x41	; 65	'A'
	.db #0xfe	; 254
	.db #0x21	; 33
	.db #0xfe	; 254
	.db #0x11	; 17
	.db #0xfe	; 254
	.db #0x11	; 17
	.db #0xfe	; 254
	.db #0x09	; 9
	.db #0xfe	; 254
	.db #0x09	; 9
	.db #0xfe	; 254
	.db #0x09	; 9
	.db #0xfe	; 254
	.db #0x09	; 9
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0x05	; 5
	.db #0xfe	; 254
	.db #0x05	; 5
	.db #0xfe	; 254
	.db #0x05	; 5
	.db #0xfe	; 254
	.db #0x05	; 5
	.db #0xfe	; 254
	.db #0x05	; 5
	.db #0xfe	; 254
	.db #0x05	; 5
	.db #0xfe	; 254
	.db #0x05	; 5
	.db #0xfe	; 254
	.db #0x05	; 5
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0x0c	; 12
	.db #0x7f	; 127
	.db #0x10	; 16
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x7f	; 127
	.db #0x10	; 16
	.db #0x7f	; 127
	.db #0x0c	; 12
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xc1	; 193
	.db #0xfe	; 254
	.db #0x31	; 49	'1'
	.db #0xfe	; 254
	.db #0x09	; 9
	.db #0xfe	; 254
	.db #0x05	; 5
	.db #0xfe	; 254
	.db #0x05	; 5
	.db #0xfe	; 254
	.db #0x05	; 5
	.db #0xfe	; 254
	.db #0x05	; 5
	.db #0xfe	; 254
	.db #0x09	; 9
	.db #0xfe	; 254
	.db #0x31	; 49	'1'
	.db #0xfe	; 254
	.db #0xc1	; 193
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x3f	; 63
	.db #0x75	; 117	'u'
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x3f	; 63
	.db #0x75	; 117	'u'
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x3f	; 63
	.db #0x75	; 117	'u'
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x3f	; 63
	.db #0x75	; 117	'u'
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xae	; 174
	.db #0xfd	; 253
	.db #0x56	; 86	'V'
	.db #0xfd	; 253
	.db #0xae	; 174
	.db #0xfd	; 253
	.db #0x56	; 86	'V'
	.db #0xfd	; 253
	.db #0xae	; 174
	.db #0xfd	; 253
	.db #0x56	; 86	'V'
	.db #0xfd	; 253
	.db #0xae	; 174
	.db #0xfd	; 253
	.db #0x56	; 86	'V'
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0x7e	; 126
	.db #0x0f	; 15
	.db #0x75	; 117	'u'
	.db #0x1f	; 31
	.db #0x6a	; 106	'j'
	.db #0x3f	; 63
	.db #0x75	; 117	'u'
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x3f	; 63
	.db #0x75	; 117	'u'
	.db #0x3f	; 63
	.db #0x7a	; 122	'z'
	.db #0x1f	; 31
	.db #0x7d	; 125
	.db #0x0f	; 15
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xc1	; 193
	.db #0xbe	; 190
	.db #0xf1	; 241
	.db #0x5e	; 94
	.db #0xf9	; 249
	.db #0xae	; 174
	.db #0xfd	; 253
	.db #0x56	; 86	'V'
	.db #0xfd	; 253
	.db #0xae	; 174
	.db #0xfd	; 253
	.db #0x56	; 86	'V'
	.db #0xfd	; 253
	.db #0xae	; 174
	.db #0xf9	; 249
	.db #0x7e	; 126
	.db #0xf1	; 241
	.db #0xfe	; 254
	.db #0xc1	; 193
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x0c	; 12
	.db #0x7f	; 127
	.db #0x10	; 16
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x7f	; 127
	.db #0x04	; 4
	.db #0x7f	; 127
	.db #0x18	; 24
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x7f	; 127
	.db #0x14	; 20
	.db #0x7f	; 127
	.db #0x14	; 20
	.db #0x7f	; 127
	.db #0x14	; 20
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x29	; 41
	.db #0xfe	; 254
	.db #0x29	; 41
	.db #0xfe	; 254
	.db #0x11	; 17
	.db #0xfe	; 254
	.db #0x29	; 41
	.db #0xfe	; 254
	.db #0x29	; 41
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x11	; 17
	.db #0xfe	; 254
	.db #0x29	; 41
	.db #0xfe	; 254
	.db #0x39	; 57	'9'
	.db #0xfe	; 254
	.db #0x29	; 41
	.db #0xfe	; 254
	.db #0x29	; 41
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xff	; 255
_selected_data:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0xfd	; 253
	.db #0x82	; 130
	.db #0xfa	; 250
	.db #0x84	; 132
	.db #0xf5	; 245
	.db #0x88	; 136
	.db #0xeb	; 235
	.db #0x80	; 128
	.db #0xe7	; 231
	.db #0x80	; 128
	.db #0xd8	; 216
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xf2	; 242
	.db #0x09	; 9
	.db #0xea	; 234
	.db #0x11	; 17
	.db #0xd6	; 214
	.db #0x21	; 33
	.db #0xae	; 174
	.db #0x41	; 65	'A'
	.db #0x5e	; 94
	.db #0x81	; 129
	.db #0xbe	; 190
	.db #0x01	; 1
	.db #0x7e	; 126
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0xfd	; 253
	.db #0x82	; 130
	.db #0xf2	; 242
	.db #0x80	; 128
	.db #0xe1	; 225
	.db #0x80	; 128
	.db #0xe1	; 225
	.db #0x80	; 128
	.db #0xe2	; 226
	.db #0x80	; 128
	.db #0xee	; 238
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xf2	; 242
	.db #0x09	; 9
	.db #0xea	; 234
	.db #0x11	; 17
	.db #0xd6	; 214
	.db #0x21	; 33
	.db #0xae	; 174
	.db #0x41	; 65	'A'
	.db #0x5e	; 94
	.db #0x81	; 129
	.db #0xbe	; 190
	.db #0x01	; 1
	.db #0x7e	; 126
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xfe	; 254
	.db #0x80	; 128
	.db #0xfd	; 253
	.db #0x81	; 129
	.db #0xf3	; 243
	.db #0x82	; 130
	.db #0xe7	; 231
	.db #0x81	; 129
	.db #0xe2	; 226
	.db #0x80	; 128
	.db #0xe4	; 228
	.db #0x80	; 128
	.db #0xe7	; 231
	.db #0x80	; 128
	.db #0xe7	; 231
	.db #0x80	; 128
	.db #0xf7	; 247
	.db #0x80	; 128
	.db #0xf7	; 247
	.db #0x80	; 128
	.db #0xf7	; 247
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x7e	; 126
	.db #0x01	; 1
	.db #0xbe	; 190
	.db #0x81	; 129
	.db #0xde	; 222
	.db #0x41	; 65	'A'
	.db #0x8e	; 142
	.db #0xa1	; 161
	.db #0x16	; 22
	.db #0x51	; 81	'Q'
	.db #0x3a	; 58
	.db #0xa1	; 161
	.db #0x76	; 118	'v'
	.db #0x41	; 65	'A'
	.db #0xee	; 238
	.db #0x01	; 1
	.db #0x5e	; 94
	.db #0x01	; 1
	.db #0xbe	; 190
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0xfd	; 253
	.db #0x83	; 131
	.db #0xfb	; 251
	.db #0x87	; 135
	.db #0xf7	; 247
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0x8e	; 142
	.db #0xee	; 238
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0xe1	; 225
	.db #0xe6	; 230
	.db #0xd1	; 209
	.db #0xd6	; 214
	.db #0xa1	; 161
	.db #0xae	; 174
	.db #0x41	; 65	'A'
	.db #0x5e	; 94
	.db #0x81	; 129
	.db #0xbe	; 190
	.db #0x01	; 1
	.db #0x7e	; 126
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xdf	; 223
	.db #0x80	; 128
	.db #0xef	; 239
	.db #0x80	; 128
	.db #0xf7	; 247
	.db #0x80	; 128
	.db #0xfb	; 251
	.db #0x80	; 128
	.db #0xfd	; 253
	.db #0x80	; 128
	.db #0xfe	; 254
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x7e	; 126
	.db #0x01	; 1
	.db #0xbe	; 190
	.db #0x01	; 1
	.db #0xde	; 222
	.db #0x01	; 1
	.db #0xee	; 238
	.db #0x01	; 1
	.db #0xf6	; 246
	.db #0x01	; 1
	.db #0xfa	; 250
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xe1	; 225
	.db #0x80	; 128
	.db #0xfe	; 254
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x7e	; 126
	.db #0x01	; 1
	.db #0xbe	; 190
	.db #0x01	; 1
	.db #0xde	; 222
	.db #0x01	; 1
	.db #0xee	; 238
	.db #0x01	; 1
	.db #0xee	; 238
	.db #0x01	; 1
	.db #0xf6	; 246
	.db #0x01	; 1
	.db #0xf6	; 246
	.db #0x01	; 1
	.db #0xf6	; 246
	.db #0x01	; 1
	.db #0xf6	; 246
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xdf	; 223
	.db #0x80	; 128
	.db #0xdf	; 223
	.db #0x80	; 128
	.db #0xdf	; 223
	.db #0x80	; 128
	.db #0xdf	; 223
	.db #0x80	; 128
	.db #0xdf	; 223
	.db #0x80	; 128
	.db #0xdf	; 223
	.db #0x80	; 128
	.db #0xdf	; 223
	.db #0x80	; 128
	.db #0xdf	; 223
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xfa	; 250
	.db #0x01	; 1
	.db #0xfa	; 250
	.db #0x01	; 1
	.db #0xfa	; 250
	.db #0x01	; 1
	.db #0xfa	; 250
	.db #0x01	; 1
	.db #0xfa	; 250
	.db #0x01	; 1
	.db #0xfa	; 250
	.db #0x01	; 1
	.db #0xfa	; 250
	.db #0x01	; 1
	.db #0xfa	; 250
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0xf3	; 243
	.db #0x80	; 128
	.db #0xef	; 239
	.db #0x80	; 128
	.db #0xdf	; 223
	.db #0x80	; 128
	.db #0xdf	; 223
	.db #0x80	; 128
	.db #0xdf	; 223
	.db #0x80	; 128
	.db #0xdf	; 223
	.db #0x80	; 128
	.db #0xef	; 239
	.db #0x80	; 128
	.db #0xf3	; 243
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x3e	; 62
	.db #0x01	; 1
	.db #0xce	; 206
	.db #0x01	; 1
	.db #0xf6	; 246
	.db #0x01	; 1
	.db #0xfa	; 250
	.db #0x01	; 1
	.db #0xfa	; 250
	.db #0x01	; 1
	.db #0xfa	; 250
	.db #0x01	; 1
	.db #0xfa	; 250
	.db #0x01	; 1
	.db #0xf6	; 246
	.db #0x01	; 1
	.db #0xce	; 206
	.db #0x01	; 1
	.db #0x3e	; 62
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x9f	; 159
	.db #0xc0	; 192
	.db #0x9f	; 159
	.db #0xc0	; 192
	.db #0x9f	; 159
	.db #0xc0	; 192
	.db #0x9f	; 159
	.db #0xc0	; 192
	.db #0x9f	; 159
	.db #0xc0	; 192
	.db #0x9f	; 159
	.db #0xc0	; 192
	.db #0x9f	; 159
	.db #0xc0	; 192
	.db #0x9f	; 159
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xf9	; 249
	.db #0x02	; 2
	.db #0xf9	; 249
	.db #0x02	; 2
	.db #0xf9	; 249
	.db #0x02	; 2
	.db #0xf9	; 249
	.db #0x02	; 2
	.db #0xf9	; 249
	.db #0x02	; 2
	.db #0xf9	; 249
	.db #0x02	; 2
	.db #0xf9	; 249
	.db #0x02	; 2
	.db #0xf9	; 249
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x83	; 131
	.db #0xf0	; 240
	.db #0x8f	; 143
	.db #0xe0	; 224
	.db #0x9f	; 159
	.db #0xc0	; 192
	.db #0x9f	; 159
	.db #0xc0	; 192
	.db #0x9f	; 159
	.db #0xc0	; 192
	.db #0x9f	; 159
	.db #0xc0	; 192
	.db #0x8f	; 143
	.db #0xe0	; 224
	.db #0x83	; 131
	.db #0xf0	; 240
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x3e	; 62
	.db #0xc1	; 193
	.db #0x0e	; 14
	.db #0xf1	; 241
	.db #0x06	; 6
	.db #0xf9	; 249
	.db #0x02	; 2
	.db #0xf9	; 249
	.db #0x02	; 2
	.db #0xf9	; 249
	.db #0x02	; 2
	.db #0xf9	; 249
	.db #0x02	; 2
	.db #0xf1	; 241
	.db #0x06	; 6
	.db #0xc1	; 193
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x3e	; 62
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x61	; 97	'a'
	.db #0x61	; 97	'a'
	.db #0x52	; 82	'R'
	.db #0x52	; 82	'R'
	.db #0x4c	; 76	'L'
	.db #0x4c	; 76	'L'
	.db #0x4c	; 76	'L'
	.db #0x4c	; 76	'L'
	.db #0x52	; 82	'R'
	.db #0x52	; 82	'R'
	.db #0x61	; 97	'a'
	.db #0x61	; 97	'a'
	.db #0x40	; 64
	.db #0x5e	; 94
	.db #0x40	; 64
	.db #0x6d	; 109	'm'
	.db #0x40	; 64
	.db #0x73	; 115	's'
	.db #0x40	; 64
	.db #0x73	; 115	's'
	.db #0x40	; 64
	.db #0x6d	; 109	'm'
	.db #0x40	; 64
	.db #0x5e	; 94
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0x87	; 135
	.db #0xfe	; 254
	.db #0x4b	; 75	'K'
	.db #0xfe	; 254
	.db #0x33	; 51	'3'
	.db #0xfe	; 254
	.db #0x33	; 51	'3'
	.db #0xfe	; 254
	.db #0x4b	; 75	'K'
	.db #0xfe	; 254
	.db #0x87	; 135
	.db #0x7a	; 122	'z'
	.db #0x7b	; 123
	.db #0xb6	; 182
	.db #0xb7	; 183
	.db #0xce	; 206
	.db #0xcf	; 207
	.db #0xce	; 206
	.db #0xcf	; 207
	.db #0xb6	; 182
	.db #0xb7	; 183
	.db #0x7a	; 122	'z'
	.db #0x7b	; 123
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x73	; 115	's'
	.db #0x73	; 115	's'
	.db #0x6f	; 111	'o'
	.db #0x6f	; 111	'o'
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0x67	; 103	'g'
	.db #0x67	; 103	'g'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xd6	; 214
	.db #0xd7	; 215
	.db #0xd6	; 214
	.db #0xd7	; 215
	.db #0xee	; 238
	.db #0xef	; 239
	.db #0xd6	; 214
	.db #0xd7	; 215
	.db #0xd6	; 214
	.db #0xd7	; 215
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xef	; 239
	.db #0xd6	; 214
	.db #0xd7	; 215
	.db #0xc6	; 198
	.db #0xc7	; 199
	.db #0xd6	; 214
	.db #0xd7	; 215
	.db #0xd6	; 214
	.db #0xd7	; 215
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
_cursors:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x0f	; 15
	.db #0x0d	; 13
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x11	; 17
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x0a	; 10
_cursors_data:
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0x78	; 120	'x'
	.db #0xff	; 255
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0x6e	; 110	'n'
	.db #0xff	; 255
	.db #0x46	; 70	'F'
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x02	; 2
	.db #0x1f	; 31
	.db #0x05	; 5
	.db #0x3f	; 63
	.db #0x0a	; 10
	.db #0x7f	; 127
	.db #0x14	; 20
	.db #0x7e	; 126
	.db #0x28	; 40
	.db #0xfc	; 252
	.db #0x30	; 48	'0'
	.db #0xf8	; 248
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x18	; 24
	.db #0xfc	; 252
	.db #0x28	; 40
	.db #0xfc	; 252
	.db #0x50	; 80	'P'
	.db #0xf8	; 248
	.db #0xa0	; 160
	.db #0xf0	; 240
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x02	; 2
	.db #0x1f	; 31
	.db #0x05	; 5
	.db #0x7f	; 127
	.db #0x0a	; 10
	.db #0xff	; 255
	.db #0x34	; 52	'4'
	.db #0xfe	; 254
	.db #0x78	; 120	'x'
	.db #0xfc	; 252
	.db #0x78	; 120	'x'
	.db #0xfc	; 252
	.db #0x70	; 112	'p'
	.db #0xf8	; 248
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x30	; 48	'0'
	.db #0xf8	; 248
	.db #0x50	; 80	'P'
	.db #0xf8	; 248
	.db #0xa0	; 160
	.db #0xf0	; 240
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x02	; 2
	.db #0x1f	; 31
	.db #0x05	; 5
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0xfe	; 254
	.db #0x31	; 49	'1'
	.db #0xfd	; 253
	.db #0x63	; 99	'c'
	.db #0xfa	; 250
	.db #0x77	; 119	'w'
	.db #0xfd	; 253
	.db #0x6e	; 110	'n'
	.db #0xff	; 255
	.db #0x64	; 100	'd'
	.db #0xff	; 255
	.db #0x62	; 98	'b'
	.db #0xf7	; 247
	.db #0x21	; 33
	.db #0x73	; 115	's'
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x20	; 32
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0x78	; 120	'x'
	.db #0xa0	; 160
	.db #0xf8	; 248
	.db #0x10	; 16
	.db #0xf8	; 248
	.db #0x20	; 32
	.db #0xf0	; 240
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x04	; 4
	.db #0x3f	; 63
	.db #0x08	; 8
	.db #0x7f	; 127
	.db #0x11	; 17
	.db #0xff	; 255
	.db #0x22	; 34
	.db #0xff	; 255
	.db #0x7d	; 125
	.db #0xff	; 255
	.db #0x46	; 70	'F'
	.db #0xff	; 255
	.db #0x7c	; 124
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0x60	; 96
	.db #0xf0	; 240
	.db #0xa0	; 160
	.db #0xf0	; 240
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0xff	; 255
	.db #0x04	; 4
	.db #0xfb	; 251
	.db #0x7b	; 123
	.db #0xff	; 255
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_colors:
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
_modes:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
;paint.c:282: void move_cursor()
;	---------------------------------
; Function move_cursor
; ---------------------------------
_move_cursor::
	add	sp, #-3
;paint.c:286: for( x = 0; x < cursors[ current_cursor ].w; x++ )
	ldhl	sp,	#2
	ld	(hl), #0x00
00108$:
	ld	hl, #_current_cursor
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_cursors
	add	hl,bc
	inc	hl
	ld	c, (hl)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, c
	jr	NC, 00110$
;paint.c:287: for( y = 0; y < cursors[ current_cursor ].h; y++ )
	ld	c, #0x00
00105$:
	ld	hl, #_current_cursor
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #_cursors
	add	hl, de
;	spillPairReg hl
;	spillPairReg hl
	ld	e,l
	ld	d,h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	NC, 00109$
;paint.c:290: cursor_y + 16 - cursors[ current_cursor ].hot_y + ( y << 3 ) );
	ld	a, (#_cursor_y)
	add	a, #0x10
	ld	b, a
	ld	hl, #0x0004
	add	hl, de
	ld	l, (hl)
;	spillPairReg hl
	ld	a, b
	sub	a, l
	ld	b, a
	ldhl	sp,	#1
	ld	(hl), c
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	add	a, b
	ld	b, a
;paint.c:289: cursor_x + 8 - cursors[ current_cursor ].hot_x + ( x << 3 ),
	ld	a, (#_cursor_x)
	add	a, #0x08
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ld	e, a
	ld	a, l
	sub	a, e
	ld	e, a
	ldhl	sp,	#2
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	ld	e, a
;paint.c:288: move_sprite( ( x << 1 ) + y,
	ld	a, l
	add	a, a
	ldhl	sp,	#1
	add	a, (hl)
	ld	d, a
;paint.c:290: cursor_y + 16 - cursors[ current_cursor ].hot_y + ( y << 3 ) );
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), e
;paint.c:287: for( y = 0; y < cursors[ current_cursor ].h; y++ )
	inc	c
	jr	00105$
00109$:
;paint.c:286: for( x = 0; x < cursors[ current_cursor ].w; x++ )
	ldhl	sp,	#2
	inc	(hl)
	jp	00108$
00110$:
;paint.c:291: }
	add	sp, #3
	ret
;paint.c:293: void move_menu_cursor()
;	---------------------------------
; Function move_menu_cursor
; ---------------------------------
_move_menu_cursor::
;paint.c:297: ( ( icons[ menu_cursor_pos ].y + icons[ menu_cursor_pos ].h ) << 3 ) + 12 );
	ld	hl, #_menu_cursor_pos
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_icons
	add	hl,bc
;	spillPairReg hl
;	spillPairReg hl
	ld	e,l
	ld	d,h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	c, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	a, (hl)
	add	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x0c
	ld	b, a
;paint.c:296: ( ( icons[ menu_cursor_pos ].x + icons[ menu_cursor_pos ].w ) << 3 ) + 4,
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	c, (hl)
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	add	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x04
	ld	c, a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;paint.c:297: ( ( icons[ menu_cursor_pos ].y + icons[ menu_cursor_pos ].h ) << 3 ) + 12 );
;paint.c:298: }
	ret
;paint.c:300: void set_icon( uint8_t icon, uint8_t selected )
;	---------------------------------
; Function set_icon
; ---------------------------------
_set_icon::
	add	sp, #-16
	ld	c, a
	ldhl	sp,	#13
	ld	(hl), e
;paint.c:304: for( x = 0; x < icons[ icon ].w; x++ )
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_icons
	add	hl,bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#14
	ld	(hl), #0x00
00107$:
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, c
	jp	NC, 00109$
;paint.c:305: for( y = 0; y < icons[ icon ].h; y++ ) {
	pop	de
	push	de
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	pop	de
	push	de
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#15
	ld	(hl), #0x00
00104$:
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#15
	ld	a, (hl)
	sub	a, c
	jr	NC, 00108$
;paint.c:306: uint16_t index = icons[ icon ].data_idx + ( ( uint16_t ) x << 1 ) + y;
	dec	hl
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#15
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, bc
;paint.c:310: data_buffer[ index ] );
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #_data_buffer
	add	hl, bc
	ld	e, l
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), e
	inc	hl
;paint.c:309: selected ? selected_data[ index ] : data[ index ],
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
	ld	hl, #_selected_data
	add	hl, bc
	jr	00112$
00111$:
	ld	hl, #_data
	add	hl, bc
00112$:
	ld	c, l
	ld	b, h
;paint.c:308: icons[ icon ].y + y,
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#15
	add	a, (hl)
	ldhl	sp,	#12
	ld	(hl), a
;paint.c:307: switch_data( icons[ icon ].x + x,
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#14
	add	a, (hl)
	ldhl	sp,	#10
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	push	de
	push	bc
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_switch_data
	add	sp, #6
;paint.c:305: for( y = 0; y < icons[ icon ].h; y++ ) {
	ldhl	sp,	#15
	inc	(hl)
	jr	00104$
00108$:
;paint.c:304: for( x = 0; x < icons[ icon ].w; x++ )
	ldhl	sp,	#14
	inc	(hl)
	jp	00107$
00109$:
;paint.c:312: }
	add	sp, #16
	ret
;paint.c:314: void change_icon( uint8_t icon, uint8_t selected )
;	---------------------------------
; Function change_icon
; ---------------------------------
_change_icon::
	add	sp, #-16
	ld	c, a
	ldhl	sp,	#13
	ld	(hl), e
;paint.c:318: for( x = 0; x < icons[ icon ].w; x++ )
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_icons
	add	hl,bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	ldhl	sp,	#14
	ld	(hl), #0x00
00107$:
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, c
	jp	NC, 00109$
;paint.c:319: for( y = 0; y < icons[ icon ].h; y++ )
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,	#15
	ld	(hl), #0x00
00104$:
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#15
	ld	a, (hl)
	sub	a, c
	jr	NC, 00108$
;paint.c:323: selected_data[ icons[ icon ].data_idx + ( ( uint16_t ) x << 1 ) + y ] :
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#14
	ld	e, (hl)
	inc	hl
	ld	d, #0x00
	ld	c, (hl)
	ld	b, #0x00
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	sla	e
	rl	d
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	add	hl, bc
	ld	c, l
	ld	a, h
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	ldhl	sp,	#0
	ld	(hl), c
	inc	hl
	ld	(hl), a
;paint.c:322: ( selected ?
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
;paint.c:323: selected_data[ icons[ icon ].data_idx + ( ( uint16_t ) x << 1 ) + y ] :
	pop	de
	push	de
	ld	hl, #_selected_data
	add	hl, de
	ld	c, l
	ld	b, h
	jr	00112$
00111$:
;paint.c:324: data[ icons[ icon ].data_idx + ( ( uint16_t ) x << 1 ) + y ] ),
	ld	de, #_data
	pop	hl
	push	hl
	add	hl, de
	ld	c, l
	ld	b, h
00112$:
;paint.c:321: icons[ icon ].y + y,
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#15
	add	a, (hl)
	ldhl	sp,	#12
	ld	(hl), a
;paint.c:320: switch_data( icons[ icon ].x + x,
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#14
	add	a, (hl)
	dec	hl
	dec	hl
	ld	de, #0x0000
	push	de
	push	bc
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_switch_data
	add	sp, #6
;paint.c:319: for( y = 0; y < icons[ icon ].h; y++ )
	ldhl	sp,	#15
	inc	(hl)
	jr	00104$
00108$:
;paint.c:318: for( x = 0; x < icons[ icon ].w; x++ )
	ldhl	sp,	#14
	inc	(hl)
	jp	00107$
00109$:
;paint.c:326: }
	add	sp, #16
	ret
;paint.c:328: void reset_icon( uint8_t icon )
;	---------------------------------
; Function reset_icon
; ---------------------------------
_reset_icon::
	add	sp, #-13
	ld	c, a
;paint.c:332: for( x = 0; x < icons[ icon ].w; x++ )
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_icons
	add	hl,bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#11
	ld	(hl), #0x00
00107$:
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#11
	ld	a, (hl)
	sub	a, c
	jp	NC, 00109$
;paint.c:333: for( y = 0; y < icons[ icon ].h; y++ )
	pop	de
	push	de
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	pop	de
	push	de
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#12
	ld	(hl), #0x00
00104$:
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, c
	jr	NC, 00108$
;paint.c:336: data_buffer[ icons[ icon ].data_idx + ( x << 1 ) + y ],
	dec	hl
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_data_buffer
	add	hl, de
	ld	c, l
	ld	b, h
;paint.c:335: icons[ icon ].y + y,
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#12
	add	a, (hl)
	dec	hl
	dec	hl
	ld	(hl), a
;paint.c:334: switch_data( icons[ icon ].x + x,
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#11
	add	a, (hl)
	dec	hl
	ld	de, #0x0000
	push	de
	push	bc
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_switch_data
	add	sp, #6
;paint.c:333: for( y = 0; y < icons[ icon ].h; y++ )
	ldhl	sp,	#12
	inc	(hl)
	jr	00104$
00108$:
;paint.c:332: for( x = 0; x < icons[ icon ].w; x++ )
	ldhl	sp,	#11
	inc	(hl)
	jp	00107$
00109$:
;paint.c:338: }
	add	sp, #13
	ret
;paint.c:340: void splash()
;	---------------------------------
; Function splash
; ---------------------------------
_splash::
;paint.c:344: cursor_x = 40;
	ld	hl, #_cursor_x
	ld	(hl), #0x28
;paint.c:345: cursor_y = 50;
	ld	hl, #_cursor_y
	ld	(hl), #0x32
;paint.c:346: current_cursor = PEN;
	ld	hl, #_current_cursor
	ld	(hl), #0x01
;paint.c:347: set_cursor();
	call	_set_cursor
;paint.c:348: move_cursor();
	call	_move_cursor
;paint.c:349: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
00108$:
;paint.c:351: for( ; cursor_x < 120; cursor_x++ ) {
	ld	a, (#_cursor_x)
	sub	a, #0x78
	jr	NC, 00111$
;paint.c:352: wait_vbl_done();
	call	_wait_vbl_done
;paint.c:353: move_cursor();
	call	_move_cursor
;paint.c:354: plot( cursor_x, cursor_y, BLACK, SOLID );
	ld	hl, #0x03
	push	hl
	ld	a, (#_cursor_y)
	ld	h, a
	ld	a, (#_cursor_x)
	ld	l, a
	push	hl
	call	_plot
	add	sp, #4
;paint.c:351: for( ; cursor_x < 120; cursor_x++ ) {
	ld	hl, #_cursor_x
	inc	(hl)
	jr	00108$
00111$:
;paint.c:356: for( ; cursor_y < 94; cursor_y++ ) {
	ld	a, (#_cursor_y)
	sub	a, #0x5e
	jr	NC, 00114$
;paint.c:357: wait_vbl_done();
	call	_wait_vbl_done
;paint.c:358: move_cursor();
	call	_move_cursor
;paint.c:359: plot( cursor_x, cursor_y, BLACK, SOLID );
	ld	hl, #0x03
	push	hl
	ld	a, (#_cursor_y)
	ld	h, a
	ld	a, (#_cursor_x)
	ld	l, a
	push	hl
	call	_plot
	add	sp, #4
;paint.c:356: for( ; cursor_y < 94; cursor_y++ ) {
	ld	hl, #_cursor_y
	inc	(hl)
	jr	00111$
00114$:
;paint.c:361: for( ; cursor_x > 40; cursor_x-- ) {
	ld	a, #0x28
	ld	hl, #_cursor_x
	sub	a, (hl)
	jr	NC, 00117$
;paint.c:362: wait_vbl_done();
	call	_wait_vbl_done
;paint.c:363: move_cursor();
	call	_move_cursor
;paint.c:364: plot( cursor_x, cursor_y, BLACK, SOLID );
	ld	hl, #0x03
	push	hl
	ld	a, (#_cursor_y)
	ld	h, a
	ld	a, (#_cursor_x)
	ld	l, a
	push	hl
	call	_plot
	add	sp, #4
;paint.c:361: for( ; cursor_x > 40; cursor_x-- ) {
	ld	hl, #_cursor_x
	dec	(hl)
	jr	00114$
00117$:
;paint.c:366: for( ; cursor_y > 50; cursor_y-- ) {
	ld	a, #0x32
	ld	hl, #_cursor_y
	sub	a, (hl)
	jr	NC, 00104$
;paint.c:367: wait_vbl_done();
	call	_wait_vbl_done
;paint.c:368: move_cursor();
	call	_move_cursor
;paint.c:369: plot( cursor_x, cursor_y, BLACK, SOLID );
	ld	hl, #0x03
	push	hl
	ld	a, (#_cursor_y)
	ld	h, a
	ld	a, (#_cursor_x)
	ld	l, a
	push	hl
	call	_plot
	add	sp, #4
;paint.c:366: for( ; cursor_y > 50; cursor_y-- ) {
	ld	hl, #_cursor_y
	dec	(hl)
	jr	00117$
00104$:
;paint.c:371: cursor_x = 160 / 2;
	ld	hl, #_cursor_x
	ld	(hl), #0x50
;paint.c:372: cursor_y = 144 / 2;
	ld	hl, #_cursor_y
	ld	(hl), #0x48
;paint.c:373: current_cursor = FILL;
	ld	hl, #_current_cursor
	ld	(hl), #0x03
;paint.c:374: set_cursor();
	call	_set_cursor
;paint.c:375: move_cursor();
	call	_move_cursor
;paint.c:377: for( y = 51; y < 94; y++ )
	ld	c, #0x33
;paint.c:378: for( x = 41; x < 120; x++ )
00133$:
	ld	b, #0x29
00119$:
;paint.c:379: plot( x, y, LTGREY, SOLID );
	push	bc
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_plot
	add	sp, #4
	pop	bc
;paint.c:378: for( x = 41; x < 120; x++ )
	inc	b
	ld	a, b
	sub	a, #0x78
	jr	C, 00119$
;paint.c:377: for( y = 51; y < 94; y++ )
	inc	c
	ld	a, c
	sub	a, #0x5e
	jr	C, 00133$
;paint.c:382: }
	ret
;paint.c:384: void menu()
;	---------------------------------
; Function menu
; ---------------------------------
_menu::
	add	sp, #-9
;paint.c:390: slowdown = 50;
	ldhl	sp,	#0
	ld	(hl), #0x32
;paint.c:392: for( i = 0; i < NB_TOOLS; i++ )
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
00139$:
;paint.c:394: i == FIRST_TOOL + current_tool ||
	ld	a, (_current_tool)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, #0x00
	ld	c, l
	ld	b, #0x00
	ld	a, h
	sub	a, c
	jr	NZ, 00284$
	ld	a, e
	sub	a, b
	jr	Z, 00146$
00284$:
;paint.c:395: i == FIRST_COLOR + current_color ||
	push	hl
	ld	hl, #_current_color
	ld	e, (hl)
	pop	hl
	ld	d, #0x00
	ld	a, e
	add	a, #0x0a
	ld	e, a
	jr	NC, 00285$
	inc	d
00285$:
	ld	a, c
	sub	a, e
	jr	NZ, 00286$
	ld	a, b
	sub	a, d
	jr	Z, 00146$
00286$:
;paint.c:396: i == FIRST_MODE + current_mode );
	push	hl
	ld	a, (#_current_mode)
	pop	hl
	ld	d, #0x00
	add	a, #0x0e
	ld	e, a
	jr	NC, 00287$
	inc	d
00287$:
	ld	a, e
	sub	a, c
	jr	NZ, 00288$
	ld	a, d
	sub	a, b
	jr	Z, 00146$
00288$:
	ld	e, #0x00
	jr	00147$
00146$:
	ld	e, #0x01
00147$:
;paint.c:393: set_icon( i,
	push	hl
	ld	a, l
	call	_set_icon
	pop	hl
;paint.c:392: for( i = 0; i < NB_TOOLS; i++ )
	inc	l
	ld	a, l
	sub	a, #0x12
	jr	C, 00139$
;paint.c:398: cursor = current_cursor;
	ld	a, (#_current_cursor)
	ldhl	sp,	#1
	ld	(hl), a
;paint.c:399: current_cursor = ARROW;
	ld	hl, #_current_cursor
	ld	(hl), #0x00
;paint.c:400: set_cursor();
	call	_set_cursor
;paint.c:401: move_menu_cursor();
	call	_move_menu_cursor
;paint.c:402: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;paint.c:403: waitpadup();
	call	_waitpadup
;paint.c:404: do {
00135$:
;paint.c:405: wait_vbl_done();
	call	_wait_vbl_done
;paint.c:406: key = joypad();
	call	_joypad
	ldhl	sp,	#2
	ld	(hl), a
;paint.c:407: if( key & ( J_UP | J_DOWN | J_LEFT | J_RIGHT ) ) {
	ld	a, (hl)
	and	a, #0x0f
	jp	Z,00115$
;paint.c:408: if( key & J_UP )
	push	hl
	ldhl	sp,	#4
	bit	2, (hl)
	pop	hl
	jr	Z, 00103$
;paint.c:409: menu_cursor_pos = icons[ menu_cursor_pos ].up;
	ld	hl, #_menu_cursor_pos
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_icons
	add	hl,bc
	ld	bc, #0x0005
	add	hl, bc
	ld	a, (hl)
	ld	hl, #_menu_cursor_pos
	ld	(hl), a
00103$:
;paint.c:410: if( key & J_DOWN )
	push	hl
	ldhl	sp,	#4
	bit	3, (hl)
	pop	hl
	jr	Z, 00105$
;paint.c:411: menu_cursor_pos = icons[ menu_cursor_pos ].down;
	ld	hl, #_menu_cursor_pos
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_icons
	add	hl,bc
	ld	bc, #0x0006
	add	hl, bc
	ld	a, (hl)
	ld	hl, #_menu_cursor_pos
	ld	(hl), a
00105$:
;paint.c:412: if( key & J_LEFT )
	push	hl
	ldhl	sp,	#4
	bit	1, (hl)
	pop	hl
	jr	Z, 00107$
;paint.c:413: menu_cursor_pos = icons[ menu_cursor_pos ].left;
	ld	hl, #_menu_cursor_pos
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_icons
	add	hl,bc
	ld	bc, #0x0007
	add	hl, bc
	ld	a, (hl)
	ld	hl, #_menu_cursor_pos
	ld	(hl), a
00107$:
;paint.c:414: if( key & J_RIGHT )
	push	hl
	ldhl	sp,	#4
	bit	0, (hl)
	pop	hl
	jr	Z, 00109$
;paint.c:415: menu_cursor_pos = icons[ menu_cursor_pos ].right;
	ld	hl, #_menu_cursor_pos
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_icons
	add	hl,bc
	ld	bc, #0x0008
	add	hl, bc
	ld	a, (hl)
	ld	(#_menu_cursor_pos),a
00109$:
;paint.c:416: move_menu_cursor();
	call	_move_menu_cursor
;paint.c:417: while( slowdown && key == joypad() ) {
	ldhl	sp,	#0
	ld	c, (hl)
00111$:
	ld	a, c
	or	a, a
	jr	Z, 00113$
	call	_joypad
	ld	b, a
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00113$
;paint.c:418: wait_vbl_done();
	call	_wait_vbl_done
;paint.c:419: slowdown--;
	dec	c
	jr	00111$
00113$:
;paint.c:421: slowdown = 10;
	ldhl	sp,	#0
	ld	(hl), #0x0a
	jr	00116$
00115$:
;paint.c:424: slowdown = 50;
	ldhl	sp,	#0
	ld	(hl), #0x32
00116$:
;paint.c:425: if( key & J_A ) {
	push	hl
	ldhl	sp,	#4
	bit	4, (hl)
	pop	hl
	jp	Z,00136$
;paint.c:426: if( /* menu_cursor_pos >= FIRST_TOOL && */ menu_cursor_pos <= LAST_TOOL ) {
	ld	a, #0x09
	ld	hl, #_menu_cursor_pos
	sub	a, (hl)
	jr	C, 00131$
;paint.c:427: if( menu_cursor_pos != /* FIRST_TOOL + */ current_tool ) {
	ld	a, (hl)
	ld	hl, #_current_tool
	sub	a, (hl)
	jp	Z,00136$
;paint.c:428: change_icon(/* FIRST_TOOL + */ current_tool, UNSELECTED );
	ld	e, #0x00
	ld	a, (#_current_tool)
	call	_change_icon
;paint.c:429: current_tool = menu_cursor_pos /* - FIRST_TOOL */;
	ld	a, (#_menu_cursor_pos)
	ld	hl, #_current_tool
	ld	(hl), a
;paint.c:430: change_icon(/* FIRST_TOOL + */ current_tool, SELECTED );
	ld	e, #0x01
	ld	a, (hl)
	call	_change_icon
;paint.c:431: cursor = icons[/* FIRST_TOOL + */ current_tool ].cursor;
	ld	hl, #_current_tool
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_icons
	add	hl,bc
	ld	bc, #0x0009
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	jp	00136$
00131$:
;paint.c:435: if( menu_cursor_pos != FIRST_COLOR + current_color ) {
	ld	a, (#_menu_cursor_pos)
	ldhl	sp,	#3
	ld	(hl+), a
	ld	(hl), #0x00
;paint.c:434: else if( menu_cursor_pos >= FIRST_COLOR && menu_cursor_pos <= LAST_COLOR ) {
	ld	hl, #_menu_cursor_pos
	ld	a, (hl)
	sub	a, #0x0a
	jr	C, 00127$
	ld	a, #0x0d
	sub	a, (hl)
	jr	C, 00127$
;paint.c:435: if( menu_cursor_pos != FIRST_COLOR + current_color ) {
	ld	a, (#_current_color)
	ldhl	sp,	#5
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#7
	sub	a, (hl)
	jr	NZ, 00298$
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#8
	sub	a, (hl)
	jr	Z, 00136$
00298$:
;paint.c:436: change_icon( FIRST_COLOR + current_color, UNSELECTED );
	ld	a, (#_current_color)
	add	a, #0x0a
	ld	e, #0x00
	call	_change_icon
;paint.c:437: current_color = menu_cursor_pos - FIRST_COLOR;
	ld	a, (#_menu_cursor_pos)
	add	a, #0xf6
	ld	hl, #_current_color
	ld	(hl), a
;paint.c:438: change_icon( FIRST_COLOR + current_color, SELECTED );
	ld	a, (hl)
	add	a, #0x0a
	ld	e, #0x01
	call	_change_icon
	jr	00136$
00127$:
;paint.c:441: else if( menu_cursor_pos >= FIRST_MODE && menu_cursor_pos <= LAST_MODE ) {
	ld	hl, #_menu_cursor_pos
	ld	a, (hl)
	sub	a, #0x0e
	jr	C, 00136$
	ld	a, #0x11
	sub	a, (hl)
	jr	C, 00136$
;paint.c:442: if( menu_cursor_pos != FIRST_MODE + current_mode ) {
	ld	a, (#_current_mode)
	ldhl	sp,	#5
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000e
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#7
	sub	a, (hl)
	jr	NZ, 00299$
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#8
	sub	a, (hl)
	jr	Z, 00136$
00299$:
;paint.c:443: change_icon( FIRST_MODE + current_mode, UNSELECTED );
	ld	a, (#_current_mode)
	add	a, #0x0e
	ld	e, #0x00
	call	_change_icon
;paint.c:444: current_mode = menu_cursor_pos - FIRST_MODE;
	ld	a, (#_menu_cursor_pos)
	add	a, #0xf2
	ld	hl, #_current_mode
	ld	(hl), a
;paint.c:445: change_icon( FIRST_MODE + current_mode, SELECTED );
	ld	a, (hl)
	add	a, #0x0e
	ld	e, #0x01
	call	_change_icon
00136$:
;paint.c:449: } while( key != J_SELECT );
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x40
	jp	NZ,00135$
;paint.c:450: waitpadup();
	call	_waitpadup
;paint.c:451: for( i = 0; i < NB_TOOLS; i++ )
	ld	c, #0x00
00141$:
;paint.c:452: reset_icon( i );
	push	bc
	ld	a, c
	call	_reset_icon
	pop	bc
;paint.c:451: for( i = 0; i < NB_TOOLS; i++ )
	inc	c
	ld	a, c
	sub	a, #0x12
	jr	C, 00141$
;paint.c:453: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;paint.c:454: current_cursor = cursor;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(#_current_cursor),a
;paint.c:455: }
	add	sp, #9
	ret
;paint.c:457: void run()
;	---------------------------------
; Function run
; ---------------------------------
_run::
	add	sp, #-4
;paint.c:463: slowdown = 10;
	ldhl	sp,	#0
;paint.c:464: drawn = erased = 0;
	ld	a, #0x0a
	ld	(hl+), a
	inc	hl
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;paint.c:466: set_cursor();
	call	_set_cursor
;paint.c:467: move_cursor();
	call	_move_cursor
;paint.c:468: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;paint.c:470: while( 1 ) {
00133$:
;paint.c:471: wait_vbl_done();
	call	_wait_vbl_done
;paint.c:472: key = joypad();
	call	_joypad
;paint.c:473: if( key & ( J_UP | J_DOWN | J_LEFT | J_RIGHT ) ) {
	ld	b, a
	and	a, #0x0f
	jr	Z, 00118$
;paint.c:474: if( key & J_UP && cursor_y > 0 )
	bit	2, b
	jr	Z, 00102$
	ld	hl, #_cursor_y
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;paint.c:475: cursor_y--;
	dec	(hl)
00102$:
;paint.c:476: if( key & J_DOWN && cursor_y < 143 )
	bit	3, b
	jr	Z, 00105$
	ld	hl, #_cursor_y
	ld	a, (hl)
	sub	a, #0x8f
	jr	NC, 00105$
;paint.c:477: cursor_y++;
	inc	(hl)
00105$:
;paint.c:478: if( key & J_LEFT && cursor_x > 0 )
	bit	1, b
	jr	Z, 00108$
	ld	hl, #_cursor_x
	ld	a, (hl)
	or	a, a
	jr	Z, 00108$
;paint.c:479: cursor_x--;
	dec	(hl)
00108$:
;paint.c:480: if( key & J_RIGHT && cursor_x < 159 )
	bit	0, b
	jr	Z, 00111$
	ld	hl, #_cursor_x
	ld	a, (hl)
	sub	a, #0x9f
	jr	NC, 00111$
;paint.c:481: cursor_x++;
	inc	(hl)
00111$:
;paint.c:482: move_cursor();
	push	bc
	call	_move_cursor
	pop	bc
;paint.c:483: while( slowdown && key == joypad() ) {
	ldhl	sp,	#0
	ld	c, (hl)
00114$:
	ld	a, c
	or	a, a
	jr	Z, 00116$
	call	_joypad
	ld	e, a
	ld	a, b
	sub	a, e
	jr	NZ, 00116$
;paint.c:484: wait_vbl_done();
	call	_wait_vbl_done
;paint.c:485: slowdown--;
	dec	c
	jr	00114$
00116$:
;paint.c:487: slowdown = 1;
	ldhl	sp,	#0
;paint.c:488: drawn = erased = 0;
	ld	a, #0x01
	ld	(hl+), a
	inc	hl
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	jr	00119$
00118$:
;paint.c:491: slowdown = 10;
	ldhl	sp,	#0
	ld	(hl), #0x0a
00119$:
;paint.c:492: if( key & J_SELECT ) {
	bit	6, b
	jr	Z, 00121$
;paint.c:493: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;paint.c:494: menu();
	push	bc
	call	_menu
	call	_set_cursor
	call	_move_cursor
	pop	bc
;paint.c:497: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
00121$:
;paint.c:499: if( ( key & ( J_A | J_B ) ) == J_A ) {
	ld	c, b
	ld	a, c
	and	a, #0x30
	ld	e, a
	ld	d, #0x00
	ld	a, e
	sub	a, #0x10
	or	a, d
	jr	NZ, 00125$
;paint.c:500: if( !drawn ) {
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	NZ, 00126$
;paint.c:501: drawn++;
	inc	(hl)
;paint.c:502: plot( cursor_x, cursor_y, colors[ current_color ], modes[ current_mode ] );
	ld	bc, #_modes+0
	ld	a, c
	ld	hl, #_current_mode
	add	a, (hl)
	ld	c, a
	jr	NC, 00238$
	inc	b
00238$:
	ld	a, (bc)
	ldhl	sp,	#1
	ld	(hl), a
	ld	bc, #_colors+0
	ld	a, c
	ld	hl, #_current_color
	add	a, (hl)
	ld	c, a
	jr	NC, 00239$
	inc	b
00239$:
	ld	a, (bc)
	push	de
	ldhl	sp,	#3
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	a, (#_cursor_y)
	ld	h, a
	ld	a, (#_cursor_x)
	ld	l, a
	push	hl
	call	_plot
	add	sp, #4
	pop	de
	jr	00126$
00125$:
;paint.c:506: drawn = 0;
	ldhl	sp,	#3
	ld	(hl), #0x00
00126$:
;paint.c:507: if( ( key & ( J_A | J_B ) ) == J_B ) {
	ld	a, e
	sub	a, #0x20
	or	a, d
	jr	NZ, 00130$
;paint.c:508: if( !erased ) {
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jp	NZ, 00133$
;paint.c:509: erased++;
	inc	(hl)
;paint.c:510: plot( cursor_x, cursor_y, WHITE, SOLID );
	xor	a, a
	rrca
	push	af
	ld	a, (#_cursor_y)
	ld	h, a
	ld	a, (#_cursor_x)
	ld	l, a
	push	hl
	call	_plot
	add	sp, #4
	jp	00133$
00130$:
;paint.c:514: erased = 0;
	ldhl	sp,	#2
	ld	(hl), #0x00
	jp	00133$
;paint.c:516: }
	add	sp, #4
	ret
;paint.c:518: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;paint.c:521: OBP1_REG = 0xE0U;
	ld	a, #0xe0
	ldh	(_OBP1_REG + 0), a
;paint.c:523: splash();
	call	_splash
;paint.c:525: current_tool = 0;
	ld	hl, #_current_tool
	ld	(hl), #0x00
;paint.c:526: current_color = BLACK;
	ld	hl, #_current_color
	ld	(hl), #0x03
;paint.c:527: current_mode = SOLID;
	ld	hl, #_current_mode
	ld	(hl), #0x00
;paint.c:528: current_cursor = PEN;
	ld	hl, #_current_cursor
	ld	(hl), #0x01
;paint.c:529: menu_cursor_pos = 0;
	ld	hl, #_menu_cursor_pos
	ld	(hl), #0x00
;paint.c:530: cursor_x = 160 / 2;
	ld	hl, #_cursor_x
	ld	(hl), #0x50
;paint.c:531: cursor_y = 144 / 2;
	ld	hl, #_cursor_y
	ld	(hl), #0x48
;paint.c:533: run();
;paint.c:534: }
	jp	_run
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

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
	.globl _setupbug
	.globl _setupship
	.globl _movegamecharacter
	.globl _checkcollisions
	.globl _performantdelay
	.globl _printf
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _spritesize
	.globl _bug
	.globl _ship
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_ship::
	.ds 8
_bug::
	.ds 8
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_spritesize::
	.ds 1
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
;main.c:10: void performantdelay(UINT8 numloops){
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
	ld	c, a
;main.c:12: for(i = 0; i < numloops; i++){
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;main.c:13: wait_vbl_done();
	call	_wait_vbl_done
;main.c:12: for(i = 0; i < numloops; i++){
	inc	b
;main.c:15: }
	jr	00103$
;main.c:17: UBYTE checkcollisions(GameCharacter* one, GameCharacter* two){
;	---------------------------------
; Function checkcollisions
; ---------------------------------
_checkcollisions::
	add	sp, #-16
	ldhl	sp,	#14
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#12
	ld	a, c
	ld	(hl+), a
;main.c:18: return (one->x >= two->x && one->x <= two->x + two->width) && (one->y >= two->y && one->y <= two->y + two->height) || (two->x >= one->x && two->x <= one->x + one->width) && (two->y >= one->y && two->y <= one->y + one->height);
	ld	a, b
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#0
	ld	a, (hl+)
	sub	a, (hl)
	jr	C, 00108$
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	d, #0x00
	ld	e, a
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00152$
	bit	7, d
	jr	NZ, 00153$
	cp	a, a
	jr	00153$
00152$:
	bit	7, d
	jr	Z, 00153$
	scf
00153$:
	jr	C, 00108$
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#11
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a, (hl)
	sub	a, c
	jr	C, 00108$
	inc	hl
	ld	b, #0x00
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#11
	ld	a, (hl-)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00154$
	bit	7, d
	jr	NZ, 00155$
	cp	a, a
	jr	00155$
00154$:
	bit	7, d
	jr	Z, 00155$
	scf
00155$:
	jp	NC, 00104$
00108$:
	ldhl	sp,	#1
	ld	a, (hl-)
	sub	a, (hl)
	jp	C, 00103$
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	d, #0x00
	ld	e, a
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00156$
	bit	7, d
	jr	NZ, 00157$
	cp	a, a
	jr	00157$
00156$:
	bit	7, d
	jr	Z, 00157$
	scf
00157$:
	jr	C, 00103$
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#11
	ld	a, (hl)
	sub	a, c
	jr	C, 00103$
	ldhl	sp,	#5
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#7
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl+), a
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#9
	ld	e, l
	ld	d, h
	ldhl	sp,	#7
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00158$
	bit	7, d
	jr	NZ, 00159$
	cp	a, a
	jr	00159$
00158$:
	bit	7, d
	jr	Z, 00159$
	scf
00159$:
	jr	NC, 00104$
00103$:
	ldhl	sp,	#11
	ld	(hl), #0x00
	jr	00105$
00104$:
	ldhl	sp,	#11
	ld	(hl), #0x01
00105$:
	ldhl	sp,	#11
	ld	a, (hl)
;main.c:19: }
	add	sp, #16
	ret
;main.c:21: void movegamecharacter(GameCharacter* character, UINT8 x, UINT8 y){
;	---------------------------------
; Function movegamecharacter
; ---------------------------------
_movegamecharacter::
	add	sp, #-3
	ldhl	sp,	#2
	ld	(hl), a
;main.c:22: move_sprite(character->spritids[0], x, y);
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (de)
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	inc	hl
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:23: move_sprite(character->spritids[1], x + spritesize, y);
	ld	a, (hl)
	ld	hl, #_spritesize
	add	a, (hl)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	c, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
;main.c:24: move_sprite(character->spritids[2], x, y + spritesize);
	ld	a, (hl-)
	ld	(bc), a
	ld	a, (hl)
	ld	hl, #_spritesize
	add	a, (hl)
	ld	c, a
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
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
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
;main.c:25: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
	ld	a, (hl-)
	dec	hl
	ld	(bc), a
	ld	a, (hl)
	ld	hl, #_spritesize
	add	a, (hl)
	ld	b, a
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_spritesize
	add	a, (hl)
	ld	c, a
	inc	de
	inc	de
	inc	de
	ld	a, (de)
;C:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;main.c:25: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
;main.c:26: }
	add	sp, #3
	pop	hl
	inc	sp
	jp	(hl)
;main.c:28: void setupship(){
;	---------------------------------
; Function setupship
; ---------------------------------
_setupship::
;main.c:29: ship.x = 80;
	ld	hl, #(_ship + 4)
	ld	(hl), #0x50
;main.c:30: ship.y = 130;
	ld	bc, #_ship + 5
	ld	a, #0x82
	ld	(bc), a
;main.c:31: ship.width = 16;
	ld	hl, #(_ship + 6)
	ld	(hl), #0x10
;main.c:32: ship.height = 16;
	ld	hl, #(_ship + 7)
	ld	(hl), #0x10
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;main.c:36: ship.spritids[0] = 0;
	ld	hl, #_ship
	ld	(hl), #0x00
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x01
;main.c:38: ship.spritids[1] = 1;
	ld	hl, #(_ship + 1)
	ld	(hl), #0x01
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x02
;main.c:40: ship.spritids[2] = 2;
	ld	hl, #(_ship + 2)
	ld	(hl), #0x02
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x03
;main.c:42: ship.spritids[3] = 3;
	ld	hl, #(_ship + 3)
	ld	(hl), #0x03
;main.c:44: movegamecharacter(&ship, ship.x, ship.y);
	ld	a, (bc)
	ld	hl, #(_ship + 4)
	ld	c, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_ship
	call	_movegamecharacter
;main.c:45: }
	ret
;main.c:47: void setupbug(){
;	---------------------------------
; Function setupbug
; ---------------------------------
_setupbug::
;main.c:48: bug.x = 30;
	ld	hl, #(_bug + 4)
	ld	(hl), #0x1e
;main.c:49: bug.y = 0;
	ld	bc, #_bug + 5
	xor	a, a
	ld	(bc), a
;main.c:50: bug.width = 16;
	ld	hl, #(_bug + 6)
	ld	(hl), #0x10
;main.c:51: bug.height = 16;    
	ld	hl, #(_bug + 7)
	ld	(hl), #0x10
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x04
;main.c:55: bug.spritids[0] = 4;
	ld	hl, #_bug
	ld	(hl), #0x04
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x05
;main.c:57: bug.spritids[1] = 5;
	ld	hl, #(_bug + 1)
	ld	(hl), #0x05
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x06
;main.c:59: bug.spritids[2] = 6;
	ld	hl, #(_bug + 2)
	ld	(hl), #0x06
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x07
;main.c:61: bug.spritids[3] = 7;
	ld	hl, #(_bug + 3)
	ld	(hl), #0x07
;main.c:63: movegamecharacter(&bug, bug.x, bug.y);
	ld	a, (bc)
	ld	hl, #(_bug + 4)
	ld	c, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_bug
	call	_movegamecharacter
;main.c:64: }
	ret
;main.c:66: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:67: set_sprite_data(0, 8, GameSprites);
	ld	de, #_GameSprites
	push	de
	ld	hl, #0x800
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:68: setupship();
	call	_setupship
;main.c:69: setupbug();
	call	_setupbug
;main.c:71: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:72: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:74: while(!checkcollisions(&ship, &bug)){
00107$:
	ld	bc, #_bug
	ld	de, #_ship
	call	_checkcollisions
	or	a, a
	jr	NZ, 00109$
;main.c:75: if(joypad() & J_LEFT){
	call	_joypad
	ld	e, a
;main.c:76: ship.x -= 2;
	ld	bc, #_ship + 4
;main.c:77: movegamecharacter(&ship, ship.x, ship.y);
;main.c:75: if(joypad() & J_LEFT){
	bit	1, e
	jr	Z, 00102$
;main.c:76: ship.x -= 2;
	ld	a, (bc)
	dec	a
	dec	a
	ld	(bc), a
;main.c:77: movegamecharacter(&ship, ship.x, ship.y);
	ld	hl, #(_ship + 5)
	ld	h, (hl)
;	spillPairReg hl
	ld	a, (bc)
	ld	e, a
	push	bc
	push	hl
	inc	sp
	ld	a, e
	ld	de, #_ship
	call	_movegamecharacter
	pop	bc
00102$:
;main.c:79: if(joypad() & J_RIGHT){
	call	_joypad
	rrca
	jr	NC, 00104$
;main.c:80: ship.x += 2;
	ld	a, (bc)
	add	a, #0x02
	ld	(bc), a
;main.c:81: movegamecharacter(&ship, ship.x, ship.y);
	ld	hl, #(_ship + 5)
	ld	h, (hl)
;	spillPairReg hl
	ld	a, (bc)
	ld	e, a
	push	bc
	push	hl
	inc	sp
	ld	a, e
	ld	de, #_ship
	call	_movegamecharacter
	pop	bc
00104$:
;main.c:84: bug.y += 5;
	ld	a, (#(_bug + 5) + 0)
	add	a, #0x05
	ld	(#(_bug + 5)),a
;main.c:86: if(bug.y >= 144){
;	spillPairReg hl
;main.c:88: bug.x = ship.x;
;main.c:86: if(bug.y >= 144){
	ld	a, (#(_bug + 5) + 0)
	sub	a, #0x90
	jr	C, 00106$
;main.c:87: bug.y=0;
	ld	hl, #(_bug + 5)
	ld	(hl), #0x00
;main.c:88: bug.x = ship.x;
	ld	a, (bc)
	ld	(#(_bug + 4)),a
00106$:
;main.c:91: movegamecharacter(&bug,bug.x,bug.y);
	ld	a, (#(_bug + 5) + 0)
	ld	hl, #(_bug + 4)
	ld	c, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_bug
	call	_movegamecharacter
;main.c:93: performantdelay(5);      
	ld	a, #0x05
	call	_performantdelay
	jr	00107$
00109$:
;main.c:96: printf("\n \n \n \n \n \n \n === GAME  OVER ===");
	ld	de, #___str_0
	push	de
	call	_printf
	pop	hl
;main.c:97: }
	ret
___str_0:
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " === GAME  OVER ==="
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit__spritesize:
	.db #0x08	; 8
	.area _CABS (ABS)

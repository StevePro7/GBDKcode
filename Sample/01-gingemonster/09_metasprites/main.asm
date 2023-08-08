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
	.globl _performantdelay
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
;main.c:17: void movegamecharacter(struct GameCharacter* character, UINT8 x, UINT8 y){
;	---------------------------------
; Function movegamecharacter
; ---------------------------------
_movegamecharacter::
	add	sp, #-3
	ldhl	sp,	#2
	ld	(hl), a
;main.c:18: move_sprite(character->spritids[0], x, y);
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
;main.c:19: move_sprite(character->spritids[1], x + spritesize, y);
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
;main.c:20: move_sprite(character->spritids[2], x, y + spritesize);
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
;main.c:21: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
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
;main.c:21: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
;main.c:22: }
	add	sp, #3
	pop	hl
	inc	sp
	jp	(hl)
;main.c:24: void setupship(){
;	---------------------------------
; Function setupship
; ---------------------------------
_setupship::
;main.c:25: ship.x = 80;
	ld	hl, #(_ship + 4)
	ld	(hl), #0x50
;main.c:26: ship.y = 130;
	ld	bc, #_ship + 5
	ld	a, #0x82
	ld	(bc), a
;main.c:27: ship.width = 16;
	ld	hl, #(_ship + 6)
	ld	(hl), #0x10
;main.c:28: ship.height = 16;
	ld	hl, #(_ship + 7)
	ld	(hl), #0x10
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;main.c:32: ship.spritids[0] = 0;
	ld	hl, #_ship
	ld	(hl), #0x00
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x01
;main.c:34: ship.spritids[1] = 1;
	ld	hl, #(_ship + 1)
	ld	(hl), #0x01
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x02
;main.c:36: ship.spritids[2] = 2;
	ld	hl, #(_ship + 2)
	ld	(hl), #0x02
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x03
;main.c:38: ship.spritids[3] = 3;
	ld	hl, #(_ship + 3)
	ld	(hl), #0x03
;main.c:40: movegamecharacter(&ship, ship.x, ship.y);
	ld	a, (bc)
	ld	hl, #(_ship + 4)
	ld	c, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_ship
	call	_movegamecharacter
;main.c:41: }
	ret
;main.c:43: void setupbug(){
;	---------------------------------
; Function setupbug
; ---------------------------------
_setupbug::
;main.c:44: bug.x = 30;
	ld	hl, #(_bug + 4)
	ld	(hl), #0x1e
;main.c:45: bug.y = 0;
	ld	bc, #_bug + 5
	xor	a, a
	ld	(bc), a
;main.c:46: bug.width = 16;
	ld	hl, #(_bug + 6)
	ld	(hl), #0x10
;main.c:47: bug.height = 16;    
	ld	hl, #(_bug + 7)
	ld	(hl), #0x10
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x04
;main.c:51: bug.spritids[0] = 4;
	ld	hl, #_bug
	ld	(hl), #0x04
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x05
;main.c:53: bug.spritids[1] = 5;
	ld	hl, #(_bug + 1)
	ld	(hl), #0x05
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x06
;main.c:55: bug.spritids[2] = 6;
	ld	hl, #(_bug + 2)
	ld	(hl), #0x06
;C:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x07
;main.c:57: bug.spritids[3] = 7;
	ld	hl, #(_bug + 3)
	ld	(hl), #0x07
;main.c:59: movegamecharacter(&bug, bug.x, bug.y);
	ld	a, (bc)
	ld	hl, #(_bug + 4)
	ld	c, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_bug
	call	_movegamecharacter
;main.c:60: }
	ret
;main.c:62: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:63: set_sprite_data(0, 8, GameSprites);
	ld	de, #_GameSprites
	push	de
	ld	hl, #0x800
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:64: setupship();
	call	_setupship
;main.c:65: setupbug();
	call	_setupbug
;main.c:67: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:68: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:70: while(1){
00108$:
;main.c:71: if(joypad() & J_LEFT){
	call	_joypad
	bit	1, a
	jr	Z, 00102$
;main.c:72: ship.x -= 2;
	ld	hl, #_ship + 4
	ld	a, (hl)
	dec	a
	dec	a
	ld	(hl), a
;main.c:73: movegamecharacter(&ship, ship.x, ship.y);
	ld	bc, #_ship + 5
	ld	a, (bc)
	ld	c, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_ship
	call	_movegamecharacter
00102$:
;main.c:75: if(joypad() & J_RIGHT){
	call	_joypad
	rrca
	jr	NC, 00104$
;main.c:76: ship.x += 2;
	ld	hl, #_ship + 4
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
;main.c:77: movegamecharacter(&ship, ship.x, ship.y);
	ld	bc, #_ship + 5
	ld	a, (bc)
	ld	c, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_ship
	call	_movegamecharacter
00104$:
;main.c:80: bug.y += 5;
	ld	bc, #_bug + 5
	ld	a, (bc)
	add	a, #0x05
	ld	(bc), a
;main.c:82: if(bug.y >= 144){
	ld	a, (bc)
;main.c:84: bug.x = ship.x;
;main.c:82: if(bug.y >= 144){
	sub	a, #0x90
	jr	C, 00106$
;main.c:83: bug.y=0;
	xor	a, a
	ld	(bc), a
;main.c:84: bug.x = ship.x;
	ld	a, (#(_ship + 4) + 0)
	ld	(#(_bug + 4)),a
00106$:
;main.c:87: movegamecharacter(&bug,bug.x,bug.y);
	ld	a, (bc)
	ld	hl, #(_bug + 4)
	ld	c, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_bug
	call	_movegamecharacter
;main.c:89: performantdelay(5);      
	ld	a, #0x05
	call	_performantdelay
;main.c:91: }
	jr	00108$
	.area _CODE
	.area _INITIALIZER
__xinit__spritesize:
	.db #0x08	; 8
	.area _CABS (ABS)

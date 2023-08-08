#ifndef _GAME_CHARACTER_H_
#define _GAME_CHARACTER_H_

#include <gb/gb.h>
#include <asm/sm83/types.h>

//generic character structure: id, position, graphics
typedef struct GameCharacter {
	UBYTE spritids[ 4 ]; // all characters use 4 sprites
	UINT8 x;
	UINT8 y;
	UINT8 width;
	UINT8 height;
} GameCharacter;

#endif//_GAME_CHARACTER_H_
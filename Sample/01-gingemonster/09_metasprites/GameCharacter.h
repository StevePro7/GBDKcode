#ifndef _GAME_CHARACTER_H_
#define _GAME_CHARACTER_H_

#include <gb/gb.h>
#include <asm/sm83/types.h>

//generic character structure: id, position, graphics
struct GameCharacter {
	UBYTE spritids[4]; // all characters use 4 sprites
	UINT8 x;
	UINT8 y;
	UINT8 width;
	UINT8 height;
};

#endif//_GAME_CHARACTER_H_
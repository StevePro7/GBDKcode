//AUTOGENERATED FILE FROM png2asset
#ifndef METASPRITE_Player_H
#define METASPRITE_Player_H

#include <stdint.h>
#include <gbdk/platform.h>
#include <gbdk/metasprites.h>

#define Player_TILE_ORIGIN 0
#define Player_TILE_W 8
#define Player_TILE_H 8
#define Player_WIDTH 16
#define Player_HEIGHT 8
#define Player_TILE_COUNT 2
#define Player_PALETTE_COUNT 1
#define Player_COLORS_PER_PALETTE 4
#define Player_TOTAL_COLORS 4
#define Player_PIVOT_X 8
#define Player_PIVOT_Y 4
#define Player_PIVOT_W 16
#define Player_PIVOT_H 8

BANKREF_EXTERN(Player)

extern const palette_color_t Player_palettes[4];
extern const uint8_t Player_tiles[32];

extern const metasprite_t* const Player_metasprites[1];

#endif

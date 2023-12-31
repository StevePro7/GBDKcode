//AUTOGENERATED FILE FROM png2asset
#ifndef METASPRITE_Alien_H
#define METASPRITE_Alien_H

#include <stdint.h>
#include <gbdk/platform.h>
#include <gbdk/metasprites.h>

#define Alien_TILE_ORIGIN 0
#define Alien_TILE_W 8
#define Alien_TILE_H 8
#define Alien_WIDTH 16
#define Alien_HEIGHT 8
#define Alien_TILE_COUNT 2
#define Alien_PALETTE_COUNT 1
#define Alien_COLORS_PER_PALETTE 4
#define Alien_TOTAL_COLORS 4
#define Alien_PIVOT_X 8
#define Alien_PIVOT_Y 4
#define Alien_PIVOT_W 16
#define Alien_PIVOT_H 8

BANKREF_EXTERN(Alien)

extern const palette_color_t Alien_palettes[4];
extern const uint8_t Alien_tiles[32];

extern const metasprite_t* const Alien_metasprites[1];

#endif

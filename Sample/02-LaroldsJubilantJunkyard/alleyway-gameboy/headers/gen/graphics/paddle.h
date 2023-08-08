//AUTOGENERATED FILE FROM png2asset
#ifndef METASPRITE_paddle_H
#define METASPRITE_paddle_H

#include <stdint.h>
#include <gbdk/platform.h>
#include <gbdk/metasprites.h>

#define paddle_TILE_ORIGIN 0
#define paddle_TILE_W 8
#define paddle_TILE_H 8
#define paddle_WIDTH 32
#define paddle_HEIGHT 8
#define paddle_TILE_COUNT 3
#define paddle_PALETTE_COUNT 1
#define paddle_COLORS_PER_PALETTE 4
#define paddle_TOTAL_COLORS 4
#define paddle_PIVOT_X 16
#define paddle_PIVOT_Y 4
#define paddle_PIVOT_W 32
#define paddle_PIVOT_H 8

BANKREF_EXTERN(paddle)

extern const palette_color_t paddle_palettes[4];
extern const uint8_t paddle_tiles[48];

extern const metasprite_t* const paddle_metasprites[1];

#endif

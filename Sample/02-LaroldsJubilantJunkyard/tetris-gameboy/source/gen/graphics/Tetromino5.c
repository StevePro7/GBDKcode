//AUTOGENERATED FILE FROM png2asset

#include <stdint.h>
#include <gbdk/platform.h>
#include <gbdk/metasprites.h>

BANKREF(Tetromino5)

const palette_color_t Tetromino5_palettes[32] = {
	RGB8(255,  0,168), RGB8(255,  0,168), RGB8(255,  0,168), RGB8(255,  0,168)
	,
	RGB8(255,  0,168), RGB8(255,  0,168), RGB8(255,  0,168), RGB8(255,  0,168)
	,
	RGB8(255,  0,168), RGB8(255,  0,168), RGB8(255,  0,168), RGB8(255,  0,168)
	,
	RGB8(255,  0,168), RGB8(255,  0,168), RGB8(255,  0,168), RGB8(255,  0,168)
	,
	RGB8( 41,126,174), RGB8(248,248,248), RGB8(  0,  0,  0), RGB8(113,198,233)
	,
	RGB8(255,  0,168), RGB8(255,  0,168), RGB8(255,  0,168), RGB8(255,  0,168)
	,
	RGB8(255,  0,168), RGB8(255,  0,168), RGB8(255,  0,168), RGB8(255,  0,168)
	,
	RGB8(255,  0,168), RGB8(255,  0,168), RGB8(255,  0,168), RGB8(255,  0,168)
	
};

const uint8_t Tetromino5_tiles[64] = {
	0x00,0xff,0x7e,0x9f,
	0x42,0xff,0x5a,0xe7,
	0x5a,0xe7,0x42,0xff,
	0x7e,0xff,0x00,0xff,
	
0x00,0xff,0x7e,0xfd,
	0x42,0xfd,0x5a,0xe7,
	0x5a,0xe7,0x42,0xff,
	0x7e,0xff,0x00,0xff,
	
0x00,0xff,0x7e,0xff,
	0x42,0xff,0x5a,0xe7,
	0x5a,0xe7,0x42,0xff,
	0x7e,0xf9,0x00,0xff,
	
0x00,0xff,0x7e,0xff,
	0x42,0xff,0x5a,0xe7,
	0x5a,0xe7,0x42,0xbf,
	0x7e,0xbf,0x00,0xff
	
};

const metasprite_t Tetromino5_metasprite0[] = {
	METASPR_ITEM(16, 8, 0, 4), METASPR_ITEM(0, 8, 0, 4), METASPR_ITEM(0, 8, 0, 4), METASPR_ITEM(8, 0, 0, 4), METASPR_TERM
};

const metasprite_t Tetromino5_metasprite1[] = {
	METASPR_ITEM(8, 16, 1, 4), METASPR_ITEM(8, 0, 1, 4), METASPR_ITEM(8, -8, 1, 4), METASPR_ITEM(0, 8, 1, 4), METASPR_TERM
};

const metasprite_t Tetromino5_metasprite2[] = {
	METASPR_ITEM(8, 8, 2, 4), METASPR_ITEM(8, 0, 2, 4), METASPR_ITEM(0, 8, 2, 4), METASPR_ITEM(0, 8, 2, 4), METASPR_TERM
};

const metasprite_t Tetromino5_metasprite3[] = {
	METASPR_ITEM(8, 16, 3, 4), METASPR_ITEM(0, 8, 3, 4), METASPR_ITEM(8, -8, 3, 4), METASPR_ITEM(8, 0, 3, 4), METASPR_TERM
};

const metasprite_t* const Tetromino5_metasprites[4] = {
	Tetromino5_metasprite0, Tetromino5_metasprite1, Tetromino5_metasprite2, Tetromino5_metasprite3
};

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module GameSprites
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _GameSprites
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_GameSprites::
	.ds 128
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
	.area _CODE
	.area _INITIALIZER
__xinit__GameSprites:
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x82	; 130
	.db #0x03	; 3
	.db #0xe4	; 228
	.db #0x67	; 103	'g'
	.db #0x99	; 153
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x41	; 65	'A'
	.db #0xc0	; 192
	.db #0x27	; 39
	.db #0xe6	; 230
	.db #0x99	; 153
	.db #0x7f	; 127
	.db #0x81	; 129
	.db #0x3f	; 63
	.db #0x41	; 65	'A'
	.db #0x0f	; 15
	.db #0x30	; 48	'0'
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0xfc	; 252
	.db #0x82	; 130
	.db #0xf0	; 240
	.db #0x0c	; 12
	.db #0x80	; 128
	.db #0x70	; 112	'p'
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x07	; 7
	.db #0x47	; 71	'G'
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xe0	; 224
	.db #0xe2	; 226
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0x0d	; 13
	.db #0x1d	; 29
	.db #0x3d	; 61
	.db #0x0d	; 13
	.db #0x47	; 71	'G'
	.db #0x0f	; 15
	.db #0x43	; 67	'C'
	.db #0x07	; 7
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xb0	; 176
	.db #0xb8	; 184
	.db #0xbc	; 188
	.db #0xb0	; 176
	.db #0xe2	; 226
	.db #0xf0	; 240
	.db #0xc2	; 194
	.db #0xe0	; 224
	.db #0x01	; 1
	.db #0xc0	; 192
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.area _CABS (ABS)
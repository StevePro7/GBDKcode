;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module bank_1
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_bank_1
	.globl _bank_1
	.globl _puts
	.globl _var_1
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA_0
_var_1::
	.ds 2
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
;bank_1.c:7: void bank_1() BANKED /* In ROM bank 1 */
;	---------------------------------
; Function bank_1
; ---------------------------------
	b_bank_1	= 0
_bank_1::
;bank_1.c:9: puts("I'm in ROM bank 1");
	ld	de, #___str_0
;bank_1.c:10: }
	jp	_puts
___str_0:
	.ascii "I'm in ROM bank 1"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

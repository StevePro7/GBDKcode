;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module sgb_sfx_names
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sgb_sfx_names_table_b
	.globl _sgb_sfx_names_table_a
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
_sgb_sfx_names_table_a::
	.ds 98
_sgb_sfx_names_table_b::
	.ds 52
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
___str_0:
	.ascii "Dummy flag, re-trigger  "
	.db 0x00
___str_1:
	.ascii "Nintendo                "
	.db 0x00
___str_2:
	.ascii "Game Over               "
	.db 0x00
___str_3:
	.ascii "Drop                    "
	.db 0x00
___str_4:
	.ascii "OK A                    "
	.db 0x00
___str_5:
	.ascii "OK B                    "
	.db 0x00
___str_6:
	.ascii "Select A                "
	.db 0x00
___str_7:
	.ascii "Select B                "
	.db 0x00
___str_8:
	.ascii "Select C                "
	.db 0x00
___str_9:
	.ascii "Mistake Buzzer          "
	.db 0x00
___str_10:
	.ascii "Catch Item              "
	.db 0x00
___str_11:
	.ascii "Gate squeaks 1 time     "
	.db 0x00
___str_12:
	.ascii "Explosion small         "
	.db 0x00
___str_13:
	.ascii "Explosion medium        "
	.db 0x00
___str_14:
	.ascii "Explosion large         "
	.db 0x00
___str_15:
	.ascii "Attacked A              "
	.db 0x00
___str_16:
	.ascii "Attacked B              "
	.db 0x00
___str_17:
	.ascii "Hit (punch) A           "
	.db 0x00
___str_18:
	.ascii "Hit (punch) B           "
	.db 0x00
___str_19:
	.ascii "Breath in air           "
	.db 0x00
___str_20:
	.ascii "Rocket Projectile A     "
	.db 0x00
___str_21:
	.ascii "Rocket Projectile B     "
	.db 0x00
___str_22:
	.ascii "Escaping Bubble         "
	.db 0x00
___str_23:
	.ascii "Jump                    "
	.db 0x00
___str_24:
	.ascii "Fast Jump               "
	.db 0x00
___str_25:
	.ascii "Jet (rocket) takeoff    "
	.db 0x00
___str_26:
	.ascii "Jet (rocket) landing    "
	.db 0x00
___str_27:
	.ascii "Cup breaking            "
	.db 0x00
___str_28:
	.ascii "Glass breaking          "
	.db 0x00
___str_29:
	.ascii "Level UP                "
	.db 0x00
___str_30:
	.ascii "Insert air              "
	.db 0x00
___str_31:
	.ascii "Sword swing             "
	.db 0x00
___str_32:
	.ascii "Water falling           "
	.db 0x00
___str_33:
	.ascii "Fire                    "
	.db 0x00
___str_34:
	.ascii "Wall collapsing         "
	.db 0x00
___str_35:
	.ascii "Cancel                  "
	.db 0x00
___str_36:
	.ascii "Walking                 "
	.db 0x00
___str_37:
	.ascii "Blocking strike         "
	.db 0x00
___str_38:
	.ascii "Picture floats on & off "
	.db 0x00
___str_39:
	.ascii "Fade in                 "
	.db 0x00
___str_40:
	.ascii "Fade out                "
	.db 0x00
___str_41:
	.ascii "Window being opened     "
	.db 0x00
___str_42:
	.ascii "Window being closed     "
	.db 0x00
___str_43:
	.ascii "Big Laser               "
	.db 0x00
___str_44:
	.ascii "Stone gate closes/opens "
	.db 0x00
___str_45:
	.ascii "Teleportation           "
	.db 0x00
___str_46:
	.ascii "Lightning               "
	.db 0x00
___str_47:
	.ascii "Earthquake              "
	.db 0x00
___str_48:
	.ascii "Small Laser             "
	.db 0x00
___str_49:
	.ascii "Applause small group    "
	.db 0x00
___str_50:
	.ascii "Applause medium group   "
	.db 0x00
___str_51:
	.ascii "Applause large group    "
	.db 0x00
___str_52:
	.ascii "Wind                    "
	.db 0x00
___str_53:
	.ascii "Rain                    "
	.db 0x00
___str_54:
	.ascii "Storm                   "
	.db 0x00
___str_55:
	.ascii "Storm with wind/thunder "
	.db 0x00
___str_56:
	.ascii "Avalanche               "
	.db 0x00
___str_57:
	.ascii "Wave                    "
	.db 0x00
___str_58:
	.ascii "River                   "
	.db 0x00
___str_59:
	.ascii "Waterfall               "
	.db 0x00
___str_60:
	.ascii "Small character running "
	.db 0x00
___str_61:
	.ascii "Horse running           "
	.db 0x00
___str_62:
	.ascii "Warning sound           "
	.db 0x00
___str_63:
	.ascii "Approaching car         "
	.db 0x00
___str_64:
	.ascii "Jet flying              "
	.db 0x00
___str_65:
	.ascii "UFO flying              "
	.db 0x00
___str_66:
	.ascii "Electromagnetic waves   "
	.db 0x00
___str_67:
	.ascii "Score UP                "
	.db 0x00
___str_68:
	.ascii "Camera shutter, formanto"
	.db 0x00
___str_69:
	.ascii "Write, formanto         "
	.db 0x00
___str_70:
	.ascii "Show up title, formanto "
	.db 0x00
	.area _INITIALIZER
__xinit__sgb_sfx_names_table_a:
	.dw ___str_0
	.dw ___str_1
	.dw ___str_2
	.dw ___str_3
	.dw ___str_4
	.dw ___str_5
	.dw ___str_6
	.dw ___str_7
	.dw ___str_8
	.dw ___str_9
	.dw ___str_10
	.dw ___str_11
	.dw ___str_12
	.dw ___str_13
	.dw ___str_14
	.dw ___str_15
	.dw ___str_16
	.dw ___str_17
	.dw ___str_18
	.dw ___str_19
	.dw ___str_20
	.dw ___str_21
	.dw ___str_22
	.dw ___str_23
	.dw ___str_24
	.dw ___str_25
	.dw ___str_26
	.dw ___str_27
	.dw ___str_28
	.dw ___str_29
	.dw ___str_30
	.dw ___str_31
	.dw ___str_32
	.dw ___str_33
	.dw ___str_34
	.dw ___str_35
	.dw ___str_36
	.dw ___str_37
	.dw ___str_38
	.dw ___str_39
	.dw ___str_40
	.dw ___str_41
	.dw ___str_42
	.dw ___str_43
	.dw ___str_44
	.dw ___str_45
	.dw ___str_46
	.dw ___str_47
	.dw ___str_48
__xinit__sgb_sfx_names_table_b:
	.dw ___str_0
	.dw ___str_49
	.dw ___str_50
	.dw ___str_51
	.dw ___str_52
	.dw ___str_53
	.dw ___str_54
	.dw ___str_55
	.dw ___str_46
	.dw ___str_47
	.dw ___str_56
	.dw ___str_57
	.dw ___str_58
	.dw ___str_59
	.dw ___str_60
	.dw ___str_61
	.dw ___str_62
	.dw ___str_63
	.dw ___str_64
	.dw ___str_65
	.dw ___str_66
	.dw ___str_67
	.dw ___str_33
	.dw ___str_68
	.dw ___str_69
	.dw ___str_70
	.area _CABS (ABS)

#include "hUGEDriver.h"
#include <stddef.h>

static const unsigned char order_cnt = 28;

static const unsigned char P0[] = {
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
};
static const unsigned char P1[] = {
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC00),
    DN(___,0,0x000),
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC00),
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC00),
    DN(___,0,0x000),
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC00),
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC00),
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC00),
    DN(As4,2,0xC07),
    DN(As4,2,0xC00),
    DN(As4,2,0xC07),
    DN(As4,2,0xC00),
    DN(As4,2,0xC07),
    DN(As4,2,0xC07),
    DN(A_4,2,0xC07),
    DN(G_4,2,0xC07),
    DN(F_4,2,0xC07),
    DN(F_4,2,0xC00),
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC00),
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC07),
    DN(F_4,2,0xC07),
    DN(F_4,2,0xC00),
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC00),
    DN(___,0,0x000),
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC00),
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC00),
    DN(___,0,0x000),
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC00),
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC00),
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC00),
    DN(As4,2,0xC07),
    DN(As4,2,0xC00),
    DN(As4,2,0xC07),
    DN(As4,2,0xC00),
    DN(As4,2,0xC07),
    DN(As4,2,0xC07),
    DN(A_4,2,0xC07),
    DN(G_4,2,0xC07),
    DN(F_4,2,0xC07),
    DN(F_4,2,0xC00),
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC00),
    DN(C_5,2,0xC07),
    DN(C_5,2,0xC07),
    DN(F_4,2,0xC07),
    DN(F_4,2,0xC00),
};
static const unsigned char P2[] = {
    DN(C_5,14,0xC07),
    DN(C_5,14,0xC03),
    DN(C_6,14,0xC07),
    DN(C_6,14,0xC03),
    DN(C_6,14,0xC01),
    DN(___,0,0x000),
    DN(C_5,14,0xC07),
    DN(C_5,14,0xC03),
    DN(C_6,14,0xC07),
    DN(C_6,14,0xC03),
    DN(C_6,14,0xC01),
    DN(___,0,0x000),
    DN(C_5,14,0xC07),
    DN(C_5,14,0xC03),
    DN(C_6,14,0xC07),
    DN(C_6,14,0xC03),
    DN(As4,14,0xC07),
    DN(As4,14,0xC03),
    DN(As5,14,0xC07),
    DN(As5,14,0xC03),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(As4,14,0xC07),
    DN(As4,14,0xC03),
    DN(F_4,14,0xC07),
    DN(F_4,14,0xC01),
    DN(F_4,14,0xC07),
    DN(F_5,14,0xC07),
    DN(F_5,14,0xC03),
    DN(___,0,0x000),
    DN(F_4,14,0xC07),
    DN(F_4,14,0xC03),
    DN(C_5,14,0xC07),
    DN(C_5,14,0xC03),
    DN(C_6,14,0xC07),
    DN(C_6,14,0xC03),
    DN(___,0,0x000),
    DN(C_5,14,0xC07),
    DN(C_5,14,0xC03),
    DN(C_5,14,0xC07),
    DN(C_6,14,0xC07),
    DN(C_6,14,0xC03),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(C_5,14,0xC07),
    DN(C_5,14,0xC03),
    DN(C_6,14,0xC07),
    DN(C_6,14,0xC03),
    DN(As4,14,0xC07),
    DN(As4,14,0xC03),
    DN(As5,14,0xC07),
    DN(As5,14,0xC03),
    DN(___,0,0x000),
    DN(As4,14,0xC07),
    DN(As5,14,0xC07),
    DN(As5,14,0xC03),
    DN(F_4,14,0xC07),
    DN(F_4,14,0xC03),
    DN(F_5,14,0xC07),
    DN(F_5,14,0xC03),
    DN(F_4,14,0xC07),
    DN(F_4,14,0xC03),
    DN(___,0,0x000),
    DN(___,0,0x000),
};
static const unsigned char P3[] = {
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC01),
    DN(C_5,15,0xC0B),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC01),
    DN(C_5,15,0xC0B),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC01),
    DN(C_5,15,0xC0B),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC01),
    DN(C_5,15,0xC0B),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
};
static const unsigned char P10[] = {
    DN(C_5,0,0xC00),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
};
static const unsigned char P11[] = {
    DN(C_5,0,0xC02),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0xB02),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
};
static const unsigned char P12[] = {
    DN(G_4,14,0xC07),
    DN(G_4,14,0xC03),
    DN(As4,14,0xC07),
    DN(As4,14,0xC03),
    DN(B_4,14,0xC07),
    DN(B_4,14,0xC03),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
};
static const unsigned char P13[] = {
    DN(C_5,0,0xC00),
    DN(___,0,0xF07),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
};
static const unsigned char P23[] = {
    DN(C_5,15,0xC0F),
    DN(C_5,15,0xC0F),
    DN(C_5,15,0xC0F),
    DN(C_5,15,0xC0F),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC01),
    DN(C_5,15,0xC0B),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC01),
    DN(C_5,15,0xC0B),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC01),
    DN(C_5,15,0xC0B),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
};
static const unsigned char P30[] = {
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0xB04),
};
static const unsigned char P40[] = {
    DN(C_6,4,0xC07),
    DN(C_6,4,0xC00),
    DN(E_6,4,0xC07),
    DN(E_6,4,0xC00),
    DN(G_6,4,0xC07),
    DN(G_6,4,0xC00),
    DN(C_6,4,0xC07),
    DN(E_6,4,0xC07),
    DN(E_6,4,0xC00),
    DN(G_6,4,0xC07),
    DN(G_6,4,0xC00),
    DN(C_6,4,0xC07),
    DN(C_6,4,0xC00),
    DN(E_6,4,0xC07),
    DN(G_6,4,0xC07),
    DN(G_6,4,0xC00),
    DN(As5,4,0xC07),
    DN(As5,4,0xC00),
    DN(D_6,4,0xC07),
    DN(D_6,4,0xC00),
    DN(F_6,4,0xC07),
    DN(F_6,4,0xC00),
    DN(A_5,4,0xC07),
    DN(C_6,4,0xC07),
    DN(C_6,4,0xC00),
    DN(F_6,4,0xC07),
    DN(F_6,4,0xC00),
    DN(A_5,4,0xC07),
    DN(A_5,4,0xC00),
    DN(C_6,4,0xC07),
    DN(F_6,4,0xC07),
    DN(F_6,4,0xC00),
    DN(C_6,4,0xC07),
    DN(C_6,4,0xC00),
    DN(E_6,4,0xC07),
    DN(E_6,4,0xC00),
    DN(G_6,4,0xC07),
    DN(G_6,4,0xC00),
    DN(C_6,4,0xC07),
    DN(E_6,4,0xC07),
    DN(E_6,4,0xC00),
    DN(G_6,4,0xC07),
    DN(G_6,4,0xC00),
    DN(C_6,4,0xC07),
    DN(C_6,4,0xC00),
    DN(E_6,4,0xC07),
    DN(G_6,4,0xC07),
    DN(G_6,4,0xC00),
    DN(As6,4,0xC07),
    DN(A_6,4,0xC07),
    DN(G_6,4,0xC07),
    DN(F_6,4,0xC07),
    DN(F_6,4,0xC00),
    DN(___,0,0x000),
    DN(C_6,4,0xC07),
    DN(F_6,4,0xC07),
    DN(F_6,4,0xC00),
    DN(G_6,4,0xC07),
    DN(G_6,4,0xC00),
    DN(G_6,4,0xC07),
    DN(G_6,4,0xC00),
    DN(F_6,4,0xC07),
    DN(G_6,4,0xC07),
    DN(G_6,4,0xC00),
};
static const unsigned char P50[] = {
    DN(C_6,4,0xC07),
    DN(C_6,4,0xC00),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(C_6,4,0xC07),
    DN(C_6,4,0xC00),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(C_6,4,0xC07),
    DN(As5,4,0xC07),
    DN(As5,4,0xC00),
    DN(___,0,0x000),
    DN(As5,4,0xC07),
    DN(As5,4,0xC00),
    DN(F_5,4,0xC07),
    DN(F_5,4,0xC00),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(As5,4,0xC07),
    DN(As5,4,0xC00),
    DN(C_6,4,0xC07),
    DN(C_6,4,0xC00),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(As6,4,0xC07),
    DN(A_6,4,0xC07),
    DN(G_6,4,0xC07),
    DN(F_6,4,0xC07),
    DN(F_6,4,0xC00),
    DN(C_6,4,0xC07),
    DN(C_6,4,0xC00),
    DN(F_6,4,0xC07),
    DN(F_6,4,0xC00),
    DN(G_6,4,0xC07),
    DN(G_6,4,0xC00),
    DN(G_6,4,0xC07),
    DN(G_6,4,0xC00),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
};
static const unsigned char P61[] = {
    DN(G_6,2,0xC07),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(G_6,2,0xC07),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(E_6,2,0xC07),
    DN(E_6,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(E_6,2,0xC07),
    DN(E_6,2,0xC00),
    DN(E_6,2,0xC07),
    DN(F_6,2,0xC07),
    DN(F_6,2,0xC00),
    DN(F_6,2,0xC07),
    DN(F_6,2,0xC00),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(As5,2,0xC07),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(A_5,2,0xC07),
    DN(A_5,2,0xC00),
    DN(F_6,2,0xC07),
    DN(F_6,2,0xC00),
    DN(E_6,2,0xC07),
    DN(E_6,2,0xC00),
    DN(G_6,2,0xC07),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(G_6,2,0xC07),
    DN(As6,2,0xC07),
    DN(As6,2,0xC00),
    DN(A_6,2,0xC07),
    DN(A_6,2,0xC00),
    DN(G_6,2,0xC07),
    DN(G_6,2,0xC00),
    DN(E_6,2,0xC07),
    DN(E_6,2,0xC00),
    DN(E_6,2,0xC07),
    DN(F_6,2,0xC07),
    DN(F_6,2,0xC00),
    DN(___,0,0x000),
    DN(F_6,2,0xC07),
    DN(F_6,2,0xC00),
    DN(E_6,2,0xC07),
    DN(F_6,2,0xC07),
    DN(F_6,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(___,0,0x000),
    DN(As5,2,0xC07),
    DN(As5,2,0xC00),
    DN(B_5,2,0xC07),
    DN(B_5,2,0xC00),
};
static const unsigned char P71[] = {
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(___,0,0x000),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(As5,2,0xC07),
    DN(As5,2,0xC07),
    DN(As5,2,0xC00),
    DN(As5,2,0xC07),
    DN(As5,2,0xC07),
    DN(As5,2,0xC07),
    DN(A_5,2,0xC07),
    DN(G_5,2,0xC07),
    DN(F_5,2,0xC07),
    DN(F_5,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(F_5,2,0xC07),
    DN(F_5,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(As5,2,0xC07),
    DN(As5,2,0xC07),
    DN(As5,2,0xC00),
    DN(As5,2,0xC00),
    DN(As5,2,0xC07),
    DN(As5,2,0xC00),
    DN(A_5,2,0xC07),
    DN(G_5,2,0xC07),
    DN(F_5,2,0xC00),
    DN(F_5,2,0xC07),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(F_5,2,0xC07),
    DN(F_5,2,0xC00),
};
static const unsigned char P80[] = {
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(___,0,0x000),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(___,0,0x000),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(As5,2,0xC07),
    DN(As5,2,0xC00),
    DN(As5,2,0xC07),
    DN(As5,2,0xC00),
    DN(As5,2,0xC07),
    DN(As5,2,0xC07),
    DN(A_5,2,0xC07),
    DN(G_5,2,0xC07),
    DN(F_5,2,0xC07),
    DN(F_5,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC07),
    DN(F_5,2,0xC07),
    DN(F_5,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(___,0,0x000),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(___,0,0x000),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(As5,2,0xC07),
    DN(As5,2,0xC00),
    DN(As5,2,0xC07),
    DN(As5,2,0xC00),
    DN(As5,2,0xC07),
    DN(As5,2,0xC07),
    DN(As5,2,0xC00),
    DN(C_6,2,0xC07),
    DN(C_6,2,0xC00),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
};
static const unsigned char P81[] = {
    DN(G_6,2,0x000),
    DN(C_6,2,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(G_6,2,0x000),
    DN(C_6,2,0x000),
    DN(___,0,0x000),
    DN(E_6,2,0x000),
    DN(___,0,0x000),
    DN(C_6,2,0x000),
    DN(___,0,0x000),
    DN(E_6,2,0x000),
    DN(___,0,0x000),
    DN(E_6,2,0x000),
    DN(F_6,2,0x000),
    DN(___,0,0x000),
    DN(F_6,2,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(As5,2,0x000),
    DN(C_6,2,0x000),
    DN(___,0,0x000),
    DN(A_5,2,0x000),
    DN(___,0,0x000),
    DN(F_6,2,0x000),
    DN(___,0,0x000),
    DN(E_6,2,0x000),
    DN(___,0,0x000),
    DN(G_6,2,0x000),
    DN(C_6,2,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(G_6,2,0x000),
    DN(As6,2,0x000),
    DN(___,0,0x000),
    DN(A_6,2,0x000),
    DN(___,0,0x000),
    DN(G_6,2,0x000),
    DN(___,0,0x000),
    DN(E_6,2,0x000),
    DN(___,0,0x000),
    DN(E_6,2,0x000),
    DN(F_6,2,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(F_6,2,0x000),
    DN(___,0,0x000),
    DN(E_6,2,0x000),
    DN(F_6,2,0x000),
    DN(___,0,0x000),
    DN(C_6,2,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(As5,2,0x000),
    DN(___,0,0x000),
    DN(B_5,2,0x000),
    DN(___,0,0x000),
};
static const unsigned char P82[] = {
    DN(E_6,14,0xC07),
    DN(G_5,14,0xC07),
    DN(G_5,14,0xC03),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(E_6,14,0xC07),
    DN(G_5,14,0xC07),
    DN(G_5,14,0xC03),
    DN(C_6,14,0xC07),
    DN(C_6,14,0xC03),
    DN(G_5,14,0xC07),
    DN(G_5,14,0xC03),
    DN(C_6,14,0xC07),
    DN(C_6,14,0xC03),
    DN(C_6,14,0xC07),
    DN(C_6,14,0xC07),
    DN(C_6,14,0xC03),
    DN(C_6,14,0xC07),
    DN(C_6,14,0xC03),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(F_5,14,0xC07),
    DN(F_5,14,0xC07),
    DN(F_5,14,0xC03),
    DN(F_5,14,0xC07),
    DN(F_5,14,0xC03),
    DN(As4,14,0xC07),
    DN(As4,14,0xC03),
    DN(B_4,14,0xC07),
    DN(B_4,14,0xC03),
    DN(E_6,14,0xC07),
    DN(G_5,14,0xC07),
    DN(G_5,14,0xC03),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(E_6,14,0xC07),
    DN(G_6,14,0xC07),
    DN(G_6,14,0xC03),
    DN(F_6,14,0xC07),
    DN(F_6,14,0xC03),
    DN(E_6,14,0xC07),
    DN(E_6,14,0xC03),
    DN(C_6,14,0xC07),
    DN(C_6,14,0xC03),
    DN(C_6,14,0xC07),
    DN(C_6,14,0xC07),
    DN(C_6,14,0xC03),
    DN(___,0,0x000),
    DN(C_6,14,0xC07),
    DN(C_6,14,0xC03),
    DN(C_6,14,0xC07),
    DN(As5,14,0xC07),
    DN(As5,14,0xC03),
    DN(A_5,14,0xC07),
    DN(A_5,14,0xC03),
    DN(___,0,0x000),
    DN(F_5,14,0xC07),
    DN(F_5,14,0xC03),
    DN(B_5,14,0xC07),
    DN(B_5,14,0xC03),
};
static const unsigned char P83[] = {
    DN(___,0,0x000),
    DN(C_5,15,0xE02),
    DN(___,0,0x000),
    DN(C_5,15,0xE02),
    DN(C_5,15,0xC0F),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC05),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xE02),
    DN(___,0,0x000),
    DN(C_5,15,0xE02),
    DN(C_5,15,0xC0F),
    DN(C_5,15,0xE02),
    DN(C_5,15,0xE02),
    DN(C_5,15,0xE02),
    DN(___,0,0x000),
    DN(C_5,15,0xC0F),
    DN(C_5,15,0xE02),
    DN(___,0,0x000),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xE02),
    DN(___,0,0xE01),
    DN(C_5,15,0xE02),
    DN(C_5,15,0xC0F),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xE02),
    DN(___,0,0x000),
    DN(C_5,15,0xE02),
    DN(C_5,15,0xC0F),
    DN(C_5,15,0xE02),
    DN(C_5,15,0xE02),
    DN(C_5,15,0xE02),
    DN(___,0,0x000),
    DN(C_5,15,0xC0F),
    DN(C_5,15,0xE02),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
    DN(C_5,15,0xC0F),
    DN(___,0,0xE01),
};

static const unsigned char* const order1[] = {P10,P0,P0,P40,P50,P50,P0,P61,P80,P40,P50,P50,P0,P30};
static const unsigned char* const order2[] = {P11,P1,P1,P1,P1,P1,P61,P71,P81,P1,P1,P1,P1,P1};
static const unsigned char* const order3[] = {P12,P2,P2,P2,P2,P2,P2,P2,P82,P2,P2,P2,P2,P2};
static const unsigned char* const order4[] = {P13,P3,P23,P3,P3,P3,P3,P3,P83,P3,P3,P3,P23,P3};

static const unsigned char duty_instruments[] = {
8,64,240,128,
8,128,240,128,
8,192,240,128,
8,0,240,128,
8,128,240,128,
8,128,240,128,
8,128,240,128,
8,128,240,128,
8,128,240,128,
8,128,240,128,
8,128,240,128,
8,128,240,128,
8,128,240,128,
8,128,240,128,
8,128,240,128,
};
static const unsigned char wave_instruments[] = {
0,32,0,128,
0,32,1,128,
0,32,2,128,
0,32,3,128,
0,32,4,128,
0,32,5,128,
0,32,6,128,
0,32,0,128,
0,32,1,128,
0,32,2,128,
0,32,3,128,
0,32,4,128,
0,32,5,128,
0,32,6,128,
0,32,7,128,
};
static const unsigned char noise_instruments[] = {
240,0,0,0,0,0,0,0,
240,0,0,0,0,0,0,0,
240,0,0,0,0,0,0,0,
240,0,0,0,0,0,0,0,
240,0,0,0,0,0,0,0,
240,0,0,0,0,0,0,0,
240,0,0,0,0,0,0,0,
240,0,0,0,0,0,0,0,
240,0,0,0,0,0,0,0,
240,0,0,0,0,0,0,0,
240,0,0,0,0,0,0,0,
240,0,0,0,0,0,0,0,
240,0,0,0,0,0,0,0,
240,0,0,0,0,0,0,0,
240,0,0,0,0,0,0,0,
};

static const unsigned char waves[] = {
    165,215,201,225,188,154,118,49,12,186,222,96,27,202,3,147,
    240,225,210,195,180,165,150,135,120,105,90,75,60,45,30,15,
    253,236,219,202,185,168,151,134,121,104,87,70,53,36,19,2,
    222,254,220,186,154,169,135,119,136,135,101,86,84,50,16,18,
    171,205,239,237,203,160,18,62,220,186,188,222,254,220,50,16,
    255,238,221,204,187,170,153,136,119,102,85,68,51,34,17,0,
    255,255,255,255,255,255,255,255,0,0,0,0,0,0,0,0,
    121,188,222,239,255,238,220,185,117,67,33,16,0,17,35,69,
    85,202,26,228,220,58,216,150,91,160,23,55,181,234,103,117,
    229,225,50,32,142,103,167,13,37,30,138,62,19,2,19,170,
    137,109,120,225,137,22,99,144,68,197,67,126,231,16,129,157,
    136,7,44,23,164,9,18,62,74,110,0,62,96,220,85,18,
    137,174,1,40,149,149,129,9,85,120,41,10,171,131,126,6,
    157,105,231,61,51,198,20,0,94,202,198,145,228,120,151,188,
    38,72,219,174,24,125,83,217,184,57,77,61,153,101,234,78,
    58,208,140,183,157,190,25,119,7,147,14,57,116,163,202,46,
};

const hUGESong_t tetris_music = {7, &order_cnt, order1, order2, order3,order4, duty_instruments, wave_instruments, noise_instruments, NULL, waves};
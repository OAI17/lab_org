.globl main
.globl fondo
.globl bote
.globl make_sun
.globl make_mountain
.globl make_cloud
.globl make_boat
.globl fish
.globl rand
.globl make_iceberg
.globl cardumen
.globl delay0
.globl make_moon
.globl bs

.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32

.equ HALF_SCREEN_HEIGH, 240 // Dimencion Cielo
.equ SKYE_COLOR_I, 0x16FF // Color inical del cielo
.equ INCREMENT_COLOR, 0x0400 // Incremento para degrades
.equ Q_LINE, 10 // Cantidad de lineas del mismo color

.equ BASE_COLOR, 0xFF00 // Color base
.equ SEA_COLOR_l, 0x008F // Color mar

.equ DIM_WAVES_Y, 250
.equ DIM_WAVES_X, 640
.equ POS_WAVES, 0
.equ WAVES_COLOR, 0x00FF
.equ DIST_WAVES, 3000
.equ RADIO_WAVES, 150

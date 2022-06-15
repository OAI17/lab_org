
.include "fun.s"
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32
.equ SUN_COLOR, 0xFFE200

.equ HALF_SCREEN_HEIGH, 240 // Dimencion Cielo
.equ SKYE_COLOR_I, 0x88FF // Color inical del cielo
.equ INCREMENT_COLOR, 0x80000 // Incremento para degrades
.equ Q_LINE, 10 // Cantidad de lineas del mismo color

.equ BASE_COLOR, 0xFF00 // Color base
.equ SEA_COLOR_l, 0x008F // Color mar

.equ DIM_WAVES_Y, 250
.equ DIM_WAVES_X, 640
.equ POS_WAVES, 0
.equ WAVES_COLOR, 0x00FF
.equ DIST_WAVES, 3000
.equ RADIO_WAVES, 150
.globl main

main:

	// X0 contiene la direccion base del framebuffer
 	mov x20, x0	// Save framebuffer base address to x20	
	//---------------- CODE HERE ------------------------------------

	movz x10, BASE_COLOR, lsl 16
	movk x10, SKYE_COLOR_I, lsl 00

	mov x11, Q_LINE // Cantidad de renglones con el mismo color
	mov x9, SKYE_COLOR_I // Seteo variable de color
	mov x12, 2 // Contador para mitad de la imagen
	mov x2, HALF_SCREEN_HEIGH         // Y Size cielo

	bl fondo
	


	movz x12, 30		// cordenada Y 
	movz x13, 640		// 
	mul x12, x12, x13	// calcula la "esquina" izquierda del circulo
	add x12, x12, 460	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	bl make_sun

	movz x12, 40		// cordenada Y de 160 hasta 420
	movz x13, 640		// 
	mul x12, x12, x13	// calcula el centro del barco
	add x12, x12, 500	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	movz x14, 0xFF00 , lsl 16	// color de las velas
	movk x14, 0x99FF , lsl 0	//

	bl make_mountain




	movz x12, 40		// cordenada Y 
	movz x13, 640		// 
	mul x12, x12, x13	// calcula la "esquina" izquierda del barco
	add x12, x12, 100	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	bl make_cloud

	movz x12, 120		// cordenada Y 
	movz x13, 640		// 
	mul x12, x12, x13	// calcula la "esquina" izquierda del barco
	add x12, x12, 200	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	bl make_cloud

	movz x12, 60		// cordenada Y 
	movz x13, 640		// 
	mul x12, x12, x13	// calcula la "esquina" izquierda del barco
	add x12, x12, 320	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	bl make_cloud



	movz x15, 0xFFA0 , lsl 16	// color de la base del barco
	movk x15, 0x522D , lsl 0	//
	

	movz x12, 260		// cordenada Y de 160 hasta 420
	movz x13, 640		// 
	mul x12, x12, x13	// calcula el centro del barco
	add x12, x12, 440	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	movz x14, 0xFFFF , lsl 16		//color de las velas
	movk x14, 0x0 , lsl 0	//


	bl make_boat



	movz x15, 0xFFCD , lsl 16	// color de la base del barco
	movk x15, 0x853F , lsl 0	//
	

	movz x12, 300		// cordenada Y de 160 hasta 420
	movz x13, 640		// 
	mul x12, x12, x13	// calcula el centro del barco
	add x12, x12, 220	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	movz x14, 0xFFFF , lsl 16		//color de las velas
	movk x14, 0xFFFF , lsl 0	//


	bl make_boat

	movz x15, 0xFF8B , lsl 16	// color de la base del barco
	movk x15, 0x4513 , lsl 0	//	


	movz x12, 380		// cordenada Y de 160 hasta 420
	movz x13, 640		// 
	mul x12, x12, x13	// calcula el centro del barco
	add x12, x12, 490	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	movz x14, 0x0 , lsl 16	// color de las velas
	movk x14, 0x0 , lsl 0	//
	bl make_boat




//---------------------------------------------------------------
// Infinite Loop 

InfLoop: 
	b InfLoop




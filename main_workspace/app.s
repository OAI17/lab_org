.include "boat.s"
.include "background.s"
.include "sun.s"
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32
.globl main

main:

	// X0 contiene la direccion base del framebuffer
 	mov x20, x0	// Save framebuffer base address to x20	
	//---------------- CODE HERE ------------------------------------


	//Fondo
	movz x10, BASE_COLOR, lsl 16
	movk x10, SKYE_COLOR_I, lsl 00

	mov x11, Q_LINE // Cantidad de renglones con el mismo color
	mov x9, SKYE_COLOR_I // Seteo variable de color
	mov x12, 2 // Contador para mitad de la imagen
	mov x2, HALF_SCREEN_HEIGH         // Y Size cielo

	bl fondo
	
	//Primer barco
	movz x15, 0xFFCD , lsl 16	// color de la base del barco
	movk x15, 0x853F , lsl 0	//
	
	movz x12, 300		// cordenada Y de 160 hasta 420
	movz x13, 640		// 
	mul x12, x12, x13	// calcula el centro del barco
	add x12, x12, 200	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	movz x14, 0xFF , lsl 16		//color de las velas
	movk x14, 0xFFFF , lsl 0	//
	
	bl make_boat

	
	//Segundo barco
	movz x15, 0xFF8B , lsl 16	// color de la base del barco
	movk x15, 0x4513 , lsl 0	//	

	movz x12, 380		// cordenada Y de 160 hasta 420
	movz x13, 640		// 
	mul x12, x12, x13	// calcula el centro del barco
	add x12, x12, 460	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	movz x14, 0x0 , lsl 16	// color de las velas
	movk x14, 0x0 , lsl 0	//
	
	bl make_boat

	//Sol
	movz x15, 0xFF , lsl 16	// color del circulo
	movk x15, 0x0 , lsl 0	//	

	mov x2 , 50    // radio del circulo

	movz x12, 100		// cordenada Y 
	movz x13, 640		// 
	mul x12, x12, x13	// calcula la "esquina" izquierda del barco
	add x12, x12, 480	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	bl make_circle


//---------------------------------------------------------------
// Infinite Loop 

InfLoop: 
	b InfLoop



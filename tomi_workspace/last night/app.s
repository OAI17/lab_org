.include "boat.s"
.include "background.s"
.include "sun.s"
.include "mountain.s"
.include "letters.s"
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
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

	//Sol
	movz x12, 30		// cordenada Y 
	movz x13, 640		// 
	mul x12, x12, x13	// calcula la "esquina" izquierda del circulo
	add x12, x12, 460	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	bl make_sun

	//Primera montaNa
	movz x12, 150		// cordenada Y de 160 hasta 420
	movz x13, 640		// 
	mul x12, x12, x13	// calcula el centro del barco
	add x12, x12, 550	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 
	mov x2, 90			// Altura montaNa
	movz x14, 0xFF87 , lsl 16	// color de las montaNas
	movk x14, 0xCEFA , lsl 0	//

	bl make_mountain

	//Segunda montaNa	
	movz x12, 100		// cordenada Y de 160 hasta 420
	movz x13, 640		// 
	mul x12, x12, x13	// calcula el centro del barco
	add x12, x12, 500	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 
	mov x2, 140			// Altura montaNa

	movz x14, 0x0 , lsl 16	// color de las montaNas
	movk x14, 0xBBFF , lsl 0	//

	bl make_mountain


	//Nuve1
	movz x12, 40		// cordenada Y 
	movz x13, 640		// 
	mul x12, x12, x13	// calcula la "esquina" izquierda del barco
	add x12, x12, 100	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	bl make_cloud
	//Nuve2
	movz x12, 120		// cordenada Y 
	movz x13, 640		// 
	mul x12, x12, x13	// calcula la "esquina" izquierda del barco
	add x12, x12, 200	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	bl make_cloud

	//Nuve3
	movz x12, 60		// cordenada Y 
	movz x13, 640		// 
	mul x12, x12, x13	// calcula la "esquina" izquierda del barco
	add x12, x12, 320	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	bl make_cloud

	//Primer barco
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

	//Segundo barco
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

	
	//Tercer barco
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

// Pescado pintado

	mov x3, 50 // Posicion X
	mov x4, 400 // Posicion Y
	mov x5, 640
	mul x4, x4, x5
	add x3, x3, x4
	lsl x3, x3, 2
	add x3, x20, x3

	movz x6, 0xff20, lsl 16
	movk x6, 0xb2aa, lsl 00

	bl fish


	mov x3, 30 // Posicion X
	mov x4, 380 // Posicion Y
	mov x5, 640
	mul x4, x4, x5
	add x3, x3, x4
	lsl x3, x3, 2
	add x3, x20, x3

	movz x6, 0xff20, lsl 16
	movk x6, 0xb2aa, lsl 00

	bl fish

	movz x3, 195	// y				
    movz x4, 640
    mul x3, x3, x4
    add x3, x3,370	// x
    lsl x3, x3, 2
    add x3,x20,x3

	movz x6, 0xffff, lsl 16
    movk x6, 0xffff, lsl 00 // Color 

	bl make_I



//---------------------------------------------------------------
// Infinite Loop 

InfLoop: 
	b InfLoop



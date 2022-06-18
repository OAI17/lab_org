
.include "global.s"
frame80:
    mov x1,x30
///////////////////////////////////////////
	//Fondo
	movz x10, 0xFF48, lsl 16
	movk x10, 0x3DEB, lsl 00

	mov x11, Q_LINE // Cantidad de renglones con el mismo color
	mov x9, SKYE_COLOR_I // Seteo variable de color
	mov x12, 2 // Contador para mitad de la imagen
	mov x2, HALF_SCREEN_HEIGH         // Y Size cielo

    mov x8, 160 	//radio olas

	bl fondo

	//Estrellas
    movz x2, 0xb0ca, lsl 0
    movk x2, 0xb0ca, lsl 16
    movk x2, 0xd5ad, lsl 32
    movk x2, 0xbeef, lsl 48

	movz x26, 0xD700, lsl 0 //color estrellas
    movk x26, 0xFFFF, lsl 16 //color estrellas
	mov x13, 200 //contador de estrellas cambiar x1 
		
	bl rand
///////////////////////////////////////////

	//Sol
	movz x12, 127		// cordenada Y 
	movz x13, 640		// 
	mul x12, x12, x13	// calcula la "esquina" izquierda del circulo
	add x12, x12, 425	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	bl make_sun

	//Primera montaNa2
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
	add x12, x12, 416	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	bl make_cloud
	//Nuve2
	movz x12, 120		// cordenada Y 
	movz x13, 640		// 
	mul x12, x12, x13	// calcula la "esquina" izquierda del barco
	add x12, x12, 514	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	bl make_cloud

	//Nuve3
	movz x12, 60		// cordenada Y 
	movz x13, 640		// 
	mul x12, x12, x13	// calcula la "esquina" izquierda del barco
	add x12, x12, 602	// cordenada X de 
    lsl x12, x12, 2		//
	add x12,x20,x12     // 

	bl make_cloud

	//Primer barco
	movz x15, 0xFFA0 , lsl 16	// color de la base del barco
	movk x15, 0x522D , lsl 0	//
	

	movz x12, 259	// cordenada Y de 160 hasta 420
	movz x13, 640		// 
	mul x12, x12, x13	// calcula el centro del barco
	add x12, x12, 288	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	movz x14, 0xFFFF , lsl 16		//color de las velas
	movk x14, 0x0 , lsl 0	//

	mov x11, 2


	bl make_boat


	//Segundo barco
	movz x15, 0xFFCD , lsl 16	// color de la base del barco
	movk x15, 0x853F , lsl 0	//
	
	movz x12, 300		// cordenada Y de 160 hasta 420
	movz x13, 640		// 
	mul x12, x12, x13	// calcula el centro del barco
	add x12, x12, 202	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	movz x14, 0xFF , lsl 16		//color de las velas
	movk x14, 0xFFFF , lsl 0	//
	
	mov x11, 3

	bl make_boat

	
	//Tercer barco
	movz x15, 0xFF8B , lsl 16	// color de la base del barco
	movk x15, 0x4513 , lsl 0	//	

	movz x12, 380		// cordenada Y de 160 hasta 420
	movz x13, 640		// 
	mul x12, x12, x13	// calcula el centro del barco
	add x12, x12, 286	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12     // 

	movz x14, 0x0 , lsl 16	// color de las velas
	movk x14, 0x0 , lsl 0	//

	mov x11, 1

	bl make_boat

// Pescado pintado


br x1

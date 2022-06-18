
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


fondo:
mov x0, x20
mov x27, x30

loop1:
	mov x13, SCREEN_WIDTH         // X Size


loop0:
	stur w10,[x0]	   // Set color of pixel N
	add x0,x0,4	   // Next pixel
	sub x13,x13,1	   // decrement X counter
	cbnz x13,loop0	   // If not end row jump
	
	/*Degrades*/
	cmp x12,2
	b.ne decrement_y
	sub x11,x11,1
	cbnz x11, decrement_y // Compara si termino de pintar el bloque del mismo color 
	add x9, x10, INCREMENT_COLOR // Calcular nuevo color
	mov x10, x9 // Seteo de nuevo color
	mov x11,Q_LINE // Reinicio de contador de renglones

	decrement_y:
	sub x2,x2,1	   // Decrement Y counter
	cbnz x2,loop1	   // if not last row, jump
	/*Termina de pintar el cielo*/
	
	cbz x29, skp //Veo si es de dia o noche
	//movz x10, 0xffff, lsl 0 
	//bl rand
	
	skp:
	sub x12, x12, 1 // Primera mitad pintada 
	cmp x12, 1 
	b.ne sea_effects

	mov x2, HALF_SCREEN_HEIGH // Pinte segunda mitad
	
	movz x10, BASE_COLOR, lsl 16 // Seteo color del mar
	movk x10, SEA_COLOR_l, lsl 00 // Seteo color del mar
	b loop1


sea_effects:
	// Dir base del Circulo
	movz x3, DIM_WAVES_Y			
	movz x4, DIM_WAVES_X
	mul x3, x3, x4
	add x3, x3, POS_WAVES
	lsl x3, x3, 2
	add x3,x20,x3	// Lo mandé a el centro de la pantalla

	mov x7, x3 // guardo la pos inicial del circulo
	mov x9, x8
	//Pintar Circulo	

	pintarLinea:

	movz x6, WAVES_COLOR, lsl 00
	
	stur w6, [x3] // Pinta la ola 
	add x3, x3, 4 
	sub x8, x8, 1 
	cbnz x8, pintarLinea // Movimiento en eje x

	sub x9, x9, 1 // Movimiento en eje y
	mov x8, x9

	add x3, x3, DIST_WAVES // Espacio entre linea 
	cbnz x9, pintarLinea 

br x27

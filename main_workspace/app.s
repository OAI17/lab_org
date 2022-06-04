.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32


.equ HALF_SCREEN_HEIGH, 240 // Dimencion Cielo
.equ SKYE_COLOR_I, 0x88FF // Color inical del cielo
.equ INCREMENT_COLOR, 0x80000 // Incremento para degrades
.equ Q_LINE, 10 // Cantidad de lineas del mismo color

.equ BASE_COLOR, 0xFF00 // Color base
.equ SEA_COLOR_l, 0x00FF // Color mar



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

loop1:
	mov x1, SCREEN_WIDTH         // X Size


loop0:
	stur w10,[x0]	   // Set color of pixel N
	add x0,x0,4	   // Next pixel
	sub x1,x1,1	   // decrement X counter
	cbnz x1,loop0	   // If not end row jump

	/*Degrades*/
	cmp x12,2
	b.ne decrement_y
	cbnz x11, decrement_y // Compara si termino de pintar el bloque del mismo color
	sub x11,x11,1 
	add x9, x10, INCREMENT_COLOR // Calcular nuevo color
	mov x10, x9 // Seteo de nuevo color
	mov x11,Q_LINE // Reinicio de contador de renglones

	decrement_y:
	sub x2,x2,1	   // Decrement Y counter
	cbnz x2,loop1	   // if not last row, jump
	/*Termina de pintar el cielo*/
	
	sub x12, x12, 1 // Primera mitad pintada 
	cmp x12, 1 
	b.ne InfLoop

	mov x2, HALF_SCREEN_HEIGH // Pinte segunda mitad
	
	movz x10, BASE_COLOR, lsl 16 // Seteo color del mar
	movk x10, SEA_COLOR_l, lsl 00 // Seteo color del mar
	b loop1




.include "barco.s"
b lop00


//---------------------------------------------------------------
// Infinite Loop 
InfLoop: 
	b InfLoop



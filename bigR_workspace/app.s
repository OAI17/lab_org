.include "sun.s"

.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32


.globl main
main:
	// X0 contiene la direccion base del framebuffer
 	mov x20, x0	// Save framebuffer base address to x20	
	//---------------- CODE HERE ------------------------------------
	
	movz x10, 0xffff, lsl 16	//mas sig transp los otros dos rojo -->> armar la tonalidad del color 	
	movk x10, 0xffff, lsl 00	//mas sig verde los otros dos azul
	
	mov x2, SCREEN_HEIGH         // Y Size 
loop1:
	mov x1, SCREEN_WIDTH         // X Size


loop0:
	stur w10,[x0]	   // Set color of pixel N
	add x0,x0,4	   // Next pixel
	sub x1,x1,1	   // decrement X counter
	cbnz x1,loop0	   // If not end row jump
	sub x2,x2,1	   // Decrement Y counter
	cbnz x2,loop1	   // if not last row, jump

	//---------------------------------------------------------------
	// Infinite Loop 

// Pescado pintado
	mov x3, 300
	mov x4, 220
	mov x5, 640
	mul x4, x4, x5
	add x3, x3, x4
	lsl x3, x3, 2
	add x3, x20, x3

	movz x6, 0xff20, lsl 16
	movk x6, 0xb2aa, lsl 00
	add x7, x3, xzr
	add x8, x3, xzr

	mov x5, 20
	mov x4, x5
	mov x10, 2560
	
colaP: 
	
	stur w6, [x7]
	stur w6, [x8]
	add x7, x7, x10
	sub x8, x8, x10
	sub x4, x4, 1
	cbnz x4, colaP
	add x3, x3, 4
	add x7, x3, xzr
	add x8, x3, xzr
	sub x5, x5, 1
	mov x4, x5
	cbnz x5, colaP

	mov x5, 30
	mov x4, x5
	movz x11, 0xffff, lsl 16
	movk x11, 0xd700, lsl 00
cola2P:
	stur w11, [x7]
	stur w11, [x8]
	add x7, x7, x10
	sub x8, x8, x10
	sub x4, x4, 1
	cbnz x4, cola2P
	add x3, x3, 4
	add x7, x3, xzr
	add x8, x3, xzr
	sub x5, x5, 1
	mov x4, x5
	cbnz x5, cola2P

	//Ojo
	add x9, x3, 80
	movz x5, 0xffff, lsl 16
	movk x5, 0xffff, lsl 0

	mov x2, 4
	movz x12, 210		// cordenada Y 
	movz x13, 640		// 
	mul x12, x12, x13	// calcula la "esquina" izquierda del barco
	add x12, x12, 330	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12
	bl make_circle
	
InfLoop: 
	b InfLoop

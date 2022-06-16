
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32


.globl main
main:
	// X0 contiene la direccion base del framebuffer
 	mov x20, x0	// Save framebuffer base address to x20	
	//---------------- CODE HERE ------------------------------------
	
	movz x10, 0x00, lsl 16
	movk x10, 0x0000, lsl 00

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
	
	// Dir base del Circulo
	movz x3, 210				
	movz x4, 640
	mul x3, x3, x4
	add x3, x3, 320
	lsl x3, x3, 2
	add x3,x20,x3
	
	movz x5, 0xffff, lsl 16
	movk x5, 0xffff, lsl 0

	mov x4, 8
alaIzq:
	stur w5, [x3]
	add x3, x3, 2572
	sub x4, x4, 1
	cbnz x4, alaIzq
  
	mov x4, 8
alaDer:
	stur w5, [x3]
	sub x3, x3, 2552
	sub x4, x4, 1
	cbnz x4, alaDer

InfLoop: 

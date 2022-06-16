
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
	
	// Dir base de la letra H
	movz x3, 210				
	movz x4, 640
	mul x3, x3, x4
	add x3, x3, 320
	lsl x3, x3, 2
	add x3,x20,x3	// Lo mandé a el centro de la pantalla, pero se puede incializar en cualquir lado
	mov x8, 15 // Contador para el palo vertical
    mov x10, 20 // Contador para el palo horizontal
	mov x7, x3 // guardo la pos inicial de la letra
    mov x9, x3
    mov x13, x8
    mov x11, x3
    add x11, x11, 80
    mov x12, x3
    add x12, x12, 80

	//Pintar Letra H
	
pintarLinea1:

	movz x6, 0xffff, lsl 16
    movk x6, 0xffff, lsl 00 // Color 
	stur w6, [x3]	// x3 es el pixel con la dir base
	stur w6, [x7]
	add x3, x3, 2560
	sub x7, x7, 2560
	sub x8, x8, 1
	cbnz x8, pintarLinea1

paloH:
    stur w6, [x9]
    add x9, x9, 4
    sub x10, x10, 1
    cbnz x10, paloH

    
pintarLinea2:
    stur w6, [x11]
    stur w6, [x12]
    add x11, x11, 2560
    sub x12, x12, 2560
    sub x13, x13, 1
    cbnz x13, pintarLinea2

// Big T
    movz x3, 195	// y				
    movz x4, 640
    mul x3, x3, x4
    add x3, x3, 290	// x
    lsl x3, x3, 2
    add x3,x20,x3

    mov x5, x3
    mov x7, x3

    mov x4, 30
lineaV:
    stur w6, [x3]
    add x3, x3, 2560
    sub x4, x4, 1
    cbnz x4, lineaV

    mov x4, 10
lineaH:
    stur w6, [x5]
    stur w6, [x7]
    add x5, x5, 4
    sub x7, x7, 4
    sub x4, x4, 1
    cbnz x4, lineaH

// BigI
    movz x3, 195	// y				
    movz x4, 640
    mul x3, x3, x4
    add x3, x3,370	// x
    lsl x3, x3, 2
    add x3,x20,x3

    mov x5, x3
    mov x7, x3
    mov x4, 30
lineaVi:
    stur w6, [x3]
    add x3, x3, 2560
    sub x4, x4, 1
    cbnz x4, lineaVi

    mov x4, 10
lineaHi:
    stur w6, [x5]
    stur w6, [x7]
    add x5, x5, 4
    sub x7, x7, 4
    sub x4, x4, 1
    cbnz x4, lineaHi

    mov x5, x3
    mov x7, x3
    mov x4, 10
lineaHii:
    stur w6, [x5]
    stur w6, [x7]
    add x5, x5, 4
    sub x7, x7, 4
    sub x4, x4, 1
    cbnz x4, lineaHii
InfLoop: 
	b InfLoop


.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32


.globl main
main:
	// X0 contiene la direccion base del framebuffer
 	mov x20, x0	// Save framebuffer base address to x20	
	//---------------- CODE HERE ------------------------------------
	
	movz x10, 0x0, lsl 16	//mas sig transp los otros dos rojo -->> armar la tonalidad del color 	
	movk x10, 0x0, lsl 00	//mas sig verde los otros dos azul
	
	movz x11, 0x0, lsl 16
	movk x11, 0x0BFF, lsl 00

	mov x2, SCREEN_HEIGH
	 
loop1:
	mov x1, SCREEN_WIDTH         // X Size 

loop0:
	stur w10,[x0]	   // Set color of pixel N
	add x0,x0,4	   // Next pixel
	sub x1,x1,1	   // decrement X counter
	
	cbnz x1,loop0	   // If not end row jump
	sub x2,x2,1	   // Decrement Y counter
	cbnz x2,loop1	   // if not last row, jump
	
	bl triang	
	//---------------------------------------------------------------
	// Infinite Loop 
	b InfLoop

for:
	stur x11, [x17]
	movz x16 , 640
	add x16, x16 ,1
	lsl x16,x16,2
	sub x17 ,x17 ,x16 
	sub x15, x15 , 1
	cbnz x15, for
	b back

cuad:
	movz x12, 210
	movz x13, 640
	mul x12, x12, x13
	add x12, x12, 320
	lsl x12, x12, 2
	add x12,x20,x12

	mov x17, x12
	mov x15, 100
	b for
	back:
	movz x15, 100

test:
	movz x14, 100
	add x11,x11,256

aux:

	stur w11, [x12]
	add x12,x12,4
	sub x14,x14,1	
	cbnz x14,aux

	movz x16 , 220
	add x16, x16 ,320
	lsl x16,x16,2
	add x12 ,x12 ,x16 
	sub x15, x15 , 1
	cbnz x15, test

	br x30

triang:
	movz x18, 320
	lsl x18,x18,2
	add x18, x18, x20
	mov x21, x18 //centro
	mov x19,x18
	mov x22, 100 //altura triang
	mov x7, 4 //incremento lados
	b bucle 
	

bucle:

	mov x16,640
	lsl x16,x16,2 //calc aux
	add x21,x21,x16
	
	mov x18,x21 //prox linea
	mov x19,x21

	sub x18,x18,x7 //moverme izq
	add x19,x19,x7 //moverme der

	add x7,x7,4 //incremento lados

aux_2:

	stur w11,[x18] // colorer
	add x18,x18,4
	subs xzr, x18,x19
	bne aux_2 

	sub x22,x22,1 //decremento altura triang
	cbnz x22, bucle
	br x30

InfLoop: 
	b InfLoop

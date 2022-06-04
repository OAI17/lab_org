
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32


.globl main
main:
	// X0 contiene la direccion base del framebuffer
 	mov x20, x0	// Save framebuffer base address to x20	
	//---------------- CODE HERE ------------------------------------
	
	movz x10, 0x2300, lsl 16
	movk x10, 0x1585, lsl 00

	movz x11, 0xFF8B, lsl 16
	movk x11, 0x4513, lsl 00

	mov x2, SCREEN_HEIGH         // Y Size 
loop1:
	mov x1, SCREEN_WIDTH         // X Size
loop0:
	stur w10,[x0]	   // Set color of pixel N
	add x0,x0,4	   // Next pixel
	sub x1,x1,1	   // decrement X counter
	stur w10,[x0]
	add x0,x0,4
	sub x1,x1,1
	cbnz x1,loop0	   // If not end row jump
	sub x2,x2,1	   // Decrement Y counter
	cbnz x2,loop1	   // if not last row, jump
	
	bl make_boat

	//---------------------------------------------------------------
	// Infinite Loop 

InfLoop: 
	b InfLoop



make_boat:

	movz x12, 210
	movz x13, 640
	mul x12, x12, x13
	add x12, x12, 320
	lsl x12, x12, 2
	add x12,x20,x12      // centro del barco


	bl base							//hacer base del barco

	sub x13, x12, 300
	mov x29, 150           // altura mastil
	mov x28, 70				// "mitad" altura vela
	bl vela						//hacer la vela
retur_boat:

	add x13, x12, 200
	mov x29, 100           		// altura mastil
	mov x28, 50					// "mitad" altura vela
	bl vela						//hacer la vela


	br x30

base : 
	mov x4, x12	  		//centro del barco
	sub x5, x4 ,600		//esquina izquierda del barco
	add x7,x4, 600      //esquina derecha del barco
	
	mov x19, 20
	
	mov x16,640
	lsl x16,x16,2    //calc aux avanzar sig linea


	mov x8, x5
	mov x6, 1
	lineas:
		stur xzr,[x8]
		add x8,x8,4
		subs xzr,x8,x7
		bne lineas

	nexttable:


		add x5, x5 ,12
		sub x7, x7, 12

		mov x6, 3
	first:
	for:			   //pintar la tabla
		
		add x5,x5,x16
		stur xzr,[x5]
		mov x8, x5
		add x8,x8,4
		stur xzr,[x8]
		add x8,x8,4	
		add x7,x7,x16
		mov x9,x7
		stur xzr,[x9]
		add x9,x9,4
		stur xzr,[x9]
		add x9,x9,4
	aux:
		stur w11,[x8]
		add x8,x8,4
		subs xzr,x9,x8
		bne aux

		
		sub x6, x6,1
		cbnz x6 , for

		sub x19,x19,1
		cbnz x19,nexttable

		add x5,x5,x16
		add x7,x7,x16
		lineas2:
		stur xzr,[x5]
		add x5,x5,4
		subs xzr,x5,x7
		bne lineas2

	br x30


vela: 

	b mastil
back:

	b triang

	br x30


triang:
	mov x21, x7 //centro
	mov x19, x7
	mov x22, x28 //altura triang
	mov x8, 4 //incremento lados
	b bucle 
	
	

bucle:
	movz x13, 0xFFFF , lsl 00
	movk x13, 0xFFFF , lsl 16

	mov x16,640
	lsl x16,x16,2 //calc aux
	add x21,x21,x16
	
	mov x18,x21 //prox linea
	mov x19,x21

	add x19,x19,x8 //moverme der

	add x8,x8,4 //incremento lados

aux_2:

	stur w13,[x18] // colorer
	add x18,x18,4
	subs xzr, x18,x19
	bne aux_2 

	sub x22,x22,1 //decremento altura triang
	cbnz x22, bucle
	
	sub x22, x28, 20 
bucle2:
	
	add x21,x21,x16
	mov x18,x21 //prox linea
	mov x19,x21
	add x19,x19,x8 //moverme der
	sub x8,x8,4
	

aux_3:	
	stur w13,[x18] // colorer
	add x18,x18,4
	subs xzr, x18,x19
	bne aux_3 

	sub x22,x22,1 //decremento altura triang
	cbnz x22,bucle2 
	
	
	b retur_boat


mastil:

	mov x4, x13   		// esquina inf izquierda del bote
	mov x5, 10
	
	mov x16,640
	lsl x16,x16,2 
		
	top:
		add x4,x4 ,4
		mov x7,x4			
		mov x6,x29  			//largo del mastil 
		follow:

		stur w11,[x7]	
		sub x7,x7,x16
		sub x6,x6,1
		cbnz x6, follow
	
		sub x5,x5,1
	cbnz x5, top
	add x7,x7,4

	b back		// al final x7 debe guardar la esquina sup derecha +1 bit



.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32


.equ HALF_SCREEN_HEIGH, 240 // Dimencion Cielo
.equ SKYE_COLOR_I, 0x88FF // Color inical del cielo
.equ INCREMENT_COLOR, 0x80000 // Incremento para degrades
.equ Q_LINE, 10 // Cantidad de lineas del mismo color

.equ BASE_COLOR, 0xFF00 // Color base
.equ SEA_COLOR_l, 0x008F // Color mar

.equ DIM_WAVES_Y, 250
.equ DIM_WAVES_X, 640
.equ POS_WAVES, 0
.equ WAVES_COLOR, 0x00FF
.equ DIST_WAVES, 3000
.equ RADIO_WAVES, 150
.globl main


delay:
	delay1:
	sub x17,x17,1
	cbnz x17 , delay1
	br x30

// hacer el barco principio
make_boat:

	mov x25, x30

	mov x10,x12  // guardo la cordenada del centro del barco

	bl base							//hacer base del barco

	sub x13, x12, 240
	mov x29, 120           // altura mastil
	mov x28, 60				// "mitad" altura vela
	bl velaM						//hacer la vela


	add x13, x12, 200
	mov x29, 100           		// altura mastil
	mov x28, 50					// "mitad" altura vela
	bl velasec						//hacer la vela

	mov x3 , x10		// cargo el centro del barco


	cmp x11, 1

	beq l_H


	cmp x11, 2

	beq l_I


	cmp x11, 3

	beq l_T

	l_H:

	sub x3 ,x3, 160		// desplazo hacia la izquierda

	mov x10, 2560		// 
	lsl x10, x10,6		//	
	sub x3,x3,x10		//

	movz x6, 0xffff, lsl 16
    movk x6, 0xffff, lsl 00 // Color de la H 

	bl make_H

	b skip

	l_I:
	

	sub x3 ,x3, 120		// desplazo hacia la izquierda

	mov x10, 2560		//
	mov x14, 80
	mul x10,x10,x14		//	
	sub x3,x3,x10		//

	movz x6, 0xffff, lsl 16
    movk x6, 0xffff, lsl 00 // Color de la I

	bl make_I

	b skip

	l_T: 

	sub x3 ,x3, 120		// desplazo hacia la izquierda

	mov x10, 2560		//
	mov x14, 80
	mul x10,x10,x14		//	
	sub x3,x3,x10		//


	movz x6, 0x0, lsl 16
    movk x6, 0x0, lsl 00 // Color  de la T

	bl make_T

	b skip

	skip :

	br x25

// fin funcion base

base : 
	mov x4, x12	  		//centro del barco
	sub x5, x4 ,460		//esquina izquierda del barco
	add x7,x4, 460      //esquina derecha del barco
	
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
		stur w15,[x8]
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


velaM: 

	b mastil
back:

	mov x21, x7 //centro
	mov x19, x7
	mov x22, x28 //altura triang
	mov x8, 4 //incremento lados

bucle:

	mov x16,640
	lsl x16,x16,2 //calc aux
	add x21,x21,x16
	
	mov x18,x21 //prox linea
	mov x19,x21

	add x19,x19,x8 //moverme der

	add x8,x8,4 //incremento lados

aux_2:

	stur w14,[x18] // colorer
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
	stur w14,[x18] // colorer
	add x18,x18,4
	subs xzr, x18,x19
	bne aux_3 

	sub x22,x22,1 //decremento altura triang
	cbnz x22,bucle2 
	
	
	br x30


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

		stur w15,[x7]	
		sub x7,x7,x16
		sub x6,x6,1
		cbnz x6, follow
	
		sub x5,x5,1
	cbnz x5, top
	add x7,x7,4

	b back		// al final x7 debe guardar la esquina sup derecha +1 bit


velasec: 

	b mastil2
back2:

	mov x21, x7 //centro
	mov x19, x7
	mov x22, x28 //altura triang
	mov x8, 4 //incremento lados

loopV:
	
	mov x16,640
	lsl x16,x16,2 //calc aux
	add x21,x21,x16
	
	mov x18,x21 //prox linea
	mov x19,x21

	add x19,x19,x8 //moverme der

	add x8,x8,4 //incremento lados

pintar:

	stur w14,[x18] // colorer
	add x18,x18,4
	subs xzr, x18,x19
	bne pintar 

	sub x22,x22,1 //decremento altura triang
	cbnz x22, loopV
	
	sub x22, x28, 20 
loopV2:
	
	add x21,x21,x16
	mov x18,x21 //prox linea
	mov x19,x21
	add x19,x19,x8 //moverme der
	sub x8,x8,4
	

aux_4:	
	stur w14,[x18] // colorer
	add x18,x18,4
	subs xzr, x18,x19
	bne aux_4 

	sub x22,x22,1 //decremento altura triang
	cbnz x22,loopV2 
	
	
	br x30


mastil2:

	mov x4, x13   		// esquina inf izquierda del bote
	mov x5, 10
	
	mov x16,640
	lsl x16,x16,2 
		
	top2:
		add x4,x4 ,4
		mov x7,x4			
		mov x6,x29  			//largo del mastil 
		continue:

		stur w15,[x7]	
		sub x7,x7,x16
		sub x6,x6,1
		cbnz x6, continue
	
		sub x5,x5,1
	cbnz x5, top2
	add x7,x7,4

	b back2		// al final x7 debe guardar la esquina sup derecha +1 bit

br x30
// fin del barco

// hacer fondo principio

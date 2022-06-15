
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


	b base							//hacer base del barco
	endbase:


	sub x13, x12, 240
	mov x29, 120           // altura mastil
	mov x28, 60				// "mitad" altura vela
	b velaM						//hacer la vela
end_vela1:

	add x13, x12, 200
	mov x29, 100           		// altura mastil
	mov x28, 50					// "mitad" altura vela
	b velasec						//hacer la vela
end_vela2:

	br x30

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

	b endbase


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
	
	
	b end_vela1


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
	
	
	b end_vela2


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

// fin del barco

// hacer fondo principio

fondo:

mov x0, x20

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
	mov x8, RADIO_WAVES // radio mov x22, del circulo
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

br x30

//fin de hacer el fondo

// fin

make_circle:

	mul x5,x2,x2   // radio al cuadrado
	mov x10, x16 

	sub x3,xzr,x2   		//	 cordenada Y del plano cartesiana la seteo en -r

	lazo:
		mov x6,x12
		sub x4,xzr,x2  	// cordenada X del plano cartesiano	la seteo en -r
		add x15,x15,x10
		lazo_aux:

		//	calcular si y*y + x*x <= r*r , si lo es pintar si no con un branch salteo el stur 

			mul x8, x4,x4  		// x*x
			mul x7, x3,x3  		// y*y
			add x8, x8,x7  		// x*x + y*y
			subs xzr, x8,x5 	// comparo la suma de los lados al cuadrado y el radio al cuadrado


			bgt skip_paint
			
			stur w15,[x6]
		
		skip_paint:
		//
			add x6,x6, 4
			add x4,x4,1
			subs xzr,x4,x2
			bne lazo_aux


		add x3,x3,1
		subs xzr,x3,x2
		mov x13,640
		lsl x13,x13, 2
		add x12,x12,x13
		bne lazo

br x30

// fin del circulo

//  funcion de la luna
make_moon :

	mov x29, x30 // guardo la direccion de retorno

	mov x28, x12 // guardo la pos de la esquina superior izquierda



	movz x15, 0xFFE7 , lsl 16	//	
	movk x15, 0xE8D8, lsl 0
	movz x16, 0x000, lsl 0

	mov x2 , 50    // radio de la luna

// first crater

	bl make_circle		// hace el circulo principarl 

	movz x15, 0xFFC8 , lsl 16	//	color de los crateres
	movk x15, 0xC9B5, lsl 0

	mov x2 , 15    	// radio del crater

	mov x12,x28 	// vuelvo a guardar en x12 la posicion original

	add x12,x12,100 // desplazo hacia la dercha la esquina sup del circulo


	mov x10, 640		//
	mov x11, 10			// desplazamiento en el eje Y de 
	mul x10, x10,x11	//	
	lsl x10,x10, 2		//

	add x12,x12,x10

	bl make_circle

// second crater

	movz x15, 0xFFC8 , lsl 16	//	color de los crateres
	movk x15, 0xC9B5, lsl 0

	mov x2 , 10    	// radio del crater

	mov x12,x28 	// vuelvo a guardar en x12 la posicion original

	add x12,x12,160 // desplazo hacia la dercha la esquina sup del circulo


	mov x10, 640		//
	mov x11, 10			// desplazamiento en el eje Y de 
	mul x10, x10,x11	//	
	lsl x10,x10, 2		//

	add x12,x12,x10

	bl make_circle

// third crater

	movz x15, 0xFFC8 , lsl 16	//	color de los crateres
	movk x15, 0xC9B5, lsl 0

	mov x2 , 10    	// radio del crater

	mov x12,x28 	// vuelvo a guardar en x12 la posicion original

	add x12,x12,220 // desplazo hacia la dercha la esquina sup del circulo


	mov x10, 640		//
	mov x11, 60			// desplazamiento en el eje Y de 
	mul x10, x10,x11	//	
	lsl x10,x10, 2		//

	add x12,x12,x10

	bl make_circle



br x29

// fin de la luna

//  funcion del sol

make_sun:

	mov x29, x30

	movz x15, 0xFF , lsl 16	//	
	movk x15, 0xE200, lsl 0
	
	movz x16, 0x100, lsl 0
	sub x16,xzr,x16

	mov x2 , 50    // radio del sol
	
	bl make_circle

br x29

// fin del sol


make_cloud:

	mov x29,x30
	mov x28, x12 // guardo el centro de la nube

	movz x15, 0xFFFF , lsl 16		//	
	movk x15, 0xFFFF, lsl 0		// color de la nube
	

	mov x2 , 25   	// radio del circulo

	sub x12,x12,20 	// desplazo hacia la izquierda desde el centro de la nube

	mov x10, 640		//
	mov x11, 15			// desplazamiento en el eje Y de 
	mul x10, x10,x11	//	
	lsl x10,x10, 2		//

	sub x12,x12,x10


	bl make_circle

	
	
	add x12,x12,0 // desplazo hacia la dercha desde el centro de la nube


	mov x10, 640		//
	mov x11, 20			// desplazamiento en el eje Y de 
	mul x10, x10,x11	//	
	lsl x10,x10, 2		//

	sub x12,x12,x10

	bl make_circle

	mov x12, x28

	add x12,x12,80 // desplazo hacia la dercha desde el centro de la nube


	mov x10, 640		//
	mov x11, 0			// desplazamiento en el eje Y de 
	mul x10, x10,x11	//	
	lsl x10,x10, 2		//

	sub x12,x12,x10

	bl make_circle

	mov x12, x28

	sub x12,x12,120 // desplazo hacia la dercha desde el centro de la nube


	mov x10, 640		//
	mov x11, 0			// desplazamiento en el eje Y de 
	mul x10, x10,x11	//	
	lsl x10,x10, 2		//

	sub x12,x12,x10

	bl make_circle



br x29

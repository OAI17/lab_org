
make_sun:

	mov x29, x30

	movz x15, 0xFF , lsl 16	//	
	movk x15, 0xE200, lsl 0
	
	movz x16, 0x100, lsl 0
	sub x16,xzr,x16

	mov x2 , 50    // radio del sol
	
	bl make_circle

br x29


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


			bge skip_paint
			
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


make_cloud:

	movz x16, 0x0,lsl 0

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

// funcion pez

fish:
	mov x29,x30

	add x7, x3, xzr
	add x8, x3, xzr

	mov x5, 10 ////TamaNo Cola
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

	mov x5, 15 //TamaNo cabeza
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
	movz x5, 0xffff, lsl 16
	movk x5, 0xffff, lsl 0
	mov x16, 0x00

	mov x2, 3 // radio ojo

	mov x12, x3


	sub x12,x12,40
	lsl x11,x10,2
	sub x12,x12,x11	

	bl make_circle

	br x29

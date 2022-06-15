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
	add x9, x3, 80
	movz x5, 0xffff, lsl 16
	movk x5, 0xffff, lsl 0
	mov x16, 0x00

	mov x2, 3
	movz x12, 395		// cordenada Y 
	movz x13, 640		// 
	mul x12, x12, x13	// calcula la "esquina" izquierda del barco
	add x12, x12, 62	// cordenada X de 
	lsl x12, x12, 2		//
	add x12,x20,x12
	bl make_circle


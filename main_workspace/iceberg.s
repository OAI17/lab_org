make_iceberg:
	mov x21, x12 //centro
	mov x19, x12
	mov x22, x2 //altura montaña
	mov x8, 80 //incremento lados

	mov x25, 2

loopVMI:
	
	mov x16,640
	lsl x16,x16,2 //calc aux
	add x21,x21,x16
	
	mov x18,x21 //prox linea
	mov x19,x21



	add x19,x19,x8 //moverme der
	sub x18,x18,x8

	sub x25,x25,1
	cbnz x25 , skip22

	mov x25,2
	add x8,x8,4 //incremento lados

	skip22:

pintarMI:

	stur w14,[x18] // colorer
	add x18,x18,4
	subs xzr, x18,x19
	bne pintarMI

	sub x22,x22,1 //decremento altura triang
	cbnz x22, loopVMI

	br x30
	
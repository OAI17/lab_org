make_circle:

	mul x5,x2,x2   // radio al cuadrado

	sub x3,xzr,x2   		//	 cordenada Y del plano cartesiana la seteo en -r

	lazo:
		mov x6,x12
		sub x4,xzr,x2  	// cordenada X del plano cartesiano	la seteo en -r
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

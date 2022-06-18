
rand:
	mov x3, x2
	lsr x3, x3, 56 //random y

	mov x4, x2
	lsr x4, x4, 51 ////random x

	//calc coord

	mov x11, 640
	mul x3, x11, x3
	add x3, x3, x4
	lsl x3, x3, 2
	add x0, x3, x20

	lsl x5, x2, 3
	eor x2, x2, x5

	str w26, [x0]
	add x0, x0, 2560
	str w26, [x0]
	sub x0, x0 ,4
	str w26, [x0]
	add x0, x0, 8
	str w26, [x0]
	sub x0, x0, 4

	subs x13, x13, 1
	cbnz x13, rand

br x30

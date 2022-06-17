
delay0:
	movz x17, 0xFF, lsl 16 // "tiempo" del delay

	delay_aux:
	sub x17,x17,1
	cbnz x17 , delay_aux

	br x30


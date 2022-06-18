.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32
bs:
        movz x10, 0x0, lsl 16
        movk x10, 0x0, lsl 00
        mov x0, x20
        mov x2, SCREEN_HEIGH         // Y Size 
    lop1:
        mov x1, SCREEN_WIDTH         // X Size
    lop0:
        stur w10,[x0]	   // Set color of pixel N
        add x0,x0,4	   // Next pixel
        sub x1,x1,1	   // decrement X counter
        cbnz x1,lop0	   // If not end row jump
        sub x2,x2,1	   // Decrement Y counter
        cbnz x2,lop1	   // if not last row, jump

br x30

.include "boat.s"
.include "background.s"
.include "sun.s"
.include "mountain.s"
.include "letters.s"
.include "iceberg.s"
.include "global.s"

.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480

main:

	// X0 contiene la direccion base del framebuffer
 	mov x20, x0	// Save framebuffer base address to x20	
	//---------------- CODE HERE ------------------------------------


	//Fondo
	movz x10, 0xFF48, lsl 16
	movk x10, 0x3D8B, lsl 00

	mov x11, Q_LINE // Cantidad de renglones con el mismo color
	mov x9, SKYE_COLOR_I // Seteo variable de color
	mov x12, 2 // Contador para mitad de la imagen
	mov x2, HALF_SCREEN_HEIGH         // Y Size cielo
	

	bl fondo
	
	//Estrellas
    movz x2, 0xb0ca, lsl 0
    movk x2, 0xb0ca, lsl 16
    movk x2, 0xd5ad, lsl 32
    movk x2, 0xbeef, lsl 48

	movz x26, 0xD700, lsl 0 //color estrellas
    movk x26, 0xFFFF, lsl 16 //color estrellas
	mov x6, 30 

	mov x1, 100 //contador de estrellas cambiar x1 
	mov x29, 1 // Variable dia=0/noche=1
		
	bl rand
	


//---------------------------------------------------------------
// Infinite Loop 

InfLoop: 
	b InfLoop



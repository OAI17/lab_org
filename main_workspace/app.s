.include "boat.s"
.include "background.s"
.include "sun.s"
.include "mountain.s"
.include "iceberg.s"
.include "letters.s"
.include "frames/frame1.s"
.include "frames/frame2.s"
.include "frames/frame3.s"
.include "frames/frame4.s"
.include "frames/frame5.s"
.include "frames/frame6.s"
.include "frames/frame7.s"
.include "frames/frame8.s"
.include "frames/frame9.s"
.include "frames/frame10.s"
.include "frames/frame11.s"
.include "frames/frame12.s"
.include "frames/frame13.s"
.include "frames/frame14.s"
.include "frames/frame15.s"
.include "frames/frame16.s"
.include "frames/frame17.s"
.include "frames/frame18.s"
.include "frames/frame19.s"
.include "frames/frame20.s"
.include "frames/frame21.s"
.include "frames/frame22.s"
.include "frames/frame23.s"
.include "frames/frame24.s"
.include "frames/frame25.s"
.include "frames/frame26.s"
.include "frames/frame27.s"
.include "frames/frame28.s"
.include "frames/frame29.s"
.include "frames/frame30.s"
.include "frames/frame31.s"
.include "frames/frame32.s"
.include "frames/frame33.s"
.include "frames/frame34.s"
.include "frames/frame35.s"
.include "frames/frame36.s"
.include "frames/frame37.s"
.include "frames/frame38.s"
.include "frames/frame39.s"
.include "frames/frame40.s"
.include "frames/frame41.s"
.include "frames/frame42.s"
.include "frames/frame43.s"
.include "frames/frame44.s"
.include "frames/frame45.s"
.include "frames/frame46.s"
.include "frames/frame47.s"
.include "frames/frame48.s"
.include "frames/frame49.s"
.include "frames/frame50.s"
.include "frames/frame51.s"
.include "frames/frame52.s"
.include "frames/frame53.s"
.include "frames/frame54.s"
.include "frames/frame55.s"
.include "frames/frame56.s"

.include "delay.s"
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.globl main
.globl make_H
.globl make_I
.globl make_T
 
main:

	// X0 contiene la direccion base del framebuffer
 	mov x20, x0	// Save framebuffer base address to x20	
	//---------------- CODE HERE ------------------------------------

bl frame1
bl delay0

bl frame2
bl delay0

bl frame3
bl delay0

bl frame4
bl delay0

bl frame5
bl delay0

bl frame6
bl delay0

bl frame7
bl delay0

bl frame8
bl delay0

bl frame9
bl delay0

bl frame10
bl delay0

bl frame11
bl delay0

bl frame12
bl delay0

bl frame13
bl delay0

bl frame14
bl delay0

bl frame15
bl delay0

bl frame16
bl delay0

bl frame17
bl delay0

bl frame18
bl delay0

bl frame19
bl delay0

bl frame20
bl delay0

bl frame21
bl delay0

bl frame22
bl delay0

bl frame23
bl delay0

bl frame24
bl delay0

bl frame25
bl delay0

bl frame26
bl delay0

bl frame27
bl delay0

bl frame28
bl delay0

bl frame29
bl delay0

bl frame30
bl delay0

bl frame31
bl delay0

bl frame32
bl delay0

bl frame33
bl delay0

bl frame34
bl delay0

bl frame35
bl delay0

bl frame36
bl delay0

bl frame37
bl delay0

bl frame38
bl delay0

bl frame39
bl delay0

bl frame40
bl delay0

bl frame41
bl delay0

bl frame42
bl delay0

bl frame43
bl delay0

bl frame44
bl delay0


bl frame45
bl delay0

bl frame46
bl delay0

bl frame47
bl delay0

bl frame48
bl delay0

bl frame49
bl delay0

bl frame50
bl delay0

bl frame51
bl delay0

bl frame52
bl delay0

bl frame53
bl delay0

bl frame54
bl delay0

bl frame55
bl delay0

bl frame56
bl delay0



//---------------------------------------------------------------
// Infinite Loop 

InfLoop: 
	b InfLoop



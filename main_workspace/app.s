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
.include "frames/frame57.s"
.include "frames/frame58.s"
.include "frames/frame59.s"
.include "frames/frame60.s"
.include "frames/frame61.s"
.include "frames/frame62.s"
.include "frames/frame63.s"
.include "frames/frame64.s"
.include "frames/frame65.s"
.include "frames/frame66.s"
.include "frames/frame67.s"
.include "frames/frame68.s"
.include "frames/frame69.s"
.include "frames/frame70.s"
.include "frames/frame71.s"
.include "frames/frame72.s"
.include "frames/frame73.s"
.include "frames/frame74.s"
.include "frames/frame75.s"
.include "frames/frame76.s"
.include "frames/frame77.s"
.include "frames/frame78.s"
.include "frames/frame79.s"
.include "frames/frame80.s"
.include "frames/frame81.s"
.include "frames/frame82.s"
.include "frames/frame83.s"
.include "frames/frame84.s"
.include "frames/frame85.s"
.include "frames/frame86.s"
.include "frames/frame87.s"
.include "frames/frame88.s"
.include "frames/frame89.s"
.include "frames/frame90.s"
.include "frames/frame91.s"
.include "frames/frame92.s"
.include "frames/frame93.s"
.include "frames/frame94.s"
.include "frames/frame95.s"
.include "frames/frame96.s"
.include "frames/frame97.s"
.include "frames/frame98.s"
.include "frames/frame99.s"
.include "frames/frame100.s"
.include "frames/frame101.s"
.include "frames/frame102.s"
.include "frames/frame103.s"
.include "frames/frame104.s"
.include "frames/frame105.s"
.include "frames/frame106.s"
.include "frames/frame107.s"
.include "frames/frame108.s"
.include "frames/frame109.s"
.include "frames/frame110.s"
.include "frames/frame111.s"
.include "frames/frame112.s"
.include "frames/frame113.s"


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

bl frame57
bl delay0

bl frame58
bl delay0

bl frame59
bl delay0

bl frame60
bl delay0

bl frame61
bl delay0

bl frame62
bl delay0

bl frame63
bl delay0

bl frame64
bl delay0


bl frame65
bl delay0

bl frame66
bl delay0

bl frame67
bl delay0

bl frame68
bl delay0

bl frame69
bl delay0

bl frame70
bl delay0

bl frame71
bl delay0

bl frame72
bl delay0

bl frame73
bl delay0

bl frame74
bl delay0

bl frame75
bl delay0

bl frame76
bl delay0


bl frame77
bl delay0

bl frame78
bl delay0

bl frame79
bl delay0

bl frame80
bl delay0

bl frame81
bl delay0

bl frame82
bl delay0

bl frame83
bl delay0

bl frame84
bl delay0

bl frame85
bl delay0

bl frame86
bl delay0

bl frame87
bl delay0

bl frame88
bl delay0

bl frame89
bl delay0

bl frame91
bl delay0

bl frame92
bl delay0

bl frame93
bl delay0

bl frame94
bl delay0

bl frame95
bl delay0

bl frame96
bl delay0

bl frame97
bl delay0

bl frame98
bl delay0

bl frame99
bl delay0

bl frame100
bl delay0

bl frame101
bl delay0

bl frame102
bl delay0

bl frame103
bl delay0

bl frame104
bl delay0

bl frame105
bl delay0

bl frame106
bl delay0

bl frame107
bl delay0

bl frame108
bl delay0

bl frame109
bl delay0

bl frame110
bl delay0

bl frame111
bl delay0

bl frame112
bl delay0

bl frame113
bl delay0


//////

// hacer que la pantalla quede en negro

////

//---------------------------------------------------------------
// Infinite Loop 

InfLoop: 
	b InfLoop



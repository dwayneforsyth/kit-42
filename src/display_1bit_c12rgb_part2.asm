;    list p=12f683,b=4,n=0   ; declare processor, tabs, and lines/page
    
;**********************************************************************
;   Copyright (C) 2005,2006,2007 Dwayne Forsyth
;                                 
;   This program is free software; you can redistribute it and/or
;   modify it under the terms of the GNU General Public License
;   as published by the Free Software Foundation; either version 2
;   of the License, or (at your option) any later version.
; 
;   This program is distributed in the hope that it will be useful,
;   but WITHOUT ANY WARRANTY; without even the implied warranty of
;   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;   GNU General Public License for more details.
;
;   You should have received a copy of the GNU General Public License
;   along with this program; if not, write to the
; 
;      Free Software Foundation, Inc.
;      51 Franklin Street, Fifth Floor
;      Boston, MA  02110-1301, USA.
;
;**********************************************************************

;**********************************************************************
rgb_stick_expand  ; this is a nice chunk of code without jumps to sit on the 11 bit boundry
;**********************************************************************


    movlw        LOW C3_C2_reg
    movwf        FSR0L
    movlw        HIGH C3_C2_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in1,0                    ; 1R
    movwf		 INDF0

    movlw        LOW C4_C3_reg
    movwf        FSR0L
    movlw        HIGH C4_C3_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in1,1                    ; 2R
    movwf		 INDF0
 
    movlw        LOW C4_C0_reg 
    movwf        FSR0L
    movlw        HIGH C4_C0_reg 
    movwf        FSR0H
    movlw        0xff
    btfsc        in1,2                     ; 3R
    movwf		 INDF0            

    movlw        LOW C5_C4_reg
    movwf        FSR0L
    movlw        HIGH C5_C4_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in1,3                    ; 4R
    movwf		 INDF0

    movlw        LOW C5_C1_reg
    movwf        FSR0L
    movlw        HIGH C5_C1_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in1,4                    ; 5R
    movwf		 INDF0

    movlw        LOW C0_C3_reg
    movwf        FSR0L
    movlw        HIGH C0_C3_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in1,5                    ; 6R
    movwf		 INDF0

    movlw        LOW C3_A5_reg
    movwf        FSR0L
    movlw        HIGH C3_A5_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in1,6                    ; R7
    movwf		 INDF0

    movlw        LOW C0_A5_reg
    movwf        FSR0L
    movlw        HIGH C0_A5_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in1,7                    ; 8R
    movwf		 INDF0

    movlw        LOW A5_C2_reg
    movwf        FSR0L
    movlw        HIGH A5_C2_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in0,0                    ; 9R
    movwf		 INDF0

    movlw        LOW A5_C5_reg
    movwf        FSR0L
    movlw        HIGH A5_C5_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in0,1                    ; 10R
    movwf		 INDF0

    movlw        LOW C2_C1_reg
    movwf        FSR0L
    movlw        HIGH C2_C1_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in0,2                    ; R11
    movwf		 INDF0

    movlw        LOW C2_C5_reg
    movwf        FSR0L
    movlw        HIGH C2_C5_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in0,3                    ; 12R
    movwf		 INDF0


    movlw        LOW C3_C1_reg
    movwf        FSR0L
    movlw        HIGH C3_C1_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in3,0                    ; G1
	movwf		 INDF0

    movlw        LOW C4_C2_reg
    movwf        FSR0L
    movlw        HIGH C4_C2_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in3,1                    ; 2G
	movwf		 INDF0

    movlw        LOW C4_A5_reg
    movwf        FSR0L
    movlw        HIGH C4_A5_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in3,2                    ; 3G
	movwf		 INDF0
 

    movlw        LOW C5_C3_reg
    movwf        FSR0L
    movlw        HIGH C5_C3_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in3,3                    ; 4G
	movwf		 INDF0

    movlw        LOW C5_C0_reg 
    movwf        FSR0L
    movlw        HIGH C5_C0_reg 
    movwf        FSR0H
    movlw        0xff
    btfsc        in3,4                    ; 5G
	movwf		 INDF0

    movlw        LOW C0_C2_reg
    movwf        FSR0L
    movlw        HIGH C0_C2_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in3,5                    ; 6G
	movwf		 INDF0
 
   movlw        LOW C3_C5_reg
    movwf        FSR0L 
    movlw        HIGH C3_C5_reg
    movwf        FSR0H 
    movlw        0xff
    btfsc        in3,6
	movwf		 INDF0           ; 7G

    movlw        LOW C0_C5_reg
    movwf        FSR0L
    movlw        HIGH C0_C5_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in3,7                    
	movwf		 INDF0              ; 8G


    movlw        LOW A5_C1_reg
    movwf        FSR0L
    movlw        HIGH A5_C1_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in2,0                    ; 9G
	movwf		 INDF0

    movlw        LOW A5_C4_reg
    movwf        FSR0L
    movlw        HIGH A5_C4_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in2,1                    ; 10G
	movwf		 INDF0

    movlw        LOW C2_C0_reg
    movwf        FSR0L
    movlw        HIGH C2_C0_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in2,2                    ; 11G
	movwf		 INDF0

    movlw        LOW C2_C4_reg
    movwf        FSR0L
    movlw        HIGH C2_C4_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in2,3                    ; 12G
	movwf		 INDF0


    movlw        LOW C3_C0_reg
    movwf        FSR0L
    movlw        HIGH C3_C0_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in5,0                    ; 1B
	movwf		 INDF0

    movlw        LOW C4_C1_reg
    movwf        FSR0L
    movlw        HIGH C4_C1_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in5,1                    ; 2B
	movwf		 INDF0

    movlw        LOW C4_C5_reg
    movwf        FSR0L
    movlw        HIGH C4_C5_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in5,2                    ; 3B
	movwf		 INDF0

    movlw        LOW C5_C2_reg
    movwf        FSR0L
    movlw        HIGH C5_C2_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in5,3                    ; 4B
	movwf		 INDF0

    movlw        LOW C5_A5_reg
    movwf        FSR0L
    movlw        HIGH C5_A5_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in5,4                    ; 5B
	movwf		 INDF0

    movlw        LOW C0_C1_reg
    movwf        FSR0L
    movlw        HIGH C0_C1_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in5,5                    ; 6B
	movwf		 INDF0

    movlw        LOW C3_C4_reg
    movwf        FSR0L
    movlw        HIGH C3_C4_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in5,6                    ; 7B
	movwf		 INDF0

    movlw        LOW C0_C4_reg
    movwf        FSR0L
    movlw        HIGH C0_C4_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in5,7                    ; 8B
	movwf		 INDF0

    movlw        LOW A5_C0_reg
    movwf        FSR0L
    movlw        HIGH A5_C0_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in4,0                    ; 9B
	movwf		 INDF0

    movlw        LOW A5_C3_reg
    movwf        FSR0L
    movlw        HIGH A5_C3_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in4,1                    ; 10B
	movwf		 INDF0

    movlw        LOW C2_A5_reg
    movwf        FSR0L
    movlw        HIGH C2_A5_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in4,2                    ; 11B
	movwf		 INDF0 

    movlw        LOW C2_C3_reg
    movwf        FSR0L
    movlw        HIGH C2_C3_reg
    movwf        FSR0H
    movlw        0xff
    btfsc        in4,3                    ; 12B
	movwf		 INDF0



    return


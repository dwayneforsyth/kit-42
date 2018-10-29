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
table_type_18
;**********************************************************************
;
;  6 bytes
;      0       1         2        3        4       5
;  DDRRRRRR RRRRRRRR DDGGGGGG GGGGGGGG DDBBBBBB BBBBBBBB
;  xx111110 00000000 xx111110 00000000 xx111110 00000000
;  xx432109 87654321 xx432109 87654321 xx432109 87654321  
;  
;  DDDDDD = delay counter
;  XX = not used

    MOVLP HIGH get_next_pattern_entry
    call         get_next_pattern_entry
    movwf        in0

    call         get_next_pattern_entry
    movwf        in1

    call         get_next_pattern_entry
    movwf        in2

    call         get_next_pattern_entry
    movwf        in3

    call         get_next_pattern_entry
    movwf        in4

    call         get_next_pattern_entry
    movwf        in5

    MOVLP HIGH     table_type_18
;   collected the 6 bits for the delay counter

    clrf         p2count
    
    btfsc        in0,7
    bsf          p2count,0

    btfsc        in0,6
    bsf          p2count,1

    btfsc        in2,7
    bsf          p2count,2

    btfsc        in2,6
    bsf          p2count,3

    btfsc        in4,7
    bsf          p2count,4

    btfsc        in4,6
    bsf          p2count,5

p18_loop
;   run through the up/down bits.

;1R 0x0f
    movlw        LOW C3_C2_reg
    movwf        FSR0L
    movlw        HIGH C3_C2_reg
    movwf        FSR0H

    btfsc        in1,0
    call         p18_led_up
    btfss        in1,0
    call         p18_led_down

;2R 0xf0
    movlw        LOW C4_C3_reg
    movwf        FSR0L
    movlw        HIGH C4_C3_reg
    movwf        FSR0H

    btfsc        in1,1
    call         p18_led_up
    btfss        in1,1
    call         p18_led_down

;3R 0xf0
    movlw        LOW C4_C0_reg
    movwf        FSR0L
    movlw        HIGH C4_C0_reg
    movwf        FSR0H

    btfsc        in1,2
    call         p18_led_up
    btfss        in1,2
    call         p18_led_down

;4R 0x0f
    movlw        LOW C5_C4_reg
    movwf        FSR0L
    movlw        HIGH C5_C4_reg
    movwf        FSR0H

    btfsc        in1,3
    call         p18_led_up
    btfss        in1,3
    call         p18_led_down

;5R 0xf0
    movlw        LOW C5_C1_reg
    movwf        FSR0L
    movlw        HIGH C5_C1_reg
    movwf        FSR0H

    btfsc        in1,4
    call         p18_led_up
    btfss        in1,4
    call         p18_led_down

;6R 0xf0
    movlw        LOW C0_C3_reg
    movwf        FSR0L
    movlw        HIGH C0_C3_reg
    movwf        FSR0H

    btfsc        in1,5
    call         p18_led_up
    btfss        in1,5
    call         p18_led_down
  

;7R 0xf0
    movlw        LOW C3_A5_reg
    movwf        FSR0L
    movlw        HIGH C3_A5_reg
    movwf        FSR0H

    btfsc        in1,6
    call         p18_led_up
    btfss        in1,6
    call         p18_led_down

;8R 0x0f
    movlw        LOW C0_A5_reg
    movwf        FSR0L
    movlw        HIGH C0_A5_reg
    movwf        FSR0H

    btfsc        in1,7
    call         p18_led_up
    btfss        in1,7
    call         p18_led_down


;9R 0x0f
    movlw        LOW A5_C2_reg
    movwf        FSR0L
    movlw        HIGH A5_C2_reg
    movwf        FSR0H

    btfsc        in0,0
    call         p18_led_up
    btfss        in0,0
    call         p18_led_down


;10R 0x0f
    movlw        LOW A5_C5_reg
    movwf        FSR0L
    movlw        HIGH A5_C5_reg
    movwf        FSR0H

    btfsc        in0,1
    call         p18_led_up
    btfss        in0,1
    call         p18_led_down
 

;11R 0xf0
    movlw        LOW C2_C1_reg
    movwf        FSR0L
    movlw        HIGH C2_C1_reg
    movwf        FSR0H

    btfsc        in0,2
    call         p18_led_up
    btfss        in0,2
    call         p18_led_down

;12R 0x0f
    movlw        LOW C2_C5_reg
    movwf        FSR0L
    movlw        HIGH C2_C5_reg
    movwf        FSR0H

    btfsc        in0,3
    call         p18_led_up
    btfss        in0,3
    call         p18_led_down
 
;1G 0xf0
    movlw        LOW C3_C1_reg
    movwf        FSR0L
    movlw        HIGH C3_C1_reg
    movwf        FSR0H

    btfsc        in3,0
    call         p18_led_up
    btfss        in3,0
    call         p18_led_down


;2G 0xf0
    movlw        LOW C4_C2_reg
    movwf        FSR0L
    movlw        HIGH C4_C2_reg
    movwf        FSR0H

    btfsc        in3,1
    call         p18_led_up
    btfss        in3,1
    call         p18_led_down


;3G 0xf0
    movlw        LOW C4_A5_reg
    movwf        FSR0L
    movlw        HIGH C4_A5_reg
    movwf        FSR0H

    btfsc        in3,2
    call         p18_led_up
    btfss        in3,2
    call         p18_led_down
 
;4G 0xf0
    movlw        LOW C5_C3_reg
    movwf        FSR0L
    movlw        HIGH C5_C3_reg
    movwf        FSR0H

    btfsc        in3,3
    call         p18_led_up
    btfss        in3,3
    call         p18_led_down
 
;5G 0xf0
    movlw        LOW C5_C0_reg
    movwf        FSR0L
    movlw        HIGH C5_C0_reg
    movwf        FSR0H

    btfsc        in3,4
    call         p18_led_up
    btfss        in3,4
    call         p18_led_down
 
;6G 0xf0
    movlw        LOW C0_C2_reg
    movwf        FSR0L
    movlw        HIGH C0_C2_reg
    movwf        FSR0H

    btfsc        in3,5
    call         p18_led_up
    btfss        in3,5
    call         p18_led_down


;7G 0x0f
    movlw        LOW C3_C5_reg
    movwf        FSR0L
    movlw        HIGH C3_C5_reg
    movwf        FSR0H

    btfsc        in3,6
    call         p18_led_up
    btfss        in3,6
    call         p18_led_down
 

;8G 0x0f
    movlw        LOW C0_C5_reg
    movwf        FSR0L
    movlw        HIGH C0_C5_reg
    movwf        FSR0H

    btfsc        in3,7
    call         p18_led_up
    btfss        in3,7
    call         p18_led_down
 
;9G 0x0f
    movlw        LOW A5_C1_reg
    movwf        FSR0L
    movlw        HIGH A5_C1_reg
    movwf        FSR0H

    btfsc        in2,0
    call         p18_led_up
    btfss        in2,0
    call         p18_led_down
 

;10G 0x0f
    movlw        LOW A5_C4_reg
    movwf        FSR0L
    movlw        HIGH A5_C4_reg
    movwf        FSR0H

    btfsc        in2,1
    call         p18_led_up
    btfss        in2,1
    call         p18_led_down
 
;11G 0x0f
    movlw        LOW C2_C0_reg
    movwf        FSR0L
    movlw        HIGH C2_C0_reg
    movwf        FSR0H

    btfsc        in2,2
    call         p18_led_up
    btfss        in2,2
    call         p18_led_down

;12G 0x0f
    movlw        LOW C2_C4_reg
    movwf        FSR0L
    movlw        HIGH C2_C4_reg
    movwf        FSR0H

    btfsc        in2,3
    call         p18_led_up
    btfss        in2,3
    call         p18_led_down

;1B 0xf0
    movlw        LOW C3_C0_reg
    movwf        FSR0L
    movlw        HIGH C3_C0_reg
    movwf        FSR0H

    btfsc        in5,0
    call         p18_led_up
    btfss        in5,0
    call         p18_led_down


;2B 0x0f
    movlw        LOW C4_C1_reg
    movwf        FSR0L
    movlw        HIGH C4_C1_reg
    movwf        FSR0H

    btfsc        in5,1
    call         p18_led_up
    btfss        in5,1
    call         p18_led_down
 
;3B 0xf0
    movlw        LOW C4_C5_reg
    movwf        FSR0L
    movlw        HIGH C4_C5_reg
    movwf        FSR0H

    btfsc        in5,2
    call         p18_led_up
    btfss        in5,2
    call         p18_led_down

;4B 0xf0
    movlw        LOW C5_C2_reg
    movwf        FSR0L
    movlw        HIGH C5_C2_reg
    movwf        FSR0H

    btfsc        in5,3
    call         p18_led_up
    btfss        in5,3
    call         p18_led_down


;5B 0xf0
    movlw        LOW C5_A5_reg
    movwf        FSR0L
    movlw        HIGH C5_A5_reg
    movwf        FSR0H

    btfsc        in5,4
    call         p18_led_up
    btfss        in5,4
    call         p18_led_down
 

;6B 0xf0
    movlw        LOW C0_C1_reg
    movwf        FSR0L
    movlw        HIGH C0_C1_reg
    movwf        FSR0H

    btfsc        in5,5
    call         p18_led_up
    btfss        in5,5
    call         p18_led_down
 
;7B 0x0f
    movlw        LOW C3_C4_reg
    movwf        FSR0L
    movlw        HIGH C3_C4_reg
    movwf        FSR0H

    btfsc        in5,6
    call         p18_led_up
    btfss        in5,6
    call         p18_led_down
 
;8B 0x0f
    movlw        LOW C0_C4_reg
    movwf        FSR0L
    movlw        HIGH C0_C4_reg
    movwf        FSR0H

    btfsc        in5,7
    call         p18_led_up
    btfss        in5,7
    call         p18_led_down
 

;9B 0x0f
    movlw        LOW A5_C0_reg
    movwf        FSR0L
    movlw        HIGH A5_C0_reg
    movwf        FSR0H

    btfsc        in4,0
    call         p18_led_up
    btfss        in4,0
    call         p18_led_down
  

;10B 0x0f
    movlw        LOW A5_C3_reg
    movwf        FSR0L
    movlw        HIGH A5_C3_reg
    movwf        FSR0H

    btfsc        in4,1
    call         p18_led_up
    btfss        in4,1
    call         p18_led_down


;11B 0xf0
    movlw        LOW C2_A5_reg
    movwf        FSR0L
    movlw        HIGH C2_A5_reg
    movwf        FSR0H

    btfsc        in4,2
    call         p18_led_up
    btfss        in4,2
    call         p18_led_down


;12B 0xf0
    movlw        LOW C2_C3_reg
    movwf        FSR0L
    movlw        HIGH C2_C3_reg
    movwf        FSR0H

    btfsc        in4,3
    call         p18_led_up
    btfss        in4,3
    call         p18_led_down

    MOVLP HIGH strobe_delay
    movf         pspeed,w
    call         strobe_delay
    MOVLP HIGH table_type_18

;   This is a quick hack, because without this button presses are not seen for minutes
;   This early exit might impact the pattern getting displayed.
;
    btfsc        button,0    ; if putton pressed show pattern id
    goto         t18_exit

    btfsc        IR_in_good,0
    goto         t18_exit

    decfsz       p2count,f
    goto         p18_loop

t18_exit
    return

;**********************************************************************
p18_led_up
;**********************************************************************

    incf        INDF0,f
    btfsc       STATUS,Z
    comf        INDF0,f
    return

;**********************************************************************
p18_led_down
;**********************************************************************

    movf        INDF0,f
    btfss       STATUS,Z
    decf        INDF0,f
    return


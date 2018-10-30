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
rgb_stick_expand2  ; this is a nice chunk of code without jumps to sit on the 11 bit boundry
;**********************************************************************

;1R 0x0f
    movlw        LOW C3_C2_reg
    movwf        FSR0L
    movlw        HIGH C3_C2_reg
    movwf        FSR0H

    btfsc        in1,0            
    incf         INDF0,f      

    btfsc        in7,0   
    decf         INDF0,f      

;2R 0xf0
    movlw        LOW C4_C3_reg
    movwf        FSR0L
    movlw        HIGH C4_C3_reg
    movwf        FSR0H

    btfsc        in1,1   
    incf         INDF0,f     

    btfsc        in7,1   
    decf         INDF0,f     


;3R 0xf0
    movlw        LOW C4_C0_reg
    movwf        FSR0L
    movlw        HIGH C4_C0_reg
    movwf        FSR0H

    btfsc        in1,2   
    incf         INDF0,f 
   
    btfsc        in7,2   
    decf         INDF0,f       

;4R 0x0f
    movlw        LOW C5_C4_reg
    movwf        FSR0L
    movlw        HIGH C5_C4_reg
    movwf        FSR0H

    btfsc        in1,3           
    incf         INDF0,f      

    btfsc        in7,3   
    decf         INDF0,f      

;5R 0xf0
    movlw        LOW C5_C1_reg
    movwf        FSR0L
    movlw        HIGH C5_C1_reg
    movwf        FSR0H

    btfsc        in1,4   
    incf         INDF0,f   

    btfsc        in7,4   
    decf         INDF0,f    

;6R 0xf0
    movlw        LOW C0_C3_reg
    movwf        FSR0L
    movlw        HIGH C0_C3_reg
    movwf        FSR0H

    btfsc        in1,5   
    incf         INDF0,f    

    btfsc        in7,5   
    decf         INDF0,f 

;7R 0xf0
    movlw        LOW C3_A5_reg
    movwf        FSR0L
    movlw        HIGH C3_A5_reg
    movwf        FSR0H

    btfsc        in1,6   
    incf         INDF0,f    

    btfsc        in7,6   
    decf         INDF0,f   

;8R 0x0f
    movlw        LOW C0_A5_reg
    movwf        FSR0L
    movlw        HIGH C0_A5_reg
    movwf        FSR0H

    btfsc        in1,7 
    incf         INDF0,f     

    btfsc        in7,7   
    decf         INDF0,f 

;9R 0x0f
    movlw        LOW A5_C2_reg
    movwf        FSR0L
    movlw        HIGH A5_C2_reg
    movwf        FSR0H

    btfsc        in0,0       
    incf         INDF0,f     

    btfsc        in6,0   
    decf         INDF0,f  

;10R 0x0f
    movlw        LOW A5_C5_reg
    movwf        FSR0L
    movlw        HIGH A5_C5_reg
    movwf        FSR0H

    btfsc        in0,1   
    incf         INDF0,f  

    btfsc        in6,1   
    decf         INDF0,f  

;11R 0xf0
    movlw        LOW C2_C1_reg
    movwf        FSR0L
    movlw        HIGH C2_C1_reg
    movwf        FSR0H

    btfsc        in0,2   
    incf         INDF0,f 

    btfsc        in6,2   
    decf         INDF0,f  

;12R 0x0f
    movlw        LOW C2_C5_reg
    movwf        FSR0L
    movlw        HIGH C2_C5_reg
    movwf        FSR0H

    btfsc        in0,3   
    incf         INDF0,f    

    btfsc        in6,3   
    decf         INDF0,f    

;1G 0xf0
    movlw        LOW C3_C1_reg
    movwf        FSR0L
    movlw        HIGH C3_C1_reg
    movwf        FSR0H

    btfsc        in3,0   
    incf         INDF0,f   

    btfsc        in9,0   
    decf         INDF0,f 

;2G 0xf0
    movlw        LOW C4_C2_reg
    movwf        FSR0L
    movlw        HIGH C4_C2_reg
    movwf        FSR0H

    btfsc        in3,1   
    incf         INDF0,f   

    btfsc        in9,1   
    decf         INDF0,f 

;3G 0xf0
    movlw        LOW C4_A5_reg
    movwf        FSR0L
    movlw        HIGH C4_A5_reg
    movwf        FSR0H

    btfsc        in3,2   
    incf         INDF0,f   

    btfsc        in9,2   
    decf         INDF0,f 

;4G 0xf0
    movlw        LOW C5_C3_reg
    movwf        FSR0L
    movlw        HIGH C5_C3_reg
    movwf        FSR0H

    btfsc        in3,3   
    incf         INDF0,f

    btfsc        in9,3   
    decf         INDF0,f 

;5G 0xf0
    movlw        LOW C5_C0_reg
    movwf        FSR0L
    movlw        HIGH C5_C0_reg
    movwf        FSR0H

    btfsc        in3,4   
    incf         INDF0,f

    btfsc        in9,4   
    decf         INDF0,f 

;6G 0xf0
    movlw        LOW C0_C2_reg
    movwf        FSR0L
    movlw        HIGH C0_C2_reg
    movwf        FSR0H

    btfsc        in3,5   
    incf         INDF0,f

    btfsc        in9,5   
    decf         INDF0,f 

;7G 0x0f
    movlw        LOW C3_C5_reg
    movwf        FSR0L
    movlw        HIGH C3_C5_reg
    movwf        FSR0H

    btfsc        in3,6   
    incf         INDF0,f 

    btfsc        in9,6   
    decf         INDF0,f 

;8G 0x0f
    movlw        LOW C0_C5_reg
    movwf        FSR0L
    movlw        HIGH C0_C5_reg
    movwf        FSR0H

    btfsc        in3,7   
    incf         INDF0,f  

    btfsc        in9,7   
    decf         INDF0,f

;9G 0x0f
    movlw        LOW A5_C1_reg
    movwf        FSR0L
    movlw        HIGH A5_C1_reg
    movwf        FSR0H

    btfsc        in2,0   
    incf         INDF0,f    

    btfsc        in8,0   
    decf         INDF0,f

;10G 0x0f
    movlw        LOW A5_C4_reg
    movwf        FSR0L
    movlw        HIGH A5_C4_reg
    movwf        FSR0H

    btfsc        in2,1   
    incf         INDF0,f  

    btfsc        in8,1   
    decf         INDF0,f

;11G 0x0f
    movlw        LOW C2_C0_reg
    movwf        FSR0L
    movlw        HIGH C2_C0_reg
    movwf        FSR0H

    btfsc        in2,2   
    incf         INDF0,f  

    btfsc        in8,2   
    decf         INDF0,f

;12G 0x0f
    movlw        LOW C2_C4_reg
    movwf        FSR0L
    movlw        HIGH C2_C4_reg
    movwf        FSR0H

    btfsc        in2,3   
    incf         INDF0,f  

    btfsc        in8,3   
    decf         INDF0,f

;1B 0xf0
    movlw        LOW C3_C0_reg
    movwf        FSR0L
    movlw        HIGH C3_C0_reg
    movwf        FSR0H

    btfsc        in5,0   
    incf         INDF0,f  
  
    btfsc        in11,0   
    decf         INDF0,f

;2B 0x0f
    movlw        LOW C4_C1_reg
    movwf        FSR0L
    movlw        HIGH C4_C1_reg
    movwf        FSR0H

    btfsc        in5,1   
    incf         INDF0,f  

    btfsc        in11,1   
    decf         INDF0,f

;3B 0xf0
    movlw        LOW C4_C5_reg
    movwf        FSR0L
    movlw        HIGH C4_C5_reg
    movwf        FSR0H

    btfsc        in5,2   
    incf         INDF0,f   

    btfsc        in11,2   
    decf         INDF0,f

;4B 0xf0
    movlw        LOW C5_C2_reg
    movwf        FSR0L
    movlw        HIGH C5_C2_reg
    movwf        FSR0H

    btfsc        in5,3   
    incf         INDF0,f 

    btfsc        in11,3   
    decf         INDF0,f

;5B 0xf0
    movlw        LOW C5_A5_reg
    movwf        FSR0L
    movlw        HIGH C5_A5_reg
    movwf        FSR0H

    btfsc        in5,4   
    incf         INDF0,f 

    btfsc        in11,4   
    decf         INDF0,f

;6B 0xf0
    movlw        LOW C0_C1_reg
    movwf        FSR0L
    movlw        HIGH C0_C1_reg
    movwf        FSR0H

    btfsc        in5,5   
    incf         INDF0,f 

    btfsc        in11,5   
    decf         INDF0,f

;7B 0x0f
    movlw        LOW C3_C4_reg
    movwf        FSR0L
    movlw        HIGH C3_C4_reg
    movwf        FSR0H

    btfsc        in5,6   
    incf         INDF0,f 

    btfsc        in11,6   
    decf         INDF0,f

;8B 0x0f
    movlw        LOW C0_C4_reg
    movwf        FSR0L
    movlw        HIGH C0_C4_reg
    movwf        FSR0H

    btfsc        in5,7   
    incf         INDF0,f 

    btfsc        in11,7   
    decf         INDF0,f

;9B 0x0f
    movlw        LOW A5_C0_reg
    movwf        FSR0L
    movlw        HIGH A5_C0_reg
    movwf        FSR0H

    btfsc        in4,0   
    incf         INDF0,f 

    btfsc        in10,0   
    decf         INDF0,f

;10B 0x0f
    movlw        LOW A5_C3_reg
    movwf        FSR0L
    movlw        HIGH A5_C3_reg
    movwf        FSR0H

    btfsc        in4,1   
    incf         INDF0,f 

    btfsc        in10,1   
    decf         INDF0,f

;11B 0xf0
    movlw        LOW C2_A5_reg
    movwf        FSR0L
    movlw        HIGH C2_A5_reg
    movwf        FSR0H

    btfsc        in4,2   
    incf         INDF0,f 

    btfsc        in10,2   
    decf         INDF0,f

;12B 0xf0
    movlw        LOW C2_C3_reg
    movwf        FSR0L
    movlw        HIGH C2_C3_reg
    movwf        FSR0H

    btfsc        in4,3   
    incf         INDF0,f 
 
    btfsc        in10,3   
    decf         INDF0,f

    return


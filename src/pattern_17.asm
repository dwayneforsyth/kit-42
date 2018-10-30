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
table_type_17
;**********************************************************************
;
;  13 bytes
;


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

    call         get_next_pattern_entry
    movwf        in6

    call         get_next_pattern_entry
    movwf        in7

    call         get_next_pattern_entry
    movwf        in8

    call         get_next_pattern_entry
    movwf        in9

    call         get_next_pattern_entry
    movwf        in10

    call         get_next_pattern_entry
    movwf        in11

    call         get_next_pattern_entry
    movwf        p2count
    incf         p2count,f

p17_loop

    btfsc        in0,7
    goto         p17_fader

    movfw        pspeed
    call         display_1bit

    decfsz       p2count,f
    goto         p17_loop

    return

p17_fader

    MOVLP HIGH rgb_stick_expand2
    call rgb_stick_expand2
    MOVLP HIGH p17_fader

    movf         pspeed,w
    call         strobe_delay

;
;   This is a quick hack, because without this button presses are not seen for minutes
;   This early exit might impact the pattern getting displayed.
;
    btfsc        button,0    ; if putton pressed show pattern id
    goto         t17_return

    btfsc        IR_in_good,0
    goto         t17_return

    decfsz       p2count,f
    goto         p17_loop

t17_return
    return


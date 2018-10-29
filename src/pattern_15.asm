;**********************************************************************
table_type_15
;**********************************************************************
;
;  6 bytes
;      0       1         2        3        4       5
;  DDRRRRRR RRRRRRRR XXGGGGGG GGGGGGGG XXBBBBBB BBBBBBBB
;  xx111110 00000000 xx111110 00000000 xx111110 00000000
;  xx432109 87654321 xx432109 87654321 xx432109 87654321  
;  
;  DD = delay counter
;  XX = not used
    var p2count

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

    movlw        b'11000000'
    andwf        in0,w
    movwf        p2count
    bcf          STATUS, C	
    rrf          p2count,f
    rrf          p2count,f
    rrf          p2count,f
    rrf          p2count,f
    rrf          p2count,f
    rrf          p2count,f
    incf         p2count,f

p3loop
    movfw        pspeed
    call         display_1bit

    decfsz       p2count,f
    goto         p3loop

    return

